Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36B37AEEC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:58:21 +0200 (CEST)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXaG-0004aF-P9
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXY5-00009P-Fv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:06 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXY3-0005UL-9q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8E3B11713;
 Tue, 11 May 2021 14:56:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 11 May 2021 14:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=mesmtp; bh=VOHbGANJEy
 nK4KMaudEFh+LdjKQ0RWACoYQIpDoTRXk=; b=h1wE+VboaKb52U2GRyBvMIcyJS
 6uPg6sP6s4nMgEQIW/11nkgisgfUsv6UV8Y37mkH5UvfQKYqnOjuNU+rJJv8L92k
 gLXmXRHwG1P91UuwzteqqX9h9p3jqGuPENpMl/e/1q+uphxyBXDdbnMz+16sK9ZY
 5MAzkzBiw7C9XBKtM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VOHbGANJEynK4KMaudEFh+LdjKQ0RWACoYQIpDoTRXk=; b=V/b6kcO/
 mn8QzA/MptuFyAR4B3EJ6ogHC5qrsgKCnnp3opj9GYQsiloDb2WE9lTR0/nnzPis
 9Ojm+3SHvqlMeWDpuINII5yFrjwwjskANAAbzQsw9juP7P5VWiUD9k0w7v9t3Twj
 NnehcZ0Ftd0lfkWgE11FO3xGmaRD5nU+8ERPih7MQf5ZkZfeeSwAZ+Nt5pErOiOo
 unZhIkQ4gPrhSSiwip1p9uvWWzzX964d9paol8HsKA90OT5T6K+aeQMbVW6XFVgr
 lp9uM+ejnjxRE9mloLd6hc19LVbidYcOGKg1ug8dslDcvWLp0/4wIaLnjLknmUYR
 mw6OJwzTqTqXPQ==
X-ME-Sender: <xms:QNOaYB9DLYL9PW2WnJHMDpPEQJNM3nln4lXbKl8kZw6x7zvrqz3PnA>
 <xme:QNOaYFuKHSKzogAoVw3CCfpSXL5WxJO1zT5qsUJiAnKZ-445BvXnaI0EBRo5JUHif
 CXhzJ38HjdP379poA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepghhushht
 rghvohesnhhorhhonhhhrgdrvghtihdrsghrnecuggftrfgrthhtvghrnhepvefhvdejle
 evteeiuddthfelgeelffekffejgfdtgefgkeehheeltddtffdvleelnecuffhomhgrihhn
 pegrphhplhgvrdgtohhmnecukfhppedvtddurdektddruddrieenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehguhhsthgrvhhosehnohhrohhn
 hhgrrdgvthhirdgsrh
X-ME-Proxy: <xmx:QNOaYPACJn5AX-FiirCNPeE6KnbYWg8pgjbY7jPfQpTwAkYNvGujmg>
 <xmx:QNOaYFdM9vbvrK_8EMIKywchDPVWhwflIm9DlEQBjA0j2gx835fmSQ>
 <xmx:QNOaYGNv7H1dR82Z14bTtRPdhYqunedBlfRbi6oW84CmOJe5ZFGEjw>
 <xmx:QNOaYN29yheaXFtU1dWtaclnCdDnfsbpnEkrdu_qJ-62Jwx_ZbDNDA>
Received: from localhost.localdomain (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 14:55:58 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] ui/cocoa: add option to swap Option and Command
Date: Tue, 11 May 2021 15:55:38 -0300
Message-Id: <20210511185538.29344-3-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210511185538.29344-1-gustavo@noronha.eti.br>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=gustavo@noronha.eti.br; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, disabled by default.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
---
 qapi/ui.json    |  8 ++++++-
 qemu-options.hx |  3 ++-
 ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4ccfae4bbb..ee6fde46d5 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1098,10 +1098,16 @@
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
index eeaa5c73e9..e0e93724b1 100644
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
index 236352deac..995301502b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -72,6 +72,7 @@
 typedef struct {
     int width;
     int height;
+    bool swap_option_command;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -325,6 +326,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
+- (BOOL) isSwapOptionCommandEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -643,6 +645,13 @@ - (void) setFullGrab:(id)sender
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
@@ -792,12 +801,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -829,13 +848,21 @@ - (bool) handleEventLocked:(NSEvent *)event
 
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
 
@@ -843,14 +870,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -1079,6 +1114,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 }
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
+- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
@@ -1265,6 +1301,13 @@ - (void) setFullGrab:(id)sender
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
@@ -1947,6 +1990,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [[controller delegate] setFullGrab: nil];
         });
     }
+    if (opts->u.cocoa.has_swap_option_command && opts->u.cocoa.swap_option_command) {
+        dispatch_async(dispatch_get_main_queue(), ^{
+            [[controller delegate] setSwapOptionCommand: nil];
+        });
+    }
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-- 
2.30.1 (Apple Git-130)


