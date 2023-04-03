require 'rails_helper'

RSpec.describe 'Contestants index page' do
  describe 'as a visitor' do
    it 'I see a list of names of all the contestants and their projects' do
      @project_1 = Project.create!(name: "Litfit", material: "Lamp Shade")
      @project_2 = Project.create!(name: "Upholstery Tuxedo", material: "Couch")
      @project_3 = Project.create!(name: "LeatherFeather", material: "Bird")

      @contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
      @contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 36, hometown: "New York City", years_of_experience: 12)
      @contestant_3 = Contestant.create!(name: "Uli Herzner", age: 34, hometown: "Boston", years_of_experience: 15)

      @contestant_1.projects << @project_1
      @contestant_1.projects << @project_2
      @contestant_2.projects << @project_3

      visit '/contestants'

      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content("Projects: Litfit, Upholstery Tuxedo")
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content("Projects: LeatherFeather")

    end
  end
end