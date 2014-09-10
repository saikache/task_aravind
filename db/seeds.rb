if Category.count <= 5
Category.create(:name => 'Education')
Category.create(:name => 'Sanitery')
Category.create(:name => 'Electronics')
Category.create(:name => 'Jewellary')
Category.create(:name => 'Paints')
Category.create(:name => 'Footwear')
Category.create(:name => 'Mobiles')
# Category.create(:name => '')
# Category.create(:name => '')
end

if User.count == 0
User.create(:email => 'test@test.com',:password => 'test' ,:admin => 1)
end
