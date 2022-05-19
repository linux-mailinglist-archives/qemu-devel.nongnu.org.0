Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33D52DA1B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:24:04 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriwV-0008Vb-Kr
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriWB-0007Rj-20
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriVv-00031f-OS
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652975793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuoKonwi4ea8DjA+TbiypqNitrSbcQvzjIJkVp9vv+c=;
 b=NlGm7V+UpPsYIHrfmaGFEl6hAWs8K7gRVl4MQwvpgLqa2WKAAl/YBA4g0B7ZoSHy29MRCG
 fPHUh4N4EhPTligjnwYTZV/W1VtIwiwuMtvO78deOsABIM0UemXUaJ8J36tiHpPeILRApZ
 26UhlnImfNca2VMz4S+u2/M+yfVewHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-L-xu0UWoN_6JmjDO2l2DBw-1; Thu, 19 May 2022 11:56:32 -0400
X-MC-Unique: L-xu0UWoN_6JmjDO2l2DBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7381185A5AA
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 15:56:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6249401E74;
 Thu, 19 May 2022 15:56:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/3] ui: Remove deprecated parameters of the "-display sdl"
 option
Date: Thu, 19 May 2022 17:56:23 +0200
Message-Id: <20220519155625.1414365-2-thuth@redhat.com>
In-Reply-To: <20220519155625.1414365-1-thuth@redhat.com>
References: <20220519155625.1414365-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dropping these deprecated parameters simplifies further refactoring
(e.g. QAPIfication is easier without underscores in the name).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 16 -------------
 docs/about/removed-features.rst | 17 ++++++++++++++
 softmmu/vl.c                    | 41 +--------------------------------
 qemu-options.hx                 | 32 ++-----------------------
 4 files changed, 20 insertions(+), 86 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a92ae0f162..562a133f18 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -81,22 +81,6 @@ the process listing. This is replaced by the new ``password-secret``
 option which lets the password be securely provided on the command
 line using a ``secret`` object instance.
 
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
index eb76974347..4c9e001c35 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -370,6 +370,23 @@ The ``opened=on`` option in the command line or QMP ``object-add`` either had
 no effect (if ``opened`` was the last option) or caused errors.  The property
 is therefore useless and should simply be removed.
 
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
index 84a31eba76..57ab9d5322 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1079,32 +1079,7 @@ static void parse_display(const char *p)
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
@@ -1962,10 +1937,6 @@ static void qemu_create_early_backends(void)
     const bool use_gtk = false;
 #endif
 
-    if ((alt_grab || ctrl_grab) && !use_sdl) {
-        error_report("-alt-grab and -ctrl-grab are only valid "
-                     "for SDL, ignoring option");
-    }
     if (dpy.has_window_close && !use_gtk && !use_sdl) {
         error_report("window-close is only valid for GTK and SDL, "
                      "ignoring option");
@@ -3273,16 +3244,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
index a664baaa18..726e437a97 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1938,8 +1938,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
@@ -2012,12 +2012,6 @@ SRST
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
@@ -2103,28 +2097,6 @@ SRST
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


