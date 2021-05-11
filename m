Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7320137AEEB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:58:18 +0200 (CEST)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXaD-0004QZ-Ig
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXY4-00007e-TH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:04 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXY0-0005RS-Qs
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:04 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0B8811714;
 Tue, 11 May 2021 14:55:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 May 2021 14:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=D2T8NY1H7D
 NsJIBk09fp01HKORi2P63E6m7ppSDfpZk=; b=WaS+wRoMPXdMBcyE1Jo5PfuJC5
 Do0BOtcWZR2gqOcw8yeLTJYnrekv09NfKcYevOUeQKx232HJR1RfBJGY3irXQ3qc
 s+wkPRbdF2IxE5a1tZ8a3NI5toFEFktHaPQmomKDldUZtTL7jeVb9B1OjMCa0Vk5
 K0NiStfe5Z2Qbd1Bc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=D2T8NY1H7DNsJIBk09fp01HKORi2P63E6m7ppSDfpZk=; b=LEDRLijk
 93XmwAzNFRN/0ZhiYZDYl+P/CdFf/1DY108TR+jJAcTHfWR/5eQmKBXDuqVDL+PH
 netUDfJt8F6tufyOMinNGrktDZYJgfUaOovrsYX83DFt+g5tWmoM7NrBqyDBQePK
 m/qM0zx1V0S2KJY1DkYxlwdbpZlDMa0r+LSIvIndGTUUAHgsnwwpnYk/vR/fPdIe
 iTXuDX+BS259zxvs3Wamo87hm+BTpv9uK2yMjfLOFNMm8qlTE7GIYhNBWnWBZHRu
 c03h+FcO0RINEaQlV0BCVLSq2ilOvCWEaDpQ6LbKD++kLNHbCa9lTzkGspS3zZO1
 gaZ9lLZv2D1T0w==
X-ME-Sender: <xms:PdOaYNLvXyziAxXOi2sG71n0GulwkdR1R7FLo3CQUE5xZ7sexV4BVA>
 <xme:PdOaYJLk3Y-dN3YwDroM5KZD-XeqWfZU703vnKRR0wB7GXJ8MuMWwPOgpffUBgA1L
 HmIlvd_1IdRy-SqyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepghhushht
 rghvohesnhhorhhonhhhrgdrvghtihdrsghrnecuggftrfgrthhtvghrnhepvefhvdejle
 evteeiuddthfelgeelffekffejgfdtgefgkeehheeltddtffdvleelnecuffhomhgrihhn
 pegrphhplhgvrdgtohhmnecukfhppedvtddurdektddruddrieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehguhhsthgrvhhosehnohhrohhn
 hhgrrdgvthhirdgsrh
X-ME-Proxy: <xmx:PdOaYFvWzeYb--xFz9OGkWLZp6vjDamp13HK5a2eTn1RdfNM6oekQA>
 <xmx:PdOaYOZyAf8pB5fpTciPkGh7IXGB8M1sbbEAfYyqXQwqYtVyBRqxUg>
 <xmx:PdOaYEZUJH3V4VL9MZry7mqeBFxiMRXJBLp0ctBSMjW4LoMUF_R1hA>
 <xmx:PdOaYDxPiWj-qsPWnQqB0mid49dErFo3mc68KLbNcf9qAgI3HLHXvg>
Received: from localhost.localdomain (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 14:55:54 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Tue, 11 May 2021 15:55:37 -0300
Message-Id: <20210511185538.29344-2-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210511185538.29344-1-gustavo@noronha.eti.br>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=gustavo@noronha.eti.br; helo=wout5-smtp.messagingengine.com
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
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>,
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
 qapi/ui.json    | 16 ++++++++++++
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 83 insertions(+), 1 deletion(-)

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
index 7c825f81fc..eeaa5c73e9 100644
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
index 37e1fb52eb..236352deac 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -304,11 +304,13 @@ @interface QemuCocoaView : NSView
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
@@ -331,6 +333,19 @@ - (void) raiseAllKeys;
 
 QemuCocoaView *cocoaView;
 
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = (QemuCocoaView*) userInfo;
+    NSEvent* event = [NSEvent eventWithCGEvent:cgEvent];
+    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
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
@@ -356,6 +371,11 @@ - (void) dealloc
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -593,6 +613,36 @@ - (void) toggleFullScreen:(id)sender
     }
 }
 
+- (void) setFullGrab:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
+
+    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) | CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
+    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
+                                 mask, handleTapEvent, self);
+    if (!eventsTap) {
+        warn_report("Could not create event tap, system key combos will not be captured.\n");
+        return;
+    } else {
+        COCOA_DEBUG("Global events tap created! Will capture system key combos.\n");
+    }
+
+    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
+    if (!runLoop) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return;
+    }
+
+    CFRunLoopSourceRef tapEventsSrc = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
+    if (!tapEventsSrc ) {
+        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
+        return;
+    }
+
+    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
+    CFRelease(tapEventsSrc);
+}
+
 - (void) toggleKey: (int)keycode {
     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
@@ -1208,6 +1258,13 @@ - (void)toggleFullScreen:(id)sender
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
@@ -1877,11 +1934,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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
2.30.1 (Apple Git-130)


