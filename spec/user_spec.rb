require 'user'

describe User do
  before do
    @user_one = User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
  end

  describe '.create' do
    it 'returns a user' do
      expect(@user_one).to be_a User
    end

    it 'sets attributes of returned user' do
      expect(@user_one.username).to eq "user1"
      expect(@user_one.password).to eq "password1"
      expect(@user_one.name).to eq "Mr User"
      expect(@user_one.email).to eq "user1@example.com"
    end

    it 'logs in' do
      expect(User.current).to eq @user_one
    end
  end

  describe '.login' do
    before do
      User.login(username: "user1", password: "password1")
      @user = User.current
    end

    it 'changes current user to match details' do
      expect(@user.username).to eq "user1"
      expect(@user.password).to eq "password1"
    end

    it 'finds other details of current user' do
      expect(@user.name).to eq "Mr User"
      expect(@user.email).to eq "user1@example.com"
    end
  end

end