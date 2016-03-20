# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
Instructor.delete_all
Subject.delete_all
Course.delete_all

JSON.parse(open("instructor.json").read).each do |entry|
  Instructor.create(uid: entry["id"], comment: entry["comment"], email: entry["email"], first: entry["first"], middle: entry["middle"], last: entry["last"])
end

JSON.parse(open("subject.json").read).each do |entry|
  Subject.create(uid: entry["id"], comment: entry["comment"], term: entry["term"], name: entry["name"], abbreviation: entry["abbreviation"])
end

JSON.parse(open("course.json").read).each do |entry|
  course = Course.create(uid: entry["id"], comment: entry["comment"], code: entry["code"], continuity_id: entry["continuity_id"], name: entry["name"], description: entry["description"], credits: entry["credits"], independent_study: entry["independent_study"])
  entry["subjects"].each do |subject_hash|
    subject_id = subject_hash["id"]
    subject = Subject.find_by uid: subject_id
    unless subject.nil?
      CourseSubject.create(course_id: course.id, subject_id: subject.id)
      # puts "success"
    else
      # puts subject_id
    end
  end
end

#
# t.text     "uid"
# t.text     "comment"
# t.text     "code"
# t.text     "continuity_id"
# t.text     "name"
# t.text     "description"
# t.text     "credits"
# t.boolean  "independent_study"
