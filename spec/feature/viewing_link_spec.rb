
require 'capybara/rspec'



feature 'Viewing links' do

  # User Story 1
  ##############

  # As a time-pressed user
  # So that I can quickly go to web sites I regularly visit
  # I would like to see a list of links on the homepage


  scenario 'User can see links on the homepage' do

    Link.create(url:'http//www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page.status_code).to eq 200

    within('ul#links') do
      expect(page).to have_content('Makers Academy')
    end
  end
  # User Story 3
  ##############

  # As a time-pressed user
  # So that I can quickly find links on a particular topic
  # I would like to filter links by tag

  scenario 'User can see links filtered by Tag' do

    Link.create(url:'http//www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag: 'coding')])
    Link.create(url:'http//bbc.co.uk', title: 'BBC', tags: [Tag.first_or_create(tag: 'news')])
    Link.create(url:'http//theguardian.co.uk', title: 'Guardian', tags: [Tag.first_or_create(tag: 'news')])
    visit('/tags/news')
    expect(page.status_code).to eq 200
    within('ul#links') do
      expect(page).not_to have_content('Makers Academy')
      expect(page).to have_content('BBC')
      expect(page).to have_content('Guardian')
    end
  end

end




