Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5B52DA4D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:33:07 +0200 (CEST)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrj5G-0001rb-9i
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriW9-0007MB-Vp
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriVz-00032G-Ax
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652975798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IovU1QTpZA81AIT0Gbs7eSE9rqZTJy4GUXf6wYRsIjc=;
 b=eEZucDWQMe8RKQyVPsWmRWBlOkvTmh8eG1L2896SDu1TvsjoOeQdj7LyvLmSEoYbrs7BJC
 8bTod0mKGt4yJeFbBVqVi83E9AiPT2dPdzLZMmtguQREb3z9MBa9WNCQNKjOFz3fTAPTCK
 E+9uTFaqnX74cSJpe6b4sJb64XDv4co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501--DZofsW4NTu_QCrfyG-KTQ-1; Thu, 19 May 2022 11:56:37 -0400
X-MC-Unique: -DZofsW4NTu_QCrfyG-KTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9E65101A52C
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 15:56:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA62492C14;
 Thu, 19 May 2022 15:56:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/3] ui: Remove deprecated options "-sdl" and "-curses"
Date: Thu, 19 May 2022 17:56:25 +0200
Message-Id: <20220519155625.1414365-4-thuth@redhat.com>
In-Reply-To: <20220519155625.1414365-1-thuth@redhat.com>
References: <20220519155625.1414365-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

We have "-sdl" and "-curses", but no "-gtk" and no "-cocoa" ...
these old-style options are rather confusing than helpful nowadays.
Now that the deprecation period is over, let's remove them, so we
get a cleaner interface (where "-display" is the only way to select
the user interface).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 10 ----------
 docs/about/removed-features.rst | 10 ++++++++++
 softmmu/vl.c                    | 19 -------------------
 qemu-options.hx                 | 24 ++----------------------
 4 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 562a133f18..e19bcba242 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -81,16 +81,6 @@ the process listing. This is replaced by the new ``password-secret``
 option which lets the password be securely provided on the command
 line using a ``secret`` object instance.
 
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
index 4c9e001c35..c7b9dadd5d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -386,6 +386,16 @@ Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 
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
index 484e9d9921..4c1e94b00e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2800,16 +2800,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
@@ -3176,15 +3166,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
index 726e437a97..60cf188da4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1981,9 +1981,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
@@ -2085,25 +2084,6 @@ SRST
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


