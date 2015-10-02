//
//  ViewController.h
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import <UIKit/UIKit.h>


@interface ViewController : UITableViewController{
    IBOutlet UIBarButtonItem *timerLabel;
    IBOutlet UIBarButtonItem *gameMode;
    NSInteger count;
    NSInteger seconds;
    NSInteger minutes;
    NSInteger subseconds;
   
    IBOutlet UISegmentedControl *BeaconA;
    IBOutlet UISegmentedControl *climbersA;
    IBOutlet UISegmentedControl *parked1A;
    IBOutlet UISegmentedControl *parked2A;
    
    IBOutlet UISegmentedControl *climbersT;
     IBOutlet UISegmentedControl *ziplineT;
    IBOutlet UITextField *hT1;
    IBOutlet UITextField *hT2;
    IBOutlet UITextField *hT3;
    IBOutlet UITextField *hT4;
    IBOutlet UISegmentedControl *parked1T;
    IBOutlet UISegmentedControl *parked2T;
    
    IBOutlet UISegmentedControl *pullE;
    IBOutlet UISegmentedControl *flyE;
    
    IBOutlet UIBarButtonItem *startButton;
    

    NSTimer *timer; //ADD THIS!!
}

- (IBAction) startTimer;
- (IBAction) resetTimer;
- (IBAction) pauseTimer;
- (IBAction) getOptions;
- (IBAction)reset;

- (IBAction) goSite;
-(IBAction)goFB;
- (void)setupGame;
- (void)subtractTime;

@end
