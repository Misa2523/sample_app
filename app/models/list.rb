class List < ApplicationRecord
  has_one_attached :image   #どのモデルに対して画像を使うのかを宣
  #　↑この記述で、Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができる
end
