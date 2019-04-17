//
//  DetailViewController.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *authorLbl;
@property (weak, nonatomic) IBOutlet UILabel *infoLbl;
@property (weak, nonatomic) IBOutlet UILabel *linkLbl;

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *authorView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *linkView;

@property CNItem *item;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Book Item";
    
    if (!_item) {
        UINavigationController *nav = [[(UINavigationController *)self.splitViewController viewControllers] lastObject];
        [nav popViewControllerAnimated:YES];
    }
    _titleLbl.text = @"";
    _authorLbl.text = @"";
    _infoLbl.text = @"";
    _linkLbl.text = @"";
    [_titleView setHidden:YES];
    [_authorView setHidden:YES];
    [_infoView setHidden:YES];
    [_linkView setHidden:YES];
}

- (void)setupUI:(CNItem*)cnItem
{
    _item = cnItem;
    
    _titleLbl.text = _item.volumeInfo.title;
    _authorLbl.text = _item.volumeInfo.authors.firstObject;
    _infoLbl.text = _item.volumeInfo.theDescription;
    _linkLbl.text = _item.volumeInfo.infoLink;
    
    [_titleView setHidden:!_titleLbl.text.length];
    [_authorView setHidden:!_authorLbl.text.length];
    [_infoView setHidden:!_infoLbl.text.length];
    [_linkView setHidden:!_linkLbl.text.length];
}

@end
