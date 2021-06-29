Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FD3B6C5C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 03:55:20 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly2y7-0003tt-3n
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 21:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly2x3-0003Cy-Hq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 21:54:13 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly2wz-0001gx-QM
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 21:54:13 -0400
Received: by mail-ed1-x530.google.com with SMTP id i24so28908845edx.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 18:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nF/Ir87ZQ8tG/oB4jGZeTQG2/nMZaqQtPl15vmvp26Y=;
 b=R0k0GLn6cGCowMfXyXAXNkkBPT81MJ/qPpEJUIo1fC/9SMa64dRwIl2N7aqrpYDgRM
 VOzh2g7UbT1y2D3E0Be5iUQC6velsuc4lPUEoYVuB4zjvmmdlR7P/MpD0ETHXVoVidSk
 n1kX4xZEjHygG7xS6SBByiTVRrFgnEh05a4PQtGu804Fes1SrqPG17wA2Xka8AcOrBBE
 uFXTrbbnobCIhG77TZ6wuk2GCyZUNdpTMlSPQC+md4QZjQCEus9qFZr53YUa5FbYWPrs
 CMZj2PoNVCNU9Tx8z3QHktcadZNivIsxs75ZHjlK83yCXhUcQ7WZ2s7Vq5u+76WNSx9Y
 eYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nF/Ir87ZQ8tG/oB4jGZeTQG2/nMZaqQtPl15vmvp26Y=;
 b=CwgpRQgYhLbUyDccwlWE2NnW0hyN1rdIwm0ot8ftByWTwIJkDZBsubrBP5YtVfkYHV
 r2uPsn+yTvE7v37RVuubAFjW1Y48sEhANThNxAdrgY05G+Fwz5t1ugAYmitBbxT8jw81
 rJirnGsG26GV6WaZIO4R0B+Wj7zwU9SAJwEIeWSJE1MaY3Hg8E8Wlj0m31hx7wp5gIcH
 FZrbx+Jr3I76ubcur4moeRssnP1GWLgUnf3u/L/aoNqBjpR/UDrIGM6kvYikQQ7M47XP
 riWekVRW59Mr5TC/qCTKwryLEqppP5aqgLzxukpEbNYcSvgnacp5pkYoIuDQqA5dSFGt
 3TwA==
X-Gm-Message-State: AOAM533wv/j6KGqyc0xo7CIFLIp696AOKDnMvvt33vZCCAUeVSTf5Xb1
 eiQDZ2YbP06plz51Gmh7kewLMOlwEeJ+IuNPNy4=
X-Google-Smtp-Source: ABdhPJzOPjzHagJBFBE9/zLtz0O2mvF+2PINoTCXeQNTko/kqvD74vpsC9UHznr8dJtyAHC3YW9QeIfKhAWUW5aAaXk=
X-Received: by 2002:a05:6402:406:: with SMTP id
 q6mr36638929edv.149.1624931647532; 
 Mon, 28 Jun 2021 18:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210628030850.34321-1-akihiko.odaki@gmail.com>
 <ca2da977-7a24-1beb-ed5c-f869a484f33b@eik.bme.hu>
 <CAMVc7JUCUCHJYJy_RRu=MWhaBF81vvoX9rLYzCN6OVtq0uxDfg@mail.gmail.com>
 <8bbb553a-6f92-4eb5-723c-3e5fa2ffc678@eik.bme.hu>
In-Reply-To: <8bbb553a-6f92-4eb5-723c-3e5fa2ffc678@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 29 Jun 2021 10:53:56 +0900
Message-ID: <CAMVc7JXqA65Cbyh9WoWLeBRjkfh0RCpOH9u15u3o+eQNs=rU6w@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use NSWindow's ability to resize
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x530.google.com
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

