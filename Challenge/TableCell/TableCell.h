//
//  ProductListCell.h
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *lblName;
@property (nonatomic, strong) IBOutlet UIImageView *imgThumb;

@end

NS_ASSUME_NONNULL_END
