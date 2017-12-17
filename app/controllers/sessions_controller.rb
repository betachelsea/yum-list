class SessionsController < ApplicationController

  def create
    # 参考: https://qiita.com/To_BB/items/01863aa50d628c069b64
    auth_hash = request.env['omniauth.auth']
    tw = TwitterAccount.find_or_initialize_by(uid: auth_hash[:uid])
    tw.screen_name ||= auth_hash[:info][:nickname]
    tw.name ||= auth_hash[:info][:name]
    if tw.user.blank?
      tw.user = User.create(name: auth_hash[:info][:name])
    end
    log_in tw.user
    flash[:notice] = "ログインしました"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to root_path notice: 'ログアウトしました'
  end
end
