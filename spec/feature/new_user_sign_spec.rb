feature 'New user' do
  scenario 'sign up page' do
    visit ('/signup')
    expect(page.status_code).to eq 200
    fill_in('email', with: 'sample@email.co.uk')
    fill_in('password', with: 'password1')
    expect{click_button('Sign up')}.to change{User.count}.by(1)
  end

  scenario 'after sign up welcome message appears' do
    visit ('/signup')
    fill_in('email', with: 'sample@email.co.uk')
    fill_in('password', with: 'password1')
    click_button('Sign up')
    expect(page).to have_content('Welcome sample@email.co.uk!')
  end

  scenario 'after sign up email is in database' do
    visit ('/signup')
    fill_in('email', with: 'sample@email.co.uk')
    fill_in('password', with: 'password1')
    click_button('Sign up')
    expect(User.first.email).to eq 'sample@email.co.uk'
  end

end