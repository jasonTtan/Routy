class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

  def yelpDests
    # This function acts as a server side proxy to retrieve yelp data without
    # exposing secret keys
    consumer_key = '7H5kBamS1jYaTsK_2RYmFQ'
    consumer_secret = '5CB-sj4CP71f3YJSQyjKV3PNktI'
    token = 'uEF1SqoxT9YF-3PEBaUJldLma-WcFp2M'
    token_secret = 'YRAcmXf19heqkhgY-D75q6yV_ws'

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search?term=" + params[:searchTerm] + "&location=los%20angeles"
#     Following commented out code was to template the yelp table server side
#     @yelpResults = JSON.parse(access_token.get(path).body)
#     # This will be AJAXed into a div, so don't use a layout
#     render :layout => false
    render :json => access_token.get(path).body
  end


  # GET /routes/1
  # GET /routes/1.json
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html { render layout: "showRouteLayout" } # show.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = Route.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end
end
