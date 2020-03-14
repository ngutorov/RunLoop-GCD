# RunLoop  VS  GCD

Demo app you can play with and see the difference between using GCD approach versus manual RunLoop block execution on a Main Thread.
        
The trick is that manual approach with CFRunLoopPerformBlock gives us opportunity to choose RunLoop mode we want to use for our block. And in case of scrolling TableView it makes big difference since all scrolling happens with UITrackingRunLoopMode.
        
Just scroll deep down to 3-4xxx cells and see how GCD tab cells are still being assigned with images after delay VS RunLoop tab cells are being assigned immediately without any visible UI lags!
        
Same TableViews on a left and on a right. But left one updates image data with Core Foundation CFRunLoopPerformBlock using manually set UITrackingRunLoopMode. Right one updates image data using GCD to access Main Thread.
        
* It's advisable to run the app on a real device.
