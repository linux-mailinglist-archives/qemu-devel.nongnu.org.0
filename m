Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27763B8732
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:40:55 +0200 (CEST)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydGg-0004u2-Ur
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd93-0005IT-19
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd8z-0000LR-Tk
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625070773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M51bOoNjPAmBMy69JSkM64p+7Wj+p5NzWjA+GJAgD4I=;
 b=QtPCExCvIH7NgHbYhv50wFP++hWx0FsuSe49Ilc14BCMlIoJwTPld4klw3wAkjplynA8r7
 ubvLPqHO55dinXmvM5r6tpBh1eReCWhYg23gbGPn6zUEv/wR8z29mtgGI8B3DqMhrJyCBH
 uYWHd7+cjR+SJ23H/bxTs2PFlWqbZgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-LiyvFY84MpCtRbZ3oYLZeA-1; Wed, 30 Jun 2021 12:32:51 -0400
X-MC-Unique: LiyvFY84MpCtRbZ3oYLZeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C956D804140
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:32:50 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC7BB5C1A3;
 Wed, 30 Jun 2021 16:32:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH 4/4] qemu-options: Improve the documentation of the -display
 options
Date: Wed, 30 Jun 2021 18:32:31 +0200
Message-Id: <20210630163231.467987-5-thuth@redhat.com>
In-Reply-To: <20210630163231.467987-1-thuth@redhat.com>
References: <20210630163231.467987-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sdl and gtk display options support more parameters than currently
documented. Also the "vnc" option got lost during a recent commit,
add it again.

Fixes: ddc717581c ("Add display suboptions to man pages")
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
+
+        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
+
+        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
+
+        ``gl=on|off|core|es`` : Use OpenGL for displaying
 
-    ``gtk[,grab-on-hover=on|off][,gl=on|off]``
+        ``show-cursor=on|off`` :  Force showing the mouse cursor
+
+        ``window-close=on|off`` : Allow to quit qemu with window close button
+
+    ``gtk``
         Display video output in a GTK window. This interface provides
         drop-down menus and other UI elements to configure and control
-        the VM during runtime.
+        the VM during runtime. Valid parameters are:
+
+        ``full-screen=on|off`` : Start in fullscreen mode
+
+        ``gl=on|off`` : Use OpenGL for displaying
 
-    ``curses [,charset=<encoding>]``
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
2.27.0


