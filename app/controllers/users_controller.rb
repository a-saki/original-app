class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  # 各actionのあとに呼ばれるjsはアクション名.js.erb
  def index
    # ▼newするときは外部キー紐付けなくていい。createでひも付けていればOK
    @user = User.new
    # ▼一覧表示用
    @users = current_family.users
  end
  
  def create
    # ▼newだと外部キーを手動で入れないといけないので、自動的に設定してくれるbuildで書くこと
    @user = current_family.users.build(user_params)
    if @user.save

    else
      # ▼エラーの場合はバリデーションかけないといけないので、必ず設定
      render "users/index"
    end
    # ▼ログインしてる家族一覧の取得
    @users = current_family.users
  end

  def destroy
    # DBから家族を削除して、また一覧を表示
    @user = User.find(params[:id])
    @user.destroy
    # ▼削除した後もログインしてる家族一覧を表示するので
    @users = current_family.users
  end
  
  def edit
    # @user = User.find(params[:id])
  end
  
  def update
         # ▼ログインしてる家族一覧の取得
    @users = current_family.users
    if @user.update(user_params)
      # redirect_to users_path
    else
      render "users/edit"
    end

  end


  private 
  
  def user_params
    params.require(:user).permit(:name, :age, :gender, :relationship)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
