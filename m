Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E05F4773
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkhN-0005aS-Jr
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofk19-0007q6-4G
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:35 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofk16-0008Kd-Cw
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:34 -0400
Received: by mail-ej1-x634.google.com with SMTP id a26so29732784ejc.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=PELy/FQMLvxpRyIm93Sxn5CNGkIc/mFFIOCF9rY/AQI=;
 b=OR3rNvXGFquj6z6sd+WNX0DwV46deZtIv/BAgjjG3rzw9Q6+EOxcS/k+zIY2TVAgal
 /2zZ4ebhqhZQkq2pRO/ds0HoMStbpP65Kud/T9YZ70m6mDjxlWNTis+h1+26UWkOlndU
 iSwGxqNJOi39n/htoSbCTWCK4sbSOI9b6lrH39NrtjJepJChOXg2Qh5KtQgipZgSW8Qs
 ICvXbtyjo6I0Alkoq1DNsc0QYUmiIgfTxPkzgCWy1paIm2XpGkg0Zwg9Yne8AOPoRbHJ
 KV/jhZdglc5hF/zMX6D2F1ypTw+lIriuZ0Tm8mgBmsNUe+euRCNR16hT/U7p1FZk7fz8
 Vgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PELy/FQMLvxpRyIm93Sxn5CNGkIc/mFFIOCF9rY/AQI=;
 b=XUESzz8jImOZScAolW8i/J1kiZEM1JmoIg1yQXwbArcuAzgoh/QnWJfEn5140Pg4Td
 xFGkWjk2jKn5NOMB0tXxk53A+8lbmsxfxv/xfz0YxdhXoGhILvwfQboJwyEfhy2qgIs6
 zMEEkZapa2iBT2Os+R31dxn5quD5j8BoLTBW565tWdyCHXVa8gHUJgK+vnsjMBBPDZ40
 AwVdFqSiRcspD2w1UPK4uGp+ef4HICP6uBl2ikavhjTTbebF7yre7mRcKYxWK2MFvG3i
 4lMj8nYytXcCCaGM6K+I6fUzF+DQy287nlF+leI4WQcujeoQW5a8c6iG5cpb88Y6Qd6g
 vttw==
X-Gm-Message-State: ACrzQf0WD75dNqtww9M/uKhoIYFM+daKPifhyPhO0Cc6oBQsdf94odPp
 1jRiM9xk+ND2rXlFVZxoJJhEuJcS3U905mA4GkmvNw==
X-Google-Smtp-Source: AMsMyM4bVRK23EJgLngls/nzytf1KCmXI1HD87Dn5TMkTJFLhqs5pjeIsNwRoZl/s7A+5Vl9DiUwHO5OjjaUing98vg=
X-Received: by 2002:a17:906:8a66:b0:78b:da52:b752 with SMTP id
 hy6-20020a1709068a6600b0078bda52b752mr7517551ejc.365.1664897969839; Tue, 04
 Oct 2022 08:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
In-Reply-To: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 16:39:18 +0100
Message-ID: <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
To: Elliot Nunn <elliot@nunn.io>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ccing Akihiko to see if he wants to review this cocoa ui frontend
patch.

also available at:
https://lore.kernel.org/qemu-devel/54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com/

I can confirm that the patch does build, but I don't have any
interesting graphics-using test images to hand to test with.

thanks
-- PMM

