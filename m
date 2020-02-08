Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DB1564C9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 15:31:44 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0R96-0007O5-1F
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 09:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0R7f-0006s5-9h
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 09:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0R7e-0000LB-2h
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 09:30:15 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0R7d-0000JE-Py
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 09:30:14 -0500
Received: by mail-wr1-x443.google.com with SMTP id w12so2237674wrt.2
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jldfeyhibgwz/hALDb0UCMObdB2yvimuHG3aVF9SutI=;
 b=IVU+Pkc3nBvA7SQCiXUnxZVMvWz3OC/HF+h3/wsiwSBpVh4lfzq5zBiH5Q4rDGuYZn
 gyR5UR8N3dXEtHJ7i2T/VrLXpei0BMJNy+QcuZrkTbQ7SibJ4T7eSQZCTojs6Rxz0JuM
 FqSrc+EmEMOkZcsLDVqkxZAxlVUsByDNd1o1mwWjMpqqT/cRyn/y/U4T/IIGxX079mVi
 ybtJFL1MrNxYr/n5Ha0x7dFbRD2W8T7cKHhb2wATseL2AscvwcRVI1FaneFcAU+WpxQO
 V+So2EC+/jZzXUUa17QnG2D5WGDneq8FshJ0zuSiR7pglXXd6Gk1SPa4D1R7D9oSJDMx
 +OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jldfeyhibgwz/hALDb0UCMObdB2yvimuHG3aVF9SutI=;
 b=MPQQCqVBEiXNTks6sppkgFzgLm3iPoh24Y0dKESydMXbITrfGppuVKb30aA2pS/Uvi
 AnBqoVQwnZ4pVIfa4M2u9/QLv99TKP3G8+nB6pfoQtoyeaHAB7HhKkb8e9Q5c+LSpPT9
 9DgYQF6BpuRERcUzry4bCLUp2n/eJFG7cCd7BRMcMitoN+gsAvx0pBaGqbJEnvBQmPu/
 SYSMm4V7sxJyMB+TBDez381TzcA80vNZXaoqRpooNPt9jPTIlaVz6L0OEcC9V2+H1y2W
 KVhJTqb2LAmY0Y48A6qvtpURpjdeLsvQIPFshClpfCrh/XIYtcXf8riVcFclDbX9+bu7
 Y3DA==
X-Gm-Message-State: APjAAAWtMt6d46dAWm6YPFU37KQQvtH6KUmsC8yi6st1odTxzjVBT7kQ
 u/5hH4gjqblHif+rjXu5Bb7xtlZC
X-Google-Smtp-Source: APXvYqxD4NA0y+/61BBCKkH1DnAZVlrDdSotCeyP08auBWGYezg9WSC0NShDib2x0UAml2xVhFKFvw==
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr4867555wrq.104.1581172212133; 
 Sat, 08 Feb 2020 06:30:12 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s23sm2229947wra.15.2020.02.08.06.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 06:30:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Fix gd_refresh_rate_millihz() when using
 VirtualConsole
Date: Sat,  8 Feb 2020 15:30:08 +0100
Message-Id: <20200208143008.6157-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Nikola Pavlica <pavlica.nikola@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix using virtual console under gtk 3.22.30 (mate 1.20.1):

  qemu-system-x86_64: Gdk: gdk_window_get_origin: assertion 'GDK_IS_WINDOW (window)' failed

Fixes: c4c00922cc and 28b58f19d2 (display/gtk: get proper refreshrate)
Reported-by: Jan Kiszka <jan.kiszka@web.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Nikola Pavlica <pavlica.nikola@gmail.com>
Report:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg678130.html
---
 ui/gtk.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index d18892d1de..c59297ff4d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1965,11 +1965,11 @@ static GtkWidget *gd_create_menu_machine(GtkDisplayState *s)
  * If available, return the refresh rate of the display in milli-Hertz,
  * else return 0.
  */
-static int gd_refresh_rate_millihz(GtkDisplayState *s)
+static int gd_refresh_rate_millihz(GtkWidget *window)
 {
 #ifdef GDK_VERSION_3_22
-    GdkDisplay *dpy = gtk_widget_get_display(s->window);
-    GdkWindow *win = gtk_widget_get_window(s->window);
+    GdkDisplay *dpy = gtk_widget_get_display(window);
+    GdkWindow *win = gtk_widget_get_window(window);
     GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
 
     return gdk_monitor_get_refresh_rate(monitor);
@@ -2045,7 +2045,8 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.kbd = qkbd_state_init(con);
     vc->gfx.dcl.con = con;
 
-    refresh_rate_millihz = gd_refresh_rate_millihz(s);
+    refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ?
+                                                   vc->window : s->window);
     if (refresh_rate_millihz) {
         vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / refresh_rate_millihz;
     }
-- 
2.21.1


