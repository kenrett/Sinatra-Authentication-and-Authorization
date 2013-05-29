helpers do

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors =  "Incorrect, please try again"
      erb :sign_in
    end
  end

end
