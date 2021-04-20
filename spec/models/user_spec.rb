require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe "ユーザー新規登録" do
      context "新規登録できる場合" do
        it "nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_dateが存在すれば登録できる" do
          expect(@user).to be_valid
        end
        
        it "emailに@が含まれていれば登録できる" do
          @user.email = "test@test.com"
          expect(@user).to be_valid
        end

        it "passwordとpassword_confirmationが6文字以上で英数字混合であれば登録できる" do
          @user.password = "012abc"
          @user.password_confirmation = "012abc"
          expect(@user).to be_valid
        end

        it "last_nameが全角であれば登録できる" do
          @user.last_name = "あああ"
          expect(@user).to be_valid
        end

        it "first_nameが全角であれば登録できる" do
          @user.first_name = "あああ"
          expect(@user).to be_valid
        end

        it "last_name_kanaが全角カタカナであれば登録できる" do
          @user.last_name_kana = "アアア"
          expect(@user).to be_valid
        end

        it "first_name_kanaが全角カタカナであれば登録できる" do
          @user.first_name_kana = "アアア"
          expect(@user).to be_valid
        end
      end
  
      context "新規登録できない場合" do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "重複するemailが存在する場合、登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it "emailに@がない場合は登録できない" do
          @user.email = "testtesttest"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが存在しても、password_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが5文字以下では登録できない" do
          @user.password = "123ab"
          @user.password_confirmation = "123ab"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが数字のみでは登録できない" do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが英字のみでは登録できない" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが全角では登録できない" do
          @user.password = "ｂｃｄｂｃｄ１２"
          @user.password_confirmation = "ｂｃｄｂｃｄ１２"
          expect(@user.errors.full_messages).to include()
        end

        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "last_nameが全角(漢字、ひらがな、カタカナ)でなければ登録できない" do
          @user.last_name = "あああa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角(漢字、ひらがな、カタカナ)のみで入力してください")
        end

        it "first_nameが全角(漢字、ひらがな、カタカナ)でなければ登録できない" do
          @user.first_name = "あああaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角(漢字、ひらがな、カタカナ)のみで入力してください")
        end

        it "last_name_kanaが全角カタカナでなければ登録できない" do
          @user.last_name_kana = "あアアア"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力してください")
        end

        it "first_name_kanaが全角カタカナでなければ登録できない" do
          @user.first_name_kana = "あアアア"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
        end

        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
