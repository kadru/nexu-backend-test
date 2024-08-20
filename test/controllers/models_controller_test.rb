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

   test "GET /models" do
      mdx_model = models(:mdx)
      ilx_model = models(:ilx)
      get "/models", as: :json

      assert_response :ok
      assert_equal [
         {
            "id" => mdx_model.id,
            "name" => mdx_model.name,
            "average_price" => mdx_model.average_price
         },
         {
            "id" => ilx_model.id,
            "name" => ilx_model.name,
            "average_price" => ilx_model.average_price
         }
      ], response.parsed_body
   end

   test "GET /models?greater=1000" do
      mdx_model = models(:mdx)

      get "/models?greater=#{440_000}",
          as: :json

      assert_response :ok
      assert_equal [
         {
            "id" => mdx_model.id,
            "name" => mdx_model.name,
            "average_price" => mdx_model.average_price
         }
      ], response.parsed_body
   end

   test "GET /models?lower=1000" do
      ilx_model = models(:ilx)

      get "/models?lower=#{440_000}",
          as: :json

      assert_response :ok
      assert_equal [
         {
            "id" => ilx_model.id,
            "name" => ilx_model.name,
            "average_price" => ilx_model.average_price
         }
      ], response.parsed_body
   end
end
