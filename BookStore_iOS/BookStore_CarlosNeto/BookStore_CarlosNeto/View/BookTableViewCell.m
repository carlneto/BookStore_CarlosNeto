//
//  BookTableViewCell.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "BookTableViewCell.h"

@interface BookTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;

@end


@implementation BookTableViewCell

- (void)setTitle:(NSString *)title andPrice:(NSString *)price
{
    _titleLbl.text = title;
    _priceLbl.text = price;
}

@end
