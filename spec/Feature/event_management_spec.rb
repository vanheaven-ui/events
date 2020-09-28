require 'rails_helper'

RSpec.feature 'Event_Management', type: :feature do
  before(:each) do
    user = User.new(name: 'Ezekiel')
    user.save
  end

  describe 'Create Event' do
    scenario 'User can create event' do
      login

      expect(page).to have_text('Ezekiel')
      visit '/events/new'
      expect(page).to have_text('Create an Event')
      fill_in 'event[name]', with: 'Event name'
      fill_in 'event[description]', with: 'Event Description'
      fill_in 'event[date]', with: '2020-09-27 08:23:11'
      fill_in 'event[location]', with: 'Event location'
      click_button 'Create Event'
      expect(page).to have_text('Event successfully created')
    end
  end

  private

  def login
    visit '/sign_in'
    fill_in :name, with: :Ezekiel
    click_button 'Sign in'
  end
end
