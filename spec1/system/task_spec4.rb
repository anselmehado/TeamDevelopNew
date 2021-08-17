require 'rails_helper'
RSpec.describe 'Task management function', type: :system do

  before do

  FactoryBot.create(:task)
  FactoryBot.create(:second_task)
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do

        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'

      end
    end


    context 'Task arranged' do
      it 'New at the top' do
      task1 =  FactoryBot.create(:task, name: 'task1')
      task2 =  FactoryBot.create(:task, name: 'task2')
      visit tasks_path
      task_list = all('.task_row')
      expect(page).to have_content 'task2'
      expect(page).to have_content 'task1'
      end
    end



  end
end
