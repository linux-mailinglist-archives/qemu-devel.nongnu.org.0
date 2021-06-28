Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64283B5D86
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:03:55 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpzW-0000ex-GV
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxpxj-0007C2-J6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:02:03 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxpxf-00085w-5h
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:02:03 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h17so25458445edw.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XlLlPDKiOXNJxYL86vwpqhM+G4yu3qcbRujF5NxPw2A=;
 b=GrvijSyCo6z7ZYzBRLa4l6z7aup/hU1FpSSItBp3HoNrm6xFT9x6rrwBR0BuB5Oqdd
 6oJMzcxrjkPsl8vT4igqLzqHS8mcY0PUdjgzAY5MOZDRo0D2jwT/z4TeDTc8epLPTDhB
 A7OO/WkedLcXJqPNVZ4LwE2vTg6ILJvEVwoHrW2OqciOWUg87gj3Gf9Jh/7B9YirV6L1
 qOa6Ge1GN1zGEPEnnC+/ZSabqGovA89YaTdv0Afv6I5kK63+HPdbQUD/0LQ+bcFnp3S7
 E6jRZ40mEPS4FoprGC1sHLO0WK0QRKBGwxg3KuPB5CD0WgDYM3Ngg6+5jPxMmMDwxI2D
 uThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XlLlPDKiOXNJxYL86vwpqhM+G4yu3qcbRujF5NxPw2A=;
 b=EyR9oNc/DGPflt6LWMpZZlBdihiiOksRFzxG+4AVAj0s95GxmvFtisLcrySTKdEonX
 RKTnXWg+p8qhmNkmsMR42xpdD0f0J9qReUj0eQTVulq/RiXib2YQ/HDfPwYEYwe4M9/A
 oIDFRhn37PIC6+OhfntxDq65m+2fAbJ5Xb5NZh8o8v6wO0tMbzN+NUlN9SRPJ9GbdhvV
 vGu13NkXNmhlIc0SIcO+esrAWl8z5uQMyLwyKmuh1+aD2/ia+qqk/PMhJfAFit+WB6KB
 jXyJiYfuqCGe3777KuVhoiVR6FlTaicQgwj+S+Vdj0e8arvqVXlk5wtP4vCB4DDnqdt5
 JSjw==
X-Gm-Message-State: AOAM5311cFUUhBuPCzU2yPkK9+kU4CpJF/g5VzkW4Hk/GS0riQdpn0HF
 Bg2YU7D7cqkOsZF3/ss90nwFjXpU5GKPMXDPhyo=
X-Google-Smtp-Source: ABdhPJzU5Y1Oyca/Qs8sL7EIF6ZOfaj4XWNu071SJLAS4eErgv1vaGhn8WqrmwScgyAcvH+lopfC2TgESLwufUymshU=
X-Received: by 2002:a05:6402:176f:: with SMTP id
 da15mr32013564edb.334.1624881716726; 
 Mon, 28 Jun 2021 05:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210628030850.34321-1-akihiko.odaki@gmail.com>
 <ca2da977-7a24-1beb-ed5c-f869a484f33b@eik.bme.hu>
In-Reply-To: <ca2da977-7a24-1beb-ed5c-f869a484f33b@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 28 Jun 2021 21:01:46 +0900
Message-ID: <CAMVc7JUCUCHJYJy_RRu=MWhaBF81vvoX9rLYzCN6OVtq0uxDfg@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use NSWindow's ability to resize
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

2021=E5=B9=B46=E6=9C=8828=E6=97=A5(=E6=9C=88) 17:57 BALATON Zoltan <balaton=
@eik.bme.hu>:
>
> On Mon, 28 Jun 2021, Akihiko Odaki wrote:
> > This change brings two new features:
> > - The window will be resizable if "Zoom To Fit" is eanbled
> > - The window can be made full screen by clicking full screen button
> >  provided by the platform. (The left-top green button.)
>
> While this is better for consistency with other apps is it a potential
> usability issue that a window bar may appear when you move the mouse to
> the top of the full screen window (where guests often have a menu bar tha=
t
> this could make harder to use)? (Haven't tested it so don't know how it
> actually works.)

The window bar is completely hidden with NSApplicationPresentationHideMenuB=
ar.

