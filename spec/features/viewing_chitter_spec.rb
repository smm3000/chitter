

feature 'Viewing Chitter' do
    scenario 'visiting the index page' do
        visit ('/')
        expect(page).to have_content "Chitter"
    end

    scenario 'a user can see posts' do
        connection = PG.connect(dbname: 'chitter_2_test')
        connection.exec("INSERT INTO chitter_messages (message) VALUES ('TEST POST 1');")
        visit ('/chitter')
        expect(page).to have_content "TEST POST 1"
    end 

end 