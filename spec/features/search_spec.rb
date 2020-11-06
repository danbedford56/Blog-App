feature 'Searching for a peep' do
  scenario 'User enters chitterboard' do
    create_account('test', 'test')
    expect(page).to have_field "keyword"
  end

  scenario 'User searches for a keyword' do
    create_account('test', 'test')
    add_peep
    fill_in 'keyword', with: 'test'
    click_button 'Search'
    expect(current_path).to eq '/peep_search'
    expect(first('.peep')).to have_content 'test'
  end

end