On Thu, 4 Aug 2022 at 07:28, Elliot Nunn <elliot@nunn.io> wrote:
>
> Implement dpy_cursor_define() and dpy_mouse_set() on macOS.
>
> The main benefit is from dpy_cursor_define: in absolute pointing mode, the
> host can redraw the cursor on the guest's behalf much faster than the guest
> can itself.
>
> To provide the programmatic movement expected from a hardware cursor,
> dpy_mouse_set is also implemented.
>
> Tricky cases are handled:
> - dpy_mouse_set() avoids rounded window corners.
> - The sometimes-delay between warping the cursor and an affected mouse-move
>   event is accounted for.
> - Cursor bitmaps are nearest-neighbor scaled to Retina size.
>
> Signed-off-by: Elliot Nunn <elliot@nunn.io>
> ---
>  ui/cocoa.m | 263 ++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 240 insertions(+), 23 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 5a8bd5dd84..f9d54448e4 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -85,12 +85,20 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>
>  static void cocoa_refresh(DisplayChangeListener *dcl);
>
> +static void cocoa_mouse_set(DisplayChangeListener *dcl,
> +                            int x, int y, int on);
> +
> +static void cocoa_cursor_define(DisplayChangeListener *dcl,
> +                                QEMUCursor *c);
> +
>  static NSWindow *normalWindow;
>  static const DisplayChangeListenerOps dcl_ops = {
>      .dpy_name          = "cocoa",
>      .dpy_gfx_update = cocoa_update,
>      .dpy_gfx_switch = cocoa_switch,
>      .dpy_refresh = cocoa_refresh,
> +    .dpy_mouse_set = cocoa_mouse_set,
> +    .dpy_cursor_define = cocoa_cursor_define,
>  };
>  static DisplayChangeListener dcl = {
>      .ops = &dcl_ops,
> @@ -313,6 +321,13 @@ @interface QemuCocoaView : NSView
>      BOOL isFullscreen;
>      BOOL isAbsoluteEnabled;
>      CFMachPortRef eventsTap;
> +    NSCursor *guestCursor;
> +    BOOL cursorHiddenByMe;
> +    BOOL guestCursorVis;
> +    int guestCursorX, guestCursorY;
> +    int lastWarpX, lastWarpY;
> +    int warpDeltaX, warpDeltaY;
> +    BOOL ignoreNextMouseMove;
>  }
>  - (void) switchSurface:(pixman_image_t *)image;
>  - (void) grabMouse;
> @@ -323,6 +338,10 @@ - (void) handleMonitorInput:(NSEvent *)event;
>  - (bool) handleEvent:(NSEvent *)event;
>  - (bool) handleEventLocked:(NSEvent *)event;
>  - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
> +- (void) cursorDefine:(NSCursor *)cursor;
> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on;
> +- (void) setCursorAppearance;
> +- (void) setCursorPosition;
>  /* The state surrounding mouse grabbing is potentially confusing.
>   * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the emulated
>   *   pointing device an absolute-position one?"], but is only updated on
> @@ -432,22 +451,6 @@ - (CGPoint) screenLocationOfEvent:(NSEvent *)ev
>      }
>  }
>
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
>  - (void) drawRect:(NSRect) rect
>  {
>      COCOA_DEBUG("QemuCocoaView: drawRect\n");
> @@ -635,6 +638,8 @@ - (void) switchSurface:(pixman_image_t *)image
>          screen.height = h;
>          [self setContentDimensions];
>          [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> +        [self setCursorAppearance];
> +        [self setCursorPosition];
>      }
>
>      // update screenBuffer
> @@ -681,6 +686,7 @@ - (void) toggleFullScreen:(id)sender
>              styleMask:NSWindowStyleMaskBorderless
>              backing:NSBackingStoreBuffered
>              defer:NO];
> +        [fullScreenWindow disableCursorRects];
>          [fullScreenWindow setAcceptsMouseMovedEvents: YES];
>          [fullScreenWindow setHasShadow:NO];
>          [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
> @@ -812,6 +818,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>      int buttons = 0;
>      int keycode = 0;
>      bool mouse_event = false;
> +    bool mousemoved_event = false;
>      // Location of event in virtual screen coordinates
>      NSPoint p = [self screenLocationOfEvent:event];
>      NSUInteger modifiers = [event modifierFlags];
> @@ -1023,6 +1030,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>                  }
>              }
>              mouse_event = true;
> +            mousemoved_event = true;
>              break;
>          case NSEventTypeLeftMouseDown:
>              buttons |= MOUSE_EVENT_LBUTTON;
> @@ -1039,14 +1047,17 @@ - (bool) handleEventLocked:(NSEvent *)event
>          case NSEventTypeLeftMouseDragged:
>              buttons |= MOUSE_EVENT_LBUTTON;
>              mouse_event = true;
> +            mousemoved_event = true;
>              break;
>          case NSEventTypeRightMouseDragged:
>              buttons |= MOUSE_EVENT_RBUTTON;
>              mouse_event = true;
> +            mousemoved_event = true;
>              break;
>          case NSEventTypeOtherMouseDragged:
>              buttons |= MOUSE_EVENT_MBUTTON;
>              mouse_event = true;
> +            mousemoved_event = true;
>              break;
>          case NSEventTypeLeftMouseUp:
>              mouse_event = true;
> @@ -1121,7 +1132,12 @@ - (bool) handleEventLocked:(NSEvent *)event
>              qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
>              last_buttons = buttons;
>          }
> -        if (isMouseGrabbed) {
> +
> +        if (!isMouseGrabbed) {
> +            return false;
> +        }
> +
> +        if (mousemoved_event) {
>              if (isAbsoluteEnabled) {
>                  /* Note that the origin for Cocoa mouse coords is bottom left, not top left.
>                   * The check on screenContainsPoint is to avoid sending out of range values for
> @@ -1132,11 +1148,38 @@ - (bool) handleEventLocked:(NSEvent *)event
>                      qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
>                  }
>              } else {
> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
> +                if (ignoreNextMouseMove) {
> +                    // Discard the first mouse-move event after a grab, because
> +                    // it includes the warp delta from an unknown initial position.
> +                    ignoreNextMouseMove = NO;
> +                    warpDeltaX = warpDeltaY = 0;
> +                } else {
> +                    // Correct subsequent events to remove the known warp delta.
> +                    // The warp delta is sometimes late to be reported, so never
> +                    // allow the delta compensation to alter the direction.
> +                    int dX = (int)[event deltaX];
> +                    int dY = (int)[event deltaY];
> +
> +                    if (dX == 0 || (dX ^ (dX - warpDeltaX)) < 0) { // Flipped sign?
> +                        warpDeltaX -= dX; // Save excess correction for later
> +                        dX = 0;
> +                    } else {
> +                        dX -= warpDeltaX; // Apply entire correction
> +                        warpDeltaX = 0;
> +                    }
> +
> +                    if (dY == 0 || (dY ^ (dY - warpDeltaY)) < 0) {
> +                        warpDeltaY -= dY;
> +                        dY = 0;
> +                    } else {
> +                        dY -= warpDeltaY;
> +                        warpDeltaY = 0;
> +                    }
> +
> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, dX);
> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, dY);
> +                }
>              }
> -        } else {
> -            return false;
>          }
>          qemu_input_event_sync();
>      }
> @@ -1153,9 +1196,15 @@ - (void) grabMouse
>          else
>              [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
>      }
> -    [self hideCursor];
>      CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>      isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
> +    [self setCursorAppearance];
> +    [self setCursorPosition];
> +
> +    // We took over and warped the mouse, so ignore the next mouse-move
> +    if (!isAbsoluteEnabled) {
> +        ignoreNextMouseMove = YES;
> +    }
>  }
>
>  - (void) ungrabMouse
> @@ -1168,9 +1217,14 @@ - (void) ungrabMouse
>          else
>              [normalWindow setTitle:@"QEMU"];
>      }
> -    [self unhideCursor];
>      CGAssociateMouseAndMouseCursorPosition(TRUE);
>      isMouseGrabbed = FALSE;
> +    [self setCursorAppearance];
> +
> +    if (!isAbsoluteEnabled) {
> +        ignoreNextMouseMove = NO;
> +        warpDeltaX = warpDeltaY = 0;
> +    }
>  }
>
>  - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> @@ -1179,6 +1233,116 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>          CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>      }
>  }
> +
> +// Indirectly called by dpy_cursor_define() in the virtual GPU
> +- (void) cursorDefine:(NSCursor *)cursor {
> +    guestCursor = cursor;
> +    [self setCursorAppearance];
> +}
> +
> +// Indirectly called by dpy_mouse_set() in the virtual GPU
> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on {
> +    if (!on != !guestCursorVis) {
> +        guestCursorVis = on;
> +        [self setCursorAppearance];
> +    }
> +
> +    if (on && (x != guestCursorX || y != guestCursorY)) {
> +        guestCursorX = x;
> +        guestCursorY = y;
> +        [self setCursorPosition];
> +    }
> +}
> +
> +// Change the cursor image to the default, the guest cursor bitmap or hidden.
> +// Said to be an expensive operation on macOS Monterey, so use sparingly.
> +- (void) setCursorAppearance {
> +    NSCursor *cursor = NULL; // NULL means hidden
> +
> +    if (!isMouseGrabbed) {
> +        cursor = [NSCursor arrowCursor];
> +    } else if (!guestCursor && !cursor_hide) {
> +        cursor = [NSCursor arrowCursor];
> +    } else if (guestCursorVis && guestCursor) {
> +        cursor = guestCursor;
> +    } else {
> +        cursor = NULL;
> +    }
> +
> +    if (cursor != NULL) {
> +        [cursor set];
> +
> +        if (cursorHiddenByMe) {
> +            [NSCursor unhide];
> +            cursorHiddenByMe = NO;
> +        }
> +    } else {
> +        if (!cursorHiddenByMe) {
> +            [NSCursor hide];
> +            cursorHiddenByMe = YES;
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
> +    // Get guest screen rect in Cocoa coordinates (bottom-left origin).
> +    NSRect virtualScreen = [[self window] convertRectToScreen:[self frame]];
> +
> +    // Convert to top-left origin.
> +    NSInteger hostScreenH = [NSScreen screens][0].frame.size.height;
> +    int scrX = virtualScreen.origin.x;
> +    int scrY = hostScreenH - virtualScreen.origin.y - virtualScreen.size.height;
> +    int scrW = virtualScreen.size.width;
> +    int scrH = virtualScreen.size.height;
> +
> +    int cursX = scrX + guestCursorX;
> +    int cursY = scrY + guestCursorY;
> +
> +    // Clip to edges
> +    cursX = MIN(MAX(scrX, cursX), scrX + scrW - 1);
> +    cursY = MIN(MAX(scrY, cursY), scrY + scrH - 1);
> +
> +    // Move diagonally towards the center to avoid rounded window corners.
> +    // Limit the number of hit-tests and discard failed attempts.
> +    int betterX = cursX, betterY = cursY;
> +    for (int i=0; i<16; i++) {
> +        if ([NSWindow windowNumberAtPoint:NSMakePoint(betterX, hostScreenH - betterY)
> +            belowWindowWithWindowNumber:0] == self.window.windowNumber) {
> +            cursX = betterX;
> +            cursY = betterY;
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
> +    // These are in down-is-positive coords, same as NSEvent deltaX/deltaY.
> +    warpDeltaX += cursX - lastWarpX;
> +    warpDeltaY += cursY - lastWarpY;
> +
> +    CGWarpMouseCursorPosition(NSMakePoint(cursX, cursY));
> +
> +    lastWarpX = cursX;
> +    lastWarpY = cursY;
> +}
> +
>  - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
>  - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
>  - (float) cdx {return cdx;}
> @@ -1251,6 +1415,7 @@ - (id) init
>              error_report("(cocoa) can't create window");
>              exit(1);
>          }
> +        [normalWindow disableCursorRects];
>          [normalWindow setAcceptsMouseMovedEvents:YES];
>          [normalWindow setTitle:@"QEMU"];
>          [normalWindow setContentView:cocoaView];
> @@ -2123,6 +2288,58 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>      qemu_clipboard_peer_register(&cbpeer);
>  }
>
> +static void cocoa_mouse_set(DisplayChangeListener *dcl, int x, int y, int on) {
> +    dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView mouseSetX:x Y:y on:on];
> +    });
> +}
> +
> +// Convert QEMUCursor to NSCursor, then call cursorDefine
> +static void cocoa_cursor_define(DisplayChangeListener *dcl, QEMUCursor *cursor) {
> +    CFDataRef cfdata = CFDataCreate(
> +        /*allocator*/ NULL,
> +        /*bytes*/ (void *)cursor->data,
> +        /*length*/ sizeof(uint32_t) * cursor->width * cursor->height);
> +
> +    CGDataProviderRef dataprovider = CGDataProviderCreateWithCFData(cfdata);
> +
> +    CGImageRef cgimage = CGImageCreate(
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
> +    NSImage *unscaled = [[NSImage alloc] initWithCGImage:cgimage size:NSZeroSize];
> +
> +    CFRelease(cfdata);
> +    CGDataProviderRelease(dataprovider);
> +    CGImageRelease(cgimage);
> +
> +    // Nearest-neighbor scale to the possibly "Retina" cursor size
> +    NSImage *scaled = [NSImage
> +        imageWithSize:NSMakeSize(cursor->width, cursor->height)
> +        flipped:NO
> +        drawingHandler:^BOOL(NSRect dest) {
> +            [NSGraphicsContext currentContext].imageInterpolation = NSImageInterpolationNone;
> +            [unscaled drawInRect:dest];
> +            return YES;
> +        }];
> +
> +    NSCursor *nscursor = [[NSCursor alloc]
> +        initWithImage:scaled
> +        hotSpot:NSMakePoint(cursor->hot_x, cursor->hot_y)];
> +
> +    dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView cursorDefine:nscursor];
> +    });
> +}
> +
>  static QemuDisplay qemu_display_cocoa = {
>      .type       = DISPLAY_TYPE_COCOA,
>      .init       = cocoa_display_init,

