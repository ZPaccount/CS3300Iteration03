require "rails_helper"


describe "Game Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating game" do
      game = Game.new(description: "Content of the description", rating: 5, playTime: 10)
      expect(game.valid?).to eq(false)
    end
    it "should not be able to save game when title missing" do
      game = Game.new(description: "Some description content goes here", rating: 5, playTime: 10)
      expect(game.save).to eq(false)
    end
    it "ensures the description is present when creating game" do
        game = Game.new(title: "Test Title", rating: 5, playTime: 10)
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save game when description missing" do
      game = Game.new(title: "Test Title", rating: 5, playTime: 10)
      expect(game.save).to eq(false)
    end
    it "ensures the rating is present when creating game" do
        game = Game.new(description: "Some description content goes here", title: "Test Title", playTime: 10)
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save game when rating missing" do
      game = Game.new(description: "Some description content goes here", title: "Test Title", playTime: 10)
      expect(game.save).to eq(false)
    end
    it "ensures the playTime is present when creating game" do
        game = Game.new(description: "Some description content goes here", title: "Test Title", rating: 5)
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save game when playTime missing" do
      game = Game.new(description: "Some description content goes here", title: "Test Title", rating: 5)
      expect(game.save).to eq(false)
    end
    it "should be able to save game when have description, title, rating, and playtime" do
      game = Game.new(title: "Title", description: "Content of the description", rating: 5, playTime: 10)
      expect(game.save).to eq(true)
    end
  end
end


describe "Game Attribute Requirements on Edit", :type => :model do
  context "Edit game" do  
    before (:each) do
      @game = Game.create(title: "Title", description: "Content of the description")
 
    end
    it "ensures the title is present when editing game" do
      @game.update(:title => "New Title")
      expect(@game.title == "New Title")
    end
    it "ensures the description is present when editing game" do
        @game.update(:description => "New description")
        expect(@game.description == "New description")
    end
    it "ensures the rating is present when editing game" do
        @game.update(:rating => 5)
        expect(@game.rating == 5)
    end
    it "ensures the playTime is present when editing game" do
        @game.update(:playTime => 100)
        expect(@game.playTime == 100)
    end
  end
end
