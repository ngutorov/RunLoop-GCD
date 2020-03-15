# RunLoop  VS  GCD

## Access Main Thread like a Boss! :sunglasses:

Demo app you can play with and see the difference between using GCD approach versus manual RunLoop block execution on a Main Thread.
        
The trick is that manual approach with CFRunLoopPerformBlock gives us opportunity to choose RunLoop mode we want to use for our block. And in case of scrolling TableView it makes big difference since all scrolling happens with UITrackingRunLoopMode.

```swift
// RunLoop VS GCD.
            switch self.cellImageAssignMode {
                
            case .GCD:
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    let image = UIImage(data: data!)
                    cell.thumbnailImage.image = image
                })
                
            case .RunLoop:
                CFRunLoopPerformBlock(CFRunLoopGetMain(), RunLoop.Mode.tracking as CFTypeRef) {
                    
                    let image = UIImage(data: data!)
                    cell.thumbnailImage.image = image
                }
            }
```
     
Just scroll fast deep down to 2-4XXX cells and stop scrolling to see how "GCD" tab cells are still being assigned with images blinking VS "RunLoop" tab cells are being assigned with minimum visible UI lags.
        
Same TableViews on the left and on the right. But left one updates image data with Core Foundation CFRunLoopPerformBlock using manually set UITrackingRunLoopMode. Right one updates image data using GCD to access Main Thread, basically delegating RunLoop mode choice to Grand Central Dispatch.
        
**It's advisable to run the app on a real device!**
