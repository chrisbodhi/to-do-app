class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos

  def self.find_done(user)
    searching = Todo.where(user_id: user.id).where(done: true).to_a
    filler = [{item: 'bake a cake'}, {item: 'lift weights'}, {item: 'write a list'}, {item: 'eat veggies'}, {item: 'drink water'}]
    i = 4
    while searching.length < 5
      searching << filler[i]
      i -= 1
    end
    searching[-5..-1]
  end
end