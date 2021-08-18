
require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe 'New creation function' do
    before(:each) do
    visit root_path
  end

    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
        fill_in 'task', with: 'task3'
        select '2021', :from => 'task_deadline_1i'
        select '1', :from => 'task_deadline_3i'
        select "unstated", :from => 'task_status'
        select "hight", :from => 'task_priority'
        click_button "Register"
        expect(page).to have_content 'task3'
        expect(page).to have_content 'unstated'
        expect(page).to have_content 'hight'
      end
    end
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        task = FactoryBot.create(:task, task_name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end

    context 'When tasks are arranged in descending order of deadline date and time' do
      it 'Task with higher deadline is displayed at the top' do
        date0 = DateTime.now.to_date
        date1 = date0 + 2.day
        task4 = FactoryBot.create(:task, task_name: 'task4', deadline: date1)
        date2 = date0 + 1.day
        task5 = FactoryBot.create(:task, task_name: 'task5', deadline: date2)
        visit tasks_path(sort_expired: "true")
        task_list = all('.deadline_row')
        expect(task_list[0].text).to eq task4.deadline.to_s
      end
    end

  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
        task = FactoryBot.create(:task, task_name: 'task')
        visit task_path(task.id)
        expect(page).to have_content 'task'
       end
     end
  end

  describe 'Search function' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
    end
    context 'If you do a fuzzy search by Title' do
      it "Filter by tasks that include search keywords" do
        visit tasks_path
        search_task_name = "Title 1"
        visit tasks_path(task_name: search_task_name)
        expect(page).to have_content search_task_name
      end
    end
    context 'When you search for status' do
      it "Tasks that exactly match the status are narrowed down" do
        visit tasks_path
        search_status = "unstated"
        visit tasks_path(status: search_status)
        expect(page).to have_content search_status
      end
    end

    context 'Title performing fuzzy search of title and status search' do
      it "Narrow down tasks that include search keywords in the Title and exactly match the status" do
        visit tasks_path
        search_task_name = "Title 2"
        search_status = "unstarted"
        visit tasks_path(task_name: search_task_name, status: search_status)
      end
    end
  end
end
