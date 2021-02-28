class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: '全角文字を使ってください' } do
           validates :first_name, presence: true
           validates :last_name, presence: true
         end

         with_options presence: true, format: { with: /\A[ァ-ヶー-]+\z/, message: '全角カタカナを使ってください' } do
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         end

         with_options presence: true, format: { with: /[a-z\d]{6,}/i, message: '半角英数字混合で入力してください' } do
         validates :encrypted_password
         end

         validates :nickname, presence: true 
         validates :birthday, presence: true

        
end
