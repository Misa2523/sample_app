class ListsController < ApplicationController
#コントローラ：コントローラ内のアクション（メソッド）は、
  #ブラウザに返すビューをviewsフォルダの中から
  #見つけ出す役割を担っている。

  #newアクションで投稿フォームのあるページを表示
  def new #「new.html.erb」とリンクしてる
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  #createアクションで投稿を保存する
  def create
    # 1.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)  #アクション内でのみ利用するためローカル変数listを使用
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4.詳細画面（show.html.erb）へリダイレクト（投稿内容をすぐ閲覧できるようにする）
    redirect_to list_path(list.id)  #引数の(list.id)を忘れず記述！
  end

  #indexアクションで一覧画面を表示
  def index #「index.html.erb」とリンクしてる
    @lists = List.all   #allメソッド：存在するレコードすべて取得（投稿したList全て表示させるため全てのデータを取得）
  end

  #showアクションで詳細画面を表示
  def show  #「show.html.erb」とリンクしてる
    @list = List.find(params[:id])  #findメソッド：引数を受け取り、idカラムを引数と比べてレコードを取得する
  end

  #editアクションで編集画面を表示
  def edit  #「edit.html.erb」とリンクしてる
    @list = List.find(params[:id])
  end

  #updateアクションで更新機能を追加
  def update
    list = List.find(params[:id]) #list：ローカル変数のため@はつけない
    list.update(list_params)
    redirect_to list_path(list.id)  #showアクションにリダイレクト（引数にはidが必要）
  end

  private   #一種の境界線（ここから下はこのcontrollerの中でしか呼び出せない）
  # ストロングパラメータ（マスアサインメント脆弱性を防ぐ仕組み）
  def list_params   #モデル名_params
    params.require(:list).permit(:title, :body, :image)  #保存するカラムを限定
  end
end


# @～～：インスタンス変数
# ↑ Controllerのアクションでインスタンス変数を指定すると、
# viewファイル上でインスタンス変数に格納された情報を表示できる