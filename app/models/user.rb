class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/} do
    validates :password
  end
  
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角のみで入力してください"} do
    validates :last_name
    validates :first_name
  end

  with_options presence:true, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"} do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth_date, presence: true

  has_many :items
  has_many :buy_infos
end
