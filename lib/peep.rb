class Peep
  attr_reader :id, :message, :user_id
  
  def initialize(id, message, user_id)
    @id = id
    @message = message
    @user_id = user_id
  end

end