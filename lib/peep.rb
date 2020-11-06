class Peep
  attr_reader :id, :message, :user_id, :date, :likes
  
  def initialize(id, message, user_id, date, likes)
    @id = id
    @message = message
    @user_id = user_id
    @date = date
    @likes = likes
  end

end