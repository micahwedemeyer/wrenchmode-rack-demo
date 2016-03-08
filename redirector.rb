require 'open-uri'
require 'json'

class Redirector
  def initialize(app)
    @app = app       

    @switched = false
    @status_url = "http://localhost:4000/api/domains/4"

    @check_thread = start_check_thread()
  end

  def call(env)      
    if @switched
      redirect
    else
      @app.call(env)   
    end
  end      

  def check_delay_secs
    5
  end

  def update_status
    puts "Update status"

    # TODO - Handle all the awful HTTP and JSON parsing things that can happen here...
    resp = open(@status_url, open_uri_headers)
    body = resp.read
    json = JSON.parse(body)

    @switch_url = json["switch_url"]

    if json["is_switched"]
      @switched = true
    else
      @switched = false
    end
  end

  private

  def open_uri_headers
    {
      "Accept" => "application/json"
    }
  end

  def switch_url
    "http://google.com"
  end

  def redirect
    [302, {'Location' => @switch_url, 'Content-Type' => 'text/html', 'Content-Length' => '0'}, []]
  end

  def start_check_thread
    Thread.new do
      while true do
        update_status
        sleep(check_delay_secs)
      end
    end
  end
end