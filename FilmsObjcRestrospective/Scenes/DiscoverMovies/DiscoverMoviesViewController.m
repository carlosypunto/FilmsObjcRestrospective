//
//  DiscoverMoviesViewController.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "DiscoverMoviesViewController.h"
#import "DisplayDiscoverMovie.h"
#import "MovieCollectionViewCell.h"
#import "UIColor+projectColors.h"
#import "UIScrollView+isNearBottomEdge.h"

static NSString* const DiscoverMoviesCellIdentifier = @"MovieCell";

@interface DiscoverMoviesViewController ()

@property (nonatomic, strong)   NSArray *data;

@end

@implementation DiscoverMoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup views
    self.collectionView.backgroundColor = [UIColor lightGray];
    
    [self.eventHandler retrieveData];
}


# pragma mark - DiscoverMoviesViewProtocol

- (void)displayDiscoverMovies:(NSArray *)movies {
    self.data = movies;
    NSLog(@"%@", movies);
    [self.collectionView reloadData];
}



# pragma mark - Tableview Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DisplayDiscoverMovie *displayDiscoverMovie = (DisplayDiscoverMovie *) self.data[indexPath.item];
    MovieCollectionViewCell *cell = (MovieCollectionViewCell *)[self.collectionView
                                                                dequeueReusableCellWithReuseIdentifier:DiscoverMoviesCellIdentifier
                                                                forIndexPath:indexPath];
    
    cell.titleLabel.text = displayDiscoverMovie.title;
    cell.dateLabel.text = displayDiscoverMovie.releaseDate;
    cell.voteLabel.text = displayDiscoverMovie.voteAverage;
    cell.popularityLabel.text = displayDiscoverMovie.popularity;
    cell.imageView.image = [UIImage imageNamed:@"PosterSize185"];
    cell.imageView.layer.cornerRadius = 4.0;
    cell.layer.cornerRadius = 14.0;
    cell.backgroundColor = [UIColor whiteColor];
    cell.posterURLRequest = displayDiscoverMovie.posterURLRequest;
    [cell retrieveImage];
    return cell;
}

#pragma mark - TableView Datasource

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat distance = 150.0;
    BOOL isNear = [scrollView isNearToBottomEdgeAtLeast: distance];
    if (isNear) {
        [self.eventHandler retrieveData];
    }
}

@end
