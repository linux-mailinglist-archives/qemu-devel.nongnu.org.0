Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2346370320
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:44:42 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcawD-0001OV-Of
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcaq7-00032o-GS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:23 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcapz-0002eZ-0f
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 52BA61DCA;
 Fri, 30 Apr 2021 17:38:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 30 Apr 2021 17:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=U78s1K6Mk0
 HaQ9NfTrza34rZqvuxpZF/YneeMMsbIUE=; b=MaYTZyv71NSjz2xQg8X4e7C4bp
 ZUOOP98oHixdddAtPR2SZTRhH12TlzQD3GE6cAzY3d0ggxXpyKPlP3kbco+K3HON
 JokvKVjOAEX32w+/MI6JeYRwUpbz1WWmsC9Vwj9fUC1jF7DGeY+jGGKS3IwmBbqi
 0LHXXNqaqQXsT9k8s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=U78s1K6Mk0HaQ9NfTrza34rZqvuxpZF/YneeMMsbIUE=; b=bquS0joe
 9ykrxxhVe/mM1nt/Yw1u9RgrBCjO7A5y8N+o0v96lY+ad6czzHe/99Q4DpTN43WY
 YtZ/MhdUvJ5zXmSgNtr1CgrWToHP09UuNr27IKGw8XuQ1Dm0ZWkWN3jcjglcdMKt
 SrujLFcxRk9+CMH0VpDHkINU2+NfcoZ4a68hb2JgGHVlKqCE2sf+BIa9gb3nHnI6
 FNA0JQ2TewZBKmE5Mw1J6yCnyd+EXNQVaHrKaiRWATLJk8wnQirKY2TTQTJdVCOo
 ado+8rmiZAAinlhwdiHEMmHt/3q2iau02qtsrZvLBgh0W9RvayR0n1a2uT3cnNAs
 1NgXPX6/WfZuow==
X-ME-Sender: <xms:xHiMYJzJHwTG39goQt7Yt7nYBlTssMRpv2RTt5tAkMviBG79JP15Hw>
 <xme:xHiMYJQbcby20NpdM9OVTqyk_4BM6a0awF05S4gvKxXeRWuytkVHvunQjPwmHaRTi
 5VHnaru67imZlp4TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgr
 vhhosehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeevhfdvjeelve
 etiedutdfhleegleffkeffjefgtdeggfekheehledttdffvdelleenucffohhmrghinhep
 rghpphhlvgdrtghomhenucfkphepvddtuddrkedtrddurdeinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhh
 rgdrvghtihdrsghr
X-ME-Proxy: <xmx:xHiMYDUOwJYJIozX6qFLTeMtezRfdWHid_ziXDphfFcrTSgvUTskjA>
 <xmx:xHiMYLgWSRBMDRqNRMhOE6gm1yFSt_VPZ776F5hQNSj7WIFs08QRQQ>
 <xmx:xHiMYLDAa1e3I6CzqIpU0NRiILSK3og3KN_Wnjbjz-lNRrk0wLqq-Q>
 <xmx:xHiMYOMzzBdu-KDQ2MgnKrCijG-ipALVJb2M1ZtxN8C0aq6lvGmzKw>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 17:38:11 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Fri, 30 Apr 2021 18:38:05 -0300
Message-Id: <20210430213806.81457-2-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210430213806.81457-1-gustavo@noronha.eti.br>
References: <20210430213806.81457-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.eti.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>
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

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
---
 qapi/ui.json    | 16 +++++++++++
 qemu-options.hx |  3 ++
 ui/cocoa.m      | 73 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..4ccfae4bbb 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1088,6 +1088,21 @@
 { 'struct'  : 'DisplayCurses',
   'data'    : { '*charset'       : 'str' } }
 
+##
+# @DisplayCocoa:
+#
+# Cocoa display options.
+#
+# @full-grab: Capture all key presses, including system combos. This
+#             requires accessibility permissions, since it performs
+#             a global grab on key events. (default: off)
+#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+#
+# Since: 6.1
+##
+{ 'struct'  : 'DisplayCocoa',
+  'data'    : { '*full-grab'     : 'bool' } }
+
 ##
 # @DisplayType:
 #
@@ -1153,6 +1168,7 @@
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


