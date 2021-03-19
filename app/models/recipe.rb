class Recipe < ApplicationRecord
    belongs_to :user
    has_many :favorites,dependent: :destroy
    has_many :favusers, through: :favorites,source: :user, dependent: :destroy
    
    mount_uploader :image, ImageUploader
    
    validates :title, presence: true, length: { maximum: 15 }
    validates :ingridient_1, presence: true, length: { maximum: 15 }
    validates :ingridient_2, presence: true, length: { maximum: 15 }
    validates :description,presence: true, length: { maximum: 120 }
    validates :sentence, presence: true, length: { maximum: 255 }
end
