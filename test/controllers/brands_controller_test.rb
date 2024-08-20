require "test_helper"

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "GET /brands" do
    get "/brands", as: :json
    acura_brand = brands(:acura)
    audi_brand = brands(:audi)

    assert_equal [
      { "id" => audi_brand.id,
        "name" => audi_brand.name,
        "average_price" => audi_brand.average_price },
      { "id" => acura_brand.id,
        "name" => acura_brand.name,
        "average_price" => acura_brand.average_price }
    ],
    response.parsed_body
  end
end
