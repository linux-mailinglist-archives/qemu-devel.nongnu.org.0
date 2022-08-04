Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7D5897D3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:38:29 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJUV1-000162-MN
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oJUL8-0004cZ-PW
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:28:16 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:38943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oJUL5-0002nA-Mu
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:28:14 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DA2483200934;
 Thu,  4 Aug 2022 02:28:06 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute2.internal (MEProxy); Thu, 04 Aug 2022 02:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1659594486; x=1659680886; bh=haI64DsnZTvk8P6+/erRTkxoijVQaJDot4+
 fywobWVA=; b=lMq+6rSZFwVU9m0lyQyT/EKqWmggLgdE6IRvEv5qWsw/Ym3Tkvr
 yE1T3dN0uEgwCR/kD8bMmRDuUeC1F9541klSIZNR/6x4eDTHWqwb3Z2svl7MPCMx
 FKlIhfjkf8Rqmn4vfl9XtzPwOASsCCAs3uMXt30/64GVg5wmadbHwrZStP6uymto
 /GvSymd5UT2zyCXn4wNWcqnlbb/b2BYx7vYq/rRP+ZA2holTD3zoO1KjAYuwTnFy
 YEjHHlVOhljwpbYgqJ3d9ksd/HSGJooeiueS5ZuCNp+JxJ+EOPsMkJlC8Ws10AFM
 UZlgNCcqiBzvzLIXoSdyp2+/SVD3tkD+skQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659594486; x=
 1659680886; bh=haI64DsnZTvk8P6+/erRTkxoijVQaJDot4+fywobWVA=; b=f
 9xxYYhc35P/0amjHH3g+Kdyj1Fl6DFIzrn9NYkfLEO7Bw/v1fEX2rwkqit/EsPa3
 RUFnm3Cgs/oRhKtX6flML5Mh2nNGsjtuXLBS62+m3yUy6NzD/A2ud6Pa+4EsPFh6
 nFnsrwKTCCaf7+7vsvnG/MMXSap4orNG3tHfrsuYvbww3cbRwmXJ8rLBeVr43JlI
 h9gUv5p4JazzaaWKbuffy22BPUG9tEsnBbeJZfN8JesDyUVs5iTjqGv6qsZ6uzF0
 Hog17rkEgp6L7ouSkKLKTd5ftPvoyg+U7aATACdmpckozfLrvAps+puTeA6uK/Sw
 7QK7jyy65q8owsG4C1X3Q==
X-ME-Sender: <xms:9mbrYoXNI-68MszH9PZrqItLOZq5BRvfPKtPhtFsZZkLis2XWhWCNw>
 <xme:9mbrYskbdqQjXi5wr_JqpE44ZZdWzeygzJaPNcupOvhsKkdCmPv7fwxyVFEq0eAgk
 jP5PVQt-pVuGApRXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvfevufgtsehttd
 ertderredtnecuhfhrohhmpedfgfhllhhiohhtucfpuhhnnhdfuceovghllhhiohhtsehn
 uhhnnhdrihhoqeenucggtffrrghtthgvrhhnpeeuuddukeejvddvgfevffeijefhkeffge
 ejffelvddtieeftdeukefgheduvedvudenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegvlhhlihhothesnhhunhhnrdhioh
X-ME-Proxy: <xmx:9mbrYsbC7AUFtH1PJ9iqN8bFo-QRnE0LKpJ2atQXfTteia6CtEEhkg>
 <xmx:9mbrYnU-OMSCftkLuLNPYA5vtLWTmlmy2BYqseH7tTEAbDlOajRF4w>
 <xmx:9mbrYil6L1oWTyFB6TX4C37DpiEtN-wDCJiiibFk6GC6xbjHyHqmLA>
 <xmx:9mbrYpsyaRmuBJOG0DH-NAklz0N7_ejhg2Jeuj2Rjk429SaPKxEaPQ>
Feedback-ID: i6a78429f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1AB80170007E; Thu,  4 Aug 2022 02:28:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
Date: Thu, 04 Aug 2022 14:27:45 +0800
From: "Elliot Nunn" <elliot@nunn.io>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org
Subject: [PATCH] ui/cocoa: Support hardware cursor interface
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.24; envelope-from=elliot@nunn.io;
 helo=wout1-smtp.messagingengine.com
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

Implement dpy_cursor_define() and dpy_mouse_set() on macOS.

The main benefit is from dpy_cursor_define: in absolute pointing mode, the
host can redraw the cursor on the guest's behalf much faster than the guest
can itself.

To provide the programmatic movement expected from a hardware cursor,
dpy_mouse_set is also implemented.

Tricky cases are handled:
- dpy_mouse_set() avoids rounded window corners.
- The sometimes-delay between warping the cursor and an affected mouse-move
  event is accounted for.
