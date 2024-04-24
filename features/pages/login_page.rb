class LoginPage

  def initialize
    @txt_username = { id: 'usernameTextField'}
    @txt_password = { id: 'passwordTextField'}
    @btn_login = { id: 'loginButton' }
    @btn_logout = { id: 'logoutButton' }
  end

  def fill_username(username)
    PageHelper.find(@txt_username).send_keys(username)
  end

  def fill_password(password)
    PageHelper.find(@txt_password).send_keys(password)
  end

  def click_login_button
    PageHelper.click_element(@btn_login)
  end

  def verify_login
    PageHelper.is_element_enabled(@btn_logout).should == true
  end
end