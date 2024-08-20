require "test_helper"

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "GET /brands" do
    get "/brands", as: :json
    acura_brand = brands(:acura)
    audi_brand = brands(:audi)

    assert_equal [
      { "id" => audi_brand.id,
        "name" => audi_brand.name,
        "average_price" => 0.0 },
      { "id" => acura_brand.id,
        "name" => acura_brand.name,
        "average_price" => 375684.5 }
    ],
    response.parsed_body
  end

  test "POST /brands" do
    post "/brands",
         params: { name: "Toyoda" },
         as: :json

    parsed_response = response.parsed_body

    assert_response :created
    assert_kind_of Integer, parsed_response["id"]
    assert_equal "Toyoda", parsed_response["name"]
    assert_equal 0.0, parsed_response["average_price"]
  end

  test "POST /brands when cannot create a brand" do
    post "/brands",
         params: { name: "Acura" },
         as: :json

    assert_response :unprocessable_entity
    assert_equal(
      {
        "error_message" => "Name has already been taken"
      }, response.parsed_body)
  end
end
