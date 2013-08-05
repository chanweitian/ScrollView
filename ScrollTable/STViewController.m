//
//  STViewController.m
//  ScrollTable
//
//  Created by Administrator on 7/26/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "STViewController.h"
#import "Player.h"

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Football Manager";
    
    self.players =  [[NSMutableArray alloc] initWithCapacity:20];
    NSMutableArray *club1 = [[NSMutableArray alloc]initWithCapacity:5];
    NSMutableArray *club2 = [[NSMutableArray alloc]initWithCapacity:5];
    NSMutableArray *club3 = [[NSMutableArray alloc]initWithCapacity:5];
    
    Player *player = [[Player alloc] init];
    player.name = @"Evan Fergerson";
    player.club = @"MU";
    [club1 addObject:player];
    player = [[Player alloc] init];
    player.name = @"David Beckham";
    player.club = @"MU";
    [club1 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Varun Fergerson";
    player.club = @"MU";
    [club1 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Law Fergerson";
    player.club = @"MU";
    [club1 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Tom Fergerson";
    player.club = @"MU";
    [club1 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Ivan Thomas";
    player.club = @"Liverpool";
    [club2 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Ronald Fernadas";
    player.club = @"Liverpool";
    [club2 addObject:player];
    player = [[Player alloc] init];
    player.name = @"John Thomas";
    player.club = @"Liverpool";
    [club2 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Bratt Thomas";
    player.club = @"Liverpool";
    [club2 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Richard Thomas";
    player.club = @"Liverpool";
    [club2 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Jack Ali";
    player.club = @"Chelsea";
    [club3 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Sally Jones";
    player.club = @"Chelsea";
    [club3 addObject:player];
    player = [[Player alloc] init];
    player.name = @"David Tan";
    player.club = @"Chelsea";
    [club3 addObject:player];
    player = [[Player alloc] init];
    player.name = @"Richard Brandson";
    player.club = @"Chelsea";
    [club3 addObject:player];
    
    
    [self.players addObject:club1];
    [self.players addObject:club2];
    [self.players addObject:club3];
    
    self.scrollView.pagingEnabled = YES;
    NSInteger numberOfViews = [self.players count];

    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width /2 ;
        
        UILabel *clubLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(xOrigin,0, self.view.frame.size.width /2 , self.scrollView.frame.size.height)];
        
        
        clubLabel.textColor = [UIColor whiteColor];
        clubLabel.backgroundColor = [UIColor blackColor];
        Player *player = [[self.players objectAtIndex:i] objectAtIndex:0];
        NSString *clubName = player.club;
        
        [clubLabel setText:[NSString stringWithFormat: @"%@", clubName]];
        clubLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [clubLabel sizeToFit];
        

        
        [self.scrollView addSubview:clubLabel];


    }
    
    
    self.scrollView
    .contentSize = CGSizeMake(self.view.frame.size.width / 2 * numberOfViews, self.scrollView.frame.size.height);
    //[self.scrollView setShowsHorizontalScrollIndicator:NO];
    //[self.scrollView setShowsVerticalScrollIndicator:NO];
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.players count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *club = [self.players objectAtIndex:section];
    return [club count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Player *player = [[self.players objectAtIndex:section] objectAtIndex:0];
    return player.club;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    NSMutableArray *club = [self.players objectAtIndex:indexPath.section];
    
    Player *player = [club objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    cell.detailTextLabel.text = player.club;
    
    return cell;

}



@end
