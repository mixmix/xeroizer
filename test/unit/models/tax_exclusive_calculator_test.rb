require "test_helper"

class TaxCalculatorTest < Test::Unit::TestCase
  include Xeroizer::Record

  def setup
    @the_line_items = [
      LineItem.build({:quantity => 1, :unit_amount => 1.00, :tax_amount => 0.15}, nil),
      LineItem.build({:quantity => 1, :unit_amount => 1.00, :tax_amount => 0.30}, nil)
    ]
  end

  it "sub_total is the sum of the line_amounts" do
    assert_equal BigDecimal("2.00"), LineItemSum.sub_total(@the_line_items)
  end

  it "total_tax is the sum of the tax_amounts" do
    assert_equal BigDecimal("0.45"), LineItemSum.total_tax(@the_line_items)
  end

  it "total is the sum of sub_total and total_tax" do
    assert_equal BigDecimal("2.45"), LineItemSum.total(@the_line_items)
  end
end
