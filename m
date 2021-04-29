Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A936F343
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 02:49:31 +0200 (CEST)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHLW-0004ao-1f
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 20:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNq-0003Z3-L6
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNm-0007dS-Ib
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E3055C00E0;
 Thu, 29 Apr 2021 19:47:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Apr 2021 19:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=+UHQmShk/9
 uBSP5zRHcNmBIM4hq62zux78UOIbsrsgE=; b=NxxkKYbx3U9/XTPuAVMIfXeBEs
 tbDSxkOHxp+aNuH7SNwv7AnHhL1s+cDaR9Pgt4iusbVgE2NXALpmIP95bg+QZIBz
 WG+Kr67cw2bQreUXMLDFvPiZ9juK165VcjEyrIIlusD08nfwUEg66JFidzyBr2Gn
 iEhzhBoCWcCx6jsVk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+UHQmShk/9uBSP5zRHcNmBIM4hq62zux78UOIbsrsgE=; b=HmStJk4z
 vSVdjC/8sRz1UexShck8IsOkcyDjY0S5SOCufe4WKobL17X2/Fr34z/p3LvEgtA/
 1mg7e1VUuRpyXlOZhuQyuXg0cV1Md8u717TcS9Zhx060n/oX7WD7ZkQKM7AA/hlp
 VdpJ0N3lFOLvHZzT5hV6K5G+0WxBbhALzTGDnFbr28Tn7/29WVc64oDbxoW2xyH8
 DwvQKhp3e1L+XNIHFuXFbkV3LKBCf/kMMxhfrfN0O6WGN/GMkjxKK5xGyHlmtmvp
 XOD4SbSuY3+K9s888ZORT7s+0TvMOWqqqzikRm9tVBFEhZYrrX4hLtYTG4wAldX0
 kDRON7msYqmQdw==
X-ME-Sender: <xms:oUWLYA4OzpeiCRZ3OH-yeZA_JpLZuQis3MSBsSXVEs7DCEQkcvoDtA>
 <xme:oUWLYB6sOiQCooVxBTOF7uGliqmMgkDS7aTvW-NipEMUxawPzGuG_bG1aacxUqQLZ
 ua_wqLbv8HwXVuN9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgr
 vhhosehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeevhfdvjeelve
 etiedutdfhleegleffkeffjefgtdeggfekheehledttdffvdelleenucffohhmrghinhep
 rghpphhlvgdrtghomhenucfkphepvddtuddrkedtrddurdeinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhh
 rgdrvghtihdrsghr
X-ME-Proxy: <xmx:oUWLYPeUpsqfuOpR258DX84zrriR29k7bB8kqhxtWptGkL27cIiBXw>
 <xmx:oUWLYFLDWr2NIlNZ17z1RDrpNNnflD0WhLvQCTD4Fh1K22iYXGo3mA>
 <xmx:oUWLYEKa_JJ5tGn-fST_2F2iGoDato3zprAZCmL8AHhXCN_hPzCDUQ>
 <xmx:oUWLYI3dB8jy694gddqQLPSCe0y2cVhsF58RSmyqHDvuLzp6ki9Fow>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 19:47:43 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Thu, 29 Apr 2021 20:47:04 -0300
Message-Id: <20210429234705.83206-2-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210429234705.83206-1-gustavo@noronha.eti.br>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=gustavo@noronha.eti.br;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Apr 2021 20:48:06 -0400
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

Applications such as Gnome may use Alt-Tab and Super-Tab for different
purposes, some use Ctrl-arrows so we want to allow qemu to handle
everything when it captures the mouse/keyboard.

However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
at an earlier part of the event handling chain, not letting qemu see it.

We add a global Event Tap that allows qemu to see all events when the
mouse is grabbed. Note that this requires additional permissions.

See:

https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
https://support.apple.com/en-in/guide/mac-help/mh32356/mac

Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
---
 qapi/ui.json    | 15 ++++++++++
 qemu-options.hx |  3 ++
 ui/cocoa.m      | 73 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..77bc00fd0d 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1088,6 +1088,20 @@
 { 'struct'  : 'DisplayCurses',
   'data'    : { '*charset'       : 'str' } }
 
+##
+# @DisplayCocoa:
+#
+# Cocoa display options.
+#
+# @full-grab:       Capture all key presses, including system combos. This
+#                   requires accessibility permissions, since it performs
+#                   a global grab on key events. (default: off)
+#                   See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+#
+##
+{ 'struct'  : 'DisplayCocoa',
+  'data'    : { '*full-grab'     : 'bool' } }
+
 ##
 # @DisplayType:
 #
