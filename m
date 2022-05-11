Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35852523C0B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:56:18 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqZN-0006pF-1r
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVI-0002Q2-NQ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVG-0004gD-VL
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652291521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1Qa8eWiKw7oxT4a4786YMEFlQyElPX/kzcM6YGI3EA=;
 b=aZu5i7MYZ2dm3/ODD5R6wch/ut5g5TZjSs+orHqGIqm1YT6vVwXUgBMCYnM2ZW1fIFMlkT
 Tz0jKmZKqEHGPU0AnMttyIA89IkJvKsweQEjhz2zivxAtSKupVeQCUdLsuSjXGmMcPQJDY
 JQSWnszyXniqS4agC4MGua5K49bgIVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-jugtt2tdOc-rqoCeyagomA-1; Wed, 11 May 2022 13:51:58 -0400
X-MC-Unique: jugtt2tdOc-rqoCeyagomA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1EA8101A52C
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:51:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59A2B400E872;
 Wed, 11 May 2022 17:51:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
Subject: [PATCH 3/3] ui: Remove deprecated options "-sdl" and "-curses"
Date: Wed, 11 May 2022 19:51:47 +0200
Message-Id: <20220511175147.917707-4-thuth@redhat.com>
In-Reply-To: <20220511175147.917707-1-thuth@redhat.com>
References: <20220511175147.917707-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

We have "-sdl" and "-curses", but no "-gtk" and no "-cocoa" ...
these old-style options are rather confusing than helpful nowadays.
Now that the deprecation period is over, let's remove them, so we
get a cleaner interface (where "-display" is the only way to select
the user interface).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 10 ----------
 docs/about/removed-features.rst | 10 ++++++++++
 softmmu/vl.c                    | 19 -------------------
 qemu-options.hx                 | 24 ++----------------------
 4 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ce7a5b97fc..0ed0e9cb13 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -109,16 +109,6 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
-``-sdl`` (since 6.2)
-''''''''''''''''''''
-
-Use ``-display sdl`` instead.
-
-``-curses`` (since 6.2)
-'''''''''''''''''''''''
-
-Use ``-display curses`` instead.
-
 ``-watchdog`` (since 6.2)
 '''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 51bfc844f6..0d5ffb353e 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -371,6 +371,16 @@ Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 
 Use ``-display sdl,grab-mod=rctrl`` instead.
 
+``-sdl`` (removed in 7.1)
+'''''''''''''''''''''''''
+
+Use ``-display sdl`` instead.
+
+``-curses`` (removed in 7.1)
+''''''''''''''''''''''''''''
+
+Use ``-display curses`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 90a0a4d393..9887c71791 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2845,16 +2845,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 nographic = true;
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
-            case QEMU_OPTION_curses:
-                warn_report("-curses is deprecated, "
-                            "use -display curses instead.");
-#ifdef CONFIG_CURSES
-                dpy.type = DISPLAY_TYPE_CURSES;
-#else
-                error_report("curses or iconv support is disabled");
-                exit(1);
-#endif
-                break;
             case QEMU_OPTION_portrait:
                 graphic_rotate = 90;
                 break;
@@ -3205,15 +3195,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.has_full_screen = true;
                 dpy.full_screen = true;
                 break;
-            case QEMU_OPTION_sdl:
-                warn_report("-sdl is deprecated, use -display sdl instead.");
-#ifdef CONFIG_SDL
-                dpy.type = DISPLAY_TYPE_SDL;
-                break;
-#else
-                error_report("SDL support is disabled");
-                exit(1);
-#endif
             case QEMU_OPTION_pidfile:
                 pid_file = optarg;
                 break;
diff --git a/qemu-options.hx b/qemu-options.hx
index 0fa873d088..1abf3e500f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1946,9 +1946,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     , QEMU_ARCH_ALL)
 SRST
 ``-display type``
-    Select type of display to use. This option is a replacement for the
-    old style -sdl/-curses/... options. Use ``-display help`` to list
-    the available display types. Valid values for type are
+    Select type of display to use. Use ``-display help`` to list the available
+    display types. Valid values for type are
 
     ``spice-app[,gl=on|off]``
         Start QEMU as a Spice server and launch the default Spice client
@@ -2050,25 +2049,6 @@ SRST
     Use C-a h for help on switching between the console and monitor.
 ERST
 
-DEF("curses", 0, QEMU_OPTION_curses,
-    "-curses         shorthand for -display curses\n",
-    QEMU_ARCH_ALL)
-SRST
-``-curses``
-    Normally, if QEMU is compiled with graphical window support, it
-    displays output such as guest graphics, guest console, and the QEMU
-    monitor in a window. With this option, QEMU can display the VGA
-    output when in text mode using a curses/ncurses interface. Nothing
-    is displayed in graphical mode.
-ERST
-
-DEF("sdl", 0, QEMU_OPTION_sdl,
-    "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
-SRST
-``-sdl``
-    Enable SDL.
-ERST
-
 #ifdef CONFIG_SPICE
 DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
-- 
2.27.0


