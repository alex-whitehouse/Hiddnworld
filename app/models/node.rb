class Node < ApplicationRecord
  belongs_to :trail
  has_many :completed_nodes, dependent: :destroy
end
