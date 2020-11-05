def create_account(username, password)
  visit '/'
  fill_in 'username_new', with: username
  fill_in 'password_new', with: password
  click_button 'Sign up'
end

def log_in(username, password)
  visit '/'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log in'
end

def add_peep
  click_link 'Post a new peep'
  fill_in 'message', with: 'test'
  click_button 'Submit'
end