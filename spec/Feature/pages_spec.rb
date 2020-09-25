require 'rails_helper'

RSpec.feature 'Views', type: :feature do
  before(:each) do
    user = User.new(name: "Ezekiel")
    user.save
  end

  describe 'Sign in' do
    scenario 'User can sign in successfully' do
      visit '/sessions/new'
      fill_in :name, with: :Ezekiel
      click_button 'Sign in'
      expect(page).to have_text('Successfully signed in, cheers!')
    end

    scenario 'User cannot sign in' do
      visit '/sessions/new'
      fill_in :name, with: :John
      click_button 'Sign in'
      expect(page).to have_text('Oops! cannot sign in, check and try again or sign up')
    end
  end

  describe 'Create Event' do
    scenario 'User can create event' do
      visit '/events/new'
      expect(page).to have_text('Create an Event')
    end
  end

  describe 'Sign Up' do
    scenario 'User can sign up' do
      visit '/users/new'
      fill_in 'user[name]', with: :Robobo
      click_button 'Sign Up'
      expect(page).to have_text('You have signed up succesfully, please sign in')
    end
  end
end