# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

languages = ['Assembly', 'C', 'CSS', 'C#', 'C++', 'Go', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Lua', 'MATLAB', 'ML', 'Perl', 'PHP', 'Prolog', 'Python', 'Ruby', 'Scala', 'SQL']
frameworks = ['React', 'React 2', 'AngularJS', 'Ruby on Rails', 'Ember.js', 'Meteor', 'Django', 'Flask']
ideaType = ['Business', 'Game', 'Educational', 'Research', 'Entertainment']
difficulty = ['Beginner', 'Intermediate', 'Difficult']

tagList = languages.concat(frameworks).concat(ideaType).concat(difficulty)

tagList.each do |t|
  Tag.create(name: t)
end

#Dummy User
user = User.create! email: 'john@gmail.com', password: 'topsecret', password_confirmation: 'topsecret'

Project.create(title: 'Space Invader Game!', description: 'I am working on a Space Invader clone and would like some help programming it. Thanks guys!', points: 5, owner_id: user.id)
