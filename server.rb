require 'sinatra'
#require 'shotgun'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

def separate_comma(number)
  number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(" ").reverse
end

get '/' do 
  '<h2>Hallo Daniel!</h2> <p>wow, das klappt</p>'  
end

get '/topsecret' do 
  '<h2>Top Secret</h2> <p>Schweine können in wirklichkeit fliegen</>'  
end

##### named parameters

get "/add/:a/:b" do
	"<p>#{(params[:a].to_i + params[:b].to_i).to_s }</p>"
end

get "/mult/:a/:b" do
	"<p>#{separate_comma(params[:a].to_i * params[:b].to_i) }</p>"
end


##### form

get "/kto" do
    %q{
        <h2>Cześć!</h2>
        <form method="post">
        A kto to? <input type="text" name="name" />
        <input type="submit" value="Go!" />
        </form>
    }
end

post "/kto" do
    "A to #{params[:name]}"
end





get "/erb-template-external" do
    erb :mytemplate, :layout => :mylayout
end