2021=E5=B9=B46=E6=9C=8829=E6=97=A5(=E7=81=AB) 6:19 BALATON Zoltan <balaton@=
eik.bme.hu>:
>
> On Mon, 28 Jun 2021, Akihiko Odaki wrote:
> > 2021=E5=B9=B46=E6=9C=8828=E6=97=A5(=E6=9C=88) 17:57 BALATON Zoltan <bal=
aton@eik.bme.hu>:
> >>
> >> On Mon, 28 Jun 2021, Akihiko Odaki wrote:
> >>> This change brings two new features:
> >>> - The window will be resizable if "Zoom To Fit" is eanbled
> >>> - The window can be made full screen by clicking full screen button
> >>>  provided by the platform. (The left-top green button.)
> >>
> >> While this is better for consistency with other apps is it a potential
> >> usability issue that a window bar may appear when you move the mouse t=
o
> >> the top of the full screen window (where guests often have a menu bar =
that
> >> this could make harder to use)? (Haven't tested it so don't know how i=
t
> >> actually works.)
> >
> > The window bar is completely hidden with NSApplicationPresentationHideM=
enuBar.
>
> I've missed that but now you pointed to it I have a comment about that.
>
> >>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> >>> ---
> >>> ui/cocoa.m | 542 ++++++++++++++++++++++++----------------------------=
-
> >>> 1 file changed, 249 insertions(+), 293 deletions(-)
> >>>
> >>> diff --git a/ui/cocoa.m b/ui/cocoa.m
> >>> index 9f72844b079..091d9721f4d 100644
> >>> --- a/ui/cocoa.m
> >>> +++ b/ui/cocoa.m
> >>> @@ -93,12 +93,10 @@ static void cocoa_switch(DisplayChangeListener *d=
cl,
> >>> static DisplayChangeListener dcl =3D {
> >>>     .ops =3D &dcl_ops,
> >>> };
> >>> -static int last_buttons;
> >>> static int cursor_hide =3D 1;
> >>>
> >>> static int gArgc;
> >>> static char **gArgv;
> >>> -static bool stretch_video;
> >>> static NSTextField *pauseLabel;
> >>> static NSArray * supportedImageFileTypes;
> >>>
> >>> @@ -301,19 +299,16 @@ static void handleAnyDeviceErrors(Error * err)
> >>> */
> >>> @interface QemuCocoaView : NSView
> >>> {
> >>> +    NSTrackingArea *trackingArea;
> >>>     QEMUScreen screen;
> >>> -    NSWindow *fullScreenWindow;
> >>> -    float cx,cy,cw,ch,cdx,cdy;
> >>>     pixman_image_t *pixman_image;
> >>>     QKbdState *kbd;
> >>>     BOOL isMouseGrabbed;
> >>> -    BOOL isFullscreen;
> >>>     BOOL isAbsoluteEnabled;
> >>> }
> >>> - (void) switchSurface:(pixman_image_t *)image;
> >>> - (void) grabMouse;
> >>> - (void) ungrabMouse;
> >>> -- (void) toggleFullScreen:(id)sender;
> >>> - (void) handleMonitorInput:(NSEvent *)event;
> >>> - (bool) handleEvent:(NSEvent *)event;
> >>> - (bool) handleEventLocked:(NSEvent *)event;
> >>> @@ -328,8 +323,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnab=
led;
> >>>  */
> >>> - (BOOL) isMouseGrabbed;
> >>> - (BOOL) isAbsoluteEnabled;
> >>> -- (float) cdx;
> >>> -- (float) cdy;
> >>> - (QEMUScreen) gscreen;
> >>> - (void) raiseAllKeys;
> >>> @end
> >>> @@ -369,46 +362,43 @@ - (BOOL) isOpaque
> >>>     return YES;
> >>> }
> >>>
> >>> -- (BOOL) screenContainsPoint:(NSPoint) p
> >>> +- (void) removeTrackingRect
> >>> {
> >>> -    return (p.x > -1 && p.x < screen.width && p.y > -1 && p.y < scre=
en.height);
> >>> +    if (trackingArea) {
> >>> +        [self removeTrackingArea:trackingArea];
> >>> +        [trackingArea release];
> >>> +        trackingArea =3D nil;
> >>> +    }
> >>> }
> >>
> >> You could override removeTrackingArea here then you would not have
> >> addTrackingArea vs. removeTrackingRect and that's the way NSTrackingAr=
ea
> >> docs also suggest.
> >
> > https://developer.apple.com/documentation/appkit/nstrackingarea?languag=
e=3Dobjc
> >> Other NSView methods related to NSTrackingArea objects
> >> (in addition to addTrackingArea:) include removeTrackingArea: and
> >> updateTrackingAreas. Views can override the latter method to recompute=
 and
> >> replace their NSTrackingArea objects in certain situations, such as a =
change in
> >> the size of the visibleRect.
> >
> > It says updateTrackingAreas can be overridden, but  decided to hook
> > the code to modify the guest display state instead because it should
> > be synchronized with trackingArea.
>
> Indeed it means updateTrackingAreas but I don't think it says you can't
> override removeTrackingArea so you could still do that as long as you cal=
l
> the original method then do whatever else is needed. Doing it in another
> method works but breaks the symmetry of add and remove so you have to
> remember to use another method to remove the tracking area than what you'=
d
> normally use. That's why I thought overriding the remove method could be
> cleaner.

removeTrackingArea: receives a tracking area to be removed, but we are
removing a particular tracking area in this case. See the use of the
method in frameUpdated. The symmetry of add and remove is in
frameUpdated; it sends addTrackingArea: and removeTrackingArea:.

