feature 'Deleting a message' do
  scenario 'User deleting a peep' do
    create_account("test", "test")
    add_peep
    expect(page).to have_content 'test'

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/chitter_board'
    expect(page).not_to have_content 'Test message'
  end

  scenario 'User cannot delete peep that they do not own' do
    create_account("test", "test")
    add_peep
    expect(page).to have_content 'test'
    create_account("test2", "test2")
    expect(first('.peep')).to_not have_button 'Delete'
  end
end