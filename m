Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726753732C4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 01:35:52 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le4Zz-00054T-HQ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 19:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1le4X5-0002rA-4E
 for qemu-devel@nongnu.org; Tue, 04 May 2021 19:32:51 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1le4X3-0004lj-4x
 for qemu-devel@nongnu.org; Tue, 04 May 2021 19:32:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 96F9B5C003F;
 Tue,  4 May 2021 19:32:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 04 May 2021 19:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=8jmGEAv85D
 LzJzIloblsgJK2DiPtX2lRLHYelg1P8Ts=; b=DnKK66jOm/et1QfCgVVinmQr2v
 EUb2P20jjKaUKljm7mk24AF8CVQQesSTTu1725tQmF40ROnYSaXjauAkAu+APWU/
 zQXydwJYi5MFR1fMP6SsFVqUR3IB6saSq9imhljqPCBlHEX+SMtIS5m9zbnHhq4F
 i6cESR4e7qEcy2WnA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8jmGEAv85DLzJzIloblsgJK2DiPtX2lRLHYelg1P8Ts=; b=h+YC1k9N
 5yhb+PzkbEzUK+fKPxCx2JzL9WliGML3grDtJFtIw4bhvqT99GLbDDwp4xNU5fKy
 TvEPdcpFEzVURQFizCCoZFNWxNqLxTkCJobARZ5vJNNtGodDdKqOpzb1XNvg/aJM
 cTPC3zF8/L6Wx9siDjkxe4VqUdRB+74EHVPSLhmPILxgG7rp54Xjx33Py7jMm0b0
 FTu4hrzfuTmzRjSAJBYmknRRkc4H/yub5ZYlIe3rQ8ds6qDT7EKwnuKwcUgqBzPR
 DdY1GEgeKzR3yMJDOKsKAoUcczEm1j4HIZ0I33HmHmbtdeGrvc4g0C6c5QAJS9pj
 +aZ6vNGxdapHbw==
X-ME-Sender: <xms:n9mRYHTjV0jEITOPUPGfT4ODcctxQfh3QtS70fSbVldtNFt8mmkjCg>
 <xme:n9mRYIwsrFK-M-hXDmZQ4w9iNWP1ABgdotVy3PXqPTzm4Ft_PA11AdZmpcRLkan0j
 JTOT_o4ZanGjGcwCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefjedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgr
 vhhosehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeevhfdvjeelve
 etiedutdfhleegleffkeffjefgtdeggfekheehledttdffvdelleenucffohhmrghinhep
 rghpphhlvgdrtghomhenucfkphepvddtuddrkedtrddurdeinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhh
 rgdrvghtihdrsghr
X-ME-Proxy: <xmx:n9mRYM0XxVNTtukjyRGxdJQS85okWKWBmj78ZEKOtKwNwQhmkUGtbQ>
 <xmx:n9mRYHC8LLpMdRpKJAjrI12TOmGErAtfrLKYaF9MZTdzD4QXT2Z_RA>
 <xmx:n9mRYAig3IlHpy2ZIx1tS7cv6EDwTWIDDmt4uYk2Gvz2RAdmzX2KWA>
 <xmx:n9mRYIeN6hDE7VxuyfxHHDWa-Hc_E8d35d4iUPyYAhi2WZ-KtY88QA>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue,  4 May 2021 19:32:45 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Tue,  4 May 2021 20:32:31 -0300
Message-Id: <20210504233232.28423-2-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210504233232.28423-1-gustavo@noronha.eti.br>
References: <20210504233232.28423-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=gustavo@noronha.eti.br;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>
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
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 71 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)

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
index 37e1fb52eb..0a45ab30e6 100644
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
+- (void) setFullGrab:(id)sender;
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
 
+- (void) setFullGrab:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
+
+    screen.full_grab = true;
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
 
+- (void) setFullGrab:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaAppController: setFullGrab\n");
+
+    [cocoaView setFullGrab:sender];
+}
+
 /* Tries to find then open the specified filename */
 - (void) openDocumentation: (NSString *) filename
 {
@@ -1877,11 +1940,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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
+            [[controller delegate] setFullGrab: nil];
         });
     }
     if (opts->has_show_cursor && opts->show_cursor) {
-- 
2.24.3 (Apple Git-128)


