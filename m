Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845F4824A9
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 16:54:09 +0100 (CET)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3KEJ-0003pP-JF
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 10:54:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3G8C-0005YB-C5; Fri, 31 Dec 2021 06:31:32 -0500
Received: from [2a00:1450:4864:20::430] (port=37772
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3G89-000672-9G; Fri, 31 Dec 2021 06:31:32 -0500
Received: by mail-wr1-x430.google.com with SMTP id t26so55493502wrb.4;
 Fri, 31 Dec 2021 03:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=qo1r93T4G599ySh3f318LBPUiQ0tcFkSSVvX0MQU6U8=;
 b=gXXygWR7mb0mq7LLXTrBfaFRUPlUXxVWvOU7XqkMAmBR+IVh+yr0mweP19BNomBhVw
 IW1LJNqCM75+Vvu7IILVqExPafqeF4V1tBwzoGl+G1mFuC0rBdprGBDAQyCwXVg1yYn2
 TgVRG6HHiQCN03/7BLbjqoxOdSBymieUb2fsInJRi80PEhBTbYikYQyatEv5JSRO9JFS
 8bhkjFoSvnoomVi3Jyir4g0mfx2D2Vx/FlT+UHelOKq3WXXTm8eSIq0htZA8ULmOcYpV
 b8BdPLKcx7BMTmg+XrFdjM4O7uTU0I1v8KDZoKJKakRcZnWoGFiiTKhseJfhWOm/c+M0
 aA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=qo1r93T4G599ySh3f318LBPUiQ0tcFkSSVvX0MQU6U8=;
 b=K4G0rxp2ivvyNJqJVSc23b7mj6X5GSq4GFlg4mcsPkquYeVOHHSkGRpkGlZ8O66re4
 NxLfoxY+rK5TjP9r+/H42/5csavvepeS5zXNsGapFtVElHUanssg9tdtAwh4oA1Dkp89
 1a/wl/yMMoXhMneJnuinRl7nMGB8YynBid9qx/v63Tu1/5vOjLuwsivSVi1jRePhZrU4
 TLBl9e/C5k88nbsOSAI2YDbrZ9DRTzJnUG8on3oktgU5EM78g82GpfYuqVuhhHPmzeo/
 f2G+km7G2torS+z/Rb0kigLGAlVZWRRn2Ky0C3VhlkTqHvFd1MuYvd4ibvojuOK6d/E3
 vGkQ==
X-Gm-Message-State: AOAM533DPlrV7xpq/gDR1fNFsqoTa+PMFlgxD885EZhMPrAPP56QwDMV
 SLgCd+jWOAPN5hp10llLIaYGehXBTYQ=
X-Google-Smtp-Source: ABdhPJw2s8XzAAMCfxYmllsEBtTn2Uj/NRxaMdwwN8TSkc1ruyGnQCZ8vWF6QrI9ueGFfRF25khWXA==
X-Received: by 2002:adf:f741:: with SMTP id z1mr29330378wrp.54.1640950287477; 
 Fri, 31 Dec 2021 03:31:27 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id z11sm32802237wmf.9.2021.12.31.03.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:31:27 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
Date: Fri, 31 Dec 2021 11:30:59 +0000
Message-Id: <20211231113059.84130-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211231113059.84130-1-carwynellis@gmail.com>
References: <20211231113059.84130-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 31 Dec 2021 10:51:30 -0500
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
 ui/cocoa.m      | 16 ++++++++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da37..dd1569ed4b 100644
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
index 69745c483b..105b742831 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static int left_command_key_enabled = 1;
 
 static int gArgc;
 static char **gArgv;
@@ -831,10 +832,14 @@ QemuCocoaView *cocoaView;
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
@@ -923,10 +928,12 @@ QemuCocoaView *cocoaView;
         case NSEventTypeLeftMouseDown:
             buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
+            [self hideCursor];
             break;
         case NSEventTypeRightMouseDown:
             buttons |= MOUSE_EVENT_RBUTTON;
             mouse_event = true;
+            [self hideCursor];
             break;
         case NSEventTypeOtherMouseDown:
             buttons |= MOUSE_EVENT_MBUTTON;
@@ -2050,10 +2057,15 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


