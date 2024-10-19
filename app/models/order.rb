class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :status, inclusion: { in: ['pending', 'paid']}
end
