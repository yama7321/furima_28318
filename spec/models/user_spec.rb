require 'rails_helper'

RSpec.describe User do
  describe 'create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、first_name、family_name、first_name_kana、family_name_kana、birthdayがあれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '既に登録されているemailでは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '@を含まないemailは登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字未満では登録できないこと' do
      @user.password = 'aaa11'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'aaa111'
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'AAA１１１'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが英字だけでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'password_confirmationが空では登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが半角文字では登録できないこと' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_nameが半角文字では登録できないこと' do
      @user.family_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'firts_name_kanaが半角文字では登録できないこと' do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'first_name_kanaが漢字では登録できないこと' do
      @user.first_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'first_name_kanaがひらがなでは登録できないこと' do
      @user.first_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'family_name_kanaが半角文字では登録できないこと' do
      @user.family_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'family_name_kanaが漢字では登録できないこと' do
      @user.family_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'family_name_kanaがひらがなでは登録できないこと' do
      @user.family_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
  end
end
