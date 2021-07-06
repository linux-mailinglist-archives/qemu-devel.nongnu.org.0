Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD23BC95B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:17:33 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i8y-0000o0-4b
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htp-0000hI-OD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htj-0002Da-Ds
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so1270584wmq.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6aNxwHF6FfhNTM323fnYbaSoWg5caXXq9HNel1YVE4=;
 b=d+J7booXGchAryftWsorImLf0CNSQqiSs04Azw9J0lruH0QvPWn2QEIs2SRQh8Mdm4
 fL/OC9QbAP9ApJLl1QEv4iqoe7NMjuazCfc0t0AB2QLSHOl3wi6ayEdPkL8Vihr6Gb3Y
 87+k6dHCWJbYSq3iIbOvASuBKmlmradQccbm+0aFqS7ARYjPT53BbDAVuHrRjzWh05S4
 aWDl2Vg07Ae2QyCzCr87xdSEUPMdI1PTf+bQSgoCrGC9ZMkBgFMTwY3mdQQRsmLbgHxM
 TuZOrRsgY6yskXb4IMLgJU+o7ti14LCmOcMhkne40btwUvDVuk12VWVFXXD5L7/SxzVw
 gGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H6aNxwHF6FfhNTM323fnYbaSoWg5caXXq9HNel1YVE4=;
 b=EJMhUYotrQlA+AoN5C1xk6wBKRRpjeUaXouR1EMGVJ3Zn+7Rk9NOafak2nvUzP6kEh
 5nTpTNBJcOMauOC2+HfjSQ0KKPKixLVWcicf9ze2vRJU4LcJeeW2tf6UPUS+qSfWbiwL
 w9a3T1B+CMUqhHsio3tnbqs5gQrd7iPq/8JQX2Pusgi4hZaAcgPKkaDS4wvAufi7ZHsF
 fgRybqapFRPv2/4EEnxDvBpK1p73N1okA5gbzKMTBf/QEvrEfY8nci+C+qw24F1pmG6O
 hT9/P5L4mz/HaziceGglxQ4jD+q46OHuFRCW4EIb19+N5HW6PdGvhlHMtno8RIRqvHW9
 w6qw==
X-Gm-Message-State: AOAM533gK6si8KWc3XnUtZtrLwQlF/a3ctHEMVb4r8zbhGWgsJZD0XBk
 V0RCkdSPOawCe7wVaZsoT7u8JekcVt0=
X-Google-Smtp-Source: ABdhPJzV+N/6+TKIyAKVefvMQwwW6974dcYE2SFNyArYTiM4k3Sdf6S9jZfSFR8Te8VGocWgIc6RIg==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr19048018wmc.102.1625565706118; 
 Tue, 06 Jul 2021 03:01:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/40] qemu-options: Improve the documentation of the -display
 options
Date: Tue,  6 Jul 2021 12:01:06 +0200
Message-Id: <20210706100141.303960-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The sdl and gtk display options support more parameters than currently
documented. Also the "vnc" option got lost during a recent commit,
add it again.

Fixes: ddc717581c ("Add display suboptions to man pages")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210630163231.467987-5-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 45 +++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index c862f1fa57..8965dabc83 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1783,11 +1783,12 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display spice-app[,gl=on|off]\n"
 #endif
 #if defined(CONFIG_SDL)
-    "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off]\n"
-    "            [,window-close=on|off][,gl=on|core|es|off]\n"
+    "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off][,gl=on|core|es|off]\n"
+    "            [,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
-    "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
+    "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
+    "            [,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
@@ -1824,17 +1825,37 @@ SRST
         application. The Spice server will redirect the serial consoles
         and QEMU monitors. (Since 4.0)
 
-    ``sdl[,window-close=on|off][,gl=on|core|es|off]``
-
+    ``sdl``
         Display video output via SDL (usually in a separate graphics
         window; see the SDL documentation for other possibilities).
+        Valid parameters are:
 
-    ``gtk[,grab-on-hover=on|off][,gl=on|off]``
+        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
+
+        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
+
+        ``gl=on|off|core|es`` : Use OpenGL for displaying
+
+        ``show-cursor=on|off`` :  Force showing the mouse cursor
+
+        ``window-close=on|off`` : Allow to quit qemu with window close button
+
+    ``gtk``
         Display video output in a GTK window. This interface provides
         drop-down menus and other UI elements to configure and control
-        the VM during runtime.
+        the VM during runtime. Valid parameters are:
 
-    ``curses [,charset=<encoding>]``
+        ``full-screen=on|off`` : Start in fullscreen mode
+
+        ``gl=on|off`` : Use OpenGL for displaying
+
+        ``grab-on-hover=on|off`` : Grab keyboard input on mouse hover
+
+        ``show-cursor=on|off`` :  Force showing the mouse cursor
+
+        ``window-close=on|off`` : Allow to quit qemu with window close button
+
+    ``curses[,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
         curses/ncurses interface. Nothing is displayed when the graphics
@@ -1845,11 +1866,14 @@ SRST
         ``charset=CP850`` for IBM CP850 encoding. The default is
         ``CP437``.
 
-    ``egl-headless[,rendernode<file>]``
+    ``egl-headless[,rendernode=<file>]``
         Offload all OpenGL operations to a local DRI device. For any
         graphical display, this display needs to be paired with either
         VNC or SPICE displays.
 
+    ``vnc=<display>``
+        Start a VNC server on display <display>
+
     ``none``
         Do not display video output. The guest will still see an
         emulated graphics card, but its output will not be displayed to
@@ -1857,9 +1881,6 @@ SRST
         that it only affects what is done with video output; -nographic
         also changes the destination of the serial and parallel port
         data.
-
-
-
 ERST
 
 DEF("nographic", 0, QEMU_OPTION_nographic,
-- 
2.31.1



