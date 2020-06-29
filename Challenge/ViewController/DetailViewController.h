//
//  DetailViewController.h
//  Challenge
//
//  Created by shweta dodiya on 2020-06-28.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) IBOutlet UIImageView *imgDetail;
@property (nonatomic, strong) IBOutlet UILabel *lblbio;
@property (nonatomic, strong) IBOutlet UILabel *lblUserName;
@property (nonatomic, strong) IBOutlet UILabel *lblCreatedAt;
@property (nonatomic, strong) IBOutlet UILabel *lbllikes;
@property (nonatomic, strong) IBOutlet UILabel *lblPortfoliolink;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *loader;

@property (nonatomic, strong) NSMutableDictionary *dicData;

@end

NS_ASSUME_NONNULL_END
