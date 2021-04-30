Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32137034C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:59:47 +0200 (CEST)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbAo-0000W1-7m
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcaq9-00034f-Mi
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:25 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcaq1-0002ft-Vr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:25 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id AEAE81DCB;
 Fri, 30 Apr 2021 17:38:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Apr 2021 17:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=LPwA/7llEm
 WjU7lVXxDWPf2hW3XmpdRVxJgT8EnSvuw=; b=ShNKJQCIvj7Tv1QOQDDPi0PG66
 kXhKGmjcAcYBeooWrNwx4fGTZJ8O272sbyNZ/ZAiP2UMikgYnRsA8R1xG7uXfsbn
 M/xePAu214vVIPozIuHQshNPDjfkKv9Fn30yDceRTEamiB1ZSf5VWImEgrprxP0V
 d0QMNy/uK8GFw9348=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LPwA/7llEmWjU7lVXxDWPf2hW3XmpdRVxJgT8EnSvuw=; b=KlZubF9Q
 +l/JKbd+5jtBBf3xOq1LYy18JcHZ7xyssM5BpefoTGpVZh639uqY89Rn9FpJCDbv
 Dr0DTQzWigO69mJvK4wzOnMLxNYAMb+tqpHe4T1KEBaaIQDA6EIDsIBjM3gcbfGs
 MJel7UmHWKIB8ZuopGwV/RE4AeeiWxhum89JuP4An7nZQS0LlW7DcozTPA7zf/dY
 tzUs8/nhVSw4kgi9e8ipKrZ6Ax1/Ai+tSladNO80BalG5ryr2sa98YpobxpA45Mz
 4CHe60+FXkD+fgbYvgXFwBpCB/SB/22pz6JRI8G8GTisSuiNpVXCt4A2nQNIx9BO
 pCUAoZXFDZo+6g==
X-ME-Sender: <xms:x3iMYK0QqkEn71-pMvZw47jraKjZEF5Prn64WAcarE9KBr7AiqXEgA>
 <xme:x3iMYNGj1m1qetAF9c1gnbFC3MNC4GbTdk7DUAAx3orMEbebF1ZsUqz2UbNYQrJWO
 ugCxAp1hRRNuVQDEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgr
 vhhosehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeevhfdvjeelve
 etiedutdfhleegleffkeffjefgtdeggfekheehledttdffvdelleenucffohhmrghinhep
 rghpphhlvgdrtghomhenucfkphepvddtuddrkedtrddurdeinecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhh
 rgdrvghtihdrsghr
X-ME-Proxy: <xmx:x3iMYC7endXDAC1_5727VXS1XVFDyLHL9wx6xLmNxQpUVCPkfAg6Og>
 <xmx:x3iMYL1ZIMWQSLHmO7Ng8ojd81_q4YGXULpxH2RdZQfQuPTtDqamnA>
 <xmx:x3iMYNHH5dtwM9BZYbe8dnWlH4C9ZytetZYK0ddKR69jBpkPgF7tnQ>
 <xmx:x3iMYCSeuXwau_T9deA_OyeVj6PW9_SC_QpwnuKMPqqvjk00E1HvAQ>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 17:38:14 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
Date: Fri, 30 Apr 2021 18:38:06 -0300
Message-Id: <20210430213806.81457-3-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210430213806.81457-1-gustavo@noronha.eti.br>
References: <20210430213806.81457-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.eti.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, enabled by default.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
---
 qapi/ui.json    |  8 ++++++-
 qemu-options.hx |  3 ++-
 ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4ccfae4bbb..ffd416a474 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1098,10 +1098,16 @@
 #             a global grab on key events. (default: off)
 #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
+# @swap-option-command: Swap the Option and Command keys so that their key
+#                       codes match their position on non-Mac keyboards and
+#                       you can use Meta/Super and Alt where you expect them.
+#                       (default: on)
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
index a77505241f..6fcb0b6aaa 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1784,7 +1784,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
index f1e4449082..73eb5080be 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -73,6 +73,7 @@
     int width;
     int height;
     bool full_grab;
+    bool swap_option_command;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -327,6 +328,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
 - (BOOL) isFullGrabEnabled;
+- (BOOL) isSwapOptionCommandEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -648,6 +650,13 @@ - (void) setFullGrab:(id)sender to:(BOOL)value
     screen.full_grab = value;
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
@@ -797,12 +806,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -834,13 +853,21 @@ - (bool) handleEventLocked:(NSEvent *)event
 
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
 
@@ -848,14 +875,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -1085,6 +1120,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
 - (BOOL) isFullGrabEnabled {return screen.full_grab;}
+- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1271,6 +1307,13 @@ - (void) setFullGrab:(id)sender to:(BOOL)value
     [cocoaView setFullGrab:sender to:value];
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
@@ -1953,6 +1996,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [[controller delegate] setFullGrab: nil to:opts->u.cocoa.full_grab];
         });
     }
+    if (!opts->u.cocoa.has_swap_option_command || opts->u.cocoa.swap_option_command) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [[controller delegate] setSwapOptionCommand: nil];
+        });
+    }
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     };
-- 
2.24.3 (Apple Git-128)


