require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    erb :splash
  end

  get '/home' do
    erb :home
  end

  post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]
    @city = params[:city]

  #  if !@full_name.match((/w+ w+ w+ w+|w+ w+ w+|w+ w+/))
  #    redirect to ('/e?error=email')
  #  end

    if !@email.match(/.+@.+/)
      redirect to('/e?error=email')
    end

    erb :subscribe
  end

  get '/reddit' do
    # TODO: we can probably get the listings with something like:
    # JSON.parse(RestClient.get('http://reddit.com/.json'))

    @listings = []

    erb :reddit
  end

  get '/youtube' do
    erb :youtube
  end

  get '/team' do
    erb :team
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Eat a croissant'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

      @day_after = [
      ['8:00am', 'Wake up'],
      ['8:30am', 'Party'],
      ['9:00am', 'Inbox One Thousand'],
      ['11:00am', 'Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee all in my belly'],
      ['6:30pm', 'Meetup Prezi'],
    ]

    # TODO: add a third day's schedule (@day_after)

    erb :schedule
  end
end
