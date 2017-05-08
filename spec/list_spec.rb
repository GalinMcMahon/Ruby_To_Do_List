require('spec_helper')

describe(List) do

  # describe("#tasks") do
  #   it("returns an array of tasks for that list") do
  #     test_list = List.new({:name => "Epicodus stuff", :id => nil})
  #     test_list.save()
  #     test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
  #     test_task.save()
  #     test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
  #     test_task2.save()
  #     expect(test_list.tasks()).to(eq([test_task, test_task2]))
  #   end
  # end

  describe("#tasks") do
      it("tells which tasks are in it") do
        test_list = List.create({:name => "list"})
        test_task1 = Task.create({:description => "task1", :list_id => test_list.id})
        test_task2 = Task.create({:description => "task2", :list_id => test_list.id})
       expect(test_list.tasks()).to(eq([test_task1, test_task2]))
      end
    end


end
