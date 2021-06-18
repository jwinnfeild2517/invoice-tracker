class ItemsController < ApplicationController

  before_action :set_invoice

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to invoice_url(@invoice) }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html {redirect_to invoice_url(@invoice), notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end


   # Only allow a list of trusted parameters through.
   def item_params
    params.permit(:name, :qty, :cost, :invoice_id)
  end

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
