//
//  DataModel.m
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/9/21.
//

#import "DataModel.h"

@implementation DataModel
@synthesize charNames = _charNames;
@synthesize stageNames = _stageNames;
@synthesize musicNames = _musicNames;

@synthesize charDict = _charDict;
@synthesize stageDict = _stageDict;
@synthesize musicDict = _musicDict;

+(DataModel*)sharedInstance {
    static DataModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[DataModel alloc] init];
    });
    return _sharedInstance;
}

//
//Array Getters
//
-(NSArray*)charNames {
    if(!_charNames) {
        [self loadNames];
    }
    return _charNames;
}

-(NSArray*)stageNames {
    if(!_stageNames) {
        [self loadNames];
    }
    return _stageNames;
}

-(NSArray*)musicNames {
    if(!_musicNames) {
        [self loadNames];
    }
    return _musicNames;
}

//
//Dictionary Getters
//
-(NSMutableDictionary*)charDict {
    if(!_charDict) {
        _charDict = [[NSMutableDictionary alloc] init];
//        for(id name in _charNames) {
//            [_charDict setValue:[UIImage imageNamed:name] forKey:name];
//        }
    }
    return _charDict;
}

-(NSMutableDictionary*)stageDict {
    if(!_stageDict) {
        _stageDict = [[NSMutableDictionary alloc] init];
        
        for(id name in _stageNames) {
            [_stageDict setValue:[UIImage imageNamed:name] forKey:name];
        }
    }
    return _stageDict;
}

-(NSMutableDictionary*)musicDict {
    if(!_musicDict) {
        _musicDict = [[NSMutableDictionary alloc] init];
        
        for(id name in _musicNames) {
            [_musicDict setValue:[UIImage imageNamed:name] forKey:name];
        }
    }
    return _musicDict;
}


-(int)loadNames {
    NSDictionary* fileDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Names" ofType:@"plist"]];
    
    _charNames = [fileDict objectForKey:@"Characters"];
    _stageNames = [fileDict objectForKey:@"Stages"];
    _musicNames = [fileDict objectForKey:@"Music"];
    
    return 1;
}

-(UIImage*)getImageWithName:(NSString*)name {
    UIImage* image = nil;
    
    
    image = [UIImage imageNamed:name];
    //image = _charDict[name];
//    if([_charDict objectForKey:name])
//        image = _charDict[name];
//    else if ([_stageDict objectForKey:name])
//        image = _stageDict[name];
//    else
//        image = _musicDict[name];
    
    return image;
}

-(NSArray*)getAllChars {
    return _charNames;
}

-(UIImage*)getCharWithIndex:(NSInteger)index {
    NSString* name = [_charNames objectAtIndex:index];
    
    return _charDict[name];
}

-(UIImage*)getStageWithIndex:(NSInteger)index {
    NSString* name = [_stageNames objectAtIndex:index];
    
    return _stageDict[name];
}

-(UIImage*)getMusicWithIndex:(NSInteger)index {
    NSString* name = [_musicNames objectAtIndex:index];
    
    return _musicDict[name];
}

-(NSInteger)numberOfChars { return self.charNames.count; }
-(NSInteger)numberOfStages { return self.stageNames.count; }
-(NSInteger)numberOfMusic { return self.musicNames.count; }

-(NSString*)getCharNameForIndex:(NSInteger)index {
    return self.charNames[index]; //_charNames[index];
}
-(NSString*)getStageNameForIndex:(NSInteger)index {
    return self.stageNames[index]; //_stageNames[index];
}
-(NSString*)getMusicNameForIndex:(NSInteger)index {
    return self.musicNames[index]; //_musicNames[index];
}



@end
