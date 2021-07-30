Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625A3DBD84
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:11:57 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9W3A-0006NB-5Z
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1L-0004I7-Il
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:03 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1J-0000KC-O9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:03 -0400
Received: by mail-qt1-x831.google.com with SMTP id x9so6879738qtw.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U7uOpgKKbYlUukkr5zRFu+fDTpauB8ROnRQm7CX2yi0=;
 b=tbErCvpnZdH6CyKT7p27d1igTvX3ybyGVKZAIpLvy7+GJIPC0CcEQVXgdNOBPEoP04
 oDIZO7kVkkHUFQ+ZfBCYJenjaJ7B+QVFbcr9KIrVB+g+qYSJCuWZYcgskFgA2LBj5GFR
 EZqWCSxlVJg/ZW9SZqDX2gjZiig4h4MAZ2WKyKSK8HxUuPfoAF/sUXQoVXiSMGGByQP7
 N6qiWEG9F3DeKmTd2IoyOlHB1jsPw6Wqv1IITkpEOAKL9n7gis5Cd9chNtCZQOOSPEK0
 AYzPAOUSWM4ir+r86LInGIw6FB3/V6b4WJ7cV3HJetMXvyKqnsfukx3ktSoLZb3bWd1A
 BzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U7uOpgKKbYlUukkr5zRFu+fDTpauB8ROnRQm7CX2yi0=;
 b=Pn8rgpdh+jRdyLjscIFXNWRNhhVASN2o02BCXZz+LfUiUduQN9jlOjSSq+Wzm1Y6Qp
 4Gj26qBFk031HU8eztIIPJevFAmly7DCk5y8du6NEczVeA3SARjU5e8YZt7c0a5UvdTW
 qy4wUErcB8Ilj8sRdqbWjjoVXb5Z3GIzc1k0WhojjOQ1Rud8qK0R65yXxTst+sDLZSpD
 iw0xcstYN/hM5aANYZoS0uubR8w6U+ucN+gStIlYgusvOGrzBiAFVZQxxVYiLBuL4ZBt
 ZNo71DMZWdG7Wq22eM+2XPoQaEaykFelDtefQIijeSvUU7HBF5SpIh0Ln44oTM+Uty3A
 rB5Q==
X-Gm-Message-State: AOAM533YLCsMqfJLFxUUzlOGLL2bVKAO/gO/fOjyf1RcR2XI46sAONXi
 rPHrzv5j2skqA7MrJkTGmqY=
X-Google-Smtp-Source: ABdhPJwdnPcjQDb6y5yLKmF4Hu8YoQWDG0OL8Ul3EAeyZlp+j6W55hHSqnFWBat89zKbmtE4CjcbFg==
X-Received: by 2002:a05:622a:10d:: with SMTP id
 u13mr3215372qtw.314.1627665000797; 
 Fri, 30 Jul 2021 10:10:00 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id k15sm1227856qko.84.2021.07.30.10.10.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Jul 2021 10:10:00 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>,
 QEMU devel list <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] ui/cocoa.m: Add full keyboard grab support
Date: Fri, 30 Jul 2021 13:09:44 -0400
Message-Id: <20210730170945.4468-2-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210730170945.4468-1-programmingkidx@gmail.com>
References: <20210730170945.4468-1-programmingkidx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are keyboard shortcuts that are vital for use in a guest that runs Mac OS.
These shortcuts are reserved for Mac OS use only which makes having the guest
see them impossible on a Mac OS host - until now. This patch will enable the
user to decide if the guest should see all keyboard shortcuts using a menu item.
This patch adds a new menu called Options and a new menu item called
"Full Keyboard Grab". Simply selecting this menu item will turn the feature on
or off at any time. Mac OS requires the user to enable access to assistive
devices to use this feature. How to do this varies with each Mac OS version.
Based on patch by Gustavo Noronha Silva <gustavo@noronha.dev.br>. 

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 ui/cocoa.m | 112 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b07..fdef9e9901 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -114,6 +114,9 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 typedef void (^CodeBlock)(void);
 typedef bool (^BoolCodeBlock)(void);
 
