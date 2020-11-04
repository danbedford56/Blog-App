feature 'Adding a new message' do
  scenario 'A user adds a message' do
    visit '/add_message'
    fill_in('message', with: 'Test message')
    click_button 'Submit'

    expect(current_path).to eq '/message_board'
    expect(page).to have_content 'Test message'
  end
end