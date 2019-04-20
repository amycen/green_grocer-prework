require "pry"
def consolidate_cart(cart)
  # code here
  whole_cart = cart.reduce Hash.new, :merge
  binding.pry
  cart.each do |item_hash|
    item_hash.each do |item, attrib|
      whole_cart[item] ||= {}
      whole_cart[item][:count] ||= 0
      whole_cart[item][:count] += 1

    end
  end
  whole_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"KALE" => {:price => 3.00, :clearance => false}},
  {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
  {"ALMONDS" => {:price => 9.00, :clearance => false}},
  {"TEMPEH" => {:price => 3.00, :clearance => true}},
  {"CHEESE" => {:price => 6.50, :clearance => false}},
  {"BEER" => {:price => 13.00, :clearance => false}},
  {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
  {"BEETS" => {:price => 2.50, :clearance => false}},
  {"SOY MILK" => {:price => 4.50, :clearance => true}}
]

consolidate_cart(cart)
