class Employee < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_name, against: :name
end
