require './app.rb'

feature 'New listings page ' do
  scenario 'A user can add a listing' do
    visit('/listings')
    click_button('Add listing')
    fill_in('name', with: 'Test name of listing')
    fill_in('price', with: '50')
    fill_in('description', with: 'Test description of listing')
    click_button('Save')
    expect(page).to have_content 'Test name of listing'
    expect(page).to have_content '50'
    expect(page).to have_content 'Test description of listing'
  end
end

feature 'Sign up page' do
  scenario 'A new user can enter their details to become a user' do
    visit '/'
    click_button('signup')
    fill_in('user_name', with: 'Test name of user')
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'p1223')
    click_button('Save')
    expect(page).to have_content 'Add a new listing'
  end
end

feature 'Login' do
  scenario 'A user can log in and be directed to the listings page' do
    visit '/'
    click_button('signup')
    fill_in('user_name', with: 'Test name of user')
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'p1223')
    click_button('Save')
    visit '/'
    fill_in('email', with: 'test@gmail.com')
    fill_in('password', with: 'p1223')
    click_button('next')
    expect(page).to have_content 'Add a new listing'
  end
end

feature 'See requested bookings' do
  scenario 'A user can see the properties they own that have a requested booking' do
    visit '/'
    click_button('signup')
    fill_in('user_name', with: 'Test name of user')
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'p1223')
    click_button('Save')
    click_button('Add listing')
    fill_in('name', with: 'Test name of listing')
    fill_in('price', with: '50')
    fill_in('description', with: 'Test description of listing')
    click_button('Save')
    click_button('Book listing')
    click_button('listings page')
    click_button('View requests')
    expect(page).to have_content 'Test name of listing'
    expect(page).to have_content '50'
    expect(page).to have_content 'Test description of listing'
  end
end
