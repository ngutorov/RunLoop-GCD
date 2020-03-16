# CF RunLoop  VS  GCD

## Access Main Thread like a Boss! :sunglasses:

Demo app you can play with and see the difference between using GCD dispatch_async approach versus CF RunLoop block execution on a Main Thread.

Two very different APIs but the trick is that Core Foundation approach with CFRunLoopPerformBlock gives us opportunity to choose certain RunLoop Mode we want to use for our block. Especially in case of scrolling TableView it makes big difference since all scrolling happens with UITrackingRunLoopMode.


```swift

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

Absolutely same simple and very long TableViews on the left and on the right loading data from a network. But left one updates image data with Core Foundation CFRunLoopPerformBlock using manually set UITrackingRunLoopMode. Right one updates image data using GCD API to access Main Thread, basically delegating RunLoop mode choice to Grand Central Dispatch.

**- It's advisable to run the app on a real device**
