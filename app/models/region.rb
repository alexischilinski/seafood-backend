class Region < ApplicationRecord
    belongs_to :user, dependent: :destroy
end
