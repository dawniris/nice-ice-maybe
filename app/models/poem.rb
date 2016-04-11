class Poem < ActiveRecord::Base
  validates :name, presence: :true
end