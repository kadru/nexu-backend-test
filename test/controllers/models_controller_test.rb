require "test_helper"

class ModelsControllerTest < ActionDispatch::IntegrationTest
   test "GET /brands/:id/models" do
      acura_brand = brands(:acura)
      idx_model = models(:ilx)
      mdx_model = models(:mdx)

      get "/brands/#{acura_brand.id}/models", as: :json

      assert_response :ok
      assert_equal [
          {
            "id" => mdx_model.id,
            "name" => mdx_model.name,
            "average_price" => mdx_model.average_price
         },
         {
           "id" => idx_model.id,
           "name" => idx_model.name,
           "average_price" => idx_model.average_price }
      ],
      response.parsed_body
   end

   test "POST /brands/:id/models" do
      acura_brand = brands(:acura)

      post "/brands/#{acura_brand.id}/models",
           params: {
             name: "Corota",
             average_price: 100_001
           },
           as: :json

      parsed_response = response.parsed_body

      assert_response :created
      assert_kind_of Integer, parsed_response["id"]
      assert_equal "Corota", parsed_response["name"]
      assert_equal 100_001, parsed_response["average_price"]
   end

   test "POST /brands/:id/models when brand doesn't exists" do
      post "/brands/0/models",
           params: {
             name: "Corota"
           },
           as: :json

      assert_response :not_found
      assert_equal(
         {
           "error_message" => "brand doesn't exists"
         },
         response.parsed_body)
   end

   test "POST /brands/:id/models when model name is not unique under current brand" do
      acura_brand = brands(:acura)

      post "/brands/#{acura_brand.id}/models",
           params: {
             name: "ILX"
           },
           as: :json

      assert_response :unprocessable_entity
      assert_equal({
         "error_message" => "Name has already been taken"
      },
      response.parsed_body)
   end
end
