
//  CFViewController.m
//  Copyright (c) 2013 Cédric Floury


#import "CFViewController.h"

@interface CFViewController (){
    
    UIImageView *_imageView;
    UILabel *label;
    BOOL _rabbitVisible;
}
@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Simple example
    label = [[UILabel alloc] initWithFrame: CGRectMake(15, 50, self.view.frame.size.width, 0)];
    [label setText: @"Slide your finger on the back camera"];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor: [UIColor clearColor]];
    [label setNumberOfLines: 0];
    label.font = [UIFont fontWithName:@"AmericanTypewriter" size:25];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,420)];
    [_imageView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    _imageView.image = [UIImage imageNamed:@"chapeau_640_720.jpg"];
    
    _rabbitVisible = NO;
    
    [self.view addSubview:_imageView];
    [self.view addSubview:label];
}

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
    NSLog(@"receiveOnMagicEventDetected");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showRabbit];
    });
    
    
}

-(void)receiveOnMagicEventNotDetected:(NSNotification *) notification
{
    NSLog(@"receiveOnMagicEventNotDetected");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideRabbit];
    });
    
}

-(void) showRabbit
{
    if(!_rabbitVisible)
    {
        _rabbitVisible = YES;
        _imageView.image = [UIImage imageNamed:@"lapin_640_720.jpg"];
        [label setText: @""];
    }
    
}

-(void) hideRabbit
{
    if(_rabbitVisible)
    {
        _rabbitVisible = NO;
        _imageView.image = [UIImage imageNamed:@"chapeau_640_720.jpg"];
        [label setText: @"Slide your finger on the back camera"];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
