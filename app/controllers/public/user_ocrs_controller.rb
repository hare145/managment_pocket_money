class Public::UserOcrsController < ApplicationController
  
  def new
    @user_ocr = UserOcr.new
  end
  
  def create
    @user_ocr = UserOcr.new(ocrimage_params)
    @user_ocr.text = perform_ocr(@user_ocr.image)

    if @user_ocr.save
      redirect_to @user_ocr, notice: 'OCRが成功しました。'
    else
      render :new
    end
  end
  
  def show
    @user_ocr = UserOcr.find(:params[@user_ocr])
  end
  
  
  
  private

  def ocrimage_params
    params.require(:user_ocr).permit(:image)
  end
  
end
