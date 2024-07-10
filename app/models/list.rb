class List < ApplicationRecord

  #どのモデルに対して画像を使うのかを宣言
  has_one_attached :image
  #　↑この記述で、Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができる

  #投稿に対して「必須入力」の設定（バリデーションの設定）
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  #validatesで対象とする項目を指定、入力されたデータのpresence（存在）をチェック
  #trueと記述すると、データが存在しなければならないという設定になる

end
