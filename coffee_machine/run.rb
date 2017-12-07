#!/usr/bin/env ruby

["coffee_machine_1", "coffee_machine_2"].each do |file_name|
  system 'mcrl22lps',  '-nfTv',          "#{file_name}.mcrl2", "#{file_name}.lps"
  system 'lpsuntime',  '-v',             "#{file_name}.lps",   "#{file_name}u.lps"
  system 'lpsrealelm', '-v', '--max=11', "#{file_name}u.lps",  "#{file_name}r.lps"
  system 'lps2lts',    '-v',             "#{file_name}.lps",   "#{file_name}.lts"
end