@@ -1153,6 +1167,7 @@
                 '*gl'            : 'DisplayGLMode' },
   'discriminator' : 'type',
   'data'    : { 'gtk'            : 'DisplayGTK',
+                'cocoa'          : 'DisplayCocoa',
                 'curses'         : 'DisplayCurses',
                 'egl-headless'   : 'DisplayEGLHeadless'} }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd6..a77505241f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1783,6 +1783,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_CURSES)
     "-display curses[,charset=<encoding>]\n"
 #endif
+#if defined(CONFIG_COCOA)
+    "-display cocoa[,full_grab=on|off]\n"
+#endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
 #endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 37e1fb52eb..f1e4449082 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -72,6 +72,7 @@
 typedef struct {
     int width;
     int height;
+    bool full_grab;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -304,11 +305,13 @@ @interface QemuCocoaView : NSView
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
+    CFMachPortRef eventsTap;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
 - (void) ungrabMouse;
 - (void) toggleFullScreen:(id)sender;
+- (void) setFullGrab:(id)sender to:(BOOL)value;
 - (void) handleMonitorInput:(NSEvent *)event;
 - (bool) handleEvent:(NSEvent *)event;
 - (bool) handleEventLocked:(NSEvent *)event;
@@ -323,6 +326,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
+- (BOOL) isFullGrabEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -331,6 +335,19 @@ - (void) raiseAllKeys;
 
 QemuCocoaView *cocoaView;
 
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = (QemuCocoaView*) userInfo;
+    NSEvent* event = [NSEvent eventWithCGEvent:cgEvent];
+    if ([cocoaView isFullGrabEnabled] && [cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
+        COCOA_DEBUG("Global events tap: qemu handled the event, capturing!\n");
+        return NULL;
+    }
+    COCOA_DEBUG("Global events tap: qemu did not handle the event, letting it through...\n");
+
+    return cgEvent;
+}
+
 @implementation QemuCocoaView
 - (id)initWithFrame:(NSRect)frameRect
 {
@@ -344,6 +361,32 @@ - (id)initWithFrame:(NSRect)frameRect
         kbd = qkbd_state_init(dcl.con);
 
     }
+
+    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) | CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
+    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
+                                 mask, handleTapEvent, self);
+    if (!eventsTap) {
+        warn_report("Could not create event tap, system key combos will not be captured.\n");
+        return self;
+    } else {
+        COCOA_DEBUG("Global events tap created! Will capture system key combos.\n");
+    }
+
+    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
+    if (!runLoop) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return self;
+    }
+
+    CFRunLoopSourceRef tapEventsSrc = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
+    if (!tapEventsSrc ) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return self;
+    }
+
+    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
+    CFRelease(tapEventsSrc);
+
     return self;
 }
 
@@ -356,6 +399,11 @@ - (void) dealloc
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -593,6 +641,13 @@ - (void) toggleFullScreen:(id)sender
     }
 }
 
+- (void) setFullGrab:(id)sender to:(BOOL)value
+{
+    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
+
+    screen.full_grab = value;
+}
+
 - (void) toggleKey: (int)keycode {
     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
@@ -1029,6 +1084,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 }
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
+- (BOOL) isFullGrabEnabled {return screen.full_grab;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1208,6 +1264,13 @@ - (void)toggleFullScreen:(id)sender
     [cocoaView toggleFullScreen:sender];
 }
 
+- (void) setFullGrab:(id)sender to:(BOOL)value
+{
+    COCOA_DEBUG("QemuCocoaAppController: setFullGrab\n");
+
+    [cocoaView setFullGrab:sender to:value];
+}
+
 /* Tries to find then open the specified filename */
 - (void) openDocumentation: (NSString *) filename
 {
@@ -1877,16 +1940,22 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    QemuCocoaAppController* controller = (QemuCocoaAppController *)[NSApplication sharedApplication];
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
             [NSApp activateIgnoringOtherApps: YES];
-            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
+            [[controller delegate] toggleFullScreen: nil];
+        });
+    }
+    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [[controller delegate] setFullGrab: nil to:opts->u.cocoa.full_grab];
         });
     }
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
-    }
+    };
 
     // register vga output callbacks
     register_displaychangelistener(&dcl);
-- 
2.24.3 (Apple Git-128)


