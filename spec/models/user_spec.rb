require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameが空だと保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含まないと保存できない' do
      @user.email = 'tanakagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end
    it 'password_confirmationが空だと保存できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）、値の一致が必須' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、名字と名前がそれぞれ必須である' do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
      @user.first_name = '123'
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください', 'Last name 全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須である' do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須である' do
      @user.first_name_kana = 'たろう'
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角(カタカナ)を使用してください', 'Last name kana 全角(カタカナ)を使用してください')
    end
    it '生年月日が必須である' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
