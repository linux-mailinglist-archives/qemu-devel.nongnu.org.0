Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009233C79F2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 01:03:56 +0200 (CEST)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3RRT-0003tZ-1x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 19:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q10-0001Bp-H2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:31 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q0r-0007ZP-1y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 828943200805;
 Tue, 13 Jul 2021 17:32:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Jul 2021 17:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.dev.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gdfQ+oG0IrXyq
 pJsobMKx2n7+BD6BP5j4n/cFUf3l6c=; b=l1YixMrbIsv4xtyxexQZ4kEODGhkd
 aYCaG10zuVmSqaH5ocayc82/Hc/TJQDik9nSLXluifQBUISLVurJGjw9a2rt6Ggf
 V1cDn+zuw2w2uE0v/jo/IdIAsj/0CTN63DmbvBScKIJ24MzZZ7a08hO/PuxgQemA
 YiWX8851k7KnaSPNK5dIILWOWoTQ1BQk++IXLuRiLvzNJOneDNZthmRJJQ/ZoF+2
 H7JPj+oycDmb8jseordISKDP8RlWn++jJUmCV+gq/9eQ6t6SZmIr841XnmJz1qQk
 JSSGLIewqgPh9SakLaYTLXf84WFCnnfnw/vCJQbFQstLSBFb8TvT6xngQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gdfQ+oG0IrXyqpJsobMKx2n7+BD6BP5j4n/cFUf3l6c=; b=Pr0XpPr+
 xbhqIL/uyxoAhd+BoW5fcjrePpo+kL2WXjkZqney06IAuPWEbLYEICGHc5s/LjIs
 iWI74Xy0uJ/8inp6hRMSNkUNJx4SIgQ17p0RVTcawEQTQNh3UAjlT5O0HyfCWuX7
 BqBjxyEIokBlzNc6aelhQJw0B0SrjOF71lnGX7jAIOuMmDbgE/dNOgDiBJksfy8M
 1i5qlrvjdvdqBMMBiFnW6nbxhMAtFpO+uvbPeH16YmWGjktoR0eecYEJJy99oCsg
 YtkUXJI1ONL7NJ9S4FtY1qITtVJ3KKfhFBfL+JkldRl1i1tHDk14AlAqt3fra38I
 LacwKtFkYKOKzg==
X-ME-Sender: <xms:YwbuYBGR7-t9H1P_gXUYlRI-36DSxNkg9Ptk--tAQrsMkKhnN8WV1A>
 <xme:YwbuYGUm-HIjzrALCvl3lC16Xew7pJrCu-f6yTt9Z-tFqAXO2VwUMGpXLuuKagzn5
 QEcf6ok9Vt9ekLO0Q>
X-ME-Received: <xmr:YwbuYDJvo9iCVroqvBa-CC96_gTgqKm35cqinxlrcgrMvdFRhYqs9mX67jqLyUjVAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepghhushhtrghv
 ohesnhhorhhonhhhrgdruggvvhdrsghrnecuggftrfgrthhtvghrnhepheeigfeigfejje
 ekiedtgfehieetheeikeetudffveeifefgtefhveehvdfhgeehnecuffhomhgrihhnpegr
 phhplhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepghhushhtrghvohesnhhorhhonhhhrgdruggvvhdrsghr
X-ME-Proxy: <xmx:YwbuYHGweDYvAAFxzHsEUmVXc9N8mJcDQtPxeHr0YGt5HQSytIqruA>
 <xmx:YwbuYHVqWIKHsXCOfV-jhYvcG5rpbT-h2WLJKpaPX99TUSOTX4m2Ig>
 <xmx:YwbuYCMODQrC4RyDmgFAUjYkes6EEAEymPCtwf-3OGhh1uS48xRu5A>
 <xmx:YwbuYJJcF46XXyitLTpObC_oKL4LYqfE49w9otf0gtYsN9AncHTijQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 17:32:17 -0400 (EDT)
From: gustavo@noronha.dev.br
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] ui/cocoa: add option to swap Option and Command
Date: Tue, 13 Jul 2021 18:32:00 -0300
Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210713213200.2547-1-gustavo@noronha.dev.br>
References: <20210713213200.2547-1-gustavo@noronha.dev.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.dev.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Jul 2021 19:01:06 -0400
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
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>, 'Eric Blake ' <eblake@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, disabled by default.

Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
---
 qapi/ui.json    |  8 ++++++-
 qemu-options.hx |  3 ++-
 ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index b2d27ce167..7d8d3b532e 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1102,10 +1102,16 @@
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
index 8308d28d1f..7cdacc83ae 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1797,7 +1797,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
index d9d98aa9de..e23060da53 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -73,6 +73,7 @@
 typedef struct {
     int width;
     int height;
+    bool swap_option_command;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -330,6 +331,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
+- (BOOL) isSwapOptionCommandEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -685,6 +687,13 @@ - (void) setFullGrab:(id)sender
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
@@ -834,12 +843,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -871,13 +890,21 @@ - (bool) handleEventLocked:(NSEvent *)event
 
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
 
@@ -885,14 +912,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -1121,6 +1156,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 }
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
+- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1317,6 +1353,13 @@ - (void) setFullGrab:(id)sender
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
@@ -2101,6 +2144,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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
2.30.1 (Apple Git-130)


