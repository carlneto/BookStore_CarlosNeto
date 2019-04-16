//
//  BookTableViewCell.h
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNBookVolumes.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookTableViewCell : UITableViewCell

- (void)setModel:(CNItem*)model;

@end

NS_ASSUME_NONNULL_END
