class Recipe < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 255 }
    validates :ingridient_1, presence: true, length: { maximum: 255 }
    validates :ingridient_2, presence: true, length: { maximum: 255 }
    validates :sentence, presence: true, length: { maximum: 255 }
end
