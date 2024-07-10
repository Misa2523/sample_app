class ListsController < ApplicationController
#コントローラ：コントローラ内のアクション（メソッド）は、
  #ブラウザに返すビューをviewsフォルダの中から
  #見つけ出す役割を担っている。

  #newアクションで投稿フォームのあるページを表示
  def new #「new.html.erbとリンクしてる」
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  #createアクションで投稿を保存する
  def create
    # 1.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)  #アクション内でのみ利用するためローカル変数listを使用
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4.トップ画面へリダイレクト
    redirect_to '/top'
  end

  #indexアクションで一覧画面を表示
  def index #「index.html.erbとリンクしてる」
    @lists = List.all   #投稿したList全て表示させるため全てのデータを取得（allはメソッドの一種）
  end

  def show
  end

  def edit
  end

  private   #一種の境界線（ここから下はこのcontrollerの中でしか呼び出せない）
  # ストロングパラメータ（マスアサインメント脆弱性を防ぐ仕組み）
  def list_params   #モデル名_params
    params.require(:list).permit(:title, :body)  #保存するカラムを限定
  end
end


# @～～：インスタンス変数
# ↑ Controllerのアクションでインスタンス変数を指定すると、
# viewファイル上でインスタンス変数に格納された情報を表示できる