
//  Created by shweta dodiya on 2020-06-28.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize lblName,imgThumb;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
