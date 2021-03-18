class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: '全角文字を使ってください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー-]+\z/, message: '全角カタカナを使ってください' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  has_many :items
  has_many :purchase_records
end
