Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8A3F98EF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:18:22 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJaoP-0002pH-7j
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJamu-0000qE-DK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:16:48 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJams-0000pS-Hi
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:16:48 -0400
Received: by mail-qt1-x831.google.com with SMTP id s15so1741789qta.10
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=7+YuRDb7CY/A4KtdiOSigAyt5dgagaSufxFz2sC7D8E=;
 b=HtB6wopGcfPzhlMKi/r+9tHFkSTRyICepXj//sj+LwhAIEGIjPQ9ginzdL9gK0HCtS
 TeyG7Mw/b1XsYP/dDvh6Rs+wbSdrU9RugkvDX1naufzBreYN/dAzRSyVEjmuvzvEte6s
 K6UWm+0tBmcJ5BEn/ZbSQRK5xiT5n+Cmgx2YQcpWwZZIr85ntZ2HR3uGMz2v4P+XF6jJ
 4yzNzy8F2j4bKgBwcjwyoMVrG3C4ATE+Wgy5mdKhcsJJ1D4bVmLQT3Qt359s/f7a6mwr
 pNrTt3j60v0ESiVZ6x+y2BUXfO4H9fGFwCnhQGM8EQq2oM2yoX54dHnMUzMo2vm4bmeo
 Ob4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=7+YuRDb7CY/A4KtdiOSigAyt5dgagaSufxFz2sC7D8E=;
 b=NvAOmbph3ZAc5fL0GEgaV3zqCriCVU6p6gnH/CGcjKGa+V6cU+Mdz+dDrozc+xTKqs
 at7YsrzM6LfUSyH3Gqe346OjOEOqFr0FdAPbj0k8SGT6WH4vGOhI1TM3M7c4qNbNi3UM
 Oe2aeu93bAMADGurV73bNSVx0MEKGSFRXQWmAuGdqk7/Av6LWESjKHycNPY7UDfHjEQ9
 9oO+QkdPsnFEeU4mySd7tJqnkA0p/nYp51TlkcgRGbk29mveuc94NERmo3j6QVW5b2x2
 Wqm401afjWtcqfOBZ/WYLTdfnSO8CL0ZrcyJ+DTPyzfGl3ntkPSjX3csb1IsoyHDqCOk
 YElg==
X-Gm-Message-State: AOAM530Uz1GA3wq/70EyJNTUZ6SMwYZ8GgmtZtCNgM65ExOOKEw/4d7n
 avf09sirwlVEV04HlQRVaew=
X-Google-Smtp-Source: ABdhPJx6mMe8kkWfCkUOIn471HEVuwWwgDmTAlVHjoJF7m1up4peFBBFnDuaDtD5+5a+UdXmqQJG5Q==
X-Received: by 2002:ac8:4684:: with SMTP id g4mr8031332qto.290.1630066603889; 
 Fri, 27 Aug 2021 05:16:43 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id c2sm3430357qte.22.2021.08.27.05.16.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 05:16:43 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Ping: [PATCH 1/2] ui/cocoa.m: Add full keyboard grab support
Message-Id: <90E28997-9AFA-4D8C-8323-BD087E629638@gmail.com>
Date: Fri, 27 Aug 2021 08:16:42 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

From: John Arbuckle <programmingkidx@gmail.com>
Date: Thu, 29 Jul 2021 14:41:57 -0400
Subject: [PATCH 1/2] ui/cocoa.m: Add full keyboard grab support

