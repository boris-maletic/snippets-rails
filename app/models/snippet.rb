class Snippet < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :filename, :content, presence: true
end

