//
//  RWFoundationMacros.h
//  Pods
//
//  Created by Ryan Wang on 15/6/27.
//
//

#ifndef Pods_RWFoundationMacros_h
#define Pods_RWFoundationMacros_h

#import <Foundation/Foundation.h>

#define __(x) (x == nil || [x isKindOfClass:[NSNull class]])?nil:[NSString stringWithFormat:@"%@",x]

#endif
