require 'sinatra'
require 'pry'
require 'pg'

#string = ARGV[0]

def db_connection
  begin
    connection = PG.connect(dbname: "indexed_text")
    yield(connection)
  ensure
    connection.close
  end
end

def find_text(text)
  db_connection do |conn|
    conn.exec_params("SELECT line_text FROM indexed_text " \
    "WHERE line_text = $1", [text])
  end
end

get "/lines/:id" do
  result = find_text(:id)
  # if result == string
  #   "#{result}" 
  # else 
  #   "Not Found"
  # end
  return result
end