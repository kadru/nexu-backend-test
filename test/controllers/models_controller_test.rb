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
end
