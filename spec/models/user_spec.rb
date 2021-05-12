require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
   it 'emailが空だと登録できない' do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it 'emailが空だと登録できない' do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it 'passwordが半角英数字混合でなければ登録できない' do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end
   it 'passwordが空だと登録できない' do
     @user.password = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it 'password_confirmationがpasswordと一致していないと登録できない' do
     @user.password_confirmation = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it 'family_nameが空だと登録できない' do
     @user.family_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Family name can't be blank")
   end
   it 'family_nameが全角文字でないと登録できない' do
    @user.family_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end
   it 'first_nameが空だと登録できない' do
     @user.first_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("First name can't be blank")
   end
     it 'first_nameが全角文字でないと登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
   end
   it 'kana_family_nameが空だと登録できない' do
     @user.kana_family_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Kana family name can't be blank")
   end
   it 'kana_family_nameが全角カタカナでないと登録できない' do
    @user.kana_family_name = 'てすと'
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana family name is invalid")
  end
   it 'kana_first_nameが空だと登録できない' do
     @user.kana_first_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Kana first name can't be blank")
   end
   it 'kana_first_nameが全角カタカナでないと登録できない' do
    @user.kana_first_name = 'てすと'
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name is invalid")
  end
   it 'birthdayが空だと登録できない' do
     @user.birthday = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end
  end
end
