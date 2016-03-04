class Post < ActiveRecord::Base

  validates :title, :sub_id, :author_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id
  )

  belongs_to(
    :sub,
    class_name: 'Sub',
    primary_key: :id,
    foreign_key: :sub_id
  )

  has_one(
    :moderator,
    through: :sub,
    source: :moderator
  )
end
