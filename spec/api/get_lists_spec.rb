RSpec.describe 'Todo Lists' do

    context "get all lists" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'contains valid schema' do # [{"name":"Groceries","items":[{"label":"Bread","completed":false},{"label":"Chese","completed":true},{"label":"Tomatoes","completed":false}]},{"name":"Work","items":[{"label":"Code reviews","completed":false},{"label":"DB migration","completed":true},{"label":"Documentation writing","completed":false}]}]
        end
    end

    context "adding new list" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # it includes name and items
        end

        it 'increases the list count by 1' do
        end
    end

    context "deleting a list" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # it includes name and items
        end

        it 'decreases the list count by 1' do
        end
    end

    context "adding new list item" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # {"label":"Bread","completed":true}
        end

        it 'should have default status INCOMPLETE' do
        end
    end

    context "marking a list item as COMPLETE" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # {"label":"Bread","completed":true}
        end
    end

    context "marking a list item as INCOMPLETE" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # {"label":"Bread","completed":true}
        end
    end

    context "deleting a list item" do  
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # [{"label":"tomatoes","completed":false},{"label":"bread","completed":false}]
        end

        it 'decreases the list items count by 1' do
        end
    end

    context "overwrite the database" do
        it 'returns 200 status code' do
        end

        it 'responds within two seconds' do
        end

        it 'returns valid schema' do # [{"name":"L1","items":[{"label":"L11","completed":false},{"label":"L12","completed":true}]}]
        end

        context "newly added database"
            it 'has the correct data count' do
            end
    end
end