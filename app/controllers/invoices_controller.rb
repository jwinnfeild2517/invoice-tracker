class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy]

  require 'pry'

  # GET /invoices or /invoices.json
  def index

    case params['filter']
    when 'Paid'
      @invoices = Invoice.where(status: params['filter'])
    when 'Completed'
      @invoices = Invoice.where(status: params['filter'])
    when 'Total'
      @invoices = Invoice.order(total: :desc)
    else
      @invoices = Invoice.all
    end
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    @items = @invoice.items
    @total = 0
    @items.each do |item|
      @total += item.cost
    end

    @invoice.update(total:@total)
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:total, :due, :status, :description)
    end
end
