class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos

  # def self.short_search(searching)
  #   short_search_results = []
  #   searching.each do |dun|
  #     if dun.item.length > 12
  #       short_search_results << dun.item.truncate(9)
  #     else
  #       short_search_results << dun.item 
  #     end
  #   end
  #   short_search_results
  # end

  def self.find_done(user)
    searching = Todo.where(user_id: user.id).where(done: true).to_a
    # results = self.short_search(searching)
    filler = [{item: 'bake cakes'}, {item: 'lift weights'}, {item: 'write lists'}, {item: 'eat veggies'}, {item: 'drink water'}]
    i = 4
    while searching.length < 5
      searching << filler[i]
      i -= 1
    end
    searching[-5..-1]
  end
end