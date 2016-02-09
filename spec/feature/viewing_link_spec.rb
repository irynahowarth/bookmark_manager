
require 'capybara/rspec'


# User Story 1
##############

# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature 'Viewing links' do

  scenario 'User can see links on the homepage' do

    Link.create(url:'http//www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

  end
end


