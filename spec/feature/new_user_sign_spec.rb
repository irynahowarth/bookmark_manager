feature 'New user' do
  scenario 'sign up page' do
    sign_up
    expect { sign_up }.to change(User, :count)
  end

  scenario 'after sign up welcome message appears' do
    sign_up
    expect(page).to have_content('Welcome sample@email.co.uk!')
  end

  scenario 'after sign up email is in database' do
    sign_up
    expect(User.first.email).to eq 'sample@email.co.uk'
  end

  scenario 'new user is not created if password and verify password differ' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'sample@email.co.uk',
              password: 'password1',
              password_confirmation: 'password1')
    visit '/signup'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :verify_password, with: password_confirmation
    click_button 'Sign up'
  end

end