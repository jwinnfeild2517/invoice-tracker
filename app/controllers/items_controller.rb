class ItemsController < ApplicationController
  def create
    binding.pry
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to(`#{invoices_path}/#{params['invoice_id']}`), notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


   # Only allow a list of trusted parameters through.
   def item_params
    params.permit(:name, :qty, :cost, :invoice_id)
  end
end
