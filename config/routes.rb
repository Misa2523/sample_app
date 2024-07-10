#ルーティング：送信されたURLに対して
  #「どのコントローラの、どのアクション」で処理するか
  #を決める「対応表」

Rails.application.routes.draw do
  #get 'lists/new'
  get 'top' => 'homes#top'
  resources :lists  #listsコントローラの同じ名前のアクションに紐づく形で、ルーティングを一括して自動生成する
  # ↑ 一括生成するもの：new, show, index, edit, create, destroy, update

  #コントローラにフォームのデータを送信するときはpostを使用
  #post 'lists' => 'lists#create'    #'コントローラ名#アクション名'
  #get 'lists' => 'lists#index'
  #get 'lists/:id' => 'lists#show', as: 'list'   #.../lists/1 や .../lists/3 に該当    #as:オプションで名前付きルートにする（'lists#show'の設定を、listとして利用できる）
  #get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  #patch 'lists/:id' => 'lists#update', as: 'update_list'    #更新の場合はpatchで指定
  #delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# get：データを取得するためのHTTPメソッド
  #（例）aタグなどで、画面遷移の際に新しいページを取得する場合
# post：データを新規保存するためのメソッド
  #（例）フォームなどの投稿をする場合