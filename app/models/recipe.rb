class Recipe < ApplicationRecord
    belongs_to :user
    has_many :favorites,dependent: :destroy
    has_many :favusers, through: :favorites,source: :user, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 255 }
    validates :ingridient_1, presence: true, length: { maximum: 255 }
    validates :ingridient_2, presence: true, length: { maximum: 255 }
    validates :sentence, presence: true, length: { maximum: 255 }
end
