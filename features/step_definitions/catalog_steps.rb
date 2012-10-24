#encoding: utf-8

前提 /^商品管理ページを開いている$/ do
  visit "/products"
end

前提 /^"(.*?)"をクリックする$/ do |link_text|
  click_link link_text
end

もし /^以下の内容で商品を登録する:$/ do |table|
  product_info = table.hashes[0]
  fill_in 'product_name', with: product_info['商品名']
  fill_in 'product_price', with: product_info['価格']
  fill_in 'product_description', with: product_info['説明']
  click_on 'Save'
end

ならば /^"(.*?)"が商品詳細ページに表示されていること$/ do |product_name|
  visit url_for(Product.where(name: product_name).first)
  within 'p.name' do
    page.should have_content(product_name)
  end
end

ならば /^説明が"(.*?)"になっていること$/ do |product_description|
  within 'div.description' do
    page.should have_content(product_description)
  end
end

ならば /^価格が"(.*?)"となっていること$/ do |product_price|
  within 'p.price' do
    page.should have_content(product_price)
  end
end