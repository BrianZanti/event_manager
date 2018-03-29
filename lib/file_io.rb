require 'CSV'

class FileIO
  def self.load(file_name)
    attendees = []
    contents = CSV.open file_name, headers: true
    contents.each do |row|
      full_name = row["first_Name"] + " " + row["last_Name"]
      attendees << full_name
    end
    attendees
  end
end
