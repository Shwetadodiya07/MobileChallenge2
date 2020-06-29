//
//  DetailViewController.m
//  Challenge
//
//  Created by shweta dodiya on 2020-06-28.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize dicData;
- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"dictdata =>%@",dicData);
    
    self.lblTitle.text = [NSString stringWithFormat:@"%@",[[dicData valueForKey:@"user"] valueForKey:@"username"]] ;
    self.lblUserName.text = [NSString stringWithFormat:@"%@",[[dicData valueForKey:@"user"] valueForKey:@"name"]] ;
    self.lblPortfoliolink.text = [NSString stringWithFormat:@"%@",[[dicData valueForKey:@"user"]valueForKey:@"portfolio_url"]] ;
    self.lbllikes.text = [NSString stringWithFormat:@"%@",[dicData valueForKey:@"likes"]] ;
    self.lblbio.text = [NSString stringWithFormat:@"%@",[[dicData valueForKey:@"user"] valueForKey:@"bio"]] ;
    self.lblCreatedAt.text = [NSString stringWithFormat:@"%@",[dicData valueForKey:@"created_at"]] ;

}

- (void)viewWillAppear:(BOOL)animated{
    [self downloadImageinBackground];
}

#pragma mark - Button Actions Method

- (IBAction)back_buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickPortfolioUrl:(id)sender {
   NSString*url = [[dicData valueForKey:@"user"] valueForKey:@"portfolio_url"];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

#pragma mark - downloadImageinBackground
-(void)downloadImageinBackground{
    [self.loader startAnimating];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // retrive image on global queue
        NSString *imagelink = [NSString stringWithFormat:@"%@",[[self.dicData valueForKey:@"urls"]valueForKey:@"full"]];
        
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:     [NSURL URLWithString:imagelink]]];

        dispatch_async(dispatch_get_main_queue(), ^{

             self.imgDetail.image = img;
             [self.loader stopAnimating];
        
        });
    });
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