>
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> > ui/cocoa.m | 542 ++++++++++++++++++++++++-----------------------------
> > 1 file changed, 249 insertions(+), 293 deletions(-)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 9f72844b079..091d9721f4d 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -93,12 +93,10 @@ static void cocoa_switch(DisplayChangeListener *dcl=
,
> > static DisplayChangeListener dcl =3D {
> >     .ops =3D &dcl_ops,
> > };
> > -static int last_buttons;
> > static int cursor_hide =3D 1;
> >
> > static int gArgc;
> > static char **gArgv;
> > -static bool stretch_video;
> > static NSTextField *pauseLabel;
> > static NSArray * supportedImageFileTypes;
> >
> > @@ -301,19 +299,16 @@ static void handleAnyDeviceErrors(Error * err)
> > */
> > @interface QemuCocoaView : NSView
> > {
> > +    NSTrackingArea *trackingArea;
> >     QEMUScreen screen;
> > -    NSWindow *fullScreenWindow;
> > -    float cx,cy,cw,ch,cdx,cdy;
> >     pixman_image_t *pixman_image;
> >     QKbdState *kbd;
> >     BOOL isMouseGrabbed;
> > -    BOOL isFullscreen;
> >     BOOL isAbsoluteEnabled;
> > }
> > - (void) switchSurface:(pixman_image_t *)image;
> > - (void) grabMouse;
> > - (void) ungrabMouse;
> > -- (void) toggleFullScreen:(id)sender;
> > - (void) handleMonitorInput:(NSEvent *)event;
> > - (bool) handleEvent:(NSEvent *)event;
> > - (bool) handleEventLocked:(NSEvent *)event;
> > @@ -328,8 +323,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnable=
d;
> >  */
> > - (BOOL) isMouseGrabbed;
> > - (BOOL) isAbsoluteEnabled;
> > -- (float) cdx;
> > -- (float) cdy;
> > - (QEMUScreen) gscreen;
> > - (void) raiseAllKeys;
> > @end
> > @@ -369,46 +362,43 @@ - (BOOL) isOpaque
> >     return YES;
> > }
> >
> > -- (BOOL) screenContainsPoint:(NSPoint) p
> > +- (void) removeTrackingRect
> > {
> > -    return (p.x > -1 && p.x < screen.width && p.y > -1 && p.y < screen=
.height);
> > +    if (trackingArea) {
> > +        [self removeTrackingArea:trackingArea];
> > +        [trackingArea release];
> > +        trackingArea =3D nil;
> > +    }
> > }
>
> You could override removeTrackingArea here then you would not have
> addTrackingArea vs. removeTrackingRect and that's the way NSTrackingArea
> docs also suggest.

https://developer.apple.com/documentation/appkit/nstrackingarea?language=3D=
objc
> Other NSView methods related to NSTrackingArea objects
> (in addition to addTrackingArea:) include removeTrackingArea: and
> updateTrackingAreas. Views can override the latter method to recompute an=
d
> replace their NSTrackingArea objects in certain situations, such as a cha=
nge in
> the size of the visibleRect.

It says updateTrackingAreas can be overridden, but  decided to hook
the code to modify the guest display state instead because it should
be synchronized with trackingArea.

