# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  about                  :string
#  bio                    :text
#  dateRegistered         :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  name                   :string
#  phone                  :integer
#  remember_created_at    :datetime
#  reportCount            :integer
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  userID                 :integer
#  userName               :string
#  username               :string
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  has_many :posts, dependent: :destroy 
  has_one_attached :user_image
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # scope :all_except, -> (user) {where.not(id:user)}
  # after_create_commit {broadcast_append_to "users"}
  has_many :messages



  # user-posts association
  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: 'user_id',
    inverse_of: :creator
  )

end
