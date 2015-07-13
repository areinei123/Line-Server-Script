require 'sinatra'
require 'pry'
require 'pg'

lines_array = ARGF.readlinesx

def db_connection
  begin
    connection = PG.connect(dbname: "indexed_text")
    yield(connection)
  ensure
    connection.close
  end
end

def insert_lines(array)
  db_connection do |conn|
    array.each do |line|
      conn.exec_params("INSERT INTO indexed_text (line_text) VALUES ($1)", [line])
    end
  end
end

def find_text(text_id)
  db_connection do |conn|
    conn.exec_params("SELECT line_text FROM indexed_text " \
    "WHERE id = $1", [text_id])
  end
end

insert_lines(lines_array)

get "/lines/:id" do
  if find_text(params[:id]).first != nil
    result = find_text(params[:id])
  else
    halt 413
  end
  erb :lines_id, locals: {line: result}
end