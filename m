Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0213B6A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:20:12 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyfr-0003mh-UB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxyeu-00038W-Gk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:19:12 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxyep-0007tt-As
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:19:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 89CE97457E7;
 Mon, 28 Jun 2021 23:19:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3054E7457F0; Mon, 28 Jun 2021 23:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2DBA27457EF;
 Mon, 28 Jun 2021 23:19:02 +0200 (CEST)
Date: Mon, 28 Jun 2021 23:19:02 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use NSWindow's ability to resize
In-Reply-To: <CAMVc7JUCUCHJYJy_RRu=MWhaBF81vvoX9rLYzCN6OVtq0uxDfg@mail.gmail.com>
Message-ID: <8bbb553a-6f92-4eb5-723c-3e5fa2ffc678@eik.bme.hu>
References: <20210628030850.34321-1-akihiko.odaki@gmail.com>
 <ca2da977-7a24-1beb-ed5c-f869a484f33b@eik.bme.hu>
 <CAMVc7JUCUCHJYJy_RRu=MWhaBF81vvoX9rLYzCN6OVtq0uxDfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-765819585-1624915142=:48178"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-765819585-1624915142=:48178
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 28 Jun 2021, Akihiko Odaki wrote:
> 2021年6月28日(月) 17:57 BALATON Zoltan <balaton@eik.bme.hu>:
>>
>> On Mon, 28 Jun 2021, Akihiko Odaki wrote:
>>> This change brings two new features:
>>> - The window will be resizable if "Zoom To Fit" is eanbled
>>> - The window can be made full screen by clicking full screen button
>>>  provided by the platform. (The left-top green button.)
>>
>> While this is better for consistency with other apps is it a potential
>> usability issue that a window bar may appear when you move the mouse to
>> the top of the full screen window (where guests often have a menu bar that
>> this could make harder to use)? (Haven't tested it so don't know how it
>> actually works.)
>
> The window bar is completely hidden with NSApplicationPresentationHideMenuBar.

I've missed that but now you pointed to it I have a comment about that.

>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> ---
>>> ui/cocoa.m | 542 ++++++++++++++++++++++++-----------------------------
>>> 1 file changed, 249 insertions(+), 293 deletions(-)
>>>
>>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>>> index 9f72844b079..091d9721f4d 100644
>>> --- a/ui/cocoa.m
>>> +++ b/ui/cocoa.m
>>> @@ -93,12 +93,10 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>>> static DisplayChangeListener dcl = {
>>>     .ops = &dcl_ops,
>>> };
>>> -static int last_buttons;
>>> static int cursor_hide = 1;
>>>
>>> static int gArgc;
>>> static char **gArgv;
>>> -static bool stretch_video;
>>> static NSTextField *pauseLabel;
>>> static NSArray * supportedImageFileTypes;
>>>
>>> @@ -301,19 +299,16 @@ static void handleAnyDeviceErrors(Error * err)
>>> */
>>> @interface QemuCocoaView : NSView
>>> {
>>> +    NSTrackingArea *trackingArea;
>>>     QEMUScreen screen;
>>> -    NSWindow *fullScreenWindow;
>>> -    float cx,cy,cw,ch,cdx,cdy;
>>>     pixman_image_t *pixman_image;
>>>     QKbdState *kbd;
>>>     BOOL isMouseGrabbed;
>>> -    BOOL isFullscreen;
>>>     BOOL isAbsoluteEnabled;
>>> }
>>> - (void) switchSurface:(pixman_image_t *)image;
>>> - (void) grabMouse;
>>> - (void) ungrabMouse;
>>> -- (void) toggleFullScreen:(id)sender;
>>> - (void) handleMonitorInput:(NSEvent *)event;
>>> - (bool) handleEvent:(NSEvent *)event;
>>> - (bool) handleEventLocked:(NSEvent *)event;
>>> @@ -328,8 +323,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
>>>  */
>>> - (BOOL) isMouseGrabbed;
>>> - (BOOL) isAbsoluteEnabled;
>>> -- (float) cdx;
>>> -- (float) cdy;
>>> - (QEMUScreen) gscreen;
>>> - (void) raiseAllKeys;
>>> @end
>>> @@ -369,46 +362,43 @@ - (BOOL) isOpaque
>>>     return YES;
>>> }
>>>
>>> -- (BOOL) screenContainsPoint:(NSPoint) p
>>> +- (void) removeTrackingRect
>>> {
>>> -    return (p.x > -1 && p.x < screen.width && p.y > -1 && p.y < screen.height);
>>> +    if (trackingArea) {
>>> +        [self removeTrackingArea:trackingArea];
>>> +        [trackingArea release];
>>> +        trackingArea = nil;
>>> +    }
>>> }
>>
>> You could override removeTrackingArea here then you would not have
>> addTrackingArea vs. removeTrackingRect and that's the way NSTrackingArea
>> docs also suggest.
>
> https://developer.apple.com/documentation/appkit/nstrackingarea?language=objc
>> Other NSView methods related to NSTrackingArea objects
>> (in addition to addTrackingArea:) include removeTrackingArea: and
>> updateTrackingAreas. Views can override the latter method to recompute and
>> replace their NSTrackingArea objects in certain situations, such as a change in
>> the size of the visibleRect.
>
> It says updateTrackingAreas can be overridden, but  decided to hook
> the code to modify the guest display state instead because it should
> be synchronized with trackingArea.

