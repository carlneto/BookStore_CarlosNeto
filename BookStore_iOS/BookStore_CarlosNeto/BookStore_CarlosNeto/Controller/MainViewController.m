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
@property (atomic) int startIndex;
@property int maxResults;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Books List";
    _startIndex = 0;
    _maxResults = 20;
    [self getBookVolumes];
}

- (void)getBookVolumes
{
    const NSString *urn = @"https://www.googleapis.com/books/v1/volumes";
    NSString *uri = [NSString stringWithFormat:@"%@?q=ios&maxResults=%d&startIndex=%d", urn, _maxResults, _startIndex];
    __weak __typeof(self) zelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:uri parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
        CNBookVolumes *bookVolumes = [CNBookVolumes fromJSONDictionary:responseObject];
        [zelf setBookVolumes:bookVolumes];
        zelf.startIndex += zelf.maxResults;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

- (void)setBookVolumes:(CNBookVolumes*)bookVolumes
{
    
    if (!_volumes) {
        for (CNItem *item in bookVolumes.items)
        {
            item.isFavorite = false;
        }
        _volumes = bookVolumes;
    } else {
        for (CNItem *item in bookVolumes.items)
        {
            item.isFavorite = false;
            [_volumes.items addObject:item];
        }
    }
    [_volumesTableView reloadData];
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
    NSInteger row = indexPath.row;
    CNItem *item = [_volumes items][row];
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell" forIndexPath:indexPath];
    [cell setModel:item];
    return cell;
}

- (BOOL)isLastIndex:(NSIndexPath *)indexPath
{
    NSInteger lastSectionIndex = [_volumesTableView numberOfSections] - 1;
    NSInteger lastRowIndex = [_volumesTableView numberOfRowsInSection:lastSectionIndex] - 1;
    return indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    if (currentOffset + 15.0 > maximumOffset)
    {
        [self getBookVolumes];
    }
}

@end
