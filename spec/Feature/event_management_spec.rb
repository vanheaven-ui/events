require 'rails_helper'

RSpec.feature 'Event_Management', type: :feature do
  before(:each) do
    user = User.new(name: 'Ezekiel')
    user.save
  end

  describe 'Create Event' do
    scenario 'User can create event' do
      login

      visit '/events/new'
      expect(page).to have_text('Create an Event')
      
    end
  end

  private

  def login
    visit '/sign_in'
    fill_in :name, with: :Ezekiel
  end
end