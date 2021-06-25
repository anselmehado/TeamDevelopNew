require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
   #pending "add some examples to (or delete) #{__FILE__}"
  let!(:task) { FactoryBot.create(:task, title: 'task') }
  before do
    #The code in before is executed at the timing when the context is executed, such as "when transitioning to the list screen" or "when tasks are arranged in descending order of creation date and time".
    visit tasks_path
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed'
        # Description of task data creation and transition to list screen has been moved, so description here is not required
        # step1で実装済みのためomit
      end
    end
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        # Implement here
      end
    end
  end
