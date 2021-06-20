require 'rails_helper'

RSpec.describe Task, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'fonction du modele tache', type: :model do
    describe 'test de validation' do
      context 'verifier si le titre de tache est vide' do
        it 'echec de validation' do
          task = Task.new(title: '', content: 'test de defaillance')
          expect(task).not_to be_valid
        end
      end

  　　context 'les details sont vides' do
        it 'il est pris dans la validation' do
        @task.name = ''
        @task.content = ''
        @task.deadline = ''
        @task.status = ''
        expect(@task.valid?).to eq(false)
        end
      end
      context 'le contenu est décrit dans le titre et les détails de la tâche' do
        it 'validation passe' do

          expect(@task.valid?).to eq(true)
        end
      end
    end


end

FactoryBot.define do
  factory :task do
    #Please change the following contents according to the column name actually created
    title { 'test_title' }
    content { 'test_content' }
  end
end
