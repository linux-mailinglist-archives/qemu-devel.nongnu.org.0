Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6B4CEAEA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:13:57 +0100 (CET)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQopo-00023Y-Kz
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:13:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonX-00083m-VJ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:37 -0500
Received: from [2607:f8b0:4864:20::1032] (port=54054
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonU-00083G-S6
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:35 -0500
Received: by mail-pj1-x1032.google.com with SMTP id bx5so10885470pjb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PXDWDash25W/oi/+uWvHCri0LOhMH/rRjTL0SUDFDSE=;
 b=ZsDr6BNYyGHXIQq4lfqgFM0apqmnTcoQYfi729v+kV2cU0iUlwlCddIvy7WpN/8RYj
 cwhQhbANKR3QBudu+CM8iftYU8dHqJtl0Kw5opJmmMZlmkwZKVDVoBOVPM7nVR26r9qr
 fifVJqL3ToTe/1XEwVvl8pNnu4i5Yp0C8IAyuCUSDARVOmwEt7cAcVVojQdaqoMZHAzF
 RR7ph+ZNofuWqiMXT/53Yhgdn7DoWtlVajEFuTJy1pfp5wm0n2dVl1tbo54LMiQJ34GO
 YStBkU7qg/0ZoPDwrM8cgrSQkkfUd9GqGDBEqdxAaXmh6JaKiQK5W7acPtT4oq9oS6Aj
 Z6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXDWDash25W/oi/+uWvHCri0LOhMH/rRjTL0SUDFDSE=;
 b=EqRoMgLYp+/r7WEweiMmt+7vuvzq2XUCCkxtbmKQcK6k66izTzlEDwwcUB7GLAyLm0
 QadYjIGiZG7RdG28Qfd/J2FPkp5G0aKX2oZo6TaW4zN0QY0L7fA0kT3fWSeqjcvf90Qq
 jcq26gILxnNe801MW9TjQS/vvufgA/L8KoRUxI1zsaofljKPq6wVgCXMpS9bdW89E++F
 rx7+w9B3ttQ8mKxCiVHdr8n+hYCPvTxQRsjq/zvL+QFSXJ523cK1BTDlwjNGBKWfGvBA
 3UuC0dsFzNLBgHlM3UVv/6xwXns+336WJbmcy41KeOxu6lRDR2takwqyXNWphCBh80ld
 PS1Q==
X-Gm-Message-State: AOAM532zXpwiCAFfTdbh/mmWD1OXWEWrN6VCmVZXxJabWJxXrYLeXRB3
 RjzfNOMK/jIv/fcj12Q9nLkPt8HhoAw=
X-Google-Smtp-Source: ABdhPJyzFi2ycY7p01LxCENvmdXo1xF5axqxgPumGOigJxbbIHowXObvJNIGZQZ90HtDeERJPVlItQ==
X-Received: by 2002:a17:902:ea02:b0:14f:fd0e:e433 with SMTP id
 s2-20020a170902ea0200b0014ffd0ee433mr7484447plg.24.1646565090933; 
 Sun, 06 Mar 2022 03:11:30 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 o185-20020a6341c2000000b0036fb987b25fsm9132662pga.38.2022.03.06.03.11.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 03:11:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/2] ui/cocoa: add option to swap Option and Command
Date: Sun,  6 Mar 2022 20:11:14 +0900
Message-Id: <20220306111114.18285-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220306111114.18285-1-akihiko.odaki@gmail.com>
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>, Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, disabled by default.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 qapi/ui.json    |  8 ++++++-
 qemu-options.hx |  3 ++-
 ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1e9893419fe..b082e1a7dee 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1270,10 +1270,16 @@
 #             a global grab on key events. (default: off)
 #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
+# @swap-option-command: Swap the Option and Command keys so that their key
+#                       codes match their position on non-Mac keyboards and
+#                       you can use Meta/Super and Alt where you expect them.
+#                       (default: off)
+#
 # Since: 6.1
 ##
 { 'struct'  : 'DisplayCocoa',
-  'data'    : { '*full-grab'     : 'bool' } }
+  'data'    : { '*full-grab'           : 'bool',
+                '*swap-option-command' : 'bool' } }
 
 ##
 # @DisplayType:
diff --git a/qemu-options.hx b/qemu-options.hx
index 4df9ccc3446..8431445e9c0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1917,7 +1917,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display curses[,charset=<encoding>]\n"
 #endif
 #if defined(CONFIG_COCOA)
-    "-display cocoa[,full_grab=on|off]\n"
+    "-display cocoa[,full-grab=on|off]\n"
+    "              [,swap-option-command=on|off]\n"
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index c41bc615d33..b152d3a1563 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -73,6 +73,7 @@
 typedef struct {
     int width;
     int height;
+    bool swap_option_command;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -329,6 +330,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
+- (BOOL) isSwapOptionCommandEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -704,6 +706,13 @@ - (void) setFullGrab:(id)sender
     CFRelease(tapEventsSrc);
 }
 
+- (void) setSwapOptionCommand:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaView: setSwapOptionCommand\n");
+
+    screen.swap_option_command = true;
+}
+
 - (void) toggleKey: (int)keycode {
     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
@@ -853,12 +862,22 @@ - (bool) handleEventLocked:(NSEvent *)event
         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
     }
     if (!(modifiers & NSEventModifierFlagOption)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        if ([self isSwapOptionCommandEnabled]) {
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
+        if ([self isSwapOptionCommandEnabled]) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        }
     }
 
     switch ([event type]) {
@@ -890,13 +909,21 @@ - (bool) handleEventLocked:(NSEvent *)event
 
                 case kVK_Option:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT];
+                        if ([self isSwapOptionCommandEnabled]) {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        }
                     }
                     break;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT_R];
+                        if ([self isSwapOptionCommandEnabled]) {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        }
                     }
                     break;
 
@@ -904,14 +931,22 @@ - (bool) handleEventLocked:(NSEvent *)event
                 case kVK_Command:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_L];
+                        if ([self isSwapOptionCommandEnabled]) {
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
+                        if ([self isSwapOptionCommandEnabled]) {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        }
                     }
                     break;
             }
@@ -1146,6 +1181,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 }
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
+- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1338,6 +1374,13 @@ - (void) setFullGrab:(id)sender
     [cocoaView setFullGrab:sender];
 }
 
+- (void) setSwapOptionCommand:(id)sender
+{
+    COCOA_DEBUG("QemuCocoaAppController: setSwapOptionCommand\n");
+
+    [cocoaView setSwapOptionCommand:sender];
+}
+
 /* Tries to find then open the specified filename */
 - (void) openDocumentation: (NSString *) filename
 {
@@ -2127,6 +2170,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [controller setFullGrab: nil];
         });
     }
+    if (opts->u.cocoa.has_swap_option_command && opts->u.cocoa.swap_option_command) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [controller setSwapOptionCommand: nil];
+        });
+    }
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-- 
2.32.0 (Apple Git-132)