+static CFMachPortRef eventsTap = NULL;
+static CFRunLoopSourceRef eventsTapSource = NULL;
+
 static void with_iothread_lock(CodeBlock block)
 {
     bool locked = qemu_mutex_iothread_locked();
@@ -332,10 +335,27 @@ - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
 - (void) raiseAllKeys;
+- (void) setFullGrab;
 @end
 
 QemuCocoaView *cocoaView;
 
+// Part of the full keyboard grab system
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type,
+CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView = (QemuCocoaView*) userInfo;
+    NSEvent* event = [NSEvent eventWithCGEvent:cgEvent];
+    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
+        COCOA_DEBUG("Global events tap: qemu handled the event, capturing!\n");
+        return NULL;
+    }
+    COCOA_DEBUG("Global events tap: qemu did not handle the event, letting it"
+                " through...\n");
+
+    return cgEvent;
+}
+
 @implementation QemuCocoaView
 - (id)initWithFrame:(NSRect)frameRect
 {
@@ -361,6 +381,12 @@ - (void) dealloc
     }
 
     qkbd_state_free(kbd);
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+    if (eventsTapSource) {
+        CFRelease(eventsTapSource);
+    }
     [super dealloc];
 }
 
@@ -1086,6 +1112,50 @@ - (void) raiseAllKeys
         qkbd_state_lift_all_keys(kbd);
     });
 }
+
+// Inserts the event tap.
+// This enables us to receive keyboard events that Mac OS would
+// otherwise not let us see - like Command-Option-Esc.
+- (void) setFullGrab
+{
+    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
+    NSString *advice = @"Try enabling access to assistive devices";
+    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) |
+    CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
+    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap,
+                                 kCGEventTapOptionDefault, mask, handleTapEvent,
+                                 self);
+    if (!eventsTap) {
+        @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                reason:[NSString stringWithFormat:@"%@\n%@", @"Could not "
+                        "create event tap.", advice]
+                userInfo:nil];
+    } else {
+        COCOA_DEBUG("Global events tap created! Will capture system key"
+                    " combos.\n");
+    }
+
+    eventsTapSource =
+    CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
+    if (!eventsTapSource ) {
+        @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                 reason:@"Could not obtain current CFRunLoop source."
+                userInfo:nil];
+    }
+    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
+    if (!runLoop) {
+           @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                 reason:@"Could not obtain current CFRunLoop."
+                userInfo:nil];
+    }
+
+    CFRunLoopAddSource(runLoop, eventsTapSource, kCFRunLoopDefaultMode);
+    CFRelease(eventsTapSource);
+}
+
 @end
 
 
@@ -1117,6 +1187,7 @@ - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
 - (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
+- (IBAction)doFullGrab:(id)sender;
 @end
 
 @implementation QemuCocoaAppController
@@ -1569,6 +1640,35 @@ - (void)adjustSpeed:(id)sender
     COCOA_DEBUG("cpu throttling at %d%c\n", cpu_throttle_get_percentage(), '%');
 }
 
+// The action method to the 'Options->Full Keyboard Grab' menu item
+- (IBAction)doFullGrab:(id) sender
+{
+    @try
+    {
+        // Set the state of the menu item
+        // if already checked
+        if ([sender state] == NSControlStateValueOn) {
+            // remove runloop source
+            CFRunLoopSourceInvalidate(eventsTapSource);
+            if (!eventsTap) {
+                CFRelease(eventsTap);
+            }
+            [sender setState: NSControlStateValueOff];
+        }
+
+        // if not already checked
+        else {
+            [cocoaView setFullGrab];
+            [sender setState: NSControlStateValueOn];
+        }
+    }
+    @catch(NSException *e) {
+        NSBeep();
+        NSLog(@"Exception in doFullGrab: %@", [e reason]);
+        QEMU_Alert([e reason]);
+    }
+}
+
 @end
 
 @interface QemuApplication : NSApplication
@@ -1655,6 +1755,18 @@ static void create_initial_menus(void)
     [menuItem setSubmenu:menu];
     [[NSApp mainMenu] addItem:menuItem];
 
+    // Options menu
+    menu = [[NSMenu alloc] initWithTitle:@"Options"];
+
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:
+                         @"Full Keyboard Grab" action:@selector(doFullGrab:)
+                                        keyEquivalent:@""] autorelease]];
+
+    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Options" action:nil
+                                    keyEquivalent:@""] autorelease];
+    [menuItem setSubmenu:menu];
+    [[NSApp mainMenu] addItem:menuItem];
+
     // Window menu
     menu = [[NSMenu alloc] initWithTitle:@"Window"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; // Miniaturize
-- 
2.24.3 (Apple Git-128)


