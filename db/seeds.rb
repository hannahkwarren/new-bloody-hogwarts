# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


student1 = Student.create(name: "Albus Severus Potter", age: 15, house: "Slytherin")

student2 = Student.create(name: "James Sirius Potter", age: 17, house: "Gryffindor")

student3 = Student.create(name: "Lily Luna Potter", age: 10, house: "Gryffindor")

student4 = Student.create(name: "Rose Granger Watson", age: 15, house: "Gryffindor")

student1.courses.create(name: "Herbology")
student2.courses.create(name: "Potions")
DD = student3.courses.create(name: "Defense Against the Dark Arts")
student1.courses.create(name: "Charms")
DD.students << student4
