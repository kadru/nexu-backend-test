require "test_helper"

class ModelTest < ActiveSupport::TestCase
  test "average_price validations" do
    model = Model.new(average_price: 99_999)

    # model is invalid when average price is not greater than 100_000
    assert_not model.valid?
    assert_equal [ "must be greater than 100000" ], model.errors[:average_price]

    # model must be valid when average_price is nil
    model = Model.new(brand: Brand.new)

    assert model.valid?
  end
end