>
> >
> > -/* Get location of event and convert to virtual screen coordinate */
> > -- (CGPoint) screenLocationOfEvent:(NSEvent *)ev
> > +- (void) frameUpdated
> > {
> > -    NSWindow *eventWindow =3D [ev window];
> > -    // XXX: Use CGRect and -convertRectFromScreen: to support macOS 10=
.10
> > -    CGRect r =3D CGRectZero;
> > -    r.origin =3D [ev locationInWindow];
> > -    if (!eventWindow) {
> > -        if (!isFullscreen) {
> > -            return [[self window] convertRectFromScreen:r].origin;
> > -        } else {
> > -            CGPoint locationInSelfWindow =3D [[self window] convertRec=
tFromScreen:r].origin;
> > -            CGPoint loc =3D [self convertPoint:locationInSelfWindow fr=
omView:nil];
> > -            if (stretch_video) {
> > -                loc.x /=3D cdx;
> > -                loc.y /=3D cdy;
> > -            }
> > -            return loc;
> > -        }
> > -    } else if ([[self window] isEqual:eventWindow]) {
> > -        if (!isFullscreen) {
> > -            return r.origin;
> > -        } else {
> > -            CGPoint loc =3D [self convertPoint:r.origin fromView:nil];
> > -            if (stretch_video) {
> > -                loc.x /=3D cdx;
> > -                loc.y /=3D cdy;
> > -            }
> > -            return loc;
> > -        }
> > -    } else {
> > -        return [[self window] convertRectFromScreen:[eventWindow conve=
rtRectToScreen:r]].origin;
> > +    [self removeTrackingRect];
> > +
> > +    if ([self window]) {
> > +        NSTrackingAreaOptions options =3D NSTrackingActiveInKeyWindow =
|
> > +                                        NSTrackingMouseEnteredAndExite=
d |
> > +                                        NSTrackingMouseMoved;
> > +        trackingArea =3D [[NSTrackingArea alloc] initWithRect:[self fr=
ame]
> > +                                                    options:options
> > +                                                      owner:self
> > +                                                   userInfo:nil];
> > +        [self addTrackingArea:trackingArea];
> > +        [self updateUIInfo];
> >     }
> > }
> >
> > +- (void) viewDidMoveToWindow
> > +{
> > +    [self resizeWindow];
> > +    [self frameUpdated];
> > +}
> > +
> > +- (void) viewWillMoveToWindow:(NSWindow *)newWindow
> > +{
> > +    [self removeTrackingRect];
> > +}
> > +
> > - (void) hideCursor
> > {
> >     if (!cursor_hide) {
> > @@ -471,13 +461,14 @@ - (void) drawRect:(NSRect) rect
> >         int i;
> >         CGImageRef clipImageRef;
> >         CGRect clipRect;
> > +        CGFloat d =3D (CGFloat)h / [self frame].size.height;
> >
> >         [self getRectsBeingDrawn:&rectList count:&rectCount];
> >         for (i =3D 0; i < rectCount; i++) {
> > -            clipRect.origin.x =3D rectList[i].origin.x / cdx;
> > -            clipRect.origin.y =3D (float)h - (rectList[i].origin.y + r=
ectList[i].size.height) / cdy;
> > -            clipRect.size.width =3D rectList[i].size.width / cdx;
> > -            clipRect.size.height =3D rectList[i].size.height / cdy;
> > +            clipRect.origin.x =3D rectList[i].origin.x * d;
> > +            clipRect.origin.y =3D (float)h - (rectList[i].origin.y + r=
ectList[i].size.height) * d;
> > +            clipRect.size.width =3D rectList[i].size.width * d;
> > +            clipRect.size.height =3D rectList[i].size.height * d;
> >             clipImageRef =3D CGImageCreateWithImageInRect(
> >                                                         imageRef,
> >                                                         clipRect
> > @@ -490,36 +481,34 @@ - (void) drawRect:(NSRect) rect
> >     }
> > }
> >
> > -- (void) setContentDimensions
> > +- (NSSize) fixZoomedFullScreenSize:(NSSize)proposedSize
> > {
> > -    COCOA_DEBUG("QemuCocoaView: setContentDimensions\n");
> > +    NSSize size;
> >
> > -    if (isFullscreen) {
> > -        cdx =3D [[NSScreen mainScreen] frame].size.width / (float)scre=
en.width;
> > -        cdy =3D [[NSScreen mainScreen] frame].size.height / (float)scr=
een.height;
> > +    size.width =3D (CGFloat)screen.width * proposedSize.height;
> > +    size.height =3D (CGFloat)screen.height * proposedSize.width;
> >
> > -        /* stretches video, but keeps same aspect ratio */
> > -        if (stretch_video =3D=3D true) {
> > -            /* use smallest stretch value - prevents clipping on sides=
 */
> > -            if (MIN(cdx, cdy) =3D=3D cdx) {
> > -                cdy =3D cdx;
> > -            } else {
> > -                cdx =3D cdy;
> > -            }
> > -        } else {  /* No stretching */
> > -            cdx =3D cdy =3D 1;
> > -        }
> > -        cw =3D screen.width * cdx;
> > -        ch =3D screen.height * cdy;
> > -        cx =3D ([[NSScreen mainScreen] frame].size.width - cw) / 2.0;
> > -        cy =3D ([[NSScreen mainScreen] frame].size.height - ch) / 2.0;
> > +    if (size.width < size.height) {
> > +        size.width /=3D screen.height;
> > +        size.height =3D proposedSize.height;
> >     } else {
> > -        cx =3D 0;
> > -        cy =3D 0;
> > -        cw =3D screen.width;
> > -        ch =3D screen.height;
> > -        cdx =3D 1.0;
> > -        cdy =3D 1.0;
> > +        size.width =3D proposedSize.width;
> > +        size.height /=3D screen.width;
> > +    }
> > +
> > +    return size;
>
> What does the above function do? Is there a more straghtforward way to
> write this or add a comment because it's a bit confusing this way.

What about renaming this method fixZoomedFullScreenSizeAspectRatio?

Regards,
Akihiko Odaki

>
> Regards,
> BALATON Zoltan
>
> > +}
> > +
> > +- (void) resizeWindow
> > +{
> > +    [[self window] setContentAspectRatio:NSMakeSize(screen.width, scre=
en.height)];
> > +
> > +    if (([[self window] styleMask] & NSWindowStyleMaskResizable) =3D=
=3D 0) {
> > +        [[self window] setContentSize:NSMakeSize(screen.width, screen.=
height)];
> > +        [[self window] center];
> > +    } else if (([[self window] styleMask] & NSWindowStyleMaskFullScree=
n) !=3D 0) {
> > +        [[self window] setContentSize:[self fixZoomedFullScreenSize:[[=
[self window] screen] frame].size]];
> > +        [[self window] center];
> >     }
> > }
> >
> > @@ -538,7 +527,12 @@ - (void) updateUIInfo
> >         NSSize screenSize =3D [[[self window] screen] frame].size;
> >         CGSize screenPhysicalSize =3D CGDisplayScreenSize(display);
> >
> > -        frameSize =3D isFullscreen ? screenSize : [self frame].size;
> > +        if (([[self window] styleMask] & NSWindowStyleMaskFullScreen) =
=3D=3D 0) {
> > +            frameSize =3D [self frame].size;
> > +        } else {
> > +            frameSize =3D screenSize;
> > +        }
> > +
> >         info.width_mm =3D frameSize.width / screenSize.width * screenPh=
ysicalSize.width;
> >         info.height_mm =3D frameSize.height / screenSize.height * scree=
nPhysicalSize.height;
> >     } else {
> > @@ -555,31 +549,19 @@ - (void) updateUIInfo
> >     dpy_set_ui_info(dcl.con, &info);
> > }
> >
> > -- (void)viewDidMoveToWindow
> > -{
> > -    [self updateUIInfo];
> > -}
> > -
> > - (void) switchSurface:(pixman_image_t *)image
> > {
> >     COCOA_DEBUG("QemuCocoaView: switchSurface\n");
> >
> >     int w =3D pixman_image_get_width(image);
> >     int h =3D pixman_image_get_height(image);
> > -    /* cdx =3D=3D 0 means this is our very first surface, in which cas=
e we need
> > -     * to recalculate the content dimensions even if it happens to be =
the size
> > -     * of the initial empty window.
> > -     */
> > -    bool isResize =3D (w !=3D screen.width || h !=3D screen.height || =
cdx =3D=3D 0.0);
> >
> > -    int oldh =3D screen.height;
> > -    if (isResize) {
> > +    if (w !=3D screen.width || h !=3D screen.height) {
> >         // Resize before we trigger the redraw, or we'll redraw at the =
wrong size
> >         COCOA_DEBUG("switchSurface: new size %d x %d\n", w, h);
> >         screen.width =3D w;
> >         screen.height =3D h;
> > -        [self setContentDimensions];
> > -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> > +        [self resizeWindow];
> >     }
> >
> >     // update screenBuffer
> > @@ -588,51 +570,6 @@ - (void) switchSurface:(pixman_image_t *)image
> >     }
> >
> >     pixman_image =3D image;
> > -
> > -    // update windows
> > -    if (isFullscreen) {
> > -        [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen=
] frame]];
> > -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.=
x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].si=
ze.height - oldh) display:NO animate:NO];
> > -    } else {
> > -        if (qemu_name)
> > -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %=
s", qemu_name]];
> > -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.=
x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].si=
ze.height - oldh) display:YES animate:NO];
> > -    }
> > -
> > -    if (isResize) {
> > -        [normalWindow center];
> > -    }
> > -}
> > -
> > -- (void) toggleFullScreen:(id)sender
> > -{
> > -    COCOA_DEBUG("QemuCocoaView: toggleFullScreen\n");
> > -
> > -    if (isFullscreen) { // switch from fullscreen to desktop
> > -        isFullscreen =3D FALSE;
> > -        [self ungrabMouse];
> > -        [self setContentDimensions];
> > -        [fullScreenWindow close];
> > -        [normalWindow setContentView: self];
> > -        [normalWindow makeKeyAndOrderFront: self];
> > -        [NSMenu setMenuBarVisible:YES];
> > -    } else { // switch from desktop to fullscreen
> > -        isFullscreen =3D TRUE;
> > -        [normalWindow orderOut: nil]; /* Hide the window */
> > -        [self grabMouse];
> > -        [self setContentDimensions];
> > -        [NSMenu setMenuBarVisible:NO];
> > -        fullScreenWindow =3D [[NSWindow alloc] initWithContentRect:[[N=
SScreen mainScreen] frame]
> > -            styleMask:NSWindowStyleMaskBorderless
> > -            backing:NSBackingStoreBuffered
> > -            defer:NO];
> > -        [fullScreenWindow setAcceptsMouseMovedEvents: YES];
> > -        [fullScreenWindow setHasShadow:NO];
> > -        [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
> > -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> > -        [[fullScreenWindow contentView] addSubview: self];
> > -        [fullScreenWindow makeKeyAndOrderFront:self];
> > -    }
> > }
> >
> > - (void) toggleKey: (int)keycode {
> > @@ -724,12 +661,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> > {
> >     /* Return true if we handled the event, false if it should be given=
 to OSX */
> >     COCOA_DEBUG("QemuCocoaView: handleEvent\n");
> > -    int buttons =3D 0;
> >     int keycode =3D 0;
> > -    bool mouse_event =3D false;
> > -    static bool switched_to_fullscreen =3D false;
> > -    // Location of event in virtual screen coordinates
> > -    NSPoint p =3D [self screenLocationOfEvent:event];
> >     NSUInteger modifiers =3D [event modifierFlags];
> >
> >     /*
> > @@ -799,37 +731,37 @@ - (bool) handleEventLocked:(NSEvent *)event
> >                     if (!!(modifiers & NSEventModifierFlagShift)) {
> >                         [self toggleKey:Q_KEY_CODE_SHIFT];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_RightShift:
> >                     if (!!(modifiers & NSEventModifierFlagShift)) {
> >                         [self toggleKey:Q_KEY_CODE_SHIFT_R];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_Control:
> >                     if (!!(modifiers & NSEventModifierFlagControl)) {
> >                         [self toggleKey:Q_KEY_CODE_CTRL];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_RightControl:
> >                     if (!!(modifiers & NSEventModifierFlagControl)) {
> >                         [self toggleKey:Q_KEY_CODE_CTRL_R];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_Option:
> >                     if (!!(modifiers & NSEventModifierFlagOption)) {
> >                         [self toggleKey:Q_KEY_CODE_ALT];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_RightOption:
> >                     if (!!(modifiers & NSEventModifierFlagOption)) {
> >                         [self toggleKey:Q_KEY_CODE_ALT_R];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 /* Don't pass command key changes to guest unless mouse=
 is grabbed */
> >                 case kVK_Command:
> > @@ -837,28 +769,23 @@ - (bool) handleEventLocked:(NSEvent *)event
> >                         !!(modifiers & NSEventModifierFlagCommand)) {
> >                         [self toggleKey:Q_KEY_CODE_META_L];
> >                     }
> > -                    break;
> > +                    return true;
> >
> >                 case kVK_RightCommand:
> >                     if (isMouseGrabbed &&
> >                         !!(modifiers & NSEventModifierFlagCommand)) {
> >                         [self toggleKey:Q_KEY_CODE_META_R];
> >                     }
> > -                    break;
> > +                    return true;
> > +
> > +                default:
> > +                    return true;
> >             }
> > -            break;
> >         case NSEventTypeKeyDown:
> >             keycode =3D cocoa_keycode_to_qemu([event keyCode]);
> >
> >             // forward command key combos to the host UI unless the mou=
se is grabbed
> >             if (!isMouseGrabbed && ([event modifierFlags] & NSEventModi=
fierFlagCommand)) {
> > -                /*
> > -                 * Prevent the command key from being stuck down in th=
e guest
> > -                 * when using Command-F to switch to full screen mode.
> > -                 */
> > -                if (keycode =3D=3D Q_KEY_CODE_F) {
> > -                    switched_to_fullscreen =3D true;
> > -                }
> >                 return false;
> >             }
> >
> > @@ -889,7 +816,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >             } else {
> >                 [self handleMonitorInput: event];
> >             }
> > -            break;
> > +            return true;
> >         case NSEventTypeKeyUp:
> >             keycode =3D cocoa_keycode_to_qemu([event keyCode]);
> >
> > @@ -902,67 +829,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >             if (qemu_console_is_graphic(NULL)) {
> >                 qkbd_state_key_event(kbd, keycode, false);
> >             }
> > -            break;
> > -        case NSEventTypeMouseMoved:
> > -            if (isAbsoluteEnabled) {
> > -                // Cursor re-entered into a window might generate even=
ts bound to screen coordinates
> > -                // and `nil` window property, and in full screen mode,=
 current window might not be
> > -                // key window, where event location alone should suffi=
ce.
> > -                if (![self screenContainsPoint:p] || !([[self window] =
isKeyWindow] || isFullscreen)) {
> > -                    if (isMouseGrabbed) {
> > -                        [self ungrabMouse];
> > -                    }
> > -                } else {
> > -                    if (!isMouseGrabbed) {
> > -                        [self grabMouse];
> > -                    }
> > -                }
> > -            }
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeLeftMouseDown:
> > -            buttons |=3D MOUSE_EVENT_LBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeRightMouseDown:
> > -            buttons |=3D MOUSE_EVENT_RBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeOtherMouseDown:
> > -            buttons |=3D MOUSE_EVENT_MBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeLeftMouseDragged:
> > -            buttons |=3D MOUSE_EVENT_LBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeRightMouseDragged:
> > -            buttons |=3D MOUSE_EVENT_RBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeOtherMouseDragged:
> > -            buttons |=3D MOUSE_EVENT_MBUTTON;
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeLeftMouseUp:
> > -            mouse_event =3D true;
> > -            if (!isMouseGrabbed && [self screenContainsPoint:p]) {
> > -                /*
> > -                 * In fullscreen mode, the window of cocoaView may not=
 be the
> > -                 * key window, therefore the position relative to the =
virtual
> > -                 * screen alone will be sufficient.
> > -                 */
> > -                if(isFullscreen || [[self window] isKeyWindow]) {
> > -                    [self grabMouse];
> > -                }
> > -            }
> > -            break;
> > -        case NSEventTypeRightMouseUp:
> > -            mouse_event =3D true;
> > -            break;
> > -        case NSEventTypeOtherMouseUp:
> > -            mouse_event =3D true;
> > -            break;
> > +            return true;
> >         case NSEventTypeScrollWheel:
> >             /*
> >              * Send wheel events to the guest regardless of window focu=
s.
> > @@ -976,7 +843,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >              */
> >             if ([event deltaY] !=3D 0) {
> >             /* Determine if this is a scroll up or scroll down event */
> > -                buttons =3D ([event deltaY] > 0) ?
> > +                int buttons =3D ([event deltaY] > 0) ?
> >                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
> >                 qemu_input_queue_btn(dcl.con, buttons, true);
> >                 qemu_input_event_sync();
> > @@ -987,62 +854,124 @@ - (bool) handleEventLocked:(NSEvent *)event
> >              * Since deltaY also reports scroll wheel events we prevent=
 mouse
> >              * movement code from executing.
> >              */
> > -            mouse_event =3D false;
> > -            break;
> > +            return true;
> >         default:
> >             return false;
> >     }
> > +}
> >
> > -    if (mouse_event) {
> > -        /* Don't send button events to the guest unless we've got a
> > -         * mouse grab or window focus. If we have neither then this ev=
ent
> > -         * is the user clicking on the background window to activate a=
nd
> > -         * bring us to the front, which will be done by the sendEvent
> > -         * call below. We definitely don't want to pass that click thr=
ough
> > -         * to the guest.
> > -         */
> > -        if ((isMouseGrabbed || [[self window] isKeyWindow]) &&
> > -            (last_buttons !=3D buttons)) {
> > -            static uint32_t bmap[INPUT_BUTTON__MAX] =3D {
> > -                [INPUT_BUTTON_LEFT]       =3D MOUSE_EVENT_LBUTTON,
> > -                [INPUT_BUTTON_MIDDLE]     =3D MOUSE_EVENT_MBUTTON,
> > -                [INPUT_BUTTON_RIGHT]      =3D MOUSE_EVENT_RBUTTON
> > -            };
> > -            qemu_input_update_buttons(dcl.con, bmap, last_buttons, but=
tons);
> > -            last_buttons =3D buttons;
> > -        }
> > -        if (isMouseGrabbed) {
> > -            if (isAbsoluteEnabled) {
> > -                /* Note that the origin for Cocoa mouse coords is bott=
om left, not top left.
> > -                 * The check on screenContainsPoint is to avoid sendin=
g out of range values for
> > -                 * clicks in the titlebar.
> > -                 */
> > -                if ([self screenContainsPoint:p]) {
> > -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x, 0=
, screen.width);
> > -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen=
.height - p.y, 0, screen.height);
> > -                }
> > -            } else {
> > -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[even=
t deltaX]);
> > -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[even=
t deltaY]);
> > -            }
> > +- (void) handleMouseEvent:(NSEvent *)event
> > +{
> > +    if (!isMouseGrabbed) {
> > +        return;
> > +    }
> > +
> > +    with_iothread_lock(^{
> > +        if (isAbsoluteEnabled) {
> > +            CGFloat d =3D (CGFloat)screen.height / [self frame].size.h=
eight;
> > +            NSPoint p =3D [event locationInWindow];
> > +            // Note that the origin for Cocoa mouse coords is bottom l=
eft, not top left.
> > +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x * d, 0, sc=
reen.width);
> > +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height =
- p.y * d, 0, screen.height);
> >         } else {
> > -            return false;
> > +            CGFloat d =3D (CGFloat)screen.height / [self convertSizeTo=
Backing:[self frame].size].height;
> > +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, [event deltaX]=
 * d);
> > +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, [event deltaY]=
 * d);
