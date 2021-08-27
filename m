Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4C3F98F6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:23:50 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJath-0006tt-Nx
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJaqs-0004bK-7d
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:20:54 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJaqp-0003hR-Ro
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:20:53 -0400
Received: by mail-qk1-x72e.google.com with SMTP id m21so6843116qkm.13
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=yL6evdCAVwXBgYdoXUl3tlojUIq0uF7k3U5CgBfKA54=;
 b=eMLVz8unJOv2rw7tS6ES/6RbFFNtgnh6T2Pap6nIxWirPgViD3Qu6bBOTHeZANQWaE
 Mj/NHLILRl2akgf31JjO1sJGROA5eIskzr4tFxvRCuSMJTJLdvAYwTZOL+XYO0luS6iA
 kbH+dYtltkqyKcckz9m6LDZJTHDvqaEUUMoBjAJlA0EjRo4DXrQPcsZcR4dAd48+Q9Co
 ztWNHzG1/ef6xjUFxHjI4sfY4GUKAer+wPM3ibnhphiWwdIZPfs3/1oLIZw/fvT1ZGQ6
 WmiHiXSFZlc0chJwTKlDo8hv6H2d0ykxoOHkMq2/ks1xWyUPBtQsJbfzx+SV94mGBeoa
 AvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=yL6evdCAVwXBgYdoXUl3tlojUIq0uF7k3U5CgBfKA54=;
 b=F8qSKhR3y61/inVbvwCu+zkHV6BILrN/y3dnYQR5QZ5EYeh+WUdmuIm5K6m7QJkTjS
 ZWtPVyiaom5C+oTp+60ibrvRVLjphK+Nu5XIGyBdgdJofBmEW4Wqj+2Geeautz8EwqnY
 nO/obXzeCeREqFsHqM7WutVZWTQIFjh/nF0hR6+vFd/5zu1dNU0Tbo2YIFKr1gEHPWbT
 cfUhdbNc22UAhX6h3JOsSe0E/1xecYgsKMH+ue7pjS7fEjrzNE58Xh5rMxDyNBLX6nuh
 5eG53LNNtfOFGj3BGK8jLqBYSi/yvjeoDR/FX6OIwTzIm2MB7j4NgJvEsuvm+5Bt/qWL
 V8BQ==
X-Gm-Message-State: AOAM530lZmMdTpl8O4+M8a33woqSs1LBDwbeFPgnlULzlzc3Yf4EWqsC
 GKxBZUTz3F92xzDtz46k4tbXwIgDAwk=
X-Google-Smtp-Source: ABdhPJxGVSkudtfYQKaCeUxyrBiAvx3rd2NVWOG1OfrT3u9JkmaxweOObq9Q32hao4r5I4xk2RIbyw==
X-Received: by 2002:a05:620a:1082:: with SMTP id
 g2mr9085373qkk.138.1630066850663; 
 Fri, 27 Aug 2021 05:20:50 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id f3sm3600906qti.65.2021.08.27.05.20.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 05:20:50 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Ping: [PATCH 2/2] ui/cocoa.m: Add ability to swap command/meta and
 options keys
Message-Id: <38371064-7807-4186-AEEB-AA79C3DB17EA@gmail.com>
Date: Fri, 27 Aug 2021 08:20:49 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72e.google.com
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

Ping:

From: John Arbuckle <programmingkidx@gmail.com>
Date: Fri, 30 Jul 2021 10:18:56 -0400
Subject: [PATCH 2/2] ui/cocoa.m: Add ability to swap command/meta and =
options keys

For users who are use to using a Macintosh keyboard having to use a PC =
keyboard
can be a pain because the Command/meta and Option/Alt keys are switched. =
To
make life easier this option is added to allow the user to switch how =
the guest
reacts to each of these keys being pushed. It can make a Macintosh =
keyboard user
feel almost at home with a PC keyboard. The same could be said for PC =
keyboard
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
=20
 static CFMachPortRef eventsTap =3D NULL;
 static CFRunLoopSourceRef eventsTapSource =3D NULL;
+static bool swap_command_option_keys =3D false;
=20
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
=20
     switch ([event type]) {
@@ -847,13 +858,22 @@ - (bool) handleEventLocked:(NSEvent *)event
=20
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
=20
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
=20
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
=20
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
=20
 @implementation QemuCocoaAppController
@@ -1669,6 +1698,22 @@ - (IBAction)doFullGrab:(id) sender
     }
 }
=20
+// The action method to the "Options->Swap Command and Option Keys" =
menu item
+- (IBAction)doSwapCommandOptionKeys:(id)sender
+{
+    // If the menu item is not checked
+    if ([sender state] =3D=3D NSControlStateValueOff) {
+        swap_command_option_keys =3D true;
+        [sender setState: NSControlStateValueOn];
+    }
+
+    // If the menu item is checked
+    else {
+        swap_command_option_keys =3D false;
+        [sender setState: NSControlStateValueOff];
+    }
+}
+
 @end
=20
 @interface QemuApplication : NSApplication
@@ -1762,6 +1807,11 @@ static void create_initial_menus(void)
                          @"Full Keyboard Grab" =
action:@selector(doFullGrab:)
                                         keyEquivalent:@""] =
autorelease]];
=20
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:
+                                                 @"Swap Command and =
Option Keys"
+                                               =
action:@selector(doSwapCommandOptionKeys:)
+                                        keyEquivalent:@""] =
autorelease]];
+
     menuItem =3D [[[NSMenuItem alloc] initWithTitle:@"Options" =
action:nil
                                     keyEquivalent:@""] autorelease];
     [menuItem setSubmenu:menu];
--=20
2.24.3 (Apple Git-128)



