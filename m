Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F03DBD85
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:11:58 +0200 (CEST)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9W3B-0006RO-Lo
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1R-0004M0-2o
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:09 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1M-0000MX-Id
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:07 -0400
Received: by mail-qt1-x82b.google.com with SMTP id h10so6900158qth.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MLHF0wFgQr+8nbdPu5FrLnRo+U2jUITrUSQIhFK6+s=;
 b=AOAAH8Dt23feHDlYqdQ1qPYGeeAaXzXyOYAW5mziLKrGmTkUaoCST9tPyKdesLUlu9
 5LCrUrVWCl1lC6AbDoTrkZPSUqziHHvn8SHz4TjcLA1jHQsJZOyFPbzdEGRFIYhCmJTh
 5lHxbkWYwXXyjp4fgbNod91OYhXfwlqRWM3HwIGL/68DThMwkGpi65zVW5i3S4jN6/Zf
 Kj79jos/2tnu+ryJc/ovS6+s1OByoDuxn9DngOLr6K9fSWNHlqk9FKTP8J1DLTuxJ+7o
 FI9WIR6KEKgd1S2/Mo7mUIzm+yCw08ayxkZJOz3D+PhcfD5xC9PQwjr0uvOvmOZhryk4
 5nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5MLHF0wFgQr+8nbdPu5FrLnRo+U2jUITrUSQIhFK6+s=;
 b=tH7tJsDjDw/M+XSYEAnd7QIugBmAoIx9uW8IDtcJCWDAXDZypuccVEhKU51/zKkiAW
 oJI36cYYT2jWVPSTvyq3xtS5HJLatcp2TQE2/pvRKfuOAy9zyoZuRQR0pyWiPEFfKWrf
 gKSx3GU1uFi5JNIzyspJ3r4jVLbt7ytW0hSQQw1+fvi/nnNbZYGwoWRohxljvPkq3Yz7
 SHUBDrvj8RAVVjW+Lq05oMYIjodmq3ifMVmGD9xz1tWij3MaYz/roYADi3cdGovvjmtO
 8x8KtVNz41M03/ocH+q1kaAxKaFtzyPuxjlImc/r7y3jHPNCKAZ76mRtSCcaf0mSteOU
 iLpQ==
X-Gm-Message-State: AOAM530mg5sAGbfB/n0nE9H97BZ5wqJZF6HUTKLaCgu2T1i86H0pfvkl
 KxZwHSTLKgPbweqbQ+KwrWw=
X-Google-Smtp-Source: ABdhPJx2MvGjbPlbB1yU+fMjxKA2pxVR5AxD4Vi7AYd7cjgYTgYGmQjeBiiUVeQR0DNIfQZ/8Xe+jQ==
X-Received: by 2002:ac8:5645:: with SMTP id 5mr3198756qtt.200.1627665003778;
 Fri, 30 Jul 2021 10:10:03 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id k15sm1227856qko.84.2021.07.30.10.10.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Jul 2021 10:10:03 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>,
 QEMU devel list <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] ui/cocoa.m: Add ability to swap command/meta and options
 keys
Date: Fri, 30 Jul 2021 13:09:45 -0400
Message-Id: <20210730170945.4468-3-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210730170945.4468-1-programmingkidx@gmail.com>
References: <20210730170945.4468-1-programmingkidx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82b.google.com
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

For users who are use to using a Macintosh keyboard having to use a PC keyboard
can be a pain because the Command/meta and Option/Alt keys are switched. To
make life easier this option is added to allow the user to switch how the guest
reacts to each of these keys being pushed. It can make a Macintosh keyboard user
feel almost at home with a PC keyboard. The same could be said for PC keyboard
users who have to use a Macinosh keyboard.
Based on patch by Gustavo Noronha Silva <gustavo@noronha.dev.br>.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 ui/cocoa.m | 66 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index fdef9e9901..98596d5f38 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -116,6 +116,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static CFMachPortRef eventsTap = NULL;
 static CFRunLoopSourceRef eventsTapSource = NULL;
+static bool swap_command_option_keys = false;
 
 static void with_iothread_lock(CodeBlock block)
 {
@@ -810,12 +811,22 @@ - (bool) handleEventLocked:(NSEvent *)event
         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
     }
     if (!(modifiers & NSEventModifierFlagOption)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        if (swap_command_option_keys) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        }
     }
     if (!(modifiers & NSEventModifierFlagCommand)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        if (swap_command_option_keys) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        }
     }
 
     switch ([event type]) {
@@ -847,13 +858,22 @@ - (bool) handleEventLocked:(NSEvent *)event
 
                 case kVK_Option:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT];
+                        if (swap_command_option_keys) {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        }
+
                     }
                     break;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT_R];
+                        if (swap_command_option_keys) {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        }
                     }
                     break;
 
@@ -861,14 +881,22 @@ - (bool) handleEventLocked:(NSEvent *)event
                 case kVK_Command:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_L];
+                        if (swap_command_option_keys) {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        }
                     }
                     break;
 
                 case kVK_RightCommand:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_R];
+                        if (swap_command_option_keys) {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        }
                     }
                     break;
             }
@@ -1188,6 +1216,7 @@ - (IBAction) do_about_menu_item: (id) sender;
 - (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
 - (IBAction)doFullGrab:(id)sender;
+- (IBAction)doSwapCommandOptionKeys:(id)sender;
 @end
 
 @implementation QemuCocoaAppController
@@ -1669,6 +1698,22 @@ - (IBAction)doFullGrab:(id) sender
     }
 }
 
+// The action method to the "Options->Swap Command and Option Keys" menu item
+- (IBAction)doSwapCommandOptionKeys:(id)sender
+{
+    // If the menu item is not checked
+    if ([sender state] == NSControlStateValueOff) {
+        swap_command_option_keys = true;
+        [sender setState: NSControlStateValueOn];
+    }
+
+    // If the menu item is checked
+    else {
+        swap_command_option_keys = false;
+        [sender setState: NSControlStateValueOff];
+    }
+}
+
 @end
 
 @interface QemuApplication : NSApplication
@@ -1762,6 +1807,11 @@ static void create_initial_menus(void)
                          @"Full Keyboard Grab" action:@selector(doFullGrab:)
                                         keyEquivalent:@""] autorelease]];
 
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:
+                                                 @"Swap Command and Option Keys"
+                                               action:@selector(doSwapCommandOptionKeys:)
+                                        keyEquivalent:@""] autorelease]];
+
     menuItem = [[[NSMenuItem alloc] initWithTitle:@"Options" action:nil
                                     keyEquivalent:@""] autorelease];
     [menuItem setSubmenu:menu];
-- 
2.24.3 (Apple Git-128)


