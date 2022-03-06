Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB54CEB77
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 13:14:22 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQpmH-000236-NT
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 07:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQpjp-0008EF-1d
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:11:49 -0500
Received: from [2607:f8b0:4864:20::432] (port=36485
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQpjl-00032q-0i
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:11:46 -0500
Received: by mail-pf1-x432.google.com with SMTP id z16so11472919pfh.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 04:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQumdAZrVlMmU2Xd/k1k8cHQvEZQp/m+Dg1bhO9I8Ck=;
 b=bgzIkPyI57HBYuyRij8twJDv/TNZlUnGf07p30O11T+2SGJl1pOv9enQVPCJOSpHVQ
 GY5MhJc8PLXG9kF8maIHbNCZfhcAml4hjDl1M/kvZ3GEF1tQ7fp71kildKeZUa6sguVc
 oN9i754xqZ3pDpN7p+ARsN/B9ZW+9vks8jfvYidrZKQYM2itPi7Z03UBntPCzP12AS5H
 rCrhdxhCPuzxKmOk8TCOEISX+yK5x8ShxYGTu7poUEzKjKV5e3gFZs1yVsvl4dok1toI
 Em2cnqpXoNLUduOh3P8I2NbrxnW+/iKJPyB1N+K7jYBaIFtdPV/mE4+sD9UgDdXqSZL5
 RM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQumdAZrVlMmU2Xd/k1k8cHQvEZQp/m+Dg1bhO9I8Ck=;
 b=27mw60KAPIZr2OuOHl+mteXELH4pj3S4fhKidNgXxLDg03107k1V007ZTf/to57zhx
 Xna2TVHlb4rJQKojFIIs6Lm8xo2LLdJc5cQ6m8ttQdfQ3W98mv3Tr62EiyDFl9XiXinj
 JLpaAN8u/O6SIRuahicelRjRkRMaH1D9WeYQB2lAye/lpLizpM4ytczaZwtANzBmW2PG
 1fEtXXJ0AqQCY4nrcx8k4PMmpITaOPFGYoPSpx3DPMMXXgpGxU5hnAMU2vg2LKWKBXU4
 opxqR9FbOLw25hmXp2SluBmiA+DhXqNa5f37uRzhkyBqkr46TdxjJIackD4Bu15PCAmO
 55rQ==
X-Gm-Message-State: AOAM5326V/oFYmtmuJ4vC2x77CH2xNx5yuTZKoixX9shq/YhhXF7kNyL
 DCOS0Gk1lSHMfbpUCotedr/dOxxFRHE=
X-Google-Smtp-Source: ABdhPJzalM9OqV55g9NRJZubWezevFs1rJFm4aTZPL3LcFxbSO8RKBc65NKcufdLvGAlHKci8h6WFQ==
X-Received: by 2002:a63:bd4a:0:b0:380:4723:7dae with SMTP id
 d10-20020a63bd4a000000b0038047237daemr476345pgp.368.1646568703222; 
 Sun, 06 Mar 2022 04:11:43 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 s42-20020a056a0017aa00b004df8133df4asm12820042pfg.179.2022.03.06.04.11.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 04:11:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 2/2] ui/cocoa: add option to swap Option and Command
Date: Sun,  6 Mar 2022 21:11:19 +0900
Message-Id: <20220306121119.45631-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220306121119.45631-1-akihiko.odaki@gmail.com>
References: <20220306121119.45631-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
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
 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/cocoa.m      | 46 ++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index ff0a04da792..e28339887e0 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1270,10 +1270,15 @@
 #             a global grab on key events. (default: off)
 #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
+# @swap-opt-cmd: Swap the Option and Command keys so that their key codes match
+#                their position on non-Mac keyboards and you can use Meta/Super
+#                and Alt where you expect them. (default: off)
+#
 # Since: 7.0
 ##
 { 'struct'  : 'DisplayCocoa',
-  'data'    : { '*full-grab'     : 'bool' } }
+  'data'    : { '*full-grab'           : 'bool',
+                '*swap-opt-cmd' : 'bool' } }
 
 ##
 # @DisplayType:
diff --git a/qemu-options.hx b/qemu-options.hx
index 4df9ccc3446..b57cbcb2c9e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1917,7 +1917,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display curses[,charset=<encoding>]\n"
 #endif
 #if defined(CONFIG_COCOA)
-    "-display cocoa[,full_grab=on|off]\n"
+    "-display cocoa[,full-grab=on|off][,swap-opt-cmd=on|off]\n"
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index bfd602a96b9..ab9de404687 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,6 +95,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static bool swap_opt_cmd;
 
 static int gArgc;
 static char **gArgv;
@@ -853,12 +854,22 @@ - (bool) handleEventLocked:(NSEvent *)event
         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
     }
     if (!(modifiers & NSEventModifierFlagOption)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        if (swap_opt_cmd) {
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
+        if (swap_opt_cmd) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        }
     }
 
     switch ([event type]) {
@@ -890,13 +901,21 @@ - (bool) handleEventLocked:(NSEvent *)event
 
                 case kVK_Option:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT];
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        }
                     }
                     break;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT_R];
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        }
                     }
                     break;
 
@@ -904,14 +923,22 @@ - (bool) handleEventLocked:(NSEvent *)event
                 case kVK_Command:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_L];
+                        if (swap_opt_cmd) {
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
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        }
                     }
                     break;
             }
@@ -2130,6 +2157,9 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
+    if (opts->u.cocoa.has_swap_opt_cmd) {
+        swap_opt_cmd = opts->u.cocoa.swap_opt_cmd;
+    }
 
     // register vga output callbacks
     register_displaychangelistener(&dcl);
-- 
2.32.0 (Apple Git-132)


