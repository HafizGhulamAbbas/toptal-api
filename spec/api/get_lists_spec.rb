RSpec.shared_examples 'shared test cases' do
    # it 'returns 200 status code' do
    #     expect(response_status).to eq(200)
    # end

    it 'responds within 200ms' do
        expect(time_taken*100).to be < 200
    end
  end

RSpec.describe 'Todo Lists' do

    context "list names are unique" do
        BASE_URL = "http://localhost:4567"
        list_name = Time.now
        new_list_response = Faraday.new(url: BASE_URL).post('/lists/add', {"name": list_name}.to_json)
        duplicate_list_response = Faraday.new(url: BASE_URL).post('/lists/add', {"name": list_name}.to_json)
        
        let(:new_list) { JSON.parse(new_list_response.body)["name"] }
        let(:duplicate_list) { JSON.parse(duplicate_list_response.body)["name"] }
       
        it 'retricts duplicate list name' do
            expect(new_list).not_to eq(duplicate_list)
        end
    end

    context "api should response within 200ms" do
        let(:response_with_time) do
            start_time = Time.now
            response = Faraday.new(url: BASE_URL).post 'list/0/item/0/complete/true' do |req|
                req.headers[:content_type] = 'application/json'
            end
            end_time = Time.now
            response_time = end_time - start_time
            [response, response_time]
        end

        let(:time_taken) {response_with_time[1]}

        include_examples 'shared test cases'
    end

    context "list item labels are unique in scope of a list" do
        existing_list_items = JSON.parse((Faraday.get(BASE_URL+"/lists")).body)[0]["items"]
        existing_list_item_name = existing_list_items[0]["label"]

        Faraday.new(url: BASE_URL).post('/list/0/add', {"label": existing_list_item_name}.to_json)
        new_list_items = JSON.parse((Faraday.get(BASE_URL+"/lists")).body)[0]["items"]   

        let(:old_list_items) { existing_list_items }
        let(:new_list_items) { new_list_items }

        it 'retricts duplicate list items name' do
            expect(check_duplicate(new_list_items)).to be_falsey
        end
    end

end

def check_duplicate list
    visited = Set.new
    list.each do |element|
        if visited.include?(element)
            return true
        else
            visited << element
        end
    end
    return false
end