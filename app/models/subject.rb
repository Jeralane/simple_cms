class Subject < ActiveRecord::Base

  has_many :pages

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order(:position) }
  scope :newest_first, lambda {order("subjects.created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

end
