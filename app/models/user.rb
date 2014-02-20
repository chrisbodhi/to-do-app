class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos

  def self.find_done(user)
    searching = Todo.where(user_id: user.id).where(done: true).to_a
    if searching.length < 5
      [{item: 'bake'}, {item: 'lift '}, {item: 'write'}, {item: 'veggies'}, {item: 'water'}] 
    else
      searching
    end
  end
end
