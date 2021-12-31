Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9A482573
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:44:31 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Lx8-0006mr-3T
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3Lv2-0004Je-Ta; Fri, 31 Dec 2021 12:42:20 -0500
Received: from [2a00:1450:4864:20::435] (port=37858
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3Lv1-0002nf-4G; Fri, 31 Dec 2021 12:42:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id t26so56988626wrb.4;
 Fri, 31 Dec 2021 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=0gOUOOzAq5cHZ/kJiozKCxs7CH4olsbJdYrcIdlKb4c=;
 b=fMQozFivD9hRtQrgBMjEqiT/8bqEZFpkEUIaA8SJ7OQQl7p/1IK+AW86MBa3flfhDX
 HByepe6/vZ7VpJnoh6bQFaWXHCM0YeiEbWzLyh3+GmOqO0dfeU0vdOQgotzsoDNcziXK
 b9i57ldSzAI1ffQv6FKB5T866me1eEqVaEbe0H/BI81hENXeaMBlT3AkbG9WIl2mTWp6
 v7mNQbgVDEi3gOBdiIz5ES7hk/nmb2lkvKuLw6wY0A9oiVbbzjSqFh6xowHy4iMw/Jyr
 UfA+oGgV0pjO6pO+cG+90gv68V4Ertcy/+Dwi6+dboGWTF88J1ms0ECJc5aJGoL498FK
 Q52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=0gOUOOzAq5cHZ/kJiozKCxs7CH4olsbJdYrcIdlKb4c=;
 b=sNpK0nDqUmKkkhA1db93MPSYS6m8Kl1Bk19X4jIr9Fd/vmZPjSz0uLa7AzI2TcK809
 NA8iIUKABukiizxLAAXintKBBysIRhLoH/XA7wZsU3o6rs/4T9+3hSjoyKSHcZ36axF/
 CGWOfR9piAVul9dF5hRMB9aU3delzG0Y5dR6lEF1dvqQeggOgg0fILtQpyFJQR9yrlq+
 u7c/gu9vvOKoTaS1jdddtfqiSKI5vsa1HadmMPUViizgVKR75q+EC3Xibo0MUy/+ggjv
 KT+qOY9NSkPf0FzSSiUZpQ8OIEpM0xNvA7tuAoSefQ9jqLQWgpd0Tpwlab3bie+bModT
 jpVg==
X-Gm-Message-State: AOAM530KpTl8gzdTbuZrrxFafbgLHFaTrPDMykthoXkHb+23onfKMBtD
 JbjYTtlgR/vKZ4DQbCvnwRm/elHQWxc=
X-Google-Smtp-Source: ABdhPJw2qtiCIgsurinFw6mVSBQ39t5AwywTsOSVycNoVuhFi9ijj8fFxi5rbrjRsNXmgaDrxAtWqQ==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr29570615wrh.109.1640972537091; 
 Fri, 31 Dec 2021 09:42:17 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id p13sm19762149wrs.54.2021.12.31.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 09:42:16 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
Date: Fri, 31 Dec 2021 17:42:10 +0000
Message-Id: <20211231174210.82446-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211231174210.82446-1-carwynellis@gmail.com>
References: <20211231174210.82446-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching between guest and host on a Mac using command-tab the
command key is sent to the guest which can trigger functionality in the
guest OS. Specifying left-command-key=off disables forwarding this key
to the guest. Defaults to enabled.

When switching between guest and host on a Mac with a fullscreen guest
the host pointer will occasionally persist despite the ui code
requesting that it be hidden. Added cursor hide calls on left and right
mouse click to hide the cursor when the mouse is clicked.

Also updated the cocoa display documentation to reference the new
left-command-key option along with the existing show-cursor option.
---
 qapi/ui.json    | 17 +++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      | 33 +++++++++++++++++++++++++--------
 3 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da37..764480e145 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1107,6 +1107,22 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool'  } }
 
+##
+# @DisplayCocoa:
+#
+# Cocoa display options.
+#
+# @left-command-key: Enable/disable forwarding of left command key to
+#                    guest. Allows command-tab window switching on the
+#                    host without sending this key to the guest when
+#                    "off". Defaults to "on"
+#
+# Since: 6.2.50
+#
+##
+{ 'struct'  : 'DisplayCocoa',
+  'data'    : { '*left-command-key' : 'bool' } }
+
 ##
 # @DisplayEGLHeadless:
 #
@@ -1254,6 +1270,7 @@
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
+      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
diff --git a/qemu-options.hx b/qemu-options.hx
index 7d47510947..5214457676 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1869,6 +1869,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_DBUS_DISPLAY)
     "-display dbus[,addr=<dbusaddr>]\n"
     "             [,gl=on|core|es|off][,rendernode=<file>]\n"
+#endif
+#if defined(CONFIG_COCOA)
+    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
 #endif
     "-display none\n"
     "                select display backend type\n"
@@ -1956,6 +1959,15 @@ SRST
         ``charset=CP850`` for IBM CP850 encoding. The default is
         ``CP437``.
 
+    ``cocoa``
+        Display video output in a Cocoa window. Mac only. This interface
+        provides drop-down menus and other UI elements to configure and
+        control the VM during runtime. Valid parameters are:
+
+        ``show-cursor=on|off`` :  Force showing the mouse cursor
+
+        ``left-command-key=on|off`` : Disable forwarding left command key to host
+
     ``egl-headless[,rendernode=<file>]``
         Offload all OpenGL operations to a local DRI device. For any
         graphical display, this display needs to be paired with either
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b..10e492538a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,6 +95,8 @@ static DisplayChangeListener dcl = {
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static bool cursor_visible = 1;
+static int left_command_key_enabled = 1;
 
 static int gArgc;
 static char **gArgv;
@@ -411,18 +413,18 @@ QemuCocoaView *cocoaView;
 
 - (void) hideCursor
 {
-    if (!cursor_hide) {
-        return;
+    if (cursor_hide && cursor_visible) {
+        cursor_visible = 0;
+        [NSCursor hide];
     }
-    [NSCursor hide];
 }
 
 - (void) unhideCursor
 {
-    if (!cursor_hide) {
-        return;
+    if (cursor_hide && !cursor_visible) {
+        cursor_visible = 1;
+        [NSCursor unhide];
     }
-    [NSCursor unhide];
 }
 
 - (void) drawRect:(NSRect) rect
@@ -831,10 +833,14 @@ QemuCocoaView *cocoaView;
                     }
                     break;
 
-                /* Don't pass command key changes to guest unless mouse is grabbed */
+                /*
+                    Don't pass command key changes to guest unless mouse is grabbed
+                    or the key is explicitly disabled using the left-command-key option
+                */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        !!(modifiers & NSEventModifierFlagCommand) &&
+                        left_command_key_enabled) {
                         [self toggleKey:Q_KEY_CODE_META_L];
                     }
                     break;
@@ -923,10 +929,16 @@ QemuCocoaView *cocoaView;
         case NSEventTypeLeftMouseDown:
             buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
+            if (isFullscreen) {
+                [self hideCursor];
+            }
             break;
         case NSEventTypeRightMouseDown:
             buttons |= MOUSE_EVENT_RBUTTON;
             mouse_event = true;
+            if (isFullscreen) {
+                [self hideCursor];
+            }
             break;
         case NSEventTypeOtherMouseDown:
             buttons |= MOUSE_EVENT_MBUTTON;
@@ -2050,10 +2062,15 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
         });
     }
+
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
 
+    if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
+        left_command_key_enabled = 0;
+    }
+
     // register vga output callbacks
     register_displaychangelistener(&dcl);
 
-- 
2.34.1


