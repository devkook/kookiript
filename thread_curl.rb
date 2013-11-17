#! /usr/bin/ruby

begin
    file = open(“idlist.log”)

    idArray=[]
    file.each_line {|line|
        idArray.push line
    }
    
    for iii in 1..10
        threads = []
        for i in 1..3 
            threads « Thread.new { 
                 `curl --data \id=“#{idArray.sample\” 127.0.0.1:1234`
            }
        end
        threads.each {|thread| thread.join}
        puts “NO:#{iii}”
        sleep(1)
    end
rescue File::Error => e
    puts e.errno
    puts e.error
ensure
    file.close if file
end
