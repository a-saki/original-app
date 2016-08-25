class UsersController < ApplicationController
  # 各actionのあとに呼ばれるjsはアクション名.js.erb
  def index
    @user = User.new
    @users = current_family.users
  end
  
  def create
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
    # ▼ログインしてる家族一覧の取得
    @users = current_family.users
  end

  def result
    @users = current_family.users.all
  end
  
  def ajax_action
    if params[:ajax_handler] == 'handle_name1'
      # Ajaxの処理
      @users = current_family.users.all
      if @users.size > 0
        render
      else
        render json: 'no data'
      end
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end
end
