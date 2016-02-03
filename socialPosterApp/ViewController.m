//
//  ViewController.m
//  socialPosterApp
//
//  Created by Pamela Iupi Peixinho on 2/2/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender {
    [self resignFirstResponder];
}

-(IBAction)takePhoto:(id)sender{
    [self.imageView.layer setBorderWidth:0];
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

-(IBAction)loadFromLibrary:(id)sender{
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info{
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)postFacebook:(id)sender{
    SLComposer  = [[SLComposeViewController alloc] init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [SLComposer setInitialText:[NSString stringWithFormat:@"%@", self.textField.text]];
    [SLComposer addImage:self.imageView.image];
    [self presentViewController:SLComposer animated:YES completion: NULL];
}

-(IBAction)sendtwitter:(id)sender{
    SLComposer  = [[SLComposeViewController alloc] init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [SLComposer setInitialText:[NSString stringWithFormat:@"%@", self.textField.text]];
    [SLComposer addImage:self.imageView.image];
    [self presentViewController:SLComposer animated:YES completion: NULL];

}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
