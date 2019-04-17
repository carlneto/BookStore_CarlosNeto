//
//  BookTableViewCell.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "BookTableViewCell.h"
#import "UIView+Utils.h"

@interface BookTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *favBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;

@property CNItem *item;

@end


@implementation BookTableViewCell

- (void)setModel:(CNItem*)model
{
    _item = model;
    NSString *title = _item.volumeInfo.title;
    CNSaleInfoListPrice *listPrice = _item.saleInfo.listPrice;
    NSString *price = listPrice ? [NSString stringWithFormat:@"%0.2f %@", listPrice.amount, listPrice.currencyCode.value] : @"---";
    [self setFavorite:[_item isFav]];
    UIImage *addToFavorite = [UIImage imageNamed:@"addToFavorite"];
    UIImage *addedFavorite = [UIImage imageNamed:@"addedFavorite"];
    [_favBtn setImage:addToFavorite forState:UIControlStateNormal];
    [_favBtn setImage:addedFavorite forState:UIControlStateSelected];
    _titleLbl.text = title;
    _priceLbl.text = price;
}

- (IBAction)favBtnAction
{
    [self setFavorite:![_item isFav]];
}

- (void)setFavorite:(BOOL)isFav
{
    [_item setFav:isFav];
    [_favBtn setSelected:isFav];
}

@end
