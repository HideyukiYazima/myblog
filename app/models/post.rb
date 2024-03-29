class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # @post.comments
  validates :title, presence: true, length: {minimum: 3, message: 'Too short to post!' }
  validates :body, presence: true

  # user_idカラムにバリデーションを追加してください
  validates :user_id, {presence: true}
  
  # インスタンスメソッドuserを定義してください
  def user
    return User.find_by(id: self.user_id)
  end
  
end
