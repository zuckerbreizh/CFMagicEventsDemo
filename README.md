CFMagicEventsDemo
=================


This trick was initially created to make an app for my children (available here for free : *[Incredible App - US/EN/FR version](https://itunes.apple.com/fr/app/incredible/id714822935?mt=8)*).<br>
This allows to `use your back camera as a simple button`.<br>
Technically, frames are captured from the back camera, and a simple algorithm is checking the fall of luminosity due to passage of your finger.

<p align="center">
  <img src="https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/2705/photo.PNG" alt="Sublime's custom image" width="300" height="450" style="border:1px solid black"/>
</p>

###Installation

Copy CFMagicEvents.h and CFMagicEvents files into your project.

###ARC Compatibility

Just add the `-fno-objc-arc` compiler flag to the CFMagicEvents.m file. To do this, go to the Build Phases tab in your target settings, open the Compile Sources group, double-click CFMagicEvents.m in the list and type `-fno-objc-arc` into the popover.

###Frameworks
- AVFoundation


###How to use

In AppDelegate (on didFinishLaunchingWithOptions method) : 

```objectivec
_cfMagicEvents  = [[CFMagicEvents alloc] init];
[_cfMagicEvents startCapture];
```

In View(s) :

```objectivec
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)receiveOnMagicEventDetected:(NSNotification *) notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //YOUR CODE HERE
    });
}

-(void)receiveOnMagicEventNotDetected:(NSNotification *) notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //YOUR CODE HERE
    });
}
```

##License
CFMagicEvents is available under the MIT license. ENJOY !

##Contact
Cédric Floury  (cfloury@gmail.fr)<br>
Twitter : *[@zuckerbreizh](https://itunes.apple.com/fr/app/incredible/id714822935?mt=8).*

