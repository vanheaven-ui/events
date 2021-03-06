require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do # rubocop: disable Metrics/BlockLength
  before(:each) do
    user = User.new(name: 'Ezekiel')
    user.save
  end

  describe 'Sign in' do
    scenario 'User can sign in successfully' do
      visit '/sign_in'
      fill_in :name, with: :Ezekiel
      click_button 'Sign in'
      expect(page).to have_text('Successfully signed in, cheers!')
    end

    scenario 'User cannot sign in' do
      visit '/sign_in'
      fill_in :name, with: :John
      click_button 'Sign in'
      expect(page).to have_text('Oops! cannot sign in, check and try again or sign up')
    end
  end

  describe 'Sign Up' do
    scenario 'User can sign up' do
      visit '/users/new'
      fill_in 'user[name]', with: :Robobo
      click_button 'Sign Up'
      expect(page).to have_text('You have signed up succesfully, please sign in')
    end

    scenario 'User can cancel sign up' do
      visit '/users/new'
      fill_in 'user[name]', with: ''
      click_button 'Sign Up'
      expect(page).to have_text('Sign Up')
      click_link 'Cancel'
      expect(page).to have_text('Sign in')
    end
  end

  describe 'Sign Out' do
    scenario 'User can signout successfully' do
      visit '/sign_in'
      fill_in :name, with: :Ezekiel
      click_button 'Sign in'
      expect(page).to have_text('Successfully signed in, cheers!')
      click_link 'Sign Out'
      expect(page).to have_text('Successfully signed out!')
    end
  end
end
