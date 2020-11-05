feature 'Adding a new peeps' do
  scenario 'A user adds a peeps' do
    visit '/add_peep'
    fill_in('message', with: 'Test message')
    click_button 'Submit'
    
    expect(current_path).to eq '/chitter_board'
    expect(page).to have_content 'Test message'
  end
end