require 'rails_helper'
RSpec.describe Task, type: :model do
  # Title must be valid if there is a title, production year, screening time, and Eirin classification.
  it "is valid with a name, content, deadline, status" do
    task = Task.new(
      name: 'DIC',
      content: 'bonji',
      deadline: 120,
      status: 'G')
    expect(task).to be_valid
  end

end
