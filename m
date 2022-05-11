Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD8523BF9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:54:04 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqXD-0004Rq-Ls
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVF-0002Et-JD
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVD-0004fe-NZ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652291515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucByN49ZKXpiyo23A22z7u1QCV7sN0pz7kp7jU9Jo5w=;
 b=TX3gBonTAog/CAlFYEYsIj8AcxIvVMxe5Sd3MyWwXmXwSsyB7ppitKFM9E2Re37rYgSHxR
 cWQ8YHx/RP03QP+8zT0edJVBbJCzCCodO4wHWj9Upr3Yi+diaKrqmnsOToB3zx81aG2Jrn
 t9FemYfwBpRGYQu/MV29un2h4ZddnDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-nqUgORaJN12QFtD3zfv2gA-1; Wed, 11 May 2022 13:51:54 -0400
X-MC-Unique: nqUgORaJN12QFtD3zfv2gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2351B801210
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:51:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9633640CF8EB;
 Wed, 11 May 2022 17:51:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
Subject: [PATCH 1/3] ui: Remove deprecated parameters of the "-display sdl"
 option
Date: Wed, 11 May 2022 19:51:45 +0200
Message-Id: <20220511175147.917707-2-thuth@redhat.com>
In-Reply-To: <20220511175147.917707-1-thuth@redhat.com>
References: <20220511175147.917707-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These parameters are in the way for further refactoring (since they
use an underscore in the name which is forbidden in QAPI), so let's
remove these now that their deprecation period is over.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 16 -------------
 docs/about/removed-features.rst | 17 ++++++++++++++
 softmmu/vl.c                    | 41 +--------------------------------
 qemu-options.hx                 | 32 ++-----------------------
 4 files changed, 20 insertions(+), 86 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97ab..ce7a5b97fc 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -109,22 +109,6 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
-``-display sdl,window_close=...`` (since 6.1)
-'''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
-an underscore between "window" and "close").
-
-``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
-
-``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,grab-mod=rctrl`` instead.
-
 ``-sdl`` (since 6.2)
 ''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4a0b270296..51bfc844f6 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,6 +355,23 @@ The ``-writeconfig`` option was not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and removed without a replacement.
 
+``-display sdl,window_close=...`` (removed in 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
+an underscore between "window" and "close").
+
+``-alt-grab`` and ``-display sdl,alt_grab=on`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
+
+``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=rctrl`` instead.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 488cc4d09e..fdf797270c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1068,32 +1068,7 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
-            } else if (strstart(opts, ",alt_grab=", &nextopt)) {
-                opts = nextopt;
-                if (strstart(opts, "on", &nextopt)) {
-                    alt_grab = 1;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    alt_grab = 0;
-                } else {
-                    goto invalid_sdl_args;
-                }
-                warn_report("alt_grab is deprecated, use grab-mod instead.");
-            } else if (strstart(opts, ",ctrl_grab=", &nextopt)) {
-                opts = nextopt;
-                if (strstart(opts, "on", &nextopt)) {
-                    ctrl_grab = 1;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    ctrl_grab = 0;
-                } else {
-                    goto invalid_sdl_args;
-                }
-                warn_report("ctrl_grab is deprecated, use grab-mod instead.");
-            } else if (strstart(opts, ",window_close=", &nextopt) ||
-                       strstart(opts, ",window-close=", &nextopt)) {
-                if (strstart(opts, ",window_close=", NULL)) {
-                    warn_report("window_close with an underscore is deprecated,"
-                                " please use window-close instead.");
-                }
+            } else if (strstart(opts, ",window-close=", &nextopt)) {
                 opts = nextopt;
                 dpy.has_window_close = true;
                 if (strstart(opts, "on", &nextopt)) {
@@ -1943,10 +1918,6 @@ static void qemu_create_early_backends(void)
     const bool use_gtk = false;
 #endif
 
-    if ((alt_grab || ctrl_grab) && !use_sdl) {
-        error_report("-alt-grab and -ctrl-grab are only valid "
-                     "for SDL, ignoring option");
-    }
     if (dpy.has_window_close && !use_gtk && !use_sdl) {
         error_report("window-close is only valid for GTK and SDL, "
                      "ignoring option");
@@ -3302,16 +3273,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.has_full_screen = true;
                 dpy.full_screen = true;
                 break;
-            case QEMU_OPTION_alt_grab:
-                alt_grab = 1;
-                warn_report("-alt-grab is deprecated, please use "
-                            "-display sdl,grab-mod=lshift-lctrl-lalt instead.");
-                break;
-            case QEMU_OPTION_ctrl_grab:
-                ctrl_grab = 1;
-                warn_report("-ctrl-grab is deprecated, please use "
-                            "-display sdl,grab-mod=rctrl instead.");
-                break;
             case QEMU_OPTION_sdl:
                 warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
diff --git a/qemu-options.hx b/qemu-options.hx
index 796229c433..0fa873d088 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1903,8 +1903,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display spice-app[,gl=on|off]\n"
 #endif
 #if defined(CONFIG_SDL)
-    "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off][,gl=on|core|es|off]\n"
-    "            [,grab-mod=<mod>][,show-cursor=on|off][,window-close=on|off]\n"
+    "-display sdl[,gl=on|core|es|off][,grab-mod=<mod>][,show-cursor=on|off]\n"
+    "            [,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
@@ -1977,12 +1977,6 @@ SRST
         the mouse grabbing in conjunction with the "g" key. ``<mods>`` can be
         either ``lshift-lctrl-lalt`` or ``rctrl``.
 
-        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
-        This parameter is deprecated - use ``grab-mod`` instead.
-
-        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing.
-        This parameter is deprecated - use ``grab-mod`` instead.
-
         ``gl=on|off|core|es`` : Use OpenGL for displaying
 
         ``show-cursor=on|off`` :  Force showing the mouse cursor
@@ -2068,28 +2062,6 @@ SRST
     is displayed in graphical mode.
 ERST
 
-DEF("alt-grab", 0, QEMU_OPTION_alt_grab,
-    "-alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-alt-grab``
-    Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that
-    this also affects the special keys (for fullscreen, monitor-mode
-    switching, etc). This option is deprecated - please use
-    ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
-ERST
-
-DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
-    "-ctrl-grab      use Right-Ctrl to grab mouse (instead of Ctrl-Alt)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-ctrl-grab``
-    Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this
-    also affects the special keys (for fullscreen, monitor-mode
-    switching, etc). This option is deprecated - please use
-    ``-display sdl,grab-mod=rctrl`` instead.
-ERST
-
 DEF("sdl", 0, QEMU_OPTION_sdl,
     "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
 SRST
-- 
2.27.0


