Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330304D9C02
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:17:15 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU734-0000sU-3s
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:17:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jF-0006Ge-DF
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:46 -0400
Received: from [2607:f8b0:4864:20::102c] (port=52925
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jD-0008Ok-Iy
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:45 -0400
Received: by mail-pj1-x102c.google.com with SMTP id v4so17760828pjh.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cp2luTFte3kbxSMNp6E3C1qzy0FoiKBclAzxIMfHyn0=;
 b=cXJ2C+NQQ50S+HtaBaKXHh+m38R02OGuiJrL5TF257tUKAfloqT3OszKD97rP2jJZ5
 TditMYQ5fa1AQEukxw4B9pNYDYZfiESWz2ojUnoaWstZzyBW34BdKB4OlP6ZsWx/1rBV
 XjYCdpuwwnQeWTxQSEivMJi+ERi5LpeRTvd/9+6RS9gxl0p5ARkNIuwgmGnfgMv7ZPXc
 baYy1CNDtzaVHoEW6cOUtlUSu4gzZ+h3eeHL9xn2dpo2S4aXIqMMlCd70AAPu2IzkiBi
 gEqkIQ11smxHAuSnb7q1J22wiEhabVlZ8Ofw+tw+cOEXpwD8HDc6ZJz2kkABJgIjcLHj
 H1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cp2luTFte3kbxSMNp6E3C1qzy0FoiKBclAzxIMfHyn0=;
 b=s6D7yTZnKmwJqPwJE5g1jWqAE3VV1kS03BeOvbarqo8tHhQk6aCwJgyQvoePyFJ3F2
 spmTmyzsQuohBvY3bVp3RKPXlA3/tM2G1rpYJzWxjmu59/ANsN5jpT0KkmbkxH0kjG3r
 HedgzrjYOY8A5V/KPnzG42B5UpLlYhVv1U/M2rS+0MW6apkwKNUh6TjqZyusVbIBunE+
 /BDhmj6CmhvO4NhJqFOeTLIhqF/iuRGqAQ8hGxUeNFcM+NFVVgkd4Qi9vYH4P6JX0Z4L
 qv3xRLXq6xjyJOG6pExUW+mJAMi1yDk2/41Itd5v9yLx9A+wN6Dx4IyZKTgbhY6Y4JuK
 +9Lg==
X-Gm-Message-State: AOAM532OEZJa6V0hQv1WbAOMt5rpo43JcGQVdZ+Zgz54XG3S/VcPuyJE
 tJncD75LKmpmdY8DoGrLXCXb72Ttqc0=
X-Google-Smtp-Source: ABdhPJzZ8HPGQqTEly/k39RI+5sSPYQctQNdaMu79YJWYnAyw7SbEcxOpFApoea3PAnNohwcSzYXtQ==
X-Received: by 2002:a17:90a:4f0b:b0:1be:e320:3e62 with SMTP id
 p11-20020a17090a4f0b00b001bee3203e62mr4452674pjh.124.1647349002075; 
 Tue, 15 Mar 2022 05:56:42 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mt15-20020a17090b230f00b001bf191e6f08sm3140247pjb.9.2022.03.15.05.56.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] ui/cocoa: capture all keys and combos when mouse is
 grabbed
Date: Tue, 15 Mar 2022 13:53:48 +0100
Message-Id: <20220315125350.82452-20-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

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
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220306121119.45631-2-akihiko.odaki@gmail.com>
Reviewed-by: Will Cohen <wwcohen@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/ui.json    |  8 +++++-
 qemu-options.hx |  3 +++
 ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4dea35a819..1d60d5fc78 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1270,11 +1270,17 @@
 #                    host without sending this key to the guest when
 #                    "off". Defaults to "on"
 #
+# @full-grab: Capture all key presses, including system combos. This
+#             requires accessibility permissions, since it performs
+#             a global grab on key events. (default: off)
+#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+#
 # Since: 7.0
 ##
 { 'struct': 'DisplayCocoa',
   'data': {
-      '*left-command-key': 'bool'
+      '*left-command-key': 'bool',
+      '*full-grab': 'bool'
   } }
 
 ##
diff --git a/qemu-options.hx b/qemu-options.hx
index f464b2fe27..4395378bb8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1916,6 +1916,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
index d20c74d938..b1250b7408 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -309,11 +309,13 @@ static void handleAnyDeviceErrors(Error * err)
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
@@ -336,6 +338,19 @@ static void handleAnyDeviceErrors(Error * err)
 
 QemuCocoaView *cocoaView;
 
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = userInfo;
+    NSEvent *event = [NSEvent eventWithCGEvent:cgEvent];
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
@@ -361,6 +376,11 @@ QemuCocoaView *cocoaView;
     }
 
     qkbd_state_free(kbd);
+
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+
     [super dealloc];
 }
 
@@ -655,6 +675,36 @@ QemuCocoaView *cocoaView;
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
@@ -1281,6 +1331,13 @@ QemuCocoaView *cocoaView;
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
@@ -1994,11 +2051,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
             [NSApp activateIgnoringOtherApps: YES];
-            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
+            [controller toggleFullScreen: nil];
+        });
+    }
+    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [controller setFullGrab: nil];
         });
     }
 
-- 
2.34.1


