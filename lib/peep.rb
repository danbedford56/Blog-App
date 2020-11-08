require_relative 'user'
class Peep
  attr_reader :id, :message, :user_id, :date, :likes, :username
  
  def initialize(id, message, user_id, date, likes)
    @id = id
    @message = message
    @user_id = user_id
    @username = User.find_user(id: user_id).username
    @date = date
    @likes = likes
  end

end