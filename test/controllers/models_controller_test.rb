require "test_helper"

class ModelsControllerTest < ActionDispatch::IntegrationTest
   test "PUT /models/:id" do
      ilx_model = models(:ilx)

      put "/models/#{ilx_model.id}.id",
          params: {
            average_price: 100_001
          },
          as: :json

      ilx_model.reload

      assert_response :ok
      assert_equal({
        "id" => ilx_model.id,
        "name" => ilx_model.name,
        "average_price" => ilx_model.average_price
      }, response.parsed_body)
   end
end
