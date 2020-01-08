
filename = "test.dat"
firstread = true
pos = 0
# Header: | 4 byte magic string "MPS7" | 1 byte version | 4 byte (uint32) # of records |
File.open(filename, "rb") do |file|
  if firstread
    first_portion = file.read(9)
    firstread = false
    pos = 10
  end
  # detail
  # | 1 byte record type enum | 4 byte (uint32) Unix timestamp | 8 byte (uint64) user ID |8 byte amount 

  file.seek(pos, IO::SEEK_END)
  record_type = file.read(1)
  puts record_type
  record_tmp = file.read(4)
  record_usrid = file.read(8)
  record_amount = file.read(8)
  puts record_type, record_tmp, record_usrid, record_amount
  pos = pos + 20 

end