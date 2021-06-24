Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08503B2A79
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:36:02 +0200 (CEST)
Received: from localhost ([::1]:59592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKq9-0001Af-UO
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnJ-0004DH-RQ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnH-0001Fw-U8
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqnl0HCQFHvn4674Ff3SrwJyalPTu2kqbe/AvKIotUc=;
 b=SwGtc0lNyELrq5iZl76rls8swAaF6VnBjg5PqsaNji4bKNGy4oOS+AGRfPZqzLvkzisTIg
 B1brul4FHsijONgNk0aMHX/VN6MSj8W1dQEHY8/G0fVqB8FS57yE7A5XqsAAejtO1RB6cx
 APLm3Ghpl5g/zUnjxJWHjSiSdF31coA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-QJjHe5SgOPu6hL9zOK5Zfg-1; Thu, 24 Jun 2021 04:32:59 -0400
X-MC-Unique: QJjHe5SgOPu6hL9zOK5Zfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2082EEC1A5;
 Thu, 24 Jun 2021 08:32:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A82D2604CD;
 Thu, 24 Jun 2021 08:32:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 293F418007AD; Thu, 24 Jun 2021 10:32:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] Add display suboptions to man pages
Date: Thu, 24 Jun 2021 10:32:45 +0200
Message-Id: <20210624083246.2297440-5-kraxel@redhat.com>
In-Reply-To: <20210624083246.2297440-1-kraxel@redhat.com>
References: <20210624083246.2297440-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ahmed Abouzied <email@aabouzied.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ahmed Abouzied <email@aabouzied.com>

Updates man pages with the suboptions for the `-display`.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/128
Buglink: https://bugs.launchpad.net/qemu/+bug/1620660
Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Message-Id: <20210601174117.661-1-email@aabouzied.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-options.hx | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3ad..ba3ca9da1df1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1819,11 +1819,22 @@ SRST
     old style -sdl/-curses/... options. Use ``-display help`` to list
     the available display types. Valid values for type are
 
-    ``sdl``
+    ``spice-app[,gl=on|off]``
+        Start QEMU as a Spice server and launch the default Spice client
+        application. The Spice server will redirect the serial consoles
+        and QEMU monitors. (Since 4.0)
+
+    ``sdl[,window-close=on|off][,gl=on|core|es|off]``
+
         Display video output via SDL (usually in a separate graphics
         window; see the SDL documentation for other possibilities).
 
-    ``curses``
+    ``gtk[,grab-on-hover=on|off][,gl=on|off]``
+        Display video output in a GTK window. This interface provides
+        drop-down menus and other UI elements to configure and control
+        the VM during runtime.
+
+    ``curses [,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
         curses/ncurses interface. Nothing is displayed when the graphics
@@ -1834,6 +1845,11 @@ SRST
         ``charset=CP850`` for IBM CP850 encoding. The default is
         ``CP437``.
 
+    ``egl-headless[,rendernode<file>]``
+        Offload all OpenGL operations to a local DRI device. For any
+        graphical display, this display needs to be paired with either
+        VNC or SPICE displays.
+
     ``none``
         Do not display video output. The guest will still see an
         emulated graphics card, but its output will not be displayed to
@@ -1842,23 +1858,8 @@ SRST
         also changes the destination of the serial and parallel port
         data.
 
-    ``gtk``
-        Display video output in a GTK window. This interface provides
-        drop-down menus and other UI elements to configure and control
-        the VM during runtime.
 
-    ``vnc``
-        Start a VNC server on display <arg>
 
-    ``egl-headless``
-        Offload all OpenGL operations to a local DRI device. For any
-        graphical display, this display needs to be paired with either
-        VNC or SPICE displays.
-
-    ``spice-app``
-        Start QEMU as a Spice server and launch the default Spice client
-        application. The Spice server will redirect the serial consoles
-        and QEMU monitors. (Since 4.0)
 ERST
 
 DEF("nographic", 0, QEMU_OPTION_nographic,
-- 
2.31.1


