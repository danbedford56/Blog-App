class Peep
  attr_reader :id, :message, :user_id, :date
  
  def initialize(id, message, user_id, date)
    @id = id
    @message = message
    @user_id = user_id
    @date = date
  end

end