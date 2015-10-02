//
//  ViewController.m
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    [self resetTime];
    timer = nil;

    
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    UIFont *font = [UIFont boldSystemFontOfSize:22];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    [timerLabel setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.tableView setBackgroundColor:[UIColor blackColor]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getOptions{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Game Types" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"No Autonomous",
                            @"Just Endgame",
                            @"Normal",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [[NSUserDefaults standardUserDefaults] setInteger:120 forKey:@"seconds"];
                    
                    [timer invalidate];
                    timer = nil;


                    break;
                case 1:
[[NSUserDefaults standardUserDefaults] setInteger:30 forKey:@"seconds"];
                    [timer invalidate];
                    timer = nil;

break;
                case 2:
[[NSUserDefaults standardUserDefaults] setInteger:150 forKey:@"seconds"];
                    [timer invalidate];
                    timer = nil;

break;
                
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    [self resetTime];
    timer = nil;

}

//Implementing our method
- (IBAction)startTimer{
    [self setupGame];
    
    if(seconds == 120){
        self.navigationController.toolbar.barTintColor =  self.navigationController.toolbar.tintColor;
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"joystick"];
    }
    if(seconds == 30){
        self.navigationController.toolbar.barTintColor = [UIColor redColor];
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"stopwatch"];
    }
    
    if(seconds < 1){
        self.navigationController.toolbar.barTintColor = nil;
        self.navigationController.toolbar.tintColor = nil;
        [timer invalidate];
        timer = nil;

    }
        
    }
    



- (IBAction)resetTimer{
    [timer invalidate];
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    gameMode.image=[UIImage imageNamed:@"brain"];
    [self resetTime];
    timer = nil;

}

- (IBAction)pauseTimer{
    [timer invalidate];
    timer = nil;

}



- (void)setupGame{
    minutes = seconds / 60;
    subseconds = seconds % 60;
    count = 0;
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:20.0/255.0 green:199.0/255.0 blue:49.0/255.0 alpha:1.0];
    self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
    
    if(!timer)
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];

}

-(void)resetTime{
    minutes = seconds / 60;
    subseconds = seconds % 60;
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
}

- (void)subtractTime{
    seconds--;
    minutes = seconds / 60;
    subseconds = seconds % 60;
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
    
    if(seconds == 120){
        self.navigationController.toolbar.tintColor =  nil;
        self.navigationController.toolbar.barTintColor =  self.navigationController.toolbar.tintColor;
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"joystick"];
    }
    if(seconds == 30){
        self.navigationController.toolbar.barTintColor = [UIColor redColor];
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"stopwatch"];
    }
    
    if(seconds < 1){
        self.navigationController.toolbar.barTintColor = nil;
        self.navigationController.toolbar.tintColor = nil;
        [timer invalidate];
        timer = nil;


    }
}

-(IBAction)score{
    
    //Autonomous
    int score = 0;
    score+=20*BeaconA.selectedSegmentIndex;
    score+=10*climbersA.selectedSegmentIndex;
    if (parked1A.selectedSegmentIndex==1){
        score+=5;
    }
    else if (parked1A.selectedSegmentIndex==2){
        score+=10;
    }
    else if (parked1A.selectedSegmentIndex==3){
        score+=20;
    }
    else if (parked1A.selectedSegmentIndex==4){
        score+=40;
    }
    if (parked2A.selectedSegmentIndex==1){
        score+=5;
    }
    else if (parked2A.selectedSegmentIndex==2){
        score+=10;
    }
    else if (parked2A.selectedSegmentIndex==3){
        score+=20;
    }
    else if (parked2A.selectedSegmentIndex==4){
        score+=40;
    }

    //Tele-Op
    score+=10*climbersT.selectedSegmentIndex;
    score+=20*ziplineT.selectedSegmentIndex;
    score+=[hT1.text intValue];
    score+=[hT2.text intValue]*5;
    score+=[hT3.text intValue]*10;
    score+=[hT4.text intValue]*15;
    if (parked1T.selectedSegmentIndex==1){
        score+=5;
    }
    else if (parked1T.selectedSegmentIndex==2){
        score+=10;
    }
    else if (parked1T.selectedSegmentIndex==3){
        score+=20;
    }
    else if (parked1T.selectedSegmentIndex==4){
        score+=40;
    }
    if (parked2T.selectedSegmentIndex==1){
        score+=5;
    }
    else if (parked2T.selectedSegmentIndex==2){
        score+=10;
    }
    else if (parked2T.selectedSegmentIndex==3){
        score+=20;
    }
    else if (parked2T.selectedSegmentIndex==4){
        score+=40;
    }


    
    //End Game
    score+=pullE.selectedSegmentIndex*80;
    score+=flyE.selectedSegmentIndex*20;

    
    int height = self.navigationController.navigationBar.frame.size.height;
    int width = self.navigationController.navigationBar.frame.size.width;
    
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width , 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    navLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:30];
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    ((UILabel *)self.navigationItem.titleView).text =[NSString stringWithFormat:@"%d",score];


}
-(IBAction)reset{
    int score = 0;
    BeaconA.selectedSegmentIndex=0;
    climbersA.selectedSegmentIndex=0;
    parked1A.selectedSegmentIndex=0;
    parked2A.selectedSegmentIndex=0;
    
    climbersT.selectedSegmentIndex=0;
    ziplineT.selectedSegmentIndex=0;
    parked1T.selectedSegmentIndex=0;
    parked2T.selectedSegmentIndex=0;
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0 , 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    navLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:30];
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    ((UILabel *)self.navigationItem.titleView).text =@"";
    
    hT1.text=nil;
    hT2.text=nil;
    hT3.text=nil;
    hT4.text=nil;

    
    pullE.selectedSegmentIndex=0;
    flyE.selectedSegmentIndex=0;

}


-(IBAction)goSite{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.i2robotics.org"]];
}

-(IBAction)goFB{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/i2robotics"]];
}


@end
