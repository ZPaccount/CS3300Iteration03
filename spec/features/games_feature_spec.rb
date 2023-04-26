require "rails_helper"


RSpec.feature "Games", type: :feature do
  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end

  context "Update game" do
    let(:game) { Game.create(title: "Test title", description: "Test content", rating: 5, playTime: 100) }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_game_path(game)
    end
 

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Game"
      expect(page).to have_content("Game was successfully updated")
    end


    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Game"
      expect(page).to have_content("Description can't be blank")
    end


    scenario "should be successful" do
      within("form") do
        fill_in "Title", with: "test"
      end
      click_button "Update Game"
      expect(page).to have_content("Game was successfully updated")
    end


    scenario "should fail" do
      within("form") do
        fill_in "Title", with: ""
      end
      click_button "Update Game"
      expect(page).to have_content("Title can't be blank")
    end


    scenario "should be successful" do
      within("form") do
        fill_in "Rating", with: 5
      end
      click_button "Update Game"
      expect(page).to have_content("Game was successfully updated")
    end


    scenario "should fail" do
      within("form") do
        fill_in "Rating", with: ""
      end
      click_button "Update Game"
      expect(page).to have_content("Rating can't be blank")
    end


    scenario "should be successful" do
      within("form") do
        fill_in "Playtime", with: 100
      end
      click_button "Update Game"
      expect(page).to have_content("Game was successfully updated")
    end


    scenario "should fail" do
      within("form") do
        fill_in "Playtime", with: ""
      end
      click_button "Update Game"
      expect(page).to have_content("Playtime can't be blank")
    end
  end

  context "Create game" do
      let(:game) { Game.create(title: "Test title", description: "Test content", rating: 5, playTime: 100) }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_game_path(game)
      end
   
   
      scenario "should be successful" do
        within("form") do
          fill_in "Title", with: "test"
          fill_in "Description", with: "New description content"
          fill_in "Rating", with: 5
          fill_in "Playtime", with: 100
        end
        click_button "Create Game"
        expect(page).to have_content("Game was successfully created")
      end
  
   
      scenario "should fail" do
        within("form") do
          fill_in "Title", with: "test"
          fill_in "Rating", with: 5
          fill_in "Playtime", with: 100
          fill_in "Description", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Description can't be blank")
      end
  
  
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: "New description content"
          fill_in "Rating", with: 5
          fill_in "Playtime", with: 100
          fill_in "Title", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Title can't be blank")
      end
  
  
      scenario "should fail" do
        within("form") do
          fill_in "Title", with: "test"
          fill_in "Description", with: "New description content"
          fill_in "Playtime", with: 100
          fill_in "Rating", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Rating can't be blank")
      end
  
  
      scenario "should fail" do
        within("form") do
          fill_in "Title", with: "test"
          fill_in "Description", with: "New description content"
          fill_in "Rating", with: 5
          fill_in "Playtime", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Playtime can't be blank")
      end
    end
end
