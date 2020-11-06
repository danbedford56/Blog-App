feature 'Liking a peep' do
  scenario 'A user likes a peep' do
    create_account('test', 'test')
    add_peep
    expect(first('.peep')).to have_content '0'
    first('.peep').click_button 'like'
    expect(first('.peep')).to have_content '1'
  end
end