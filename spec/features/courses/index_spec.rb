require 'rails_helper'

RSpec.describe "Courses Index Page", type: :feature do 

  before(:each) do 
    @student1 = Student.create(name: "Albus Severus Potter", age: 15, house: "Slytherin")
    @student2 = Student.create(name: "James Sirius Potter", age: 17, house: "Gryffindor")

    @course1 = @student1.courses.create(name: "Herbology")
    @course1.students << @student2
    @course2 = @student1.courses.create(name: "Potions")
    @course2.students << @student2
    @course3 = @student1.courses.create(name: "Defense Against the Dark Arts")
    @course4 = Course.create(name: "Charms")
  end

  it "lists all courses with number of students enrolled" do
    visit "/courses"

    expect(page).to have_content("Herbology: 2")
    expect(page).to have_content("Potions: 2")
    expect(page).to have_content("Defense Against the Dark Arts: 1")
    expect(page).to have_content("Charms: 0")
  end

  it "lists courses in alphabetical order" do
    visit "/courses"

    expect(@course4.name).to appear_before(@course3.name)
    expect(@course3.name).to appear_before(@course1.name)
    expect(@course1.name).to appear_before(@course2.name)
    expect(@course4.name).to appear_before(@course2.name)    
    expect(@course3.name).to appear_before(@course2.name)    
  end

end
