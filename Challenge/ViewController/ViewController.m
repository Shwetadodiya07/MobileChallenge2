//
//  ViewController.m
//  Challenge
//
//  Created by shweta dodiya on 2020-06-28.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

      [self.tblView registerNib:[UINib nibWithNibName:@"TableCell"
                                                    bundle:[NSBundle mainBundle]]
               forCellReuseIdentifier:@"identifier"];
          
       self.requesthandlerObj = [[RequestHandler alloc] init];
       self.requesthandlerObj.delegate = self;
    
       
      self.refreshControl = [[UIRefreshControl alloc]init];
      [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
      if (@available(iOS 10.0, *)) {
             self.tblView.refreshControl = self.refreshControl;
      } else {
             [self.tblView addSubview:self.refreshControl];
      }
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
     [self fetchData];
}


#pragma mark : Pull-To-Refresh method
- (void)refreshTable {
    //TODO: refresh your data
    [self fetchData];
    [self.refreshControl endRefreshing];
    [self.tblView reloadData];
}

#pragma mark : Fetch Method

//Fetch Data from server
-(void)fetchData{
     [self.requesthandlerObj getRequestWithString:[NSString stringWithFormat:@"%@%@client_id=%@",BASEURL,APIID,ACCESSKEY] methodType:GETMETHODTYPE];
}

-(void)fetchResponse:(NSMutableArray *)responseDic{
    self.imageList = responseDic;
    [self.tblView reloadData];
}

-(void)fetchError:(NSString *)errormessage{
    self.imageList = nil;
    [self.tblView reloadData];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:errormessage preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            //button click event
                        }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark : UITableview Delegate and Datasource Method

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imageList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cellTbl = (TableCell*)[self.tblView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];

   
   if (self.cellTbl == nil) {
                  NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
    self.cellTbl = [topLevelObjects objectAtIndex:0];
     
    }
    
    NSString *alt_description = [NSString stringWithFormat:@"%@",[[self.imageList objectAtIndex:indexPath.row] valueForKey:@"alt_description"]];
    NSLog(@"alt_description = >%@ ",alt_description);
    if (alt_description == (id)[NSNull null] || alt_description.length == 0 || [alt_description isEqualToString:@"<null>"])
    {
        alt_description = @"No Data Exist";
    }


    self.cellTbl.lblName.text = alt_description;
    
    
    NSString *imagelink = [NSString stringWithFormat:@"%@",[[[self.imageList objectAtIndex:indexPath.row] valueForKey:@"urls"]valueForKey:@"thumb"]];
    [self.cellTbl.imgThumb sd_setImageWithURL:[NSURL URLWithString:imagelink]
    placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    

    return self.cellTbl;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    dataIndex = (int)indexPath.row;
   [self performSegueWithIdentifier:@"detailPerformSeque" sender:self];
}


#pragma mark - prepareForSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailPerformSeque"])
    {
        DetailViewController *vc = [segue destinationViewController];
        vc.dicData = [self.imageList objectAtIndex:dataIndex];
    }
}


@end
