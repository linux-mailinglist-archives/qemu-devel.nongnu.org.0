Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0582D8EE7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:59:01 +0100 (CET)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUi4-0007K8-7b
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUge-0005dH-3g
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:32 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:35058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUgc-0003SF-C2
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:31 -0500
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout08.t-online.de (Postfix) with SMTP id AE81E417B4C9;
 Sun, 13 Dec 2020 17:57:27 +0100 (CET)
Received: from linpower.localnet
 (VTwmWaZQwhPd+OXvpwybyOOuGlUOJ6YlQESurqbHJEpgW47dywQcazuuyNZla2pZAF@[79.208.17.59])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koUgZ-0PNitc0; Sun, 13 Dec 2020 17:57:27 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 10D49200615; Sun, 13 Dec 2020 17:57:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/3] ui/gtk: rename variable window to widget
Date: Sun, 13 Dec 2020 17:57:23 +0100
Message-Id: <20201213165724.13418-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
References: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VTwmWaZQwhPd+OXvpwybyOOuGlUOJ6YlQESurqbHJEpgW47dywQcazuuyNZla2pZAF
X-TOI-EXPURGATEID: 150726::1607878647-0000F958-07F82434/0/0 CLEAN NORMAL
X-TOI-MSGID: a29b28fa-90da-4d94-a3ca-83e5eabaec0f
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type of the variable window is GtkWidget. Rename the variable
from window to widget, because windows and widgets are different
things.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 86b386a20d..7ff9327b9d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,13 +752,13 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the refresh rate of the display in milli-Hertz,
  * else return 0.
  */
-static int gd_refresh_rate_millihz(GtkWidget *window)
+static int gd_refresh_rate_millihz(GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
-    GdkWindow *win = gtk_widget_get_window(window);
+    GdkWindow *win = gtk_widget_get_window(widget);
 
     if (win) {
-        GdkDisplay *dpy = gtk_widget_get_display(window);
+        GdkDisplay *dpy = gtk_widget_get_display(widget);
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
 
         return gdk_monitor_get_refresh_rate(monitor);
-- 
2.26.2


