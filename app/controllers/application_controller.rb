class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'
get '/bakeries' do
  all_bakeries = Bakery.all
  all_bakeries.to_json
end

get '/bakeries/:id' do
  single_bakery = Bakery.find(params[:id])
  single_bakery.to_json(include: :baked_goods)
end

get '/baked_goods/by_price' do
  baked_goods = BakedGood.order(price: :desc)
  baked_goods.to_json
end

get '/baked_goods/most_expensive' do
  baked_goods = BakedGood.order(price: :asc).last
  baked_goods.to_json
end
  # add routes

end
