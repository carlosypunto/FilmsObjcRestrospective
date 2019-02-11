//
//  MovieCollectionViewCell.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 11/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "MovieCollectionViewCell.h"
#import <AFNetworking/AFImageDownloader.h>

@interface MovieCollectionViewCell ()

@property (strong, nonatomic) AFImageDownloadReceipt *downloadReceipt;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation MovieCollectionViewCell

- (void)retrieveImage {
    __weak typeof(self) welf = self;
    [self.activityIndicator startAnimating];
    AFImageDownloader* dow = [[AFImageDownloader alloc] init];
    self.downloadReceipt = [dow downloadImageForURLRequest:self.posterURLRequest
                                                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
                                                       welf.imageView.image = responseObject;
                                                       [welf.activityIndicator stopAnimating];
                                                   }
                                                   failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                                       welf.imageView.image = [UIImage imageNamed:@"PosterSize185"];
                                                       [welf.activityIndicator stopAnimating];
                                                   }];
}

- (void)prepareForReuse {
    [self.activityIndicator stopAnimating];
    [[self.downloadReceipt task] cancel];
}


@end
