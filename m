Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C755A358D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 09:21:54 +0200 (CEST)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRq8e-0003Zl-Kr
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 03:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oRq5U-0001cm-SC
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:18:37 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oRq5S-0008Pp-2p
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:18:36 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 332C55C01DF;
 Sat, 27 Aug 2022 03:18:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 27 Aug 2022 03:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661584710; x=
 1661671110; bh=wpbardRCf8L3LKfYXd1I157f24MMSNwtIL4JrdS956g=; b=n
 c9/fRMOPBHKJrIEDmjCtjvL/UOju5JYPJBEgqK8MKMxccYzwi+XT6+e5anNsRH0N
 brUss9oYF203YZp1o/EWLPiLxOUqfc/255XX+l5zeSmRvyWX5Xq6OgiPz424sxkk
 vmbWBDa6OGIvWSJSLHG8lIWC1dR6aDCC8Dhl2F9uunf5aLfRYIiGp2TZFjvCAlJo
 1DACAhkt6GpfcLDlJN9BcFbUoa1tNTfWA0tofYgfwd9tbznO+4++PMboG7VPyzKG
 lcViDb4lL5XX43wUTaH6TklZAoj3l9QsYv7fLs9CeSwv7OtLJ+dRIIbsS0oUqNV/
 EnOLTf6UmunyKJKWzU/rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661584710; x=
 1661671110; bh=wpbardRCf8L3LKfYXd1I157f24MMSNwtIL4JrdS956g=; b=p
 BNEzl9Z/6YI7JWL/d/nh3tgFzzM+MXN9rdMOgyEpQwCFQYuVRTDPih1gOZ1UihgF
 AaeT6/lWDSgx6J5P9d17VUmT1+EGSZoqzUDlyvdobq3yFp+/44ZltT20lrGHAJUG
 JZnRiHEh6Sg+7URoNaGSQfDL861qf8cZFRILKIejaKUy5OJfjQ5vRz85LGyzaAEC
 gUOt04TkXUh2eItCKBQgri1Bjw+tcks6Xxxl9fMFGMe4yrAKP4KrwAZrX9lrqnjK
 7O0h3PGZud8rt7Gxp17kb7z6yvQbXR50gs5/AT/re0hl3z2ZgDzSPsL2/KYT9ZWn
 m+NqS7D1RJjufAPela99A==
X-ME-Sender: <xms:RcUJYwkkg5qAnqBFUiJ1zSYr8zWBaSMOQKYW0I6c5P9vkBEg52qvoA>
 <xme:RcUJY_2JeOrqmQKRSL2OLNoRsf8VVHIOIGVVJT3KCHNuvgYtbkTLakGsRizdGEmwd
 018uvUMgLisDbHX_w>
X-ME-Received: <xmr:RcUJY-pm6LPpG1Q0gMhVSB_KUMozfdLaennLUrHXjSFN8xxJwUoKcWdGs5TMcsITu8Pxn44o2iU4AiH6Wu87ok6CYqpqz02Ulh_hH-is>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejiedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurheptggguffhjgffvefgkfhfvffose
 htqhhmtdhhtddvnecuhfhrohhmpefglhhlihhothcupfhunhhnuceovghllhhiohhtsehn
 uhhnnhdrihhoqeenucggtffrrghtthgvrhhnpeegteduieeivdejhfdtiefgteeifeetje
 ekjeefveduhfetudehieevfeejjefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegvlhhlihhothesnhhunhhnrdhioh
X-ME-Proxy: <xmx:RsUJY8l5BXd1BYFkEvS58TifXFE358MrtZmQtyrodM_CU11_kp__wA>
 <xmx:RsUJY-00T2hKWUqEAFj4Wmzigqu9x6fbzOdISBSN2I4IVwzzxtZr7w>
 <xmx:RsUJYzsTqWTD_dsY8A1Rsl2mV1d8rhxyFOiR2YSS-j5LPat93Ptueg>
 <xmx:RsUJYz-VvEqm8PzhnUJdRC5Jfl0Xx0CYjHiSRmMRb00_3-tlcjOFmQ>
Feedback-ID: i6a78429f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Aug 2022 03:18:27 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
From: Elliot Nunn <elliot@nunn.io>
In-Reply-To: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
Date: Sat, 27 Aug 2022 15:18:23 +0800
Cc: peter.maydell@linaro.org,
 f4bug@amsat.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <477A84BE-43B4-4315-9321-2A1BC7B76157@nunn.io>
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=66.111.4.29; envelope-from=elliot@nunn.io;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resending this patch now that 7.1 is released (well done).

