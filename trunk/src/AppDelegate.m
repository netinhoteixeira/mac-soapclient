#import "AppDelegate.h"
#import "SCController.h"
#import "PreferenceController.h"

@interface AppDelegate (Private)
- (SCController *)currentController;
@end

@implementation AppDelegate

+ (void)initialize;
{
	NSMutableDictionary *defaultValues = [NSMutableDictionary dictionaryWithCapacity:1];
	
	[defaultValues setObject:[NSNumber numberWithInt:0] forKey:SCWrapTextViewTextKey];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults registerDefaults:defaultValues];
}


#pragma mark -
#pragma mark Actions

- (IBAction)showPreferences:(id)sender;
{
	NSWindowController *c = [[PreferenceController alloc] init];
	[c showWindow:self];
}


#pragma mark -

- (BOOL)canExecute;
{
	return [[self currentController] canExecute];
}


- (BOOL)isParsing;
{
	return [[self currentController] isParsing];
}


- (SCController *)currentController;
{
	NSDocumentController *docCont = [NSDocumentController sharedDocumentController];
	NSWindowController *c = [[[docCont currentDocument] windowControllers] objectAtIndex:0];
	if ([c isKindOfClass:[SCController class]]) {
		return (SCController *)c;
	} else {
		return nil;
	}
}

@end
