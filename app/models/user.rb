class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snippets

  validates :username, presence: true, 
                       length: { minimum: 6, maximum: 20 }, 
                       uniqueness: { case_sensitive: false }
end

