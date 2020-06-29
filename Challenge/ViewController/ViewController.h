//
//  ViewController.h
//  Challenge
//
//  Created by shweta dodiya on 2020-06-28.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailViewController.h"
#import "TableCell.h"
#import "Constant.h"
#import "RequestHandler.h"

@interface ViewController : UIViewController<RequestHandlerServiceDelegate>
{
    int dataIndex;
}
@property (nonatomic, strong) IBOutlet UITableView *tblView;
@property (nonatomic, strong) IBOutlet TableCell *cellTbl;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) RequestHandler *requesthandlerObj;
@property (nonatomic, strong) NSMutableArray *imageList;

@end

