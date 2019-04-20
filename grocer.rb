require "pry"
def consolidate_cart(cart)
  # code here
  whole_cart = cart.reduce Hash.new, :merge
  cart.each do |item_hash|
    item_hash.each do |item, attrib|
      whole_cart[item] ||= {}
      whole_cart[item][:count] ||= 0
      curr_count = whole_cart[item][:count]
      whole_cart[item][:count] = curr_count + 1
    end
  end
  whole_cart
end

coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

def apply_coupons(cart, coupons)
  # code here
  cart.each do |item, attrib|
    coupons.find {|coupon| coupon[:item] == item}
      if item == coupon[:item]
        attrib[:count] % coupon[:num]
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
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"SOY MILK" => {:price => 4.50, :clearance => true}}
]

coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

consolidate_cart(cart)
