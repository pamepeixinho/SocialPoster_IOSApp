//
//  ViewController.h
//  socialPosterApp
//
//  Created by Pamela Iupi Peixinho on 2/2/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    UIImagePickerController *imagePicker;
    UIImage *image;
    
    SLComposeViewController *SLComposer;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)dismissKeyboard:(id)sender;
-(IBAction)takePhoto:(id)sender;
-(IBAction)loadFromLibrary:(id)sender;
-(IBAction)postFacebook:(id)sender;
-(IBAction)sendtwitter:(id)sender;


@end