Indeed it means updateTrackingAreas but I don't think it says you can't 
override removeTrackingArea so you could still do that as long as you call 
the original method then do whatever else is needed. Doing it in another 
method works but breaks the symmetry of add and remove so you have to 
remember to use another method to remove the tracking area than what you'd 
normally use. That's why I thought overriding the remove method could be 
cleaner.

>>> -/* Get location of event and convert to virtual screen coordinate */
>>> -- (CGPoint) screenLocationOfEvent:(NSEvent *)ev
>>> +- (void) frameUpdated
>>> {
>>> -    NSWindow *eventWindow = [ev window];
>>> -    // XXX: Use CGRect and -convertRectFromScreen: to support macOS 10.10
>>> -    CGRect r = CGRectZero;
>>> -    r.origin = [ev locationInWindow];
>>> -    if (!eventWindow) {
>>> -        if (!isFullscreen) {
>>> -            return [[self window] convertRectFromScreen:r].origin;
>>> -        } else {
>>> -            CGPoint locationInSelfWindow = [[self window] convertRectFromScreen:r].origin;
>>> -            CGPoint loc = [self convertPoint:locationInSelfWindow fromView:nil];
>>> -            if (stretch_video) {
>>> -                loc.x /= cdx;
>>> -                loc.y /= cdy;
>>> -            }
>>> -            return loc;
>>> -        }
>>> -    } else if ([[self window] isEqual:eventWindow]) {
>>> -        if (!isFullscreen) {
>>> -            return r.origin;
>>> -        } else {
>>> -            CGPoint loc = [self convertPoint:r.origin fromView:nil];
>>> -            if (stretch_video) {
>>> -                loc.x /= cdx;
>>> -                loc.y /= cdy;
>>> -            }
>>> -            return loc;
>>> -        }
>>> -    } else {
>>> -        return [[self window] convertRectFromScreen:[eventWindow convertRectToScreen:r]].origin;
>>> +    [self removeTrackingRect];
>>> +
>>> +    if ([self window]) {
>>> +        NSTrackingAreaOptions options = NSTrackingActiveInKeyWindow |
>>> +                                        NSTrackingMouseEnteredAndExited |
>>> +                                        NSTrackingMouseMoved;
>>> +        trackingArea = [[NSTrackingArea alloc] initWithRect:[self frame]
>>> +                                                    options:options
>>> +                                                      owner:self
>>> +                                                   userInfo:nil];
>>> +        [self addTrackingArea:trackingArea];
>>> +        [self updateUIInfo];
>>>     }
>>> }
>>>
>>> +- (void) viewDidMoveToWindow
>>> +{
>>> +    [self resizeWindow];
>>> +    [self frameUpdated];
>>> +}
>>> +
>>> +- (void) viewWillMoveToWindow:(NSWindow *)newWindow
>>> +{
>>> +    [self removeTrackingRect];
>>> +}
>>> +
>>> - (void) hideCursor
>>> {
>>>     if (!cursor_hide) {
>>> @@ -471,13 +461,14 @@ - (void) drawRect:(NSRect) rect
>>>         int i;
>>>         CGImageRef clipImageRef;
>>>         CGRect clipRect;
>>> +        CGFloat d = (CGFloat)h / [self frame].size.height;
>>>
>>>         [self getRectsBeingDrawn:&rectList count:&rectCount];
>>>         for (i = 0; i < rectCount; i++) {
>>> -            clipRect.origin.x = rectList[i].origin.x / cdx;
>>> -            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) / cdy;
>>> -            clipRect.size.width = rectList[i].size.width / cdx;
>>> -            clipRect.size.height = rectList[i].size.height / cdy;
>>> +            clipRect.origin.x = rectList[i].origin.x * d;
>>> +            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) * d;
>>> +            clipRect.size.width = rectList[i].size.width * d;
>>> +            clipRect.size.height = rectList[i].size.height * d;
>>>             clipImageRef = CGImageCreateWithImageInRect(
>>>                                                         imageRef,
>>>                                                         clipRect
>>> @@ -490,36 +481,34 @@ - (void) drawRect:(NSRect) rect
>>>     }
>>> }
>>>
>>> -- (void) setContentDimensions
>>> +- (NSSize) fixZoomedFullScreenSize:(NSSize)proposedSize
>>> {
>>> -    COCOA_DEBUG("QemuCocoaView: setContentDimensions\n");
>>> +    NSSize size;
>>>
>>> -    if (isFullscreen) {
>>> -        cdx = [[NSScreen mainScreen] frame].size.width / (float)screen.width;
>>> -        cdy = [[NSScreen mainScreen] frame].size.height / (float)screen.height;
>>> +    size.width = (CGFloat)screen.width * proposedSize.height;
>>> +    size.height = (CGFloat)screen.height * proposedSize.width;
>>>
>>> -        /* stretches video, but keeps same aspect ratio */
>>> -        if (stretch_video == true) {
>>> -            /* use smallest stretch value - prevents clipping on sides */
>>> -            if (MIN(cdx, cdy) == cdx) {
>>> -                cdy = cdx;
>>> -            } else {
>>> -                cdx = cdy;
>>> -            }
>>> -        } else {  /* No stretching */
>>> -            cdx = cdy = 1;
>>> -        }
>>> -        cw = screen.width * cdx;
>>> -        ch = screen.height * cdy;
>>> -        cx = ([[NSScreen mainScreen] frame].size.width - cw) / 2.0;
>>> -        cy = ([[NSScreen mainScreen] frame].size.height - ch) / 2.0;
>>> +    if (size.width < size.height) {
>>> +        size.width /= screen.height;
>>> +        size.height = proposedSize.height;
>>>     } else {
>>> -        cx = 0;
>>> -        cy = 0;
>>> -        cw = screen.width;
>>> -        ch = screen.height;
>>> -        cdx = 1.0;
>>> -        cdy = 1.0;
>>> +        size.width = proposedSize.width;
>>> +        size.height /= screen.width;
>>> +    }
>>> +
>>> +    return size;
>>
>> What does the above function do? Is there a more straghtforward way to
>> write this or add a comment because it's a bit confusing this way.
>
> What about renaming this method fixZoomedFullScreenSizeAspectRatio?

Maybe it's better to just add a comment. The longer name still leaves one 
guessing. Maybe fullScreenSizeKeepingAspectRatio is shorter and still says 
what it should do but a comment can be as long as it has to be to say what 
it does. But something like this seems more straightforward to me:

double aspect = (double)screen.width / screen.height;
if (proposedSize.height * aspect <= proposedSize.width) {
     proposedSize.width = proposedSize.height * aspect;
} else {
     proposedSize.height = proposedSize.width / aspect;
}
return proposedSize;

>>> +}
>>> +
>>> +- (void) resizeWindow
>>> +{
>>> +    [[self window] setContentAspectRatio:NSMakeSize(screen.width, screen.height)];
>>> +
>>> +    if (([[self window] styleMask] & NSWindowStyleMaskResizable) == 0) {
>>> +        [[self window] setContentSize:NSMakeSize(screen.width, screen.height)];
>>> +        [[self window] center];
>>> +    } else if (([[self window] styleMask] & NSWindowStyleMaskFullScreen) != 0) {
>>> +        [[self window] setContentSize:[self fixZoomedFullScreenSize:[[[self window] screen] frame].size]];
>>> +        [[self window] center];
>>>     }
>>> }
>>>
>>> @@ -538,7 +527,12 @@ - (void) updateUIInfo
>>>         NSSize screenSize = [[[self window] screen] frame].size;
>>>         CGSize screenPhysicalSize = CGDisplayScreenSize(display);
>>>
>>> -        frameSize = isFullscreen ? screenSize : [self frame].size;
>>> +        if (([[self window] styleMask] & NSWindowStyleMaskFullScreen) == 0) {
>>> +            frameSize = [self frame].size;
>>> +        } else {
>>> +            frameSize = screenSize;
>>> +        }
>>> +
>>>         info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
>>>         info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
>>>     } else {
>>> @@ -555,31 +549,19 @@ - (void) updateUIInfo
>>>     dpy_set_ui_info(dcl.con, &info);
>>> }
>>>
>>> -- (void)viewDidMoveToWindow
>>> -{
>>> -    [self updateUIInfo];
>>> -}
>>> -
>>> - (void) switchSurface:(pixman_image_t *)image
>>> {
>>>     COCOA_DEBUG("QemuCocoaView: switchSurface\n");
>>>
>>>     int w = pixman_image_get_width(image);
>>>     int h = pixman_image_get_height(image);
>>> -    /* cdx == 0 means this is our very first surface, in which case we need
>>> -     * to recalculate the content dimensions even if it happens to be the size
>>> -     * of the initial empty window.
>>> -     */
>>> -    bool isResize = (w != screen.width || h != screen.height || cdx == 0.0);
>>>
>>> -    int oldh = screen.height;
>>> -    if (isResize) {
>>> +    if (w != screen.width || h != screen.height) {
>>>         // Resize before we trigger the redraw, or we'll redraw at the wrong size
>>>         COCOA_DEBUG("switchSurface: new size %d x %d\n", w, h);
>>>         screen.width = w;
>>>         screen.height = h;
>>> -        [self setContentDimensions];
>>> -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
>>> +        [self resizeWindow];
>>>     }
>>>
>>>     // update screenBuffer
>>> @@ -588,51 +570,6 @@ - (void) switchSurface:(pixman_image_t *)image
>>>     }
>>>
>>>     pixman_image = image;
>>> -
>>> -    // update windows
>>> -    if (isFullscreen) {
>>> -        [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen] frame]];
>>> -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:NO animate:NO];
>>> -    } else {
>>> -        if (qemu_name)
>>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
>>> -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:YES animate:NO];
>>> -    }
>>> -
>>> -    if (isResize) {
>>> -        [normalWindow center];
>>> -    }
>>> -}
>>> -
>>> -- (void) toggleFullScreen:(id)sender
>>> -{
>>> -    COCOA_DEBUG("QemuCocoaView: toggleFullScreen\n");
>>> -
>>> -    if (isFullscreen) { // switch from fullscreen to desktop
>>> -        isFullscreen = FALSE;
>>> -        [self ungrabMouse];
>>> -        [self setContentDimensions];
>>> -        [fullScreenWindow close];
>>> -        [normalWindow setContentView: self];
>>> -        [normalWindow makeKeyAndOrderFront: self];
>>> -        [NSMenu setMenuBarVisible:YES];
>>> -    } else { // switch from desktop to fullscreen
>>> -        isFullscreen = TRUE;
>>> -        [normalWindow orderOut: nil]; /* Hide the window */
>>> -        [self grabMouse];
>>> -        [self setContentDimensions];
>>> -        [NSMenu setMenuBarVisible:NO];
>>> -        fullScreenWindow = [[NSWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame]
>>> -            styleMask:NSWindowStyleMaskBorderless
>>> -            backing:NSBackingStoreBuffered
>>> -            defer:NO];
>>> -        [fullScreenWindow setAcceptsMouseMovedEvents: YES];
>>> -        [fullScreenWindow setHasShadow:NO];
>>> -        [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
>>> -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
>>> -        [[fullScreenWindow contentView] addSubview: self];
>>> -        [fullScreenWindow makeKeyAndOrderFront:self];
>>> -    }
>>> }
>>>
>>> - (void) toggleKey: (int)keycode {
>>> @@ -724,12 +661,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>> {
>>>     /* Return true if we handled the event, false if it should be given to OSX */
>>>     COCOA_DEBUG("QemuCocoaView: handleEvent\n");
>>> -    int buttons = 0;
>>>     int keycode = 0;
>>> -    bool mouse_event = false;
>>> -    static bool switched_to_fullscreen = false;
>>> -    // Location of event in virtual screen coordinates
>>> -    NSPoint p = [self screenLocationOfEvent:event];
>>>     NSUInteger modifiers = [event modifierFlags];
>>>
>>>     /*
>>> @@ -799,37 +731,37 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>                     if (!!(modifiers & NSEventModifierFlagShift)) {
>>>                         [self toggleKey:Q_KEY_CODE_SHIFT];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_RightShift:
>>>                     if (!!(modifiers & NSEventModifierFlagShift)) {
>>>                         [self toggleKey:Q_KEY_CODE_SHIFT_R];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_Control:
>>>                     if (!!(modifiers & NSEventModifierFlagControl)) {
>>>                         [self toggleKey:Q_KEY_CODE_CTRL];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_RightControl:
>>>                     if (!!(modifiers & NSEventModifierFlagControl)) {
>>>                         [self toggleKey:Q_KEY_CODE_CTRL_R];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_Option:
>>>                     if (!!(modifiers & NSEventModifierFlagOption)) {
>>>                         [self toggleKey:Q_KEY_CODE_ALT];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_RightOption:
>>>                     if (!!(modifiers & NSEventModifierFlagOption)) {
>>>                         [self toggleKey:Q_KEY_CODE_ALT_R];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 /* Don't pass command key changes to guest unless mouse is grabbed */
>>>                 case kVK_Command:
>>> @@ -837,28 +769,23 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>                         !!(modifiers & NSEventModifierFlagCommand)) {
>>>                         [self toggleKey:Q_KEY_CODE_META_L];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>>
>>>                 case kVK_RightCommand:
>>>                     if (isMouseGrabbed &&
>>>                         !!(modifiers & NSEventModifierFlagCommand)) {
>>>                         [self toggleKey:Q_KEY_CODE_META_R];
>>>                     }
>>> -                    break;
>>> +                    return true;
>>> +
>>> +                default:
>>> +                    return true;
>>>             }
>>> -            break;
>>>         case NSEventTypeKeyDown:
>>>             keycode = cocoa_keycode_to_qemu([event keyCode]);
>>>
>>>             // forward command key combos to the host UI unless the mouse is grabbed
>>>             if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
>>> -                /*
>>> -                 * Prevent the command key from being stuck down in the guest
>>> -                 * when using Command-F to switch to full screen mode.
>>> -                 */
>>> -                if (keycode == Q_KEY_CODE_F) {
>>> -                    switched_to_fullscreen = true;
>>> -                }
>>>                 return false;
>>>             }
>>>
>>> @@ -889,7 +816,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>             } else {
>>>                 [self handleMonitorInput: event];
>>>             }
>>> -            break;
>>> +            return true;
>>>         case NSEventTypeKeyUp:
>>>             keycode = cocoa_keycode_to_qemu([event keyCode]);
>>>
>>> @@ -902,67 +829,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>             if (qemu_console_is_graphic(NULL)) {
>>>                 qkbd_state_key_event(kbd, keycode, false);
>>>             }
>>> -            break;
>>> -        case NSEventTypeMouseMoved:
>>> -            if (isAbsoluteEnabled) {
>>> -                // Cursor re-entered into a window might generate events bound to screen coordinates
>>> -                // and `nil` window property, and in full screen mode, current window might not be
>>> -                // key window, where event location alone should suffice.
>>> -                if (![self screenContainsPoint:p] || !([[self window] isKeyWindow] || isFullscreen)) {
>>> -                    if (isMouseGrabbed) {
>>> -                        [self ungrabMouse];
>>> -                    }
>>> -                } else {
>>> -                    if (!isMouseGrabbed) {
>>> -                        [self grabMouse];
>>> -                    }
>>> -                }
>>> -            }
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeLeftMouseDown:
>>> -            buttons |= MOUSE_EVENT_LBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeRightMouseDown:
>>> -            buttons |= MOUSE_EVENT_RBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeOtherMouseDown:
>>> -            buttons |= MOUSE_EVENT_MBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeLeftMouseDragged:
>>> -            buttons |= MOUSE_EVENT_LBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeRightMouseDragged:
>>> -            buttons |= MOUSE_EVENT_RBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeOtherMouseDragged:
>>> -            buttons |= MOUSE_EVENT_MBUTTON;
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeLeftMouseUp:
>>> -            mouse_event = true;
>>> -            if (!isMouseGrabbed && [self screenContainsPoint:p]) {
>>> -                /*
>>> -                 * In fullscreen mode, the window of cocoaView may not be the
>>> -                 * key window, therefore the position relative to the virtual
>>> -                 * screen alone will be sufficient.
>>> -                 */
>>> -                if(isFullscreen || [[self window] isKeyWindow]) {
>>> -                    [self grabMouse];
>>> -                }
>>> -            }
>>> -            break;
>>> -        case NSEventTypeRightMouseUp:
>>> -            mouse_event = true;
>>> -            break;
>>> -        case NSEventTypeOtherMouseUp:
>>> -            mouse_event = true;
>>> -            break;
>>> +            return true;
>>>         case NSEventTypeScrollWheel:
>>>             /*
>>>              * Send wheel events to the guest regardless of window focus.
>>> @@ -976,7 +843,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>              */
>>>             if ([event deltaY] != 0) {
>>>             /* Determine if this is a scroll up or scroll down event */
>>> -                buttons = ([event deltaY] > 0) ?
>>> +                int buttons = ([event deltaY] > 0) ?
>>>                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
>>>                 qemu_input_queue_btn(dcl.con, buttons, true);
>>>                 qemu_input_event_sync();
>>> @@ -987,62 +854,124 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>              * Since deltaY also reports scroll wheel events we prevent mouse
>>>              * movement code from executing.
>>>              */
>>> -            mouse_event = false;
>>> -            break;
>>> +            return true;
>>>         default:
>>>             return false;
>>>     }
>>> +}
>>>
>>> -    if (mouse_event) {
>>> -        /* Don't send button events to the guest unless we've got a
>>> -         * mouse grab or window focus. If we have neither then this event
>>> -         * is the user clicking on the background window to activate and
>>> -         * bring us to the front, which will be done by the sendEvent
>>> -         * call below. We definitely don't want to pass that click through
>>> -         * to the guest.
>>> -         */
>>> -        if ((isMouseGrabbed || [[self window] isKeyWindow]) &&
>>> -            (last_buttons != buttons)) {
>>> -            static uint32_t bmap[INPUT_BUTTON__MAX] = {
>>> -                [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
>>> -                [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
>>> -                [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON
>>> -            };
>>> -            qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
>>> -            last_buttons = buttons;
>>> -        }
>>> -        if (isMouseGrabbed) {
>>> -            if (isAbsoluteEnabled) {
>>> -                /* Note that the origin for Cocoa mouse coords is bottom left, not top left.
>>> -                 * The check on screenContainsPoint is to avoid sending out of range values for
>>> -                 * clicks in the titlebar.
>>> -                 */
>>> -                if ([self screenContainsPoint:p]) {
>>> -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x, 0, screen.width);
>>> -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
>>> -                }
>>> -            } else {
>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
>>> -            }
>>> +- (void) handleMouseEvent:(NSEvent *)event
>>> +{
>>> +    if (!isMouseGrabbed) {
>>> +        return;
>>> +    }
>>> +
>>> +    with_iothread_lock(^{
>>> +        if (isAbsoluteEnabled) {
>>> +            CGFloat d = (CGFloat)screen.height / [self frame].size.height;
>>> +            NSPoint p = [event locationInWindow];
>>> +            // Note that the origin for Cocoa mouse coords is bottom left, not top left.
>>> +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x * d, 0, screen.width);
>>> +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y * d, 0, screen.height);
>>>         } else {
>>> -            return false;
>>> +            CGFloat d = (CGFloat)screen.height / [self convertSizeToBacking:[self frame].size].height;
>>> +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, [event deltaX] * d);
>>> +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, [event deltaY] * d);
>>>         }
>>> +
>>>         qemu_input_event_sync();
>>> +    });
>>> +}
>>> +
>>> +- (void) handleMouseEvent:(NSEvent *)event button:(InputButton)button down:(bool)down
>>> +{
>>> +    if (!isMouseGrabbed) {
>>> +        return;
>>>     }
>>> -    return true;
>>> +
>>> +    with_iothread_lock(^{
>>> +        qemu_input_queue_btn(dcl.con, button, down);
>>> +    });
>>> +
>>> +    [self handleMouseEvent:event];
>>> +}
>>> +
>>> +- (void) mouseExited:(NSEvent *)event
>>> +{
>>> +    if (isAbsoluteEnabled && isMouseGrabbed) {
>>> +        [self ungrabMouse];
>>> +    }
>>> +}
>>> +
>>> +- (void) mouseEntered:(NSEvent *)event
>>> +{
>>> +    if (isAbsoluteEnabled && !isMouseGrabbed) {
>>> +        [self grabMouse];
>>> +    }
>>> +}
>>> +
>>> +- (void) mouseMoved:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event];
>>> +}
>>> +
>>> +- (void) mouseDown:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:true];
>>> +}
>>> +
>>> +- (void) rightMouseDown:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:true];
>>> +}
>>> +
>>> +- (void) otherMouseDown:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:true];
>>> +}
>>> +
>>> +- (void) mouseDragged:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event];
>>> +}
>>> +
>>> +- (void) rightMouseDragged:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event];
>>> +}
>>> +
>>> +- (void) otherMouseDragged:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event];
>>> +}
>>> +
>>> +- (void) mouseUp:(NSEvent *)event
>>> +{
>>> +    if (!isMouseGrabbed) {
>>> +        [self grabMouse];
>>> +    }
>>> +
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:false];
>>> +}
>>> +
>>> +- (void) rightMouseUp:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:false];
>>> +}
>>> +
>>> +- (void) otherMouseUp:(NSEvent *)event
>>> +{
>>> +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:false];
>>> }
>>>
>>> - (void) grabMouse
>>> {
>>>     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
>>>
>>> -    if (!isFullscreen) {
>>> -        if (qemu_name)
>>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
>>> -        else
>>> -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
>>> -    }
>>> +    if (qemu_name)
>>> +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
>>> +    else
>>> +        [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
>>>     [self hideCursor];
>>>     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>>>     isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
>>> @@ -1052,15 +981,14 @@ - (void) ungrabMouse
>>> {
>>>     COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
>>>
>>> -    if (!isFullscreen) {
>>> -        if (qemu_name)
>>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
>>> -        else
>>> -            [normalWindow setTitle:@"QEMU"];
>>> -    }
>>> +    if (qemu_name)
>>> +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
>>> +    else
>>> +        [normalWindow setTitle:@"QEMU"];
>>>     [self unhideCursor];
>>>     CGAssociateMouseAndMouseCursorPosition(TRUE);
>>>     isMouseGrabbed = FALSE;
>>> +    [self raiseAllButtons];
>>> }
>>>
>>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>> @@ -1071,8 +999,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>> }
>>> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
>>> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
>>> -- (float) cdx {return cdx;}
>>> -- (float) cdy {return cdy;}
>>> - (QEMUScreen) gscreen {return screen;}
>>>
>>> /*
>>> @@ -1086,6 +1012,15 @@ - (void) raiseAllKeys
>>>         qkbd_state_lift_all_keys(kbd);
>>>     });
>>> }
>>> +
>>> +- (void) raiseAllButtons
>>> +{
>>> +    with_iothread_lock(^{
>>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_LEFT, false);
>>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_RIGHT, false);
>>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_MIDDLE, false);
>>> +    });
>>> +}
>>> @end
>>>
>>>
>>> @@ -1100,7 +1035,6 @@ @interface QemuCocoaAppController : NSObject
>>> {
>>> }
>>> - (void)doToggleFullScreen:(id)sender;
>>> -- (void)toggleFullScreen:(id)sender;
>>> - (void)showQEMUDoc:(id)sender;
>>> - (void)zoomToFit:(id) sender;
>>> - (void)displayConsole:(id)sender;
>>> @@ -1143,12 +1077,12 @@ - (id) init
>>>             exit(1);
>>>         }
>>>         [normalWindow setAcceptsMouseMovedEvents:YES];
>>> -        [normalWindow setTitle:@"QEMU"];
>>> +        [normalWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
>>> +        [normalWindow setTitle:qemu_name ? [NSString stringWithFormat:@"QEMU %s", qemu_name] : @"QEMU"];
>>>         [normalWindow setContentView:cocoaView];
>>>         [normalWindow makeKeyAndOrderFront:self];
>>>         [normalWindow center];
>>>         [normalWindow setDelegate: self];
>>> -        stretch_video = false;
>>>
>>>         /* Used for displaying pause on the screen */
>>>         pauseLabel = [NSTextField new];
>>> @@ -1219,9 +1153,20 @@ - (void)windowDidChangeScreen:(NSNotification *)notification
>>>     [cocoaView updateUIInfo];
>>> }
>>>
>>> +- (void)windowDidEnterFullScreen:(NSNotification *)notification
>>> +{
>>> +    [cocoaView grabMouse];
>>> +}
>>> +
>>> +- (void)windowDidExitFullScreen:(NSNotification *)notification
>>> +{
>>> +    [cocoaView resizeWindow];
>>> +    [cocoaView ungrabMouse];
>>> +}
>>> +
>>> - (void)windowDidResize:(NSNotification *)notification
>>> {
>>> -    [cocoaView updateUIInfo];
>>> +    [cocoaView frameUpdated];
>>> }
>>>
>>> /* Called when the user clicks on a window's close button */
>>> @@ -1237,6 +1182,23 @@ - (BOOL)windowShouldClose:(id)sender
>>>     return NO;
>>> }
>>>
>>> +- (NSSize) window:(NSWindow *)window willUseFullScreenContentSize:(NSSize)proposedSize
>>> +{
>>> +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) == 0) {
>>> +        return NSMakeSize([cocoaView gscreen].width, [cocoaView gscreen].height);
>>> +    }
>>> +
>>> +    return [cocoaView fixZoomedFullScreenSize:proposedSize];
>>> +}
>>> +
>>> +- (NSApplicationPresentationOptions) window:(NSWindow *)window
>>> +                                     willUseFullScreenPresentationOptions:(NSApplicationPresentationOptions)proposedOptions;
>>> +
>>> +{
>>> +    return (proposedOptions & ~(NSApplicationPresentationAutoHideDock | NSApplicationPresentationAutoHideMenuBar)) |
>>> +           NSApplicationPresentationHideDock | NSApplicationPresentationHideMenuBar;

I think you can drop the & ~() part altogether and only OR the value with 
the bits you want to turn on. There's no need to turn them off first, | is 
OR not XOR.

Regards,
BALATON Zoltan

>>> +}
>>> +
>>> /* Called when QEMU goes into the background */
>>> - (void) applicationWillResignActive: (NSNotification *)aNotification
>>> {
>>> @@ -1250,14 +1212,7 @@ - (void) applicationWillResignActive: (NSNotification *)aNotification
>>>  */
>>> - (void) doToggleFullScreen:(id)sender
>>> {
>>> -    [self toggleFullScreen:(id)sender];
>>> -}
>>> -
>>> -- (void)toggleFullScreen:(id)sender
>>> -{
>>> -    COCOA_DEBUG("QemuCocoaAppController: toggleFullScreen\n");
>>> -
>>> -    [cocoaView toggleFullScreen:sender];
>>> +    [normalWindow toggleFullScreen:sender];
>>> }
>>>
>>> /* Tries to find then open the specified filename */
>>> @@ -1294,13 +1249,15 @@ - (void)showQEMUDoc:(id)sender
>>>     [self openDocumentation: @"index.html"];
>>> }
>>>
>>> -/* Stretches video to fit host monitor size */
>>> +/* Toggles the flag which stretches video to fit host window size */
>>> - (void)zoomToFit:(id) sender
>>> {
>>> -    stretch_video = !stretch_video;
>>> -    if (stretch_video == true) {
>>> +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) == 0) {
>>> +        [normalWindow setStyleMask:[normalWindow styleMask] | NSWindowStyleMaskResizable];
>>>         [sender setState: NSControlStateValueOn];
>>>     } else {
>>> +        [normalWindow setStyleMask:[normalWindow styleMask] & ~NSWindowStyleMaskResizable];
>>> +        [cocoaView resizeWindow];
>>>         [sender setState: NSControlStateValueOff];
>>>     }
>>> }
>>> @@ -1308,7 +1265,9 @@ - (void)zoomToFit:(id) sender
>>> /* Displays the console on the screen */
>>> - (void)displayConsole:(id)sender
>>> {
>>> -    console_select([sender tag]);
>>> +    with_iothread_lock(^{
>>> +        console_select([sender tag]);
>>> +    });
>>> }
>>>
>>> /* Pause the guest */
>>> @@ -1952,16 +1911,14 @@ static void cocoa_update(DisplayChangeListener *dcl,
>>>     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
>>>
>>>     dispatch_async(dispatch_get_main_queue(), ^{
>>> -        NSRect rect;
>>> -        if ([cocoaView cdx] == 1.0) {
>>> -            rect = NSMakeRect(x, [cocoaView gscreen].height - y - h, w, h);
>>> -        } else {
>>> -            rect = NSMakeRect(
>>> -                x * [cocoaView cdx],
>>> -                ([cocoaView gscreen].height - y - h) * [cocoaView cdy],
>>> -                w * [cocoaView cdx],
>>> -                h * [cocoaView cdy]);
>>> -        }
>>> +        CGFloat d = [cocoaView frame].size.height / (CGFloat)[cocoaView gscreen].height;
>>> +
>>> +        NSRect rect = NSMakeRect(
>>> +                x * d,
>>> +                ([cocoaView gscreen].height - y - h) * d,
>>> +                w * d,
>>> +                h * d);
>>> +
>>>         [cocoaView setNeedsDisplayInRect:rect];
>>>     });
>>>
>>> @@ -2034,8 +1991,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>>>     /* if fullscreen mode is to be used */
>>>     if (opts->has_full_screen && opts->full_screen) {
>>>         dispatch_async(dispatch_get_main_queue(), ^{
>>> -            [NSApp activateIgnoringOtherApps: YES];
>>> -            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
>>> +            [normalWindow toggleFullScreen: nil];
>>>         });
>>>     }
>>>     if (opts->has_show_cursor && opts->show_cursor) {
>>>
>
>
--3866299591-765819585-1624915142=:48178--

