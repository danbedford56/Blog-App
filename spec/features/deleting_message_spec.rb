feature 'Deleting a message' do
  scenario 'User deleting a peep' do
    ChitterBoard.add('Test message')
    visit '/chitter_board'
    expect(page).to have_content 'Test message'

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/chitter_board'
    expect(page).not_to have_content 'Test message'
  end
end