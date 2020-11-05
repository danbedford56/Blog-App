require 'user'

RSpec.describe User do
  
  describe '.all' do
    it 'Returns a list of all users' do
      User.create_user(username: "test", password: "test")
      expect(User.all.length).to eq 1
      expect(User.all[0].username).to eq 'test'
    end
  end

  describe '.check_login' do
    it 'Returns true if user password is correct' do
      User.create_user(username: "test", password: "test")
      expect(User.check_login(username: "test", password: "test")).to eq true
    end

    it 'Returns false if user password is incorrect' do
      User.create_user(username: "test", password: "test")
      expect(User.check_login(username: "test", password: "test1")).to eq false
    end

    it 'Returns false if username does not exist' do
      User.create_user(username: "test1", password: "test")
      expect(User.check_login(username: "test", password: "test")).to eq false
    end
  end

  describe '.find_user' do
    it 'Returns user object of input id' do
      User.create_user(username: "test", password: "test")
      expect(User.find_user(id: User.current_user).username).to eq "test"
    end
  end
end