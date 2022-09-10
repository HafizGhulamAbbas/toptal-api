RSpec.shared_examples 'shared test cases' do
    # it 'returns 200 status code' do
    #     expect(response_status).to eq(200)
    # end
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
end
