Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C781D5F65
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 09:24:53 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZrBk-0003fs-B6
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 03:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jZr7Z-0006Mx-Mr
 for qemu-devel@nongnu.org; Sat, 16 May 2020 03:20:33 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:46926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jZr7Y-0004GL-IT
 for qemu-devel@nongnu.org; Sat, 16 May 2020 03:20:33 -0400
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout02.t-online.de (Postfix) with SMTP id D206841C69C1;
 Sat, 16 May 2020 09:20:30 +0200 (CEST)
Received: from linpower.localnet
 (STFAzGZfghEGdU8d2YYGkRtMvL3KieeF5PsbyYkvcVbM2kVjY5aUBH2HgUXK0IXgUj@[46.86.59.135])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jZr7M-3rmvB20; Sat, 16 May 2020 09:20:20 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id DD1542006D1; Sat, 16 May 2020 09:20:14 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 03/11] ui/gkt: release all keys on grab-broken-event
Date: Sat, 16 May 2020 09:20:06 +0200
Message-Id: <20200516072014.7766-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <bea1a22a-1fb4-b49b-c089-e0a5c5cf55cd@t-online.de>
References: <bea1a22a-1fb4-b49b-c089-e0a5c5cf55cd@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: STFAzGZfghEGdU8d2YYGkRtMvL3KieeF5PsbyYkvcVbM2kVjY5aUBH2HgUXK0IXgUj
X-TOI-EXPURGATEID: 150726::1589613620-0001455D-92F6E522/0/0 CLEAN NORMAL
X-TOI-MSGID: a67a97c5-942b-4d25-8c49-14bcb8b79084
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/16 03:20:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no way to grab the Ctrl-Alt-Del key combination on
Windows. This key combination will leave all three keys in a
stuck condition. This patch uses the grab-broken-event to
release the keys.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index a0b10a1403..655b26de38 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1142,6 +1142,25 @@ static gboolean gd_key_event(GtkWidget *widget, GdkEventKey *key, void *opaque)
     return TRUE;
 }
 
+static gboolean gd_grab_broken_event(GtkWidget *widget,
+                                     GdkEventGrabBroken *event, void *opaque)
+{
+#ifdef CONFIG_WIN32
+    /*
+     * On Windows the Ctrl-Alt-Del key combination can't be grabbed. This
+     * key combination leaves all three keys in a stuck condition. We use
+     * the grab-broken-event to release all keys.
+     */
+    if (event->keyboard) {
+        VirtualConsole *vc = opaque;
+        GtkDisplayState *s = vc->s;
+
+        gtk_release_modifiers(s);
+    }
+#endif
+    return TRUE;
+}
+
 static gboolean gd_event(GtkWidget *widget, GdkEvent *event, void *opaque)
 {
     if (event->type == GDK_MOTION_NOTIFY) {
@@ -1910,6 +1929,8 @@ static void gd_connect_vc_gfx_signals(VirtualConsole *vc)
                          G_CALLBACK(gd_focus_out_event), vc);
         g_signal_connect(vc->gfx.drawing_area, "configure-event",
                          G_CALLBACK(gd_configure), vc);
+        g_signal_connect(vc->gfx.drawing_area, "grab-broken-event",
+                         G_CALLBACK(gd_grab_broken_event), vc);
     } else {
         g_signal_connect(vc->gfx.drawing_area, "key-press-event",
                          G_CALLBACK(gd_text_key_down), vc);
-- 
2.26.1


