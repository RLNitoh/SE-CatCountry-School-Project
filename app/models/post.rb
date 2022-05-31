# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :string
#  date        :date
#  description :string
#  isPublic    :boolean
#  likes       :integer
#  postID      :integer
#  title       :string
#  userID      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord

  # Association to user
  belongs_to :user # ----TODO----

  # one-to-one reltionship between Post and Image.
  has_one_attached :post_image
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  # user-posts association
  belongs_to(
    :creator,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :posts
  )

  # A new post should 
  validates :title, presence: true

end
