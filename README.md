# CF RunLoop  VS  GCD

## Access the Main Thread like a Boss! :sunglasses:

The demo app you can play with and see the difference between using GCD `dispatch_async` approach versus CF RunLoop block execution on the Main Thread.

Two very different APIs, but the trick is that the Core Foundation approach with `CFRunLoopPerformBlock` allows us to choose a specific `RunLoop mode` we want to use for our block. Especially in the case of scrolling TableView, it makes a big difference since all scrolling happens with UITrackingRunLoopMode.


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


Quickly scroll down to 2-4XXX cells, stop the scroll at once - and see how `"GCD" tab` cells are loading with noticeable delay versus `"RunLoop" tab` cells are assigned faster with minimal visible UI lags.

TableViews are loading identical data from a network in both tabs.

However, the left tab manually uses `UITrackingRunLoopMode` to update image data with `Core Foundation CFRunLoopPerformBlock`.

The right tab uses GCD API to access the Main Thread, essentially delegating `RunLoop mode` selection to `Grand Central Dispatch`.
<br>
<br>
> **It's advisable to run the app on a real device!**

![ScreenShot_01](https://github.com/ngutorov/RunLoop-GCD/blob/master/Demo/ScreenShot_01.PNG)
![ScreenShot_02](https://github.com/ngutorov/RunLoop-GCD/blob/master/Demo/ScreenShot_02.PNG)

**Copyright © 2019 Nikolay Gutorov. All rights reserved.**