> >         }
> > +
> >         qemu_input_event_sync();
> > +    });
> > +}
> > +
> > +- (void) handleMouseEvent:(NSEvent *)event button:(InputButton)button =
down:(bool)down
> > +{
> > +    if (!isMouseGrabbed) {
> > +        return;
> >     }
> > -    return true;
> > +
> > +    with_iothread_lock(^{
> > +        qemu_input_queue_btn(dcl.con, button, down);
> > +    });
> > +
> > +    [self handleMouseEvent:event];
> > +}
> > +
> > +- (void) mouseExited:(NSEvent *)event
> > +{
> > +    if (isAbsoluteEnabled && isMouseGrabbed) {
> > +        [self ungrabMouse];
> > +    }
> > +}
> > +
> > +- (void) mouseEntered:(NSEvent *)event
> > +{
> > +    if (isAbsoluteEnabled && !isMouseGrabbed) {
> > +        [self grabMouse];
> > +    }
> > +}
> > +
> > +- (void) mouseMoved:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event];
> > +}
> > +
> > +- (void) mouseDown:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:true];
> > +}
> > +
> > +- (void) rightMouseDown:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:true];
> > +}
> > +
> > +- (void) otherMouseDown:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:true]=
;
> > +}
> > +
> > +- (void) mouseDragged:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event];
> > +}
> > +
> > +- (void) rightMouseDragged:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event];
> > +}
> > +
> > +- (void) otherMouseDragged:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event];
> > +}
> > +
> > +- (void) mouseUp:(NSEvent *)event
> > +{
> > +    if (!isMouseGrabbed) {
> > +        [self grabMouse];
> > +    }
> > +
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:false];
> > +}
> > +
> > +- (void) rightMouseUp:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:false]=
;
> > +}
> > +
> > +- (void) otherMouseUp:(NSEvent *)event
> > +{
> > +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:false=
];
> > }
> >
> > - (void) grabMouse
> > {
> >     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
> >
> > -    if (!isFullscreen) {
> > -        if (qemu_name)
> > -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %=
s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> > -        else
> > -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to r=
elease Mouse)"];
> > -    }
> > +    if (qemu_name)
> > +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - =
(Press ctrl + alt + g to release Mouse)", qemu_name]];
> > +    else
> > +        [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to relea=
se Mouse)"];
> >     [self hideCursor];
> >     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
> >     isMouseGrabbed =3D TRUE; // while isMouseGrabbed =3D TRUE, QemuCoco=
aApp sends all events to [cocoaView handleEvent:]
> > @@ -1052,15 +981,14 @@ - (void) ungrabMouse
> > {
> >     COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
> >
> > -    if (!isFullscreen) {
> > -        if (qemu_name)
> > -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %=
s", qemu_name]];
> > -        else
> > -            [normalWindow setTitle:@"QEMU"];
> > -    }
> > +    if (qemu_name)
> > +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", =
qemu_name]];
> > +    else
> > +        [normalWindow setTitle:@"QEMU"];
> >     [self unhideCursor];
> >     CGAssociateMouseAndMouseCursorPosition(TRUE);
> >     isMouseGrabbed =3D FALSE;
> > +    [self raiseAllButtons];
> > }
> >
> > - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> > @@ -1071,8 +999,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabl=
ed {
> > }
> > - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
> > - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> > -- (float) cdx {return cdx;}
> > -- (float) cdy {return cdy;}
> > - (QEMUScreen) gscreen {return screen;}
> >
> > /*
> > @@ -1086,6 +1012,15 @@ - (void) raiseAllKeys
> >         qkbd_state_lift_all_keys(kbd);
> >     });
> > }
> > +
> > +- (void) raiseAllButtons
> > +{
> > +    with_iothread_lock(^{
> > +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_LEFT, false);
> > +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_RIGHT, false);
> > +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_MIDDLE, false);
> > +    });
> > +}
> > @end
> >
> >
> > @@ -1100,7 +1035,6 @@ @interface QemuCocoaAppController : NSObject
> > {
> > }
> > - (void)doToggleFullScreen:(id)sender;
> > -- (void)toggleFullScreen:(id)sender;
> > - (void)showQEMUDoc:(id)sender;
> > - (void)zoomToFit:(id) sender;
> > - (void)displayConsole:(id)sender;
> > @@ -1143,12 +1077,12 @@ - (id) init
> >             exit(1);
> >         }
> >         [normalWindow setAcceptsMouseMovedEvents:YES];
> > -        [normalWindow setTitle:@"QEMU"];
> > +        [normalWindow setCollectionBehavior:NSWindowCollectionBehavior=
FullScreenPrimary];
> > +        [normalWindow setTitle:qemu_name ? [NSString stringWithFormat:=
@"QEMU %s", qemu_name] : @"QEMU"];
> >         [normalWindow setContentView:cocoaView];
> >         [normalWindow makeKeyAndOrderFront:self];
> >         [normalWindow center];
> >         [normalWindow setDelegate: self];
> > -        stretch_video =3D false;
> >
> >         /* Used for displaying pause on the screen */
> >         pauseLabel =3D [NSTextField new];
> > @@ -1219,9 +1153,20 @@ - (void)windowDidChangeScreen:(NSNotification *)=
notification
> >     [cocoaView updateUIInfo];
> > }
> >
> > +- (void)windowDidEnterFullScreen:(NSNotification *)notification
> > +{
> > +    [cocoaView grabMouse];
> > +}
> > +
> > +- (void)windowDidExitFullScreen:(NSNotification *)notification
> > +{
> > +    [cocoaView resizeWindow];
> > +    [cocoaView ungrabMouse];
> > +}
> > +
> > - (void)windowDidResize:(NSNotification *)notification
> > {
> > -    [cocoaView updateUIInfo];
> > +    [cocoaView frameUpdated];
> > }
> >
> > /* Called when the user clicks on a window's close button */
> > @@ -1237,6 +1182,23 @@ - (BOOL)windowShouldClose:(id)sender
> >     return NO;
> > }
> >
> > +- (NSSize) window:(NSWindow *)window willUseFullScreenContentSize:(NSS=
ize)proposedSize
> > +{
> > +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) =3D=3D=
 0) {
> > +        return NSMakeSize([cocoaView gscreen].width, [cocoaView gscree=
n].height);
> > +    }
> > +
> > +    return [cocoaView fixZoomedFullScreenSize:proposedSize];
> > +}
> > +
> > +- (NSApplicationPresentationOptions) window:(NSWindow *)window
> > +                                     willUseFullScreenPresentationOpti=
ons:(NSApplicationPresentationOptions)proposedOptions;
> > +
> > +{
> > +    return (proposedOptions & ~(NSApplicationPresentationAutoHideDock =
| NSApplicationPresentationAutoHideMenuBar)) |
> > +           NSApplicationPresentationHideDock | NSApplicationPresentati=
onHideMenuBar;
> > +}
> > +
> > /* Called when QEMU goes into the background */
> > - (void) applicationWillResignActive: (NSNotification *)aNotification
> > {
> > @@ -1250,14 +1212,7 @@ - (void) applicationWillResignActive: (NSNotific=
ation *)aNotification
> >  */
> > - (void) doToggleFullScreen:(id)sender
> > {
> > -    [self toggleFullScreen:(id)sender];
> > -}
> > -
> > -- (void)toggleFullScreen:(id)sender
> > -{
> > -    COCOA_DEBUG("QemuCocoaAppController: toggleFullScreen\n");
> > -
> > -    [cocoaView toggleFullScreen:sender];
> > +    [normalWindow toggleFullScreen:sender];
> > }
> >
> > /* Tries to find then open the specified filename */
> > @@ -1294,13 +1249,15 @@ - (void)showQEMUDoc:(id)sender
> >     [self openDocumentation: @"index.html"];
> > }
> >
> > -/* Stretches video to fit host monitor size */
> > +/* Toggles the flag which stretches video to fit host window size */
> > - (void)zoomToFit:(id) sender
> > {
> > -    stretch_video =3D !stretch_video;
> > -    if (stretch_video =3D=3D true) {
> > +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) =3D=3D=
 0) {
> > +        [normalWindow setStyleMask:[normalWindow styleMask] | NSWindow=
StyleMaskResizable];
> >         [sender setState: NSControlStateValueOn];
> >     } else {
> > +        [normalWindow setStyleMask:[normalWindow styleMask] & ~NSWindo=
wStyleMaskResizable];
> > +        [cocoaView resizeWindow];
> >         [sender setState: NSControlStateValueOff];
> >     }
> > }
> > @@ -1308,7 +1265,9 @@ - (void)zoomToFit:(id) sender
> > /* Displays the console on the screen */
> > - (void)displayConsole:(id)sender
> > {
> > -    console_select([sender tag]);
> > +    with_iothread_lock(^{
> > +        console_select([sender tag]);
> > +    });
> > }
> >
> > /* Pause the guest */
> > @@ -1952,16 +1911,14 @@ static void cocoa_update(DisplayChangeListener =
*dcl,
> >     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
> >
> >     dispatch_async(dispatch_get_main_queue(), ^{
> > -        NSRect rect;
> > -        if ([cocoaView cdx] =3D=3D 1.0) {
> > -            rect =3D NSMakeRect(x, [cocoaView gscreen].height - y - h,=
 w, h);
> > -        } else {
> > -            rect =3D NSMakeRect(
> > -                x * [cocoaView cdx],
> > -                ([cocoaView gscreen].height - y - h) * [cocoaView cdy]=
,
> > -                w * [cocoaView cdx],
> > -                h * [cocoaView cdy]);
> > -        }
> > +        CGFloat d =3D [cocoaView frame].size.height / (CGFloat)[cocoaV=
iew gscreen].height;
> > +
> > +        NSRect rect =3D NSMakeRect(
> > +                x * d,
> > +                ([cocoaView gscreen].height - y - h) * d,
> > +                w * d,
> > +                h * d);
> > +
> >         [cocoaView setNeedsDisplayInRect:rect];
> >     });
> >
> > @@ -2034,8 +1991,7 @@ static void cocoa_display_init(DisplayState *ds, =
DisplayOptions *opts)
> >     /* if fullscreen mode is to be used */
> >     if (opts->has_full_screen && opts->full_screen) {
> >         dispatch_async(dispatch_get_main_queue(), ^{
> > -            [NSApp activateIgnoringOtherApps: YES];
> > -            [(QemuCocoaAppController *)[[NSApplication sharedApplicati=
on] delegate] toggleFullScreen: nil];
> > +            [normalWindow toggleFullScreen: nil];
> >         });
> >     }
> >     if (opts->has_show_cursor && opts->show_cursor) {
> >

