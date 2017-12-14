class SessionsController < ApplicationController

  def create
    # 参考: https://qiita.com/To_BB/items/01863aa50d628c069b64
    auth_hash = request.env['omniauth.auth']
    tw = TwitterAccount.find_or_initialize_by(
      uid: auth_hash[:uid],
      screen_name: auth_hash[:info][:nickname],
      name: auth_hash[:info][:name],
    )
    if tw.user_id.blank?
      tw.user_id = User.create(name: auth_hash[:info][:name]).id
    end
    session[:user_id] = tw.user_id
    flash[:notice] = "ログインしました"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to root_path notice: 'ログアウトしました'
  end
end
