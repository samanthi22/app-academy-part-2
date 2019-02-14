def measure(pass = 0, &block)
   start = Time.now
   if pass == 0
       yield
   else
   pass.times {|current| result = yield(current)}
   end
   (Time.now - start) / (pass == 0 ? 1 : pass)
end