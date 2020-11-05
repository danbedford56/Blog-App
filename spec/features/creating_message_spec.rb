feature 'Adding a new peeps' do
  scenario 'A user adds a peeps' do
    create_account("test", "test")
    add_peep
    expect(current_path).to eq '/chitter_board'
    expect(page).to have_content 'test'
  end
end