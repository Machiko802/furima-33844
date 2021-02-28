require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、 first_name、last_name、
      first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角（漢字）であれば登録できる' do
        @user.first_name = '花子'
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角（ひらがな）であれば登録できる' do
        @user.first_name = 'はなこ'
        @user.last_name = 'やまだ'
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角（カタカナ）であれば登録できる' do
        @user.first_name = 'ハナコ'
        @user.last_name = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'ハナコ'
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'emailに＠が含まれていれば登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在しても、password_confirmationが空では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに＠が含まれていないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordがで半角英数字混合以外では登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが全角（漢字・ひらがな・カタカタ）以外では登録できない' do
        @user.first_name = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使ってください'
      end
      it 'last_nameが全角（漢字・ひらがな・カタカタ）以外では登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使ってください'
      end  
      it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使ってください'
      end
      it 'last_name_kanaが全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana 全角カタカナを使ってください'
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordは半角英語のみは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordは数字のみは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordは全角英数字混合は登録できない' do
        @user.password = '１１１ａａａ'
        @user.password_confirmation = '１１１ａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
    end
  end
end
