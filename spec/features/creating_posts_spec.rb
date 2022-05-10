
feature 'Adding a post' do
    scenario 'A user can add a post to Chitter' do
        visit('/chitter/new')
        fill_in('message', with: 'Test Peep 1')
        click_button('Submit')
        expect(page).to have_content 'Test Peep 1'
    end
end