

feature 'Viewing Chitter' do
    scenario 'visiting the index page' do
        visit ('/')
        expect(page).to have_content "Chitter"
    end

    scenario 'a user can see posts' do
        visit ('/chitter')
        expect(page).to have_content "Test Post 1"
    end 

end 