>
> >>> -/* Get location of event and convert to virtual screen coordinate */
> >>> -- (CGPoint) screenLocationOfEvent:(NSEvent *)ev
> >>> +- (void) frameUpdated
> >>> {
> >>> -    NSWindow *eventWindow =3D [ev window];
> >>> -    // XXX: Use CGRect and -convertRectFromScreen: to support macOS =
10.10
> >>> -    CGRect r =3D CGRectZero;
> >>> -    r.origin =3D [ev locationInWindow];
> >>> -    if (!eventWindow) {
> >>> -        if (!isFullscreen) {
> >>> -            return [[self window] convertRectFromScreen:r].origin;
> >>> -        } else {
> >>> -            CGPoint locationInSelfWindow =3D [[self window] convertR=
ectFromScreen:r].origin;
> >>> -            CGPoint loc =3D [self convertPoint:locationInSelfWindow =
fromView:nil];
> >>> -            if (stretch_video) {
> >>> -                loc.x /=3D cdx;
> >>> -                loc.y /=3D cdy;
> >>> -            }
> >>> -            return loc;
> >>> -        }
> >>> -    } else if ([[self window] isEqual:eventWindow]) {
> >>> -        if (!isFullscreen) {
> >>> -            return r.origin;
> >>> -        } else {
> >>> -            CGPoint loc =3D [self convertPoint:r.origin fromView:nil=
];
> >>> -            if (stretch_video) {
> >>> -                loc.x /=3D cdx;
> >>> -                loc.y /=3D cdy;
> >>> -            }
> >>> -            return loc;
> >>> -        }
> >>> -    } else {
> >>> -        return [[self window] convertRectFromScreen:[eventWindow con=
vertRectToScreen:r]].origin;
> >>> +    [self removeTrackingRect];
> >>> +
> >>> +    if ([self window]) {
> >>> +        NSTrackingAreaOptions options =3D NSTrackingActiveInKeyWindo=
w |
> >>> +                                        NSTrackingMouseEnteredAndExi=
ted |
> >>> +                                        NSTrackingMouseMoved;
> >>> +        trackingArea =3D [[NSTrackingArea alloc] initWithRect:[self =
frame]
> >>> +                                                    options:options
> >>> +                                                      owner:self
> >>> +                                                   userInfo:nil];
> >>> +        [self addTrackingArea:trackingArea];
> >>> +        [self updateUIInfo];
> >>>     }
> >>> }
> >>>
> >>> +- (void) viewDidMoveToWindow
> >>> +{
> >>> +    [self resizeWindow];
> >>> +    [self frameUpdated];
> >>> +}
> >>> +
> >>> +- (void) viewWillMoveToWindow:(NSWindow *)newWindow
> >>> +{
> >>> +    [self removeTrackingRect];
> >>> +}
> >>> +
> >>> - (void) hideCursor
> >>> {
> >>>     if (!cursor_hide) {
> >>> @@ -471,13 +461,14 @@ - (void) drawRect:(NSRect) rect
> >>>         int i;
> >>>         CGImageRef clipImageRef;
> >>>         CGRect clipRect;
> >>> +        CGFloat d =3D (CGFloat)h / [self frame].size.height;
> >>>
> >>>         [self getRectsBeingDrawn:&rectList count:&rectCount];
> >>>         for (i =3D 0; i < rectCount; i++) {
> >>> -            clipRect.origin.x =3D rectList[i].origin.x / cdx;
> >>> -            clipRect.origin.y =3D (float)h - (rectList[i].origin.y +=
 rectList[i].size.height) / cdy;
> >>> -            clipRect.size.width =3D rectList[i].size.width / cdx;
> >>> -            clipRect.size.height =3D rectList[i].size.height / cdy;
> >>> +            clipRect.origin.x =3D rectList[i].origin.x * d;
> >>> +            clipRect.origin.y =3D (float)h - (rectList[i].origin.y +=
 rectList[i].size.height) * d;
> >>> +            clipRect.size.width =3D rectList[i].size.width * d;
> >>> +            clipRect.size.height =3D rectList[i].size.height * d;
> >>>             clipImageRef =3D CGImageCreateWithImageInRect(
> >>>                                                         imageRef,
> >>>                                                         clipRect
> >>> @@ -490,36 +481,34 @@ - (void) drawRect:(NSRect) rect
> >>>     }
> >>> }
> >>>
> >>> -- (void) setContentDimensions
> >>> +- (NSSize) fixZoomedFullScreenSize:(NSSize)proposedSize
> >>> {
> >>> -    COCOA_DEBUG("QemuCocoaView: setContentDimensions\n");
> >>> +    NSSize size;
> >>>
> >>> -    if (isFullscreen) {
> >>> -        cdx =3D [[NSScreen mainScreen] frame].size.width / (float)sc=
reen.width;
> >>> -        cdy =3D [[NSScreen mainScreen] frame].size.height / (float)s=
creen.height;
> >>> +    size.width =3D (CGFloat)screen.width * proposedSize.height;
> >>> +    size.height =3D (CGFloat)screen.height * proposedSize.width;
> >>>
> >>> -        /* stretches video, but keeps same aspect ratio */
> >>> -        if (stretch_video =3D=3D true) {
> >>> -            /* use smallest stretch value - prevents clipping on sid=
es */
> >>> -            if (MIN(cdx, cdy) =3D=3D cdx) {
> >>> -                cdy =3D cdx;
> >>> -            } else {
> >>> -                cdx =3D cdy;
> >>> -            }
> >>> -        } else {  /* No stretching */
> >>> -            cdx =3D cdy =3D 1;
> >>> -        }
> >>> -        cw =3D screen.width * cdx;
> >>> -        ch =3D screen.height * cdy;
> >>> -        cx =3D ([[NSScreen mainScreen] frame].size.width - cw) / 2.0=
;
> >>> -        cy =3D ([[NSScreen mainScreen] frame].size.height - ch) / 2.=
0;
> >>> +    if (size.width < size.height) {
> >>> +        size.width /=3D screen.height;
> >>> +        size.height =3D proposedSize.height;
> >>>     } else {
> >>> -        cx =3D 0;
> >>> -        cy =3D 0;
> >>> -        cw =3D screen.width;
> >>> -        ch =3D screen.height;
> >>> -        cdx =3D 1.0;
> >>> -        cdy =3D 1.0;
> >>> +        size.width =3D proposedSize.width;
> >>> +        size.height /=3D screen.width;
> >>> +    }
> >>> +
> >>> +    return size;
> >>
> >> What does the above function do? Is there a more straghtforward way to
> >> write this or add a comment because it's a bit confusing this way.
> >
> > What about renaming this method fixZoomedFullScreenSizeAspectRatio?
>
> Maybe it's better to just add a comment. The longer name still leaves one
> guessing. Maybe fullScreenSizeKeepingAspectRatio is shorter and still say=
s
> what it should do but a comment can be as long as it has to be to say wha=
t
> it does. But something like this seems more straightforward to me:
>
> double aspect =3D (double)screen.width / screen.height;
> if (proposedSize.height * aspect <=3D proposedSize.width) {
>      proposedSize.width =3D proposedSize.height * aspect;
> } else {
>      proposedSize.height =3D proposedSize.width / aspect;
> }
> return proposedSize;
>

fullScreenSizeKeepingAspectRatio is somewhat misleading because it is
modifying the aspect ratio of the given size. Do you think the name is
still prefered, or do you have another idea? Maybe should we just add
a comment and leave the name as is?

Having another division to calculate aspect results in a loss of
precision. Understanding its consequences is much harder than
understanding the current code in my opinion. (On the contrary, it is
quite obvious that screen_width * proposedSize.height will not
overflow. CGFloat is 64 bit in the supported systems.)

> >>> +}
> >>> +
> >>> +- (void) resizeWindow
> >>> +{
> >>> +    [[self window] setContentAspectRatio:NSMakeSize(screen.width, sc=
reen.height)];
> >>> +
> >>> +    if (([[self window] styleMask] & NSWindowStyleMaskResizable) =3D=
=3D 0) {
> >>> +        [[self window] setContentSize:NSMakeSize(screen.width, scree=
n.height)];
> >>> +        [[self window] center];
> >>> +    } else if (([[self window] styleMask] & NSWindowStyleMaskFullScr=
een) !=3D 0) {
> >>> +        [[self window] setContentSize:[self fixZoomedFullScreenSize:=
[[[self window] screen] frame].size]];
> >>> +        [[self window] center];
> >>>     }
> >>> }
> >>>
> >>> @@ -538,7 +527,12 @@ - (void) updateUIInfo
> >>>         NSSize screenSize =3D [[[self window] screen] frame].size;
> >>>         CGSize screenPhysicalSize =3D CGDisplayScreenSize(display);
> >>>
> >>> -        frameSize =3D isFullscreen ? screenSize : [self frame].size;
> >>> +        if (([[self window] styleMask] & NSWindowStyleMaskFullScreen=
) =3D=3D 0) {
> >>> +            frameSize =3D [self frame].size;
> >>> +        } else {
> >>> +            frameSize =3D screenSize;
> >>> +        }
> >>> +
> >>>         info.width_mm =3D frameSize.width / screenSize.width * screen=
PhysicalSize.width;
> >>>         info.height_mm =3D frameSize.height / screenSize.height * scr=
eenPhysicalSize.height;
> >>>     } else {
> >>> @@ -555,31 +549,19 @@ - (void) updateUIInfo
> >>>     dpy_set_ui_info(dcl.con, &info);
> >>> }
> >>>
> >>> -- (void)viewDidMoveToWindow
> >>> -{
> >>> -    [self updateUIInfo];
> >>> -}
> >>> -
> >>> - (void) switchSurface:(pixman_image_t *)image
> >>> {
> >>>     COCOA_DEBUG("QemuCocoaView: switchSurface\n");
> >>>
> >>>     int w =3D pixman_image_get_width(image);
> >>>     int h =3D pixman_image_get_height(image);
> >>> -    /* cdx =3D=3D 0 means this is our very first surface, in which c=
ase we need
> >>> -     * to recalculate the content dimensions even if it happens to b=
e the size
> >>> -     * of the initial empty window.
> >>> -     */
> >>> -    bool isResize =3D (w !=3D screen.width || h !=3D screen.height |=
| cdx =3D=3D 0.0);
> >>>
> >>> -    int oldh =3D screen.height;
> >>> -    if (isResize) {
> >>> +    if (w !=3D screen.width || h !=3D screen.height) {
> >>>         // Resize before we trigger the redraw, or we'll redraw at th=
e wrong size
> >>>         COCOA_DEBUG("switchSurface: new size %d x %d\n", w, h);
> >>>         screen.width =3D w;
> >>>         screen.height =3D h;
> >>> -        [self setContentDimensions];
> >>> -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> >>> +        [self resizeWindow];
> >>>     }
> >>>
> >>>     // update screenBuffer
> >>> @@ -588,51 +570,6 @@ - (void) switchSurface:(pixman_image_t *)image
> >>>     }
> >>>
> >>>     pixman_image =3D image;
> >>> -
> >>> -    // update windows
> >>> -    if (isFullscreen) {
> >>> -        [[fullScreenWindow contentView] setFrame:[[NSScreen mainScre=
en] frame]];
> >>> -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origi=
n.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].=
size.height - oldh) display:NO animate:NO];
> >>> -    } else {
> >>> -        if (qemu_name)
> >>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU=
 %s", qemu_name]];
> >>> -        [normalWindow setFrame:NSMakeRect([normalWindow frame].origi=
n.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].=
size.height - oldh) display:YES animate:NO];
> >>> -    }
> >>> -
> >>> -    if (isResize) {
> >>> -        [normalWindow center];
> >>> -    }
> >>> -}
> >>> -
> >>> -- (void) toggleFullScreen:(id)sender
> >>> -{
> >>> -    COCOA_DEBUG("QemuCocoaView: toggleFullScreen\n");
> >>> -
> >>> -    if (isFullscreen) { // switch from fullscreen to desktop
> >>> -        isFullscreen =3D FALSE;
> >>> -        [self ungrabMouse];
> >>> -        [self setContentDimensions];
> >>> -        [fullScreenWindow close];
> >>> -        [normalWindow setContentView: self];
> >>> -        [normalWindow makeKeyAndOrderFront: self];
> >>> -        [NSMenu setMenuBarVisible:YES];
> >>> -    } else { // switch from desktop to fullscreen
> >>> -        isFullscreen =3D TRUE;
> >>> -        [normalWindow orderOut: nil]; /* Hide the window */
> >>> -        [self grabMouse];
> >>> -        [self setContentDimensions];
> >>> -        [NSMenu setMenuBarVisible:NO];
> >>> -        fullScreenWindow =3D [[NSWindow alloc] initWithContentRect:[=
[NSScreen mainScreen] frame]
> >>> -            styleMask:NSWindowStyleMaskBorderless
> >>> -            backing:NSBackingStoreBuffered
> >>> -            defer:NO];
> >>> -        [fullScreenWindow setAcceptsMouseMovedEvents: YES];
> >>> -        [fullScreenWindow setHasShadow:NO];
> >>> -        [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
> >>> -        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> >>> -        [[fullScreenWindow contentView] addSubview: self];
> >>> -        [fullScreenWindow makeKeyAndOrderFront:self];
> >>> -    }
> >>> }
> >>>
> >>> - (void) toggleKey: (int)keycode {
> >>> @@ -724,12 +661,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>> {
> >>>     /* Return true if we handled the event, false if it should be giv=
en to OSX */
> >>>     COCOA_DEBUG("QemuCocoaView: handleEvent\n");
> >>> -    int buttons =3D 0;
> >>>     int keycode =3D 0;
> >>> -    bool mouse_event =3D false;
> >>> -    static bool switched_to_fullscreen =3D false;
> >>> -    // Location of event in virtual screen coordinates
> >>> -    NSPoint p =3D [self screenLocationOfEvent:event];
> >>>     NSUInteger modifiers =3D [event modifierFlags];
> >>>
> >>>     /*
> >>> @@ -799,37 +731,37 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>                     if (!!(modifiers & NSEventModifierFlagShift)) {
> >>>                         [self toggleKey:Q_KEY_CODE_SHIFT];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_RightShift:
> >>>                     if (!!(modifiers & NSEventModifierFlagShift)) {
> >>>                         [self toggleKey:Q_KEY_CODE_SHIFT_R];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_Control:
> >>>                     if (!!(modifiers & NSEventModifierFlagControl)) {
> >>>                         [self toggleKey:Q_KEY_CODE_CTRL];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_RightControl:
> >>>                     if (!!(modifiers & NSEventModifierFlagControl)) {
> >>>                         [self toggleKey:Q_KEY_CODE_CTRL_R];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_Option:
> >>>                     if (!!(modifiers & NSEventModifierFlagOption)) {
> >>>                         [self toggleKey:Q_KEY_CODE_ALT];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_RightOption:
> >>>                     if (!!(modifiers & NSEventModifierFlagOption)) {
> >>>                         [self toggleKey:Q_KEY_CODE_ALT_R];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 /* Don't pass command key changes to guest unless mou=
se is grabbed */
> >>>                 case kVK_Command:
> >>> @@ -837,28 +769,23 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>                         !!(modifiers & NSEventModifierFlagCommand)) {
> >>>                         [self toggleKey:Q_KEY_CODE_META_L];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>>
> >>>                 case kVK_RightCommand:
> >>>                     if (isMouseGrabbed &&
> >>>                         !!(modifiers & NSEventModifierFlagCommand)) {
> >>>                         [self toggleKey:Q_KEY_CODE_META_R];
> >>>                     }
> >>> -                    break;
> >>> +                    return true;
> >>> +
> >>> +                default:
> >>> +                    return true;
> >>>             }
> >>> -            break;
> >>>         case NSEventTypeKeyDown:
> >>>             keycode =3D cocoa_keycode_to_qemu([event keyCode]);
> >>>
> >>>             // forward command key combos to the host UI unless the m=
ouse is grabbed
> >>>             if (!isMouseGrabbed && ([event modifierFlags] & NSEventMo=
difierFlagCommand)) {
> >>> -                /*
> >>> -                 * Prevent the command key from being stuck down in =
the guest
> >>> -                 * when using Command-F to switch to full screen mod=
e.
> >>> -                 */
> >>> -                if (keycode =3D=3D Q_KEY_CODE_F) {
> >>> -                    switched_to_fullscreen =3D true;
> >>> -                }
> >>>                 return false;
> >>>             }
> >>>
> >>> @@ -889,7 +816,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>             } else {
> >>>                 [self handleMonitorInput: event];
> >>>             }
> >>> -            break;
> >>> +            return true;
> >>>         case NSEventTypeKeyUp:
> >>>             keycode =3D cocoa_keycode_to_qemu([event keyCode]);
> >>>
> >>> @@ -902,67 +829,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>             if (qemu_console_is_graphic(NULL)) {
> >>>                 qkbd_state_key_event(kbd, keycode, false);
> >>>             }
> >>> -            break;
> >>> -        case NSEventTypeMouseMoved:
> >>> -            if (isAbsoluteEnabled) {
> >>> -                // Cursor re-entered into a window might generate ev=
ents bound to screen coordinates
> >>> -                // and `nil` window property, and in full screen mod=
e, current window might not be
> >>> -                // key window, where event location alone should suf=
fice.
> >>> -                if (![self screenContainsPoint:p] || !([[self window=
] isKeyWindow] || isFullscreen)) {
> >>> -                    if (isMouseGrabbed) {
> >>> -                        [self ungrabMouse];
> >>> -                    }
> >>> -                } else {
> >>> -                    if (!isMouseGrabbed) {
> >>> -                        [self grabMouse];
> >>> -                    }
> >>> -                }
> >>> -            }
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeLeftMouseDown:
> >>> -            buttons |=3D MOUSE_EVENT_LBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeRightMouseDown:
> >>> -            buttons |=3D MOUSE_EVENT_RBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeOtherMouseDown:
> >>> -            buttons |=3D MOUSE_EVENT_MBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeLeftMouseDragged:
> >>> -            buttons |=3D MOUSE_EVENT_LBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeRightMouseDragged:
> >>> -            buttons |=3D MOUSE_EVENT_RBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeOtherMouseDragged:
> >>> -            buttons |=3D MOUSE_EVENT_MBUTTON;
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeLeftMouseUp:
> >>> -            mouse_event =3D true;
> >>> -            if (!isMouseGrabbed && [self screenContainsPoint:p]) {
> >>> -                /*
> >>> -                 * In fullscreen mode, the window of cocoaView may n=
ot be the
> >>> -                 * key window, therefore the position relative to th=
e virtual
> >>> -                 * screen alone will be sufficient.
> >>> -                 */
> >>> -                if(isFullscreen || [[self window] isKeyWindow]) {
> >>> -                    [self grabMouse];
> >>> -                }
> >>> -            }
> >>> -            break;
> >>> -        case NSEventTypeRightMouseUp:
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> -        case NSEventTypeOtherMouseUp:
> >>> -            mouse_event =3D true;
> >>> -            break;
> >>> +            return true;
> >>>         case NSEventTypeScrollWheel:
> >>>             /*
> >>>              * Send wheel events to the guest regardless of window fo=
cus.
> >>> @@ -976,7 +843,7 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>              */
> >>>             if ([event deltaY] !=3D 0) {
> >>>             /* Determine if this is a scroll up or scroll down event =
*/
> >>> -                buttons =3D ([event deltaY] > 0) ?
> >>> +                int buttons =3D ([event deltaY] > 0) ?
> >>>                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
> >>>                 qemu_input_queue_btn(dcl.con, buttons, true);
> >>>                 qemu_input_event_sync();
> >>> @@ -987,62 +854,124 @@ - (bool) handleEventLocked:(NSEvent *)event
> >>>              * Since deltaY also reports scroll wheel events we preve=
nt mouse
> >>>              * movement code from executing.
> >>>              */
> >>> -            mouse_event =3D false;
> >>> -            break;
> >>> +            return true;
> >>>         default:
> >>>             return false;
> >>>     }
> >>> +}
> >>>
> >>> -    if (mouse_event) {
> >>> -        /* Don't send button events to the guest unless we've got a
> >>> -         * mouse grab or window focus. If we have neither then this =
event
> >>> -         * is the user clicking on the background window to activate=
 and
> >>> -         * bring us to the front, which will be done by the sendEven=
t
> >>> -         * call below. We definitely don't want to pass that click t=
hrough
> >>> -         * to the guest.
> >>> -         */
> >>> -        if ((isMouseGrabbed || [[self window] isKeyWindow]) &&
> >>> -            (last_buttons !=3D buttons)) {
> >>> -            static uint32_t bmap[INPUT_BUTTON__MAX] =3D {
> >>> -                [INPUT_BUTTON_LEFT]       =3D MOUSE_EVENT_LBUTTON,
> >>> -                [INPUT_BUTTON_MIDDLE]     =3D MOUSE_EVENT_MBUTTON,
> >>> -                [INPUT_BUTTON_RIGHT]      =3D MOUSE_EVENT_RBUTTON
> >>> -            };
> >>> -            qemu_input_update_buttons(dcl.con, bmap, last_buttons, b=
uttons);
> >>> -            last_buttons =3D buttons;
> >>> -        }
> >>> -        if (isMouseGrabbed) {
> >>> -            if (isAbsoluteEnabled) {
> >>> -                /* Note that the origin for Cocoa mouse coords is bo=
ttom left, not top left.
> >>> -                 * The check on screenContainsPoint is to avoid send=
ing out of range values for
> >>> -                 * clicks in the titlebar.
> >>> -                 */
> >>> -                if ([self screenContainsPoint:p]) {
> >>> -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x,=
 0, screen.width);
> >>> -                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, scre=
en.height - p.y, 0, screen.height);
> >>> -                }
> >>> -            } else {
> >>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[ev=
ent deltaX]);
> >>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[ev=
ent deltaY]);
> >>> -            }
> >>> +- (void) handleMouseEvent:(NSEvent *)event
> >>> +{
> >>> +    if (!isMouseGrabbed) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    with_iothread_lock(^{
> >>> +        if (isAbsoluteEnabled) {
> >>> +            CGFloat d =3D (CGFloat)screen.height / [self frame].size=
.height;
> >>> +            NSPoint p =3D [event locationInWindow];
> >>> +            // Note that the origin for Cocoa mouse coords is bottom=
 left, not top left.
> >>> +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x * d, 0, =
screen.width);
> >>> +            qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.heigh=
t - p.y * d, 0, screen.height);
> >>>         } else {
> >>> -            return false;
> >>> +            CGFloat d =3D (CGFloat)screen.height / [self convertSize=
ToBacking:[self frame].size].height;
> >>> +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, [event delta=
X] * d);
> >>> +            qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, [event delta=
Y] * d);
> >>>         }
> >>> +
> >>>         qemu_input_event_sync();
> >>> +    });
> >>> +}
> >>> +
> >>> +- (void) handleMouseEvent:(NSEvent *)event button:(InputButton)butto=
n down:(bool)down
> >>> +{
> >>> +    if (!isMouseGrabbed) {
> >>> +        return;
> >>>     }
> >>> -    return true;
> >>> +
> >>> +    with_iothread_lock(^{
> >>> +        qemu_input_queue_btn(dcl.con, button, down);
> >>> +    });
> >>> +
> >>> +    [self handleMouseEvent:event];
> >>> +}
> >>> +
> >>> +- (void) mouseExited:(NSEvent *)event
> >>> +{
> >>> +    if (isAbsoluteEnabled && isMouseGrabbed) {
> >>> +        [self ungrabMouse];
> >>> +    }
> >>> +}
> >>> +
> >>> +- (void) mouseEntered:(NSEvent *)event
> >>> +{
> >>> +    if (isAbsoluteEnabled && !isMouseGrabbed) {
> >>> +        [self grabMouse];
> >>> +    }
> >>> +}
> >>> +
> >>> +- (void) mouseMoved:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event];
> >>> +}
> >>> +
> >>> +- (void) mouseDown:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:true]=
;
> >>> +}
> >>> +
> >>> +- (void) rightMouseDown:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:true=
];
> >>> +}
> >>> +
> >>> +- (void) otherMouseDown:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:tru=
e];
> >>> +}
> >>> +
> >>> +- (void) mouseDragged:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event];
> >>> +}
> >>> +
> >>> +- (void) rightMouseDragged:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event];
> >>> +}
> >>> +
> >>> +- (void) otherMouseDragged:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event];
> >>> +}
> >>> +
> >>> +- (void) mouseUp:(NSEvent *)event
> >>> +{
> >>> +    if (!isMouseGrabbed) {
> >>> +        [self grabMouse];
> >>> +    }
> >>> +
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:false=
];
> >>> +}
> >>> +
> >>> +- (void) rightMouseUp:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:fals=
e];
> >>> +}
> >>> +
> >>> +- (void) otherMouseUp:(NSEvent *)event
> >>> +{
> >>> +    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:fal=
se];
> >>> }
> >>>
> >>> - (void) grabMouse
> >>> {
> >>>     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
> >>>
> >>> -    if (!isFullscreen) {
> >>> -        if (qemu_name)
> >>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU=
 %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> >>> -        else
> >>> -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to=
 release Mouse)"];
> >>> -    }
> >>> +    if (qemu_name)
> >>> +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s =
- (Press ctrl + alt + g to release Mouse)", qemu_name]];
> >>> +    else
> >>> +        [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to rel=
ease Mouse)"];
> >>>     [self hideCursor];
> >>>     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
> >>>     isMouseGrabbed =3D TRUE; // while isMouseGrabbed =3D TRUE, QemuCo=
coaApp sends all events to [cocoaView handleEvent:]
> >>> @@ -1052,15 +981,14 @@ - (void) ungrabMouse
> >>> {
> >>>     COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
> >>>
> >>> -    if (!isFullscreen) {
> >>> -        if (qemu_name)
> >>> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU=
 %s", qemu_name]];
> >>> -        else
> >>> -            [normalWindow setTitle:@"QEMU"];
> >>> -    }
> >>> +    if (qemu_name)
> >>> +        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s"=
, qemu_name]];
> >>> +    else
> >>> +        [normalWindow setTitle:@"QEMU"];
> >>>     [self unhideCursor];
> >>>     CGAssociateMouseAndMouseCursorPosition(TRUE);
> >>>     isMouseGrabbed =3D FALSE;
> >>> +    [self raiseAllButtons];
> >>> }
> >>>
> >>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> >>> @@ -1071,8 +999,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEna=
bled {
> >>> }
> >>> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
> >>> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> >>> -- (float) cdx {return cdx;}
> >>> -- (float) cdy {return cdy;}
> >>> - (QEMUScreen) gscreen {return screen;}
> >>>
> >>> /*
> >>> @@ -1086,6 +1012,15 @@ - (void) raiseAllKeys
> >>>         qkbd_state_lift_all_keys(kbd);
> >>>     });
> >>> }
> >>> +
> >>> +- (void) raiseAllButtons
> >>> +{
> >>> +    with_iothread_lock(^{
> >>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_LEFT, false);
> >>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_RIGHT, false);
> >>> +        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_MIDDLE, false);
> >>> +    });
> >>> +}
> >>> @end
> >>>
> >>>
> >>> @@ -1100,7 +1035,6 @@ @interface QemuCocoaAppController : NSObject
> >>> {
> >>> }
> >>> - (void)doToggleFullScreen:(id)sender;
> >>> -- (void)toggleFullScreen:(id)sender;
> >>> - (void)showQEMUDoc:(id)sender;
> >>> - (void)zoomToFit:(id) sender;
> >>> - (void)displayConsole:(id)sender;
> >>> @@ -1143,12 +1077,12 @@ - (id) init
> >>>             exit(1);
> >>>         }
> >>>         [normalWindow setAcceptsMouseMovedEvents:YES];
> >>> -        [normalWindow setTitle:@"QEMU"];
> >>> +        [normalWindow setCollectionBehavior:NSWindowCollectionBehavi=
orFullScreenPrimary];
> >>> +        [normalWindow setTitle:qemu_name ? [NSString stringWithForma=
t:@"QEMU %s", qemu_name] : @"QEMU"];
> >>>         [normalWindow setContentView:cocoaView];
> >>>         [normalWindow makeKeyAndOrderFront:self];
> >>>         [normalWindow center];
> >>>         [normalWindow setDelegate: self];
> >>> -        stretch_video =3D false;
> >>>
> >>>         /* Used for displaying pause on the screen */
> >>>         pauseLabel =3D [NSTextField new];
> >>> @@ -1219,9 +1153,20 @@ - (void)windowDidChangeScreen:(NSNotification =
*)notification
> >>>     [cocoaView updateUIInfo];
> >>> }
> >>>
> >>> +- (void)windowDidEnterFullScreen:(NSNotification *)notification
> >>> +{
> >>> +    [cocoaView grabMouse];
> >>> +}
> >>> +
> >>> +- (void)windowDidExitFullScreen:(NSNotification *)notification
> >>> +{
> >>> +    [cocoaView resizeWindow];
> >>> +    [cocoaView ungrabMouse];
> >>> +}
> >>> +
> >>> - (void)windowDidResize:(NSNotification *)notification
> >>> {
> >>> -    [cocoaView updateUIInfo];
> >>> +    [cocoaView frameUpdated];
> >>> }
> >>>
> >>> /* Called when the user clicks on a window's close button */
> >>> @@ -1237,6 +1182,23 @@ - (BOOL)windowShouldClose:(id)sender
> >>>     return NO;
> >>> }
> >>>
> >>> +- (NSSize) window:(NSWindow *)window willUseFullScreenContentSize:(N=
SSize)proposedSize
> >>> +{
> >>> +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) =3D=
=3D 0) {
> >>> +        return NSMakeSize([cocoaView gscreen].width, [cocoaView gscr=
een].height);
> >>> +    }
> >>> +
> >>> +    return [cocoaView fixZoomedFullScreenSize:proposedSize];
> >>> +}
> >>> +
> >>> +- (NSApplicationPresentationOptions) window:(NSWindow *)window
> >>> +                                     willUseFullScreenPresentationOp=
tions:(NSApplicationPresentationOptions)proposedOptions;
> >>> +
> >>> +{
> >>> +    return (proposedOptions & ~(NSApplicationPresentationAutoHideDoc=
k | NSApplicationPresentationAutoHideMenuBar)) |
> >>> +           NSApplicationPresentationHideDock | NSApplicationPresenta=
tionHideMenuBar;
>
> I think you can drop the & ~() part altogether and only OR the value with
> the bits you want to turn on. There's no need to turn them off first, | i=
s
> OR not XOR.

The reset bits and the set bits are different. It resets
NSApplicationPresentationAutoHideDock and
NSApplicationPresentationAutoHideMenuBar which contradict with
NSApplicationPresentationHideDock and
NSApplicationPresentationHideMenuBar.

Regards,
Akihiko Odaki

>
> Regards,
> BALATON Zoltan
>
> >>> +}
> >>> +
> >>> /* Called when QEMU goes into the background */
> >>> - (void) applicationWillResignActive: (NSNotification *)aNotification
> >>> {
> >>> @@ -1250,14 +1212,7 @@ - (void) applicationWillResignActive: (NSNotif=
ication *)aNotification
> >>>  */
> >>> - (void) doToggleFullScreen:(id)sender
> >>> {
> >>> -    [self toggleFullScreen:(id)sender];
> >>> -}
> >>> -
> >>> -- (void)toggleFullScreen:(id)sender
> >>> -{
> >>> -    COCOA_DEBUG("QemuCocoaAppController: toggleFullScreen\n");
> >>> -
> >>> -    [cocoaView toggleFullScreen:sender];
> >>> +    [normalWindow toggleFullScreen:sender];
> >>> }
> >>>
> >>> /* Tries to find then open the specified filename */
> >>> @@ -1294,13 +1249,15 @@ - (void)showQEMUDoc:(id)sender
> >>>     [self openDocumentation: @"index.html"];
> >>> }
> >>>
> >>> -/* Stretches video to fit host monitor size */
> >>> +/* Toggles the flag which stretches video to fit host window size */
> >>> - (void)zoomToFit:(id) sender
> >>> {
> >>> -    stretch_video =3D !stretch_video;
> >>> -    if (stretch_video =3D=3D true) {
> >>> +    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) =3D=
=3D 0) {
> >>> +        [normalWindow setStyleMask:[normalWindow styleMask] | NSWind=
owStyleMaskResizable];
> >>>         [sender setState: NSControlStateValueOn];
> >>>     } else {
> >>> +        [normalWindow setStyleMask:[normalWindow styleMask] & ~NSWin=
dowStyleMaskResizable];
> >>> +        [cocoaView resizeWindow];
> >>>         [sender setState: NSControlStateValueOff];
> >>>     }
> >>> }
> >>> @@ -1308,7 +1265,9 @@ - (void)zoomToFit:(id) sender
> >>> /* Displays the console on the screen */
> >>> - (void)displayConsole:(id)sender
> >>> {
> >>> -    console_select([sender tag]);
> >>> +    with_iothread_lock(^{
> >>> +        console_select([sender tag]);
> >>> +    });
> >>> }
> >>>
> >>> /* Pause the guest */
> >>> @@ -1952,16 +1911,14 @@ static void cocoa_update(DisplayChangeListene=
r *dcl,
> >>>     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
> >>>
> >>>     dispatch_async(dispatch_get_main_queue(), ^{
> >>> -        NSRect rect;
> >>> -        if ([cocoaView cdx] =3D=3D 1.0) {
> >>> -            rect =3D NSMakeRect(x, [cocoaView gscreen].height - y - =
h, w, h);
> >>> -        } else {
> >>> -            rect =3D NSMakeRect(
> >>> -                x * [cocoaView cdx],
> >>> -                ([cocoaView gscreen].height - y - h) * [cocoaView cd=
y],
> >>> -                w * [cocoaView cdx],
> >>> -                h * [cocoaView cdy]);
> >>> -        }
> >>> +        CGFloat d =3D [cocoaView frame].size.height / (CGFloat)[coco=
aView gscreen].height;
> >>> +
> >>> +        NSRect rect =3D NSMakeRect(
> >>> +                x * d,
> >>> +                ([cocoaView gscreen].height - y - h) * d,
> >>> +                w * d,
> >>> +                h * d);
> >>> +
> >>>         [cocoaView setNeedsDisplayInRect:rect];
> >>>     });
> >>>
> >>> @@ -2034,8 +1991,7 @@ static void cocoa_display_init(DisplayState *ds=
, DisplayOptions *opts)
> >>>     /* if fullscreen mode is to be used */
> >>>     if (opts->has_full_screen && opts->full_screen) {
> >>>         dispatch_async(dispatch_get_main_queue(), ^{
> >>> -            [NSApp activateIgnoringOtherApps: YES];
> >>> -            [(QemuCocoaAppController *)[[NSApplication sharedApplica=
tion] delegate] toggleFullScreen: nil];
> >>> +            [normalWindow toggleFullScreen: nil];
> >>>         });
> >>>     }
> >>>     if (opts->has_show_cursor && opts->show_cursor) {
> >>>
> >
> >

