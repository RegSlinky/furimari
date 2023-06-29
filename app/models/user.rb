class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birth_date, presence: true

         with_options presence: true do
          validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を全角で入力してください"}
          validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を全角で入力してください"}
          validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "を全角カタカナで入力してください"}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "を全角カタカナで入力してください"}
        end
      
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: "を英字と数字の両方を含めて入力してください"
end
