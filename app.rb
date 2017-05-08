require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

get("/") do
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  @tasks = Task.all()
  erb(:lists)
end

get("/lists/new") do
  @tasks = Task.all()
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.create({:name => name, :id => nil})
  @tasks = Task.all()
  erb(:list_success)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @tasks = Task.all()
  erb(:list)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.create({:description => description, :list_id => list_id, :done => false})
  erb(:task_success)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
