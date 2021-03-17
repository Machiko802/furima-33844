class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item, only: [:index, :create, :purchase]
  before_action :purchase, only: [:index, :create]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def purchase
    if @item.user_id == current_user.id || PurchaseRecord.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
