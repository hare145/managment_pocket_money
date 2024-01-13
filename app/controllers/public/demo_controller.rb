class Public::DemoController < ApplicationController
  
  def index
    @paragraphs = Paragraph.all
  end

  def process_ocr_text
    # フォームから送信されたOCRテキストを取得
    raw_text = params[:ocr_text]

    # OCR テキストの前処理
    processed_text = raw_text.gsub(/\s+/, ' ').strip

    # テキストを段落ごとに分割
    paragraphs = processed_text.split(/\n\n+/)

    # パラグラフの一時保存
    paragraphs.each do |paragraph_text|
      Paragraph.create(text: paragraph_text)
    end

    # リダイレクトして一時保存したパラグラフを表示
    redirect_to ocr_index_path
  end

  def save_categories
    # 選択されたカテゴリを保存
    params[:categories].each do |paragraph_id, category|
      paragraph = Paragraph.find(paragraph_id)
      paragraph.tags = [category]
      paragraph.save
    end

    redirect_to ocr_index_path, notice: "選択したカテゴリが保存されました。"
  end
end
  
end
