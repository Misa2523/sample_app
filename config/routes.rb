#ルーティング：送信されたURLに対して
  #「どのコントローラの、どのアクション」で処理するか
  #を決める「対応表」

Rails.application.routes.draw do
  get 'lists/new'
  get 'top' => 'homes#top'
  #コントローラにフォームのデータを送信するときはpostを使用
  post 'lists' => 'lists#create'    #'コントローラ名#アクション名'
  get 'lists' => 'lists#index'
  get 'lists/:id' => 'lists#show'   #.../lists/1 や .../lists/3 に該当
  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# get：データを取得するためのHTTPメソッド
  #（例）aタグなどで、画面遷移の際に新しいページを取得する場合
# post：データを新規保存するためのメソッド
  #（例）フォームなどの投稿をする場合