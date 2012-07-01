require 'unit/test_helper'
require 'interactors/sign_up_to_raid'
require 'models/user'
require 'models/raid'
require 'models/character'

describe SignUpToRaid do
  it "exists" do
    SignUpToRaid.new(nil).wont_be_nil
  end

  it "takes the current user and raid on construction" do
    user = User.new
    action = SignUpToRaid.new user
    action.current_user.must_equal user
  end

  describe "#run" do
    before do
      @user = User.new

      @character = Character.new id: 4
      @raid = Raid.new id: 12

      Repository.for(Character).save @character
      Repository.for(Raid).save @raid

      @action = SignUpToRaid.new @user
    end

    it "errors if can't find the raid"

    it "errors if can't find the character"

    it "doesn't let users sign up characters they don't own"

    it "doesn't let users sign up to raids they don't have access to"

    it "creates a signup record for the information given" do
      @action.run 12, 4

      repo = Repository.for(Signup)
      signup = repo.all.first

      signup.raid.must_equal @raid
      signup.character.must_equal @character
      signup.user.must_equal @user
    end

    describe "roles" do
      it "errors if the raid doesn't have the named role" do
        -> {
          @action.run 12, 4, :cheerleader
        }.must_raise RuntimeError
      end

      it "puts character in the specified role" do
        @action.run 12, 4, :tank

        repo = Repository.for(Signup)
        signup = repo.all.first
        signup.role.must_equal :tank
      end
    end
  end
end
