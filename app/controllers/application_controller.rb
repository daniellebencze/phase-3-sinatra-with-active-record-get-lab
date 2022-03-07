class ApplicationController < Sinatra::Base

    set :default_content_type, 'application/json'

  # add routes

    # get '/bakeries/:id' do
    # end

  get '/bakeries' do
    bakeries = Bakery.all.order(:name)
    bakeries.to_json
    # get all the bakeries from the database
    # send them back as a JSON array
  end

  get '/bakeries/:id' do  
      bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)
    # get all the bakeries from the database
    # return a single bakery as a JSON 
  end

  get '/baked_goods/by_price' do
     baked_goods = BakedGood.by_price
     baked_goods.to_json
    # returns an array of baked goods as JSON, sorted by price in descending order
  end

  get '/baked_goods/most_expensive' do
      baked_good = BakedGood.all.by_price.first
     baked_good.to_json
    # returns the single most expensive baked good as JSON
  end

end
