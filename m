Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB93A79D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:06:37 +0200 (CEST)
Received: from localhost ([::1]:35026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt51o-0000q7-Px
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt50B-0008PE-Fr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt509-0006Me-2M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623747891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RL+50h9vmSdQ6ek3VVt9x2BYruTizZHc35L/871QydI=;
 b=J+MB1rEVJWaKx8T39YJx9E4Y6yAK7m7LWAh/NALj+UwCoFXKUBaFkcO4w350fYVU5RIOMc
 zIUQQbJ7tNmPWFsfbaFG6RM9p9d7fmdNG3gZwRjvmk63zBQP/9WfKho7AjcImiaYh6hLfi
 Z8f+AAAvpjoWVyRaNnFy+/5miElcJMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-Yrr2UIyjPiOhGjahkTU2cw-1; Tue, 15 Jun 2021 05:04:50 -0400
X-MC-Unique: Yrr2UIyjPiOhGjahkTU2cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B441850605
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:04:49 +0000 (UTC)
Received: from thuth.com (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF4D19D9B;
 Tue, 15 Jun 2021 09:04:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2] ui: Make the DisplayType enum entries conditional
Date: Tue, 15 Jun 2021 11:04:39 +0200
Message-Id: <20210615090439.70926-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt's "domcapabilities" command has a way to state whether certain
graphic frontends are available in QEMU or not. Originally, libvirt
looked at the "--help" output of the QEMU binary to determine whether
SDL was available or not (by looking for the "-sdl" parameter in the
help text), but since libvirt stopped doing this analysis of the help
text, the detection of SDL is currently broken, see:

 https://bugzilla.redhat.com/show_bug.cgi?id=1790902

QEMU should provide a way via the QMP interface instead. A simple way,
without introducing additional commands, is to make the DisplayType
enum entries conditional, so that the enum only contains the entries if
the corresponding CONFIG_xxx switches have been set. This of course
only gives an indication which possibilities have been enabled during
compile-time of QEMU (and does not take into account whether modules
are later available or not for example - for this we'd need a separate
command), but anyway, this should already be good enough for the above
bug ticket, and it's a good idea anyway to make the QMP interface
conditional here, so let's simply do it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Make gtk, curses and egl also conditional

 qapi/ui.json | 23 +++++++++++++++++------
 softmmu/vl.c | 20 +++++++++++++++++---
 ui/console.c |  8 +++++++-
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..6a667a0abf 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1126,9 +1126,16 @@
 #
 ##
 { 'enum'    : 'DisplayType',
-  'data'    : [ 'default', 'none', 'gtk', 'sdl',
-                'egl-headless', 'curses', 'cocoa',
-                'spice-app'] }
+  'data'    : [
+    { 'name': 'default' },
+    { 'name': 'none' },
+    { 'name': 'gtk', 'if': 'defined(CONFIG_GTK)' },
+    { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
+    { 'name': 'egl-headless',
+              'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' },
+    { 'name': 'curses', 'if': 'defined(CONFIG_CURSES)' },
+    { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
+    { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
 
 ##
 # @DisplayOptions:
@@ -1152,9 +1159,13 @@
                 '*show-cursor'   : 'bool',
                 '*gl'            : 'DisplayGLMode' },
   'discriminator' : 'type',
-  'data'    : { 'gtk'            : 'DisplayGTK',
-                'curses'         : 'DisplayCurses',
-                'egl-headless'   : 'DisplayEGLHeadless'} }
+  'data'    : {
+      'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
+      'curses': { 'type': 'DisplayCurses', 'if': 'defined(CONFIG_CURSES)' },
+      'egl-headless': { 'type': 'DisplayEGLHeadless',
+                        'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' }
+  }
+}
 
 ##
 # @query-display-options:
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 326c1e9080..fc103c2cb2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1068,6 +1068,7 @@ static void parse_display(const char *p)
          *     Not clear yet what happens to them long-term.  Should
          *     replaced by something better or deprecated and dropped.
          */
+#if defined(CONFIG_SDL)
         dpy.type = DISPLAY_TYPE_SDL;
         while (*opts) {
             const char *nextopt;
@@ -1131,6 +1132,10 @@ static void parse_display(const char *p)
             }
             opts = nextopt;
         }
+#else
+        error_report("SDL display supported is not available in this binary");
+        exit(1);
+#endif
     } else if (strstart(p, "vnc", &opts)) {
         /*
          * vnc isn't a (local) DisplayType but a protocol for remote
@@ -1867,13 +1872,22 @@ static void qemu_apply_machine_options(void)
 static void qemu_create_early_backends(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+#if defined(CONFIG_SDL)
+    const bool use_sdl = (dpy.type == DISPLAY_TYPE_SDL);
+#else
+    const bool use_sdl = false;
+#endif
+#if defined(CONFIG_GTK)
+    const bool use_gtk = (dpy.type == DISPLAY_TYPE_GTK);
+#else
+    const bool use_gtk = false;
+#endif
 
-    if ((alt_grab || ctrl_grab) && dpy.type != DISPLAY_TYPE_SDL) {
+    if ((alt_grab || ctrl_grab) && !use_sdl) {
         error_report("-alt-grab and -ctrl-grab are only valid "
                      "for SDL, ignoring option");
     }
-    if (dpy.has_window_close &&
-        (dpy.type != DISPLAY_TYPE_GTK && dpy.type != DISPLAY_TYPE_SDL)) {
+    if (dpy.has_window_close && !use_gtk && !use_sdl) {
         error_report("-no-quit is only valid for GTK and SDL, "
                      "ignoring option");
     }
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..1103b65314 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2370,13 +2370,19 @@ void qemu_display_register(QemuDisplay *ui)
 bool qemu_display_find_default(DisplayOptions *opts)
 {
     static DisplayType prio[] = {
+#if defined(CONFIG_GTK)
         DISPLAY_TYPE_GTK,
+#endif
+#if defined(CONFIG_SDL)
         DISPLAY_TYPE_SDL,
+#endif
+#if defined(CONFIG_COCOA)
         DISPLAY_TYPE_COCOA
+#endif
     };
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(prio); i++) {
+    for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
         if (dpys[prio[i]] == NULL) {
             ui_module_load_one(DisplayType_str(prio[i]));
         }
-- 
2.27.0


