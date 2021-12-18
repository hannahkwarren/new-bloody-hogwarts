require 'rails_helper'

RSpec.describe "Student Show Page", type: :feature do 

  before(:each) do 
    @student1 = Student.create(name: "Albus Severus Potter", age: 15, house: "Slytherin")
    @student2 = Student.create(name: "James Sirius Potter", age: 17, house: "Gryffindor")

    @course1 = @student1.courses.create(name: "Herbology")
    @course2 = @student1.courses.create(name: "Potions")
    @course3 = @student1.courses.create(name: "Defense Against the Dark Arts")
    @course4 = @student2.courses.create(name: "Charms")
  end

  it "shows all of a student's courses" do
    visit "/students/#{@student1.id}"

    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
    expect(page).to have_content("Defense Against the Dark Arts")
    expect(page).to_not have_content("Charms")
  end
end
