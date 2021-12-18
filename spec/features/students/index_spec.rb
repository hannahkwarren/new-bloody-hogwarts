require 'rails_helper'

RSpec.describe "Students Index Page" do

  before(:each) do
    @student1 = Student.create(name: "Albus Severus Potter", age: 15, house: "Slytherin")

    @student2 = Student.create(name: "James Sirius Potter", age: 17, house: "Gryffindor")

    @student3 = Student.create(name: "Lily Luna Potter", age: 10, house: "Gryffindor")
  end

  it "lists all students with information" do
    visit "/students"

    within("div#student-#{@student1.id}") do 
      expect(page).to have_content("Albus Severus Potter")
      expect(page).to have_content("Age: 15")
      expect(page).to have_content("House: Slytherin")
    end

    within("div#student-#{@student2.id}") do 
      expect(page).to have_content("James Sirius Potter")
      expect(page).to have_content("Age: 17")
      expect(page).to have_content("House: Gryffindor")
    end

    within("div#student-#{@student3.id}") do 
      expect(page).to have_content("Lily Luna Potter")
      expect(page).to have_content("Age: 10")
      expect(page).to have_content("House: Gryffindor")
    end
  end

  it "provides average age of all students" do 
    visit "/students"

    expect(page).to have_content("Average Student Age: 14")
  end

  it "lists students in alphabetical order" do
    visit "/students"

    expect(@student1.name).to appear_before(@student2.name)
    expect(@student2.name).to appear_before(@student3.name)
  end
end
