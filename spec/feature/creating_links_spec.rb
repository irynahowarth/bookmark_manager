feature 'add links' do

  scenario 'with address and title' do
    visit ('/links/new')
    fill_in('title', with:'google')
    fill_in('url', with:'https://www.google.co.uk')
    click_button('Add link')

    expect(current_path).to eq '/links'

    within('ul#links') do
      expect(page).to have_content('google')
    end
  end

  scenario 'with a tag' do
    
    visit ('/links/new')
    fill_in('title', with:'google')
    fill_in('url', with:'https://www.google.co.uk')
    fill_in('tags', with:'search')
    click_button('Add link')
    
    link = Link.first
    expect(link.tags.map(&:tag)).to include('search')
  end

end
