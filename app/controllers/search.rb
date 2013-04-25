class Scrutor < Sinatra::Application
  get '/' do
    query  = params[:q] || ''
    search = Search.create(input: query)
    redirect search.url
  end
end
