//
//  MainViewController.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "MainViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "BookTableViewCell.h"

@interface MainViewController ()

@property (strong, nonatomic) IBOutlet UITableView *volumesTableView;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Books List";
    [self addObserver:self forKeyPath:@"volumes" options:NSKeyValueObservingOptionNew context:nil];
    [self getBookVolumes];
}

- (void)getBookVolumes
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
        self.volumes = [CNBookVolumes fromJSONDictionary:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.volumes = [[CNBookVolumes alloc] init];
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString:@"volumes"])
    {
        [_volumesTableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _volumes.items.count;
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CNItem *item = [_volumes items][indexPath.row];
    NSString *title = item.volumeInfo.title;
    CNSaleInfoListPrice *listPrice = item.saleInfo.listPrice;
    NSString *price = listPrice ? [NSString stringWithFormat:@"%0.2f %@", listPrice.amount, listPrice.currencyCode.value] : @"---";
    
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell" forIndexPath:indexPath];
    [cell setTitle:title andPrice:price];
    return cell;
}

@end
