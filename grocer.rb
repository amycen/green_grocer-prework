require "pry"
def consolidate_cart(cart)
  # code here
  whole_cart = {}
  cart.each do |item_hash|
    item_hash.each do |item, attrib|
      whole_cart[item] ||= {}
      whole_cart[item][:count] ||= 0
      whole_cart[item][:count] += 1
      binding.pry
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