- Cursor bitmaps are nearest-neighbor scaled to Retina size.

Signed-off-by: Elliot Nunn <elliot@nunn.io>
---
 ui/cocoa.m | 263 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 240 insertions(+), 23 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 5a8bd5dd84..f9d54448e4 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -85,12 +85,20 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
+static void cocoa_mouse_set(DisplayChangeListener *dcl,
+                            int x, int y, int on);
+
+static void cocoa_cursor_define(DisplayChangeListener *dcl,
+                                QEMUCursor *c);
+
 static NSWindow *normalWindow;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
     .dpy_gfx_switch = cocoa_switch,
     .dpy_refresh = cocoa_refresh,
+    .dpy_mouse_set = cocoa_mouse_set,
+    .dpy_cursor_define = cocoa_cursor_define,
 };
 static DisplayChangeListener dcl = {
     .ops = &dcl_ops,
@@ -313,6 +321,13 @@ @interface QemuCocoaView : NSView
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
     CFMachPortRef eventsTap;
+    NSCursor *guestCursor;
+    BOOL cursorHiddenByMe;
+    BOOL guestCursorVis;
+    int guestCursorX, guestCursorY;
+    int lastWarpX, lastWarpY;
+    int warpDeltaX, warpDeltaY;
+    BOOL ignoreNextMouseMove;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
@@ -323,6 +338,10 @@ - (void) handleMonitorInput:(NSEvent *)event;
 - (bool) handleEvent:(NSEvent *)event;
 - (bool) handleEventLocked:(NSEvent *)event;
 - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
+- (void) cursorDefine:(NSCursor *)cursor;
+- (void) mouseSetX:(int)x Y:(int)y on:(int)on;
+- (void) setCursorAppearance;
+- (void) setCursorPosition;
 /* The state surrounding mouse grabbing is potentially confusing.
  * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the emulated
  *   pointing device an absolute-position one?"], but is only updated on
@@ -432,22 +451,6 @@ - (CGPoint) screenLocationOfEvent:(NSEvent *)ev
     }
 }
 
-- (void) hideCursor
-{
-    if (!cursor_hide) {
-        return;
-    }
-    [NSCursor hide];
-}
-
-- (void) unhideCursor
-{
-    if (!cursor_hide) {
-        return;
-    }
-    [NSCursor unhide];
-}
-
 - (void) drawRect:(NSRect) rect
 {
     COCOA_DEBUG("QemuCocoaView: drawRect\n");
@@ -635,6 +638,8 @@ - (void) switchSurface:(pixman_image_t *)image
         screen.height = h;
         [self setContentDimensions];
         [self setFrame:NSMakeRect(cx, cy, cw, ch)];
+        [self setCursorAppearance];
+        [self setCursorPosition];
     }
 
     // update screenBuffer
@@ -681,6 +686,7 @@ - (void) toggleFullScreen:(id)sender
             styleMask:NSWindowStyleMaskBorderless
             backing:NSBackingStoreBuffered
             defer:NO];
+        [fullScreenWindow disableCursorRects];
         [fullScreenWindow setAcceptsMouseMovedEvents: YES];
         [fullScreenWindow setHasShadow:NO];
         [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
@@ -812,6 +818,7 @@ - (bool) handleEventLocked:(NSEvent *)event
     int buttons = 0;
     int keycode = 0;
     bool mouse_event = false;
+    bool mousemoved_event = false;
     // Location of event in virtual screen coordinates
     NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
@@ -1023,6 +1030,7 @@ - (bool) handleEventLocked:(NSEvent *)event
                 }
             }
             mouse_event = true;
+            mousemoved_event = true;
             break;
         case NSEventTypeLeftMouseDown:
             buttons |= MOUSE_EVENT_LBUTTON;
@@ -1039,14 +1047,17 @@ - (bool) handleEventLocked:(NSEvent *)event
         case NSEventTypeLeftMouseDragged:
             buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
+            mousemoved_event = true;
             break;
         case NSEventTypeRightMouseDragged:
             buttons |= MOUSE_EVENT_RBUTTON;
             mouse_event = true;
+            mousemoved_event = true;
             break;
         case NSEventTypeOtherMouseDragged:
             buttons |= MOUSE_EVENT_MBUTTON;
             mouse_event = true;
+            mousemoved_event = true;
             break;
         case NSEventTypeLeftMouseUp:
             mouse_event = true;
@@ -1121,7 +1132,12 @@ - (bool) handleEventLocked:(NSEvent *)event
             qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
             last_buttons = buttons;
         }
-        if (isMouseGrabbed) {
+
+        if (!isMouseGrabbed) {
+            return false;
+        }
+
+        if (mousemoved_event) {
             if (isAbsoluteEnabled) {
                 /* Note that the origin for Cocoa mouse coords is bottom left, not top left.
                  * The check on screenContainsPoint is to avoid sending out of range values for
@@ -1132,11 +1148,38 @@ - (bool) handleEventLocked:(NSEvent *)event
                     qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
                 }
             } else {
-                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
-                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
+                if (ignoreNextMouseMove) {
+                    // Discard the first mouse-move event after a grab, because
+                    // it includes the warp delta from an unknown initial position.
+                    ignoreNextMouseMove = NO;
+                    warpDeltaX = warpDeltaY = 0;
+                } else {
+                    // Correct subsequent events to remove the known warp delta.
+                    // The warp delta is sometimes late to be reported, so never
+                    // allow the delta compensation to alter the direction.
+                    int dX = (int)[event deltaX];
+                    int dY = (int)[event deltaY];
+
+                    if (dX == 0 || (dX ^ (dX - warpDeltaX)) < 0) { // Flipped sign?
+                        warpDeltaX -= dX; // Save excess correction for later
+                        dX = 0;
+                    } else {
+                        dX -= warpDeltaX; // Apply entire correction
+                        warpDeltaX = 0;
+                    }
+
+                    if (dY == 0 || (dY ^ (dY - warpDeltaY)) < 0) {
+                        warpDeltaY -= dY;
+                        dY = 0;
+                    } else {
+                        dY -= warpDeltaY;
+                        warpDeltaY = 0;
+                    }
+
+                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, dX);
+                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, dY);
+                }
             }
-        } else {
-            return false;
         }
         qemu_input_event_sync();
     }
@@ -1153,9 +1196,15 @@ - (void) grabMouse
         else
             [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
     }
-    [self hideCursor];
     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
     isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
+    [self setCursorAppearance];
+    [self setCursorPosition];
+
+    // We took over and warped the mouse, so ignore the next mouse-move
+    if (!isAbsoluteEnabled) {
+        ignoreNextMouseMove = YES;
+    }
 }
 
 - (void) ungrabMouse
@@ -1168,9 +1217,14 @@ - (void) ungrabMouse
         else
             [normalWindow setTitle:@"QEMU"];
     }
-    [self unhideCursor];
     CGAssociateMouseAndMouseCursorPosition(TRUE);
     isMouseGrabbed = FALSE;
+    [self setCursorAppearance];
+
+    if (!isAbsoluteEnabled) {
+        ignoreNextMouseMove = NO;
+        warpDeltaX = warpDeltaY = 0;
+    }
 }
 
 - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
@@ -1179,6 +1233,116 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
         CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
     }
 }
+
+// Indirectly called by dpy_cursor_define() in the virtual GPU
+- (void) cursorDefine:(NSCursor *)cursor {
+    guestCursor = cursor;
+    [self setCursorAppearance];
+}
+
+// Indirectly called by dpy_mouse_set() in the virtual GPU
+- (void) mouseSetX:(int)x Y:(int)y on:(int)on {
+    if (!on != !guestCursorVis) {
+        guestCursorVis = on;
+        [self setCursorAppearance];
+    }
+
+    if (on && (x != guestCursorX || y != guestCursorY)) {
+        guestCursorX = x;
+        guestCursorY = y;
+        [self setCursorPosition];
+    }
+}
+
+// Change the cursor image to the default, the guest cursor bitmap or hidden.
+// Said to be an expensive operation on macOS Monterey, so use sparingly.
+- (void) setCursorAppearance {
+    NSCursor *cursor = NULL; // NULL means hidden
+
+    if (!isMouseGrabbed) {
+        cursor = [NSCursor arrowCursor];
+    } else if (!guestCursor && !cursor_hide) {
+        cursor = [NSCursor arrowCursor];
+    } else if (guestCursorVis && guestCursor) {
+        cursor = guestCursor;
+    } else {
+        cursor = NULL;
+    }
+
+    if (cursor != NULL) {
+        [cursor set];
+
+        if (cursorHiddenByMe) {
+            [NSCursor unhide];
+            cursorHiddenByMe = NO;
+        }
+    } else {
+        if (!cursorHiddenByMe) {
+            [NSCursor hide];
+            cursorHiddenByMe = YES;
+        }
+    }
+}
+
+// Move the cursor within the virtual screen
+- (void) setCursorPosition {
+    // Ignore the guest's request if the cursor belongs to Cocoa
+    if (!isMouseGrabbed || isAbsoluteEnabled) {
+        return;
+    }
+
+    // Get guest screen rect in Cocoa coordinates (bottom-left origin).
+    NSRect virtualScreen = [[self window] convertRectToScreen:[self frame]];
+
+    // Convert to top-left origin.
+    NSInteger hostScreenH = [NSScreen screens][0].frame.size.height;
+    int scrX = virtualScreen.origin.x;
+    int scrY = hostScreenH - virtualScreen.origin.y - virtualScreen.size.height;
+    int scrW = virtualScreen.size.width;
+    int scrH = virtualScreen.size.height;
+
+    int cursX = scrX + guestCursorX;
+    int cursY = scrY + guestCursorY;
+
+    // Clip to edges
+    cursX = MIN(MAX(scrX, cursX), scrX + scrW - 1);
+    cursY = MIN(MAX(scrY, cursY), scrY + scrH - 1);
+
+    // Move diagonally towards the center to avoid rounded window corners.
+    // Limit the number of hit-tests and discard failed attempts.
+    int betterX = cursX, betterY = cursY;
+    for (int i=0; i<16; i++) {
+        if ([NSWindow windowNumberAtPoint:NSMakePoint(betterX, hostScreenH - betterY)
+            belowWindowWithWindowNumber:0] == self.window.windowNumber) {
+            cursX = betterX;
+            cursY = betterY;
+            break;
+        };
+
+        if (betterX < scrX + scrW/2) {
+            betterX++;
+        } else {
+            betterX--;
+        }
+
+        if (betterY < scrY + scrH/2) {
+            betterY++;
+        } else {
+            betterY--;
+        }
+    }
+
+    // Subtract this warp delta from the next NSEventTypeMouseMoved.
+    // These are in down-is-positive coords, same as NSEvent deltaX/deltaY.
+    warpDeltaX += cursX - lastWarpX;
+    warpDeltaY += cursY - lastWarpY;
+
+    CGWarpMouseCursorPosition(NSMakePoint(cursX, cursY));
+
+    lastWarpX = cursX;
+    lastWarpY = cursY;
+}
+
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
 - (float) cdx {return cdx;}
@@ -1251,6 +1415,7 @@ - (id) init
             error_report("(cocoa) can't create window");
             exit(1);
         }
+        [normalWindow disableCursorRects];
         [normalWindow setAcceptsMouseMovedEvents:YES];
         [normalWindow setTitle:@"QEMU"];
         [normalWindow setContentView:cocoaView];
@@ -2123,6 +2288,58 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_clipboard_peer_register(&cbpeer);
 }
 
+static void cocoa_mouse_set(DisplayChangeListener *dcl, int x, int y, int on) {
+    dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView mouseSetX:x Y:y on:on];
+    });
+}
+
+// Convert QEMUCursor to NSCursor, then call cursorDefine
+static void cocoa_cursor_define(DisplayChangeListener *dcl, QEMUCursor *cursor) {
+    CFDataRef cfdata = CFDataCreate(
+        /*allocator*/ NULL,
+        /*bytes*/ (void *)cursor->data,
+        /*length*/ sizeof(uint32_t) * cursor->width * cursor->height);
+
+    CGDataProviderRef dataprovider = CGDataProviderCreateWithCFData(cfdata);
+
+    CGImageRef cgimage = CGImageCreate(
+        cursor->width, cursor->height,
+        /*bitsPerComponent*/ 8,
+        /*bitsPerPixel*/ 32,
+        /*bytesPerRow*/ sizeof(uint32_t) * cursor->width,
+        /*colorspace*/ CGColorSpaceCreateWithName(kCGColorSpaceSRGB),
+        /*bitmapInfo*/ kCGBitmapByteOrder32Host | kCGImageAlphaLast,
+        /*provider*/ dataprovider,
+        /*decode*/ NULL,
+        /*shouldInterpolate*/ FALSE,
+        /*intent*/ kCGRenderingIntentDefault);
+
+    NSImage *unscaled = [[NSImage alloc] initWithCGImage:cgimage size:NSZeroSize];
+
+    CFRelease(cfdata);
+    CGDataProviderRelease(dataprovider);
+    CGImageRelease(cgimage);
+
+    // Nearest-neighbor scale to the possibly "Retina" cursor size
+    NSImage *scaled = [NSImage
+        imageWithSize:NSMakeSize(cursor->width, cursor->height)
+        flipped:NO
+        drawingHandler:^BOOL(NSRect dest) {
+            [NSGraphicsContext currentContext].imageInterpolation = NSImageInterpolationNone;
+            [unscaled drawInRect:dest];
+            return YES;
+        }];
+
+    NSCursor *nscursor = [[NSCursor alloc]
+        initWithImage:scaled
+        hotSpot:NSMakePoint(cursor->hot_x, cursor->hot_y)];
+
+    dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView cursorDefine:nscursor];
+    });
+}
+
 static QemuDisplay qemu_display_cocoa = {
     .type       = DISPLAY_TYPE_COCOA,
     .init       = cocoa_display_init,

