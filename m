Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E50F36F342
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 02:49:31 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHLW-0004bF-12
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 20:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNs-0003aN-EW
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:52 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNn-0007e7-DK
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:52 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E3DAA5C00CE;
 Thu, 29 Apr 2021 19:47:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Apr 2021 19:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=TnvD4gWTUv
 LiU6hHTbYCZ9unVM2ZluFbYX0IDEPSfxo=; b=Xz/bv4pH/03hrQ9vhCe6t3meLG
 9dU1UxHfv27XV30jiSnTh9TCE+kUY4M1YGaMVaf/9v7ZcbwJ2DebHdlnx/DlWS9s
 XMWQED6hEI1dHKL6KYIGKMyHjiyy60qt2BEoWXLip7sOdoEmgvfRLbQygj18iVqd
 zvvQg15qoxkKYP0qs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TnvD4gWTUvLiU6hHTbYCZ9unVM2ZluFbYX0IDEPSfxo=; b=MWpdtj8s
 /LvjScZ2Lt66D9QYBzhA4A+FuQiYX4jZ8y2Ke89tRgG0pHJCuL7dAD6Dh9S41ndX
 sMHxnYvdDU78P+GToHvcu2o8P0f0sQy40TwFZSRnCiuSZ6BlN2pET/vY+7/KEBLx
 uT6E3UkLO3ZPgIQ//rmY+QWdsaJqzHbr++lAqp37A33U8q40Tl/N6zf/CSUI7DKa
 HrXl+QMGTSgwGaQikB1tD6gSJ8SkTmOD+7ecINUtg8IV0I/0aXM9DVQyw9VjjyKA
 QUjkEI1vruGBe01B/T5v1ANVU/Nbwd0K5SCeA7WEE00gxJuf2Jf1uwSEHY+HKOgm
 mx305z0Pqgh+5Q==
X-ME-Sender: <xms:okWLYBB6UMUpwpgcy9dnm8bmmohFq0Aog_eKpJ4ZK9x0mz45pIJ7GA>
 <xme:okWLYPh0pP-8DIT-giviDyXf-sdlJHMSa09LrSu1ixWGtrNqeTa3u2pgHNLx3O9dY
 jO2bbHXMj7qSemjrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgr
 vhhosehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeevhfdvjeelve
 etiedutdfhleegleffkeffjefgtdeggfekheehledttdffvdelleenucffohhmrghinhep
 rghpphhlvgdrtghomhenucfkphepvddtuddrkedtrddurdeinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhh
 rgdrvghtihdrsghr
X-ME-Proxy: <xmx:okWLYMn1HHauj82v3_5ksKwUxnrpMzZX3onFUaOroI2n4gIPo2_o4g>
 <xmx:okWLYLyoVncZSndpWAMH_ItdZzyyISioSCsVBvul_qIUORSFh34S_g>
 <xmx:okWLYGSEEn2I5jdb9sI0XMU4Koy5BLuEEY7LikX7Of2H9BnkHRu-6A>
 <xmx:okWLYEdvKFqOnp_iU9C79LJrcNHJR6SL-7g7zZ4oNwqbKX46JVsE2w>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 19:47:45 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
Date: Thu, 29 Apr 2021 20:47:05 -0300
Message-Id: <20210429234705.83206-3-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210429234705.83206-1-gustavo@noronha.eti.br>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=gustavo@noronha.eti.br;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Apr 2021 20:48:06 -0400
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
 'Markus Armbruster ' <armbru@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, enabled by default.

Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
---
 qapi/ui.json    |  7 +++++-
 qemu-options.hx |  1 +
 ui/cocoa.m      | 66 +++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 77bc00fd0d..02db684251 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1098,9 +1098,14 @@
 #                   a global grab on key events. (default: off)
 #                   See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
+# @swap-option-command: Swaps the Option and Command keys so that their key codes
+#                       match their position on non-Mac keyboards and you can use
+#                       Meta/Super and Alt where you expect them. (default: on)
+#
 ##
 { 'struct'  : 'DisplayCocoa',
-  'data'    : { '*full-grab'     : 'bool' } }
+  'data'    : { '*full-grab'           : 'bool',
+                '*swap-option-command' : 'bool' } }
 
 ##
 # @DisplayType:
diff --git a/qemu-options.hx b/qemu-options.hx
index a77505241f..d6137eedac 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1785,6 +1785,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_COCOA)
     "-display cocoa[,full_grab=on|off]\n"
+    "              [,swap_option_command=on|off]\n"
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index f1e4449082..879e568a9d 100644
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
 
@@ -848,15 +875,21 @@ - (bool) handleEventLocked:(NSEvent *)event
                 case kVK_Command:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_L];
-                    }
+                        if ([self isSwapOptionCommandEnabled]) {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        }                    }
                     break;
 
                 case kVK_RightCommand:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_R];
-                    }
+                        if ([self isSwapOptionCommandEnabled]) {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        }                    }
                     break;
             }
             break;
@@ -1085,6 +1118,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
 - (BOOL) isFullGrabEnabled {return screen.full_grab;}
+- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1271,6 +1305,13 @@ - (void) setFullGrab:(id)sender to:(BOOL)value
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
@@ -1953,6 +1994,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


