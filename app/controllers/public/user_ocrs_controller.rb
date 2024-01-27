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
    
    @use_ocr_text = @user_ocr.text
    @use_ocr_text = shaped_only_numbers(@use_ocr_text)
    @use_ocr_text = strip_zenkaku(@user_ocr_text)
    
  end
  
  
  
  private
  
  def ocrimage_params
    params.require(:user_ocr).permit(:image)
  end
  
  def perform_ocr(image)
    return unless image.attached?

    image_path = Rails.root.join('tmp', 'uploads', image.filename.to_s)
    File.open(image_path, 'wb') { |file| file.write(image.download) }

    text = RTesseract.new(image_path).to_s

    File.delete(image_path) # 一時ファイルを削除

    text
  end
  
end
