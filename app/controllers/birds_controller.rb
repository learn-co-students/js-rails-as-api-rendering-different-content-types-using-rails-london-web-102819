class BirdsController < ApplicationController
  def index
    # 👇 @birds, instance vavirables are for rendering to ERB. 
        # @birds = Bird.all
        # 👇Rails implicityly render this. Usually, not typing it out liek this.
        # render 'birds/index.html.erb' 
    
    # for directly rendering to JSON in the same action, a simple local varialbe works just fine:
        birds = Bird.all
        render json: birds

    #👇to explicitly render plaintext: __ now, via JS, can access with a fetch() request
    # render plain: "Hello #{@birds[3].name}"

    #👇to start using our JavaScript skills and access with a fetch() request.
      #example_frontend.html as a frontend to send request to this Rails app.
      #in example_frontend page, to access the plain text rendered above:
      #fetch('http://localhost:3000/birds').then(response => response.text()).then(text => console.log(text));
    
    #👇to render JSON from a controller __ you specify json: followed by data that can be converted to valid JSON:

        #plain text:
    #render json: 'Remember that JSON is just object notation converted to string data, so strings also work here'

        #We can pass strings as we see above, as well as hashes, arrays, and other data types:
    # render json: { message: 'Hashes of data will get converted to JSON' }
    # render json: ['As','well','as','arrays']

        #In our bird watching case, we actually already have a collection of data, @birds, so we can write:
    # render json: @birds 
    #👆 Going back to our example_frontend.html, we could send another fetch() request to the same place:
        #fetch('http://localhost:3000/birds').then(response => response.json()).then(object => console.log(object))
        #👉 compare the above fetch() request to render json:@birds vs. below:
    # render json: { birds: @birds, messages: ['Hello Birds', 'Goodbye Birds'] }
      # the same as render json: { birds: @birds, messages: ['Hello Birds', 'Goodbye Birds'] }.to_json. Rails implicitly takes arrays and hashes and convert them to JSON 
      #fetch('http://localhost:3000/birds').then(response => response.json()).then(object => console.log(object))
  end
end


