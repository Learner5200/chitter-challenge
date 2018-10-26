def setup_test_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE peeps, users;')
end

def reset_users
  User.current = nil
end

def sign_up
  click_button "Sign Up"
  fill_in(:username, with: "user1")
  fill_in(:password, with: "password1")
  fill_in(:name, with: "Mr User")
  fill_in(:email, with: "user1@example.com")
  click_button "Submit"
  # @user_one = User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
end

def create_peeps
  @peep_one = Peep.create(username: "user1", content: "content1")
  @peep_two = Peep.create(username: "user1", content: "content2")
  visit '/'
end
