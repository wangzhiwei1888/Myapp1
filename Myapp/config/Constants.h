//
//  Constants.h
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/28.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#endif /* Constants_h */
