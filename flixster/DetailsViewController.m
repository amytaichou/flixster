//
//  DetailsViewController.m
//  flixster
//
//  Created by Amy Liu on 6/28/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bannerView;
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsis;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString]; // appends both parts of the url
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString]; // NSURL confirms the string is a valid URL
    [self.poster setImageWithURL:posterURL];
    
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:posterURLString]; // appends both parts of the url
    
    NSURL *backdropURL = [NSURL URLWithString:fullPosterURLString]; // NSURL confirms the string is a valid URL
    
    [self.bannerView setImageWithURL:backdropURL];
    
    self.movieTitle.text = self.movie[@"title"];
    self.movieSynopsis.text = self.movie[@"overview"];
    [self.movieSynopsis sizeToFit];
    
    
    CGFloat maxHeight = self.movieSynopsis.frame.origin.y + self.movieSynopsis.frame.size.height + 30;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, maxHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
