feature 'Deleting a message' do
  scenario 'User deleting a message' do
    Message_Board.add('Test message')
    visit '/message_board'
    expect(page).to have_content 'Test message'

    first('.message').click_button 'Delete'

    expect(current_path).to eq '/message_board'
    expect(page).not_to have_content 'Test message'
  end
end