> On 4 Aug 2022, at 2:27 pm, Elliot Nunn <elliot@nunn.io> wrote:
>=20
> Implement dpy_cursor_define() and dpy_mouse_set() on macOS.
>=20
> The main benefit is from dpy_cursor_define: in absolute pointing mode, =
the
> host can redraw the cursor on the guest's behalf much faster than the =
guest
> can itself.
>=20
> To provide the programmatic movement expected from a hardware cursor,
> dpy_mouse_set is also implemented.
>=20
> Tricky cases are handled:
> - dpy_mouse_set() avoids rounded window corners.
> - The sometimes-delay between warping the cursor and an affected =
mouse-move
>  event is accounted for.
> - Cursor bitmaps are nearest-neighbor scaled to Retina size.
>=20
> Signed-off-by: Elliot Nunn <elliot@nunn.io>
> ---
> ui/cocoa.m | 263 ++++++++++++++++++++++++++++++++++++++++++++++++-----
> 1 file changed, 240 insertions(+), 23 deletions(-)
>=20
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 5a8bd5dd84..f9d54448e4 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -85,12 +85,20 @@ static void cocoa_switch(DisplayChangeListener =
*dcl,
>=20
> static void cocoa_refresh(DisplayChangeListener *dcl);
>=20
> +static void cocoa_mouse_set(DisplayChangeListener *dcl,
> +                            int x, int y, int on);
> +
> +static void cocoa_cursor_define(DisplayChangeListener *dcl,
> +                                QEMUCursor *c);
> +
> static NSWindow *normalWindow;
> static const DisplayChangeListenerOps dcl_ops =3D {
>     .dpy_name          =3D "cocoa",
>     .dpy_gfx_update =3D cocoa_update,
>     .dpy_gfx_switch =3D cocoa_switch,
>     .dpy_refresh =3D cocoa_refresh,
> +    .dpy_mouse_set =3D cocoa_mouse_set,
> +    .dpy_cursor_define =3D cocoa_cursor_define,
> };
> static DisplayChangeListener dcl =3D {
>     .ops =3D &dcl_ops,
> @@ -313,6 +321,13 @@ @interface QemuCocoaView : NSView
>     BOOL isFullscreen;
>     BOOL isAbsoluteEnabled;
>     CFMachPortRef eventsTap;
> +    NSCursor *guestCursor;
> +    BOOL cursorHiddenByMe;
> +    BOOL guestCursorVis;
> +    int guestCursorX, guestCursorY;
> +    int lastWarpX, lastWarpY;
> +    int warpDeltaX, warpDeltaY;
> +    BOOL ignoreNextMouseMove;
> }
> - (void) switchSurface:(pixman_image_t *)image;
> - (void) grabMouse;
> @@ -323,6 +338,10 @@ - (void) handleMonitorInput:(NSEvent *)event;
> - (bool) handleEvent:(NSEvent *)event;
> - (bool) handleEventLocked:(NSEvent *)event;
> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
> +- (void) cursorDefine:(NSCursor *)cursor;
> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on;
> +- (void) setCursorAppearance;
> +- (void) setCursorPosition;
> /* The state surrounding mouse grabbing is potentially confusing.
>  * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the =
emulated
>  *   pointing device an absolute-position one?"], but is only updated =
on
> @@ -432,22 +451,6 @@ - (CGPoint) screenLocationOfEvent:(NSEvent *)ev
>     }
> }
>=20
> -- (void) hideCursor
> -{
> -    if (!cursor_hide) {
> -        return;
> -    }
> -    [NSCursor hide];
> -}
> -
> -- (void) unhideCursor
> -{
> -    if (!cursor_hide) {
> -        return;
> -    }
> -    [NSCursor unhide];
> -}
> -
> - (void) drawRect:(NSRect) rect
> {
>     COCOA_DEBUG("QemuCocoaView: drawRect\n");
> @@ -635,6 +638,8 @@ - (void) switchSurface:(pixman_image_t *)image
>         screen.height =3D h;
>         [self setContentDimensions];
>         [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> +        [self setCursorAppearance];
> +        [self setCursorPosition];
>     }
>=20
>     // update screenBuffer
> @@ -681,6 +686,7 @@ - (void) toggleFullScreen:(id)sender
>             styleMask:NSWindowStyleMaskBorderless
>             backing:NSBackingStoreBuffered
>             defer:NO];
> +        [fullScreenWindow disableCursorRects];
>         [fullScreenWindow setAcceptsMouseMovedEvents: YES];
>         [fullScreenWindow setHasShadow:NO];
>         [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
> @@ -812,6 +818,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>     int buttons =3D 0;
>     int keycode =3D 0;
>     bool mouse_event =3D false;
> +    bool mousemoved_event =3D false;
>     // Location of event in virtual screen coordinates
>     NSPoint p =3D [self screenLocationOfEvent:event];
>     NSUInteger modifiers =3D [event modifierFlags];
> @@ -1023,6 +1030,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>                 }
>             }
>             mouse_event =3D true;
> +            mousemoved_event =3D true;
>             break;
>         case NSEventTypeLeftMouseDown:
>             buttons |=3D MOUSE_EVENT_LBUTTON;
> @@ -1039,14 +1047,17 @@ - (bool) handleEventLocked:(NSEvent *)event
>         case NSEventTypeLeftMouseDragged:
>             buttons |=3D MOUSE_EVENT_LBUTTON;
>             mouse_event =3D true;
> +            mousemoved_event =3D true;
>             break;
>         case NSEventTypeRightMouseDragged:
>             buttons |=3D MOUSE_EVENT_RBUTTON;
>             mouse_event =3D true;
> +            mousemoved_event =3D true;
>             break;
>         case NSEventTypeOtherMouseDragged:
>             buttons |=3D MOUSE_EVENT_MBUTTON;
>             mouse_event =3D true;
> +            mousemoved_event =3D true;
>             break;
>         case NSEventTypeLeftMouseUp:
>             mouse_event =3D true;
> @@ -1121,7 +1132,12 @@ - (bool) handleEventLocked:(NSEvent *)event
>             qemu_input_update_buttons(dcl.con, bmap, last_buttons, =
buttons);
>             last_buttons =3D buttons;
>         }
> -        if (isMouseGrabbed) {
> +
> +        if (!isMouseGrabbed) {
> +            return false;
> +        }
> +
> +        if (mousemoved_event) {
>             if (isAbsoluteEnabled) {
>                 /* Note that the origin for Cocoa mouse coords is =
bottom left, not top left.
>                  * The check on screenContainsPoint is to avoid =
sending out of range values for
> @@ -1132,11 +1148,38 @@ - (bool) handleEventLocked:(NSEvent *)event
>                     qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, =
screen.height - p.y, 0, screen.height);
>                 }
>             } else {
> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, =
(int)[event deltaX]);
> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, =
(int)[event deltaY]);
> +                if (ignoreNextMouseMove) {
> +                    // Discard the first mouse-move event after a =
grab, because
> +                    // it includes the warp delta from an unknown =
initial position.
> +                    ignoreNextMouseMove =3D NO;
> +                    warpDeltaX =3D warpDeltaY =3D 0;
> +                } else {
> +                    // Correct subsequent events to remove the known =
warp delta.
> +                    // The warp delta is sometimes late to be =
reported, so never
> +                    // allow the delta compensation to alter the =
direction.
> +                    int dX =3D (int)[event deltaX];
> +                    int dY =3D (int)[event deltaY];
> +
> +                    if (dX =3D=3D 0 || (dX ^ (dX - warpDeltaX)) < 0) =
{ // Flipped sign?
> +                        warpDeltaX -=3D dX; // Save excess correction =
for later
> +                        dX =3D 0;
> +                    } else {
> +                        dX -=3D warpDeltaX; // Apply entire =
correction
> +                        warpDeltaX =3D 0;
> +                    }
> +
> +                    if (dY =3D=3D 0 || (dY ^ (dY - warpDeltaY)) < 0) =
{
> +                        warpDeltaY -=3D dY;
> +                        dY =3D 0;
> +                    } else {
> +                        dY -=3D warpDeltaY;
> +                        warpDeltaY =3D 0;
> +                    }
> +
> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, dX);
> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, dY);
> +                }
>             }
> -        } else {
> -            return false;
>         }
>         qemu_input_event_sync();
>     }
> @@ -1153,9 +1196,15 @@ - (void) grabMouse
>         else
>             [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to =
release Mouse)"];
>     }
> -    [self hideCursor];
>     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>     isMouseGrabbed =3D TRUE; // while isMouseGrabbed =3D TRUE, =
QemuCocoaApp sends all events to [cocoaView handleEvent:]
> +    [self setCursorAppearance];
> +    [self setCursorPosition];
> +
> +    // We took over and warped the mouse, so ignore the next =
mouse-move
> +    if (!isAbsoluteEnabled) {
> +        ignoreNextMouseMove =3D YES;
> +    }
> }
>=20
> - (void) ungrabMouse
> @@ -1168,9 +1217,14 @@ - (void) ungrabMouse
>         else
>             [normalWindow setTitle:@"QEMU"];
>     }
> -    [self unhideCursor];
>     CGAssociateMouseAndMouseCursorPosition(TRUE);
>     isMouseGrabbed =3D FALSE;
> +    [self setCursorAppearance];
> +
> +    if (!isAbsoluteEnabled) {
> +        ignoreNextMouseMove =3D NO;
> +        warpDeltaX =3D warpDeltaY =3D 0;
> +    }
> }
>=20
> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> @@ -1179,6 +1233,116 @@ - (void) =
setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>         CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>     }
> }
> +
> +// Indirectly called by dpy_cursor_define() in the virtual GPU
> +- (void) cursorDefine:(NSCursor *)cursor {
> +    guestCursor =3D cursor;
> +    [self setCursorAppearance];
> +}
> +
> +// Indirectly called by dpy_mouse_set() in the virtual GPU
> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on {
> +    if (!on !=3D !guestCursorVis) {
> +        guestCursorVis =3D on;
> +        [self setCursorAppearance];
> +    }
> +
> +    if (on && (x !=3D guestCursorX || y !=3D guestCursorY)) {
> +        guestCursorX =3D x;
> +        guestCursorY =3D y;
> +        [self setCursorPosition];
> +    }
> +}
> +
> +// Change the cursor image to the default, the guest cursor bitmap or =
hidden.
> +// Said to be an expensive operation on macOS Monterey, so use =
sparingly.
> +- (void) setCursorAppearance {
> +    NSCursor *cursor =3D NULL; // NULL means hidden
> +
> +    if (!isMouseGrabbed) {
> +        cursor =3D [NSCursor arrowCursor];
> +    } else if (!guestCursor && !cursor_hide) {
> +        cursor =3D [NSCursor arrowCursor];
> +    } else if (guestCursorVis && guestCursor) {
> +        cursor =3D guestCursor;
> +    } else {
> +        cursor =3D NULL;
> +    }
> +
> +    if (cursor !=3D NULL) {
> +        [cursor set];
> +
> +        if (cursorHiddenByMe) {
> +            [NSCursor unhide];
> +            cursorHiddenByMe =3D NO;
> +        }
> +    } else {
> +        if (!cursorHiddenByMe) {
> +            [NSCursor hide];
> +            cursorHiddenByMe =3D YES;
> +        }
> +    }
> +}
> +
> +// Move the cursor within the virtual screen
> +- (void) setCursorPosition {
> +    // Ignore the guest's request if the cursor belongs to Cocoa
> +    if (!isMouseGrabbed || isAbsoluteEnabled) {
> +        return;
> +    }
> +
> +    // Get guest screen rect in Cocoa coordinates (bottom-left =
origin).
> +    NSRect virtualScreen =3D [[self window] convertRectToScreen:[self =
frame]];
> +
> +    // Convert to top-left origin.
> +    NSInteger hostScreenH =3D [NSScreen =
screens][0].frame.size.height;
> +    int scrX =3D virtualScreen.origin.x;
> +    int scrY =3D hostScreenH - virtualScreen.origin.y - =
virtualScreen.size.height;
> +    int scrW =3D virtualScreen.size.width;
> +    int scrH =3D virtualScreen.size.height;
> +
> +    int cursX =3D scrX + guestCursorX;
> +    int cursY =3D scrY + guestCursorY;
> +
> +    // Clip to edges
> +    cursX =3D MIN(MAX(scrX, cursX), scrX + scrW - 1);
> +    cursY =3D MIN(MAX(scrY, cursY), scrY + scrH - 1);
> +
> +    // Move diagonally towards the center to avoid rounded window =
corners.
> +    // Limit the number of hit-tests and discard failed attempts.
> +    int betterX =3D cursX, betterY =3D cursY;
> +    for (int i=3D0; i<16; i++) {
> +        if ([NSWindow windowNumberAtPoint:NSMakePoint(betterX, =
hostScreenH - betterY)
> +            belowWindowWithWindowNumber:0] =3D=3D =
self.window.windowNumber) {
> +            cursX =3D betterX;
> +            cursY =3D betterY;
> +            break;
> +        };
> +
> +        if (betterX < scrX + scrW/2) {
> +            betterX++;
> +        } else {
> +            betterX--;
> +        }
> +
> +        if (betterY < scrY + scrH/2) {
> +            betterY++;
> +        } else {
> +            betterY--;
> +        }
> +    }
> +
> +    // Subtract this warp delta from the next NSEventTypeMouseMoved.
> +    // These are in down-is-positive coords, same as NSEvent =
deltaX/deltaY.
> +    warpDeltaX +=3D cursX - lastWarpX;
> +    warpDeltaY +=3D cursY - lastWarpY;
> +
> +    CGWarpMouseCursorPosition(NSMakePoint(cursX, cursY));
> +
> +    lastWarpX =3D cursX;
> +    lastWarpY =3D cursY;
> +}
> +
> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> - (float) cdx {return cdx;}
> @@ -1251,6 +1415,7 @@ - (id) init
>             error_report("(cocoa) can't create window");
>             exit(1);
>         }
> +        [normalWindow disableCursorRects];
>         [normalWindow setAcceptsMouseMovedEvents:YES];
>         [normalWindow setTitle:@"QEMU"];
>         [normalWindow setContentView:cocoaView];
> @@ -2123,6 +2288,58 @@ static void cocoa_display_init(DisplayState =
*ds, DisplayOptions *opts)
>     qemu_clipboard_peer_register(&cbpeer);
> }
>=20
> +static void cocoa_mouse_set(DisplayChangeListener *dcl, int x, int y, =
int on) {
> +    dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView mouseSetX:x Y:y on:on];
> +    });
> +}
> +
> +// Convert QEMUCursor to NSCursor, then call cursorDefine
> +static void cocoa_cursor_define(DisplayChangeListener *dcl, =
QEMUCursor *cursor) {
> +    CFDataRef cfdata =3D CFDataCreate(
> +        /*allocator*/ NULL,
> +        /*bytes*/ (void *)cursor->data,
> +        /*length*/ sizeof(uint32_t) * cursor->width * =
cursor->height);
> +
> +    CGDataProviderRef dataprovider =3D =
CGDataProviderCreateWithCFData(cfdata);
> +
> +    CGImageRef cgimage =3D CGImageCreate(
> +        cursor->width, cursor->height,
> +        /*bitsPerComponent*/ 8,
> +        /*bitsPerPixel*/ 32,
> +        /*bytesPerRow*/ sizeof(uint32_t) * cursor->width,
> +        /*colorspace*/ CGColorSpaceCreateWithName(kCGColorSpaceSRGB),
> +        /*bitmapInfo*/ kCGBitmapByteOrder32Host | kCGImageAlphaLast,
> +        /*provider*/ dataprovider,
> +        /*decode*/ NULL,
> +        /*shouldInterpolate*/ FALSE,
> +        /*intent*/ kCGRenderingIntentDefault);
> +
> +    NSImage *unscaled =3D [[NSImage alloc] initWithCGImage:cgimage =
size:NSZeroSize];
> +
> +    CFRelease(cfdata);
> +    CGDataProviderRelease(dataprovider);
> +    CGImageRelease(cgimage);
> +
> +    // Nearest-neighbor scale to the possibly "Retina" cursor size
> +    NSImage *scaled =3D [NSImage
> +        imageWithSize:NSMakeSize(cursor->width, cursor->height)
> +        flipped:NO
> +        drawingHandler:^BOOL(NSRect dest) {
> +            [NSGraphicsContext currentContext].imageInterpolation =3D =
NSImageInterpolationNone;
> +            [unscaled drawInRect:dest];
> +            return YES;
> +        }];
> +
> +    NSCursor *nscursor =3D [[NSCursor alloc]
> +        initWithImage:scaled
> +        hotSpot:NSMakePoint(cursor->hot_x, cursor->hot_y)];
> +
> +    dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView cursorDefine:nscursor];
> +    });
> +}
> +
> static QemuDisplay qemu_display_cocoa =3D {
>     .type       =3D DISPLAY_TYPE_COCOA,
>     .init       =3D cocoa_display_init,


