require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  setup do
    @product = products(:shirt)
    @subscriber = subscribers(:david)
  end

  test "in_stock" do
    mail = ProductMailer.with(product: @product, subscriber: @subscriber).in_stock
    assert_equal "In stock", mail.subject
    assert_equal [ @subscriber.email ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