There are keyboard shortcuts that are vital for use in a guest that runs =
Mac OS.
These shortcuts are reserved for Mac OS use only which makes having the =
guest
see them impossible on a Mac OS host - until now. This patch will enable =
the
user to decide if the guest should see all keyboard shortcuts using a =
menu item.
This patch adds a new menu called Options and a new menu item called
"Full Keyboard Grab". Simply selecting this menu item will turn the =
feature on
or off at any time. Mac OS requires the user to enable access to =
assistive
devices to use this feature. How to do this varies with each Mac OS =
version.
Based on patch by Gustavo Noronha Silva <gustavo@noronha.dev.br>.=20

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
=20
+static CFMachPortRef eventsTap =3D NULL;
+static CFRunLoopSourceRef eventsTapSource =3D NULL;
+
 static void with_iothread_lock(CodeBlock block)
 {
     bool locked =3D qemu_mutex_iothread_locked();
@@ -332,10 +335,27 @@ - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
 - (void) raiseAllKeys;
+- (void) setFullGrab;
 @end
=20
 QemuCocoaView *cocoaView;
=20
+// Part of the full keyboard grab system
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType =
type,
+CGEventRef cgEvent, void *userInfo)
+{
+    QemuCocoaView *cocoaView =3D (QemuCocoaView*) userInfo;
+    NSEvent* event =3D [NSEvent eventWithCGEvent:cgEvent];
+    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
+        COCOA_DEBUG("Global events tap: qemu handled the event, =
capturing!\n");
+        return NULL;
+    }
+    COCOA_DEBUG("Global events tap: qemu did not handle the event, =
letting it"
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
=20
     qkbd_state_free(kbd);
+    if (eventsTap) {
+        CFRelease(eventsTap);
+    }
+    if (eventsTapSource) {
+        CFRelease(eventsTapSource);
+    }
     [super dealloc];
 }
=20
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
+    NSString *advice =3D @"Try enabling access to assistive devices";
+    CGEventMask mask =3D CGEventMaskBit(kCGEventKeyDown) |
+    CGEventMaskBit(kCGEventKeyUp) | =
CGEventMaskBit(kCGEventFlagsChanged);
+    eventsTap =3D CGEventTapCreate(kCGHIDEventTap, =
kCGHeadInsertEventTap,
+                                 kCGEventTapOptionDefault, mask, =
handleTapEvent,
+                                 self);
+    if (!eventsTap) {
+        @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                reason:[NSString stringWithFormat:@"%@\n%@", @"Could =
not "
+                        "create event tap.", advice]
+                userInfo:nil];
+    } else {
+        COCOA_DEBUG("Global events tap created! Will capture system =
key"
+                    " combos.\n");
+    }
+
+    eventsTapSource =3D
+    CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
+    if (!eventsTapSource ) {
+        @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                 reason:@"Could not obtain current CFRunLoop source."
+                userInfo:nil];
+    }
+    CFRunLoopRef runLoop =3D CFRunLoopGetCurrent();
+    if (!runLoop) {
+           @throw [NSException
+                 exceptionWithName:@"Tap failure"
+                 reason:@"Could not obtain current CFRunLoop."
+                userInfo:nil];
+    }
+
+    CFRunLoopAddSource(runLoop, eventsTapSource, =
kCFRunLoopDefaultMode);
+    CFRelease(eventsTapSource);
+}
+
 @end
=20
=20
@@ -1117,6 +1187,7 @@ - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
 - (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
+- (IBAction)doFullGrab:(id)sender;
 @end
=20
 @implementation QemuCocoaAppController
@@ -1569,6 +1640,35 @@ - (void)adjustSpeed:(id)sender
     COCOA_DEBUG("cpu throttling at %d%c\n", =
cpu_throttle_get_percentage(), '%');
 }
=20
+// The action method to the 'Options->Full Keyboard Grab' menu item
+- (IBAction)doFullGrab:(id) sender
+{
+    @try
+    {
+        // Set the state of the menu item
+        // if already checked
+        if ([sender state] =3D=3D NSControlStateValueOn) {
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
=20
 @interface QemuApplication : NSApplication
@@ -1655,6 +1755,18 @@ static void create_initial_menus(void)
     [menuItem setSubmenu:menu];
     [[NSApp mainMenu] addItem:menuItem];
=20
+    // Options menu
+    menu =3D [[NSMenu alloc] initWithTitle:@"Options"];
+
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:
+                         @"Full Keyboard Grab" =
action:@selector(doFullGrab:)
+                                        keyEquivalent:@""] =
autorelease]];
+
+    menuItem =3D [[[NSMenuItem alloc] initWithTitle:@"Options" =
action:nil
+                                    keyEquivalent:@""] autorelease];
+    [menuItem setSubmenu:menu];
+    [[NSApp mainMenu] addItem:menuItem];
+
     // Window menu
     menu =3D [[NSMenu alloc] initWithTitle:@"Window"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" =
action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; =
// Miniaturize
--=20
2.24.3 (Apple Git-128)



