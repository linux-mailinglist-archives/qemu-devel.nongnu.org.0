Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A360E8E2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:18:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onltA-0005Qx-OH; Wed, 26 Oct 2022 15:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsw-00059n-52
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:20 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsu-0001oA-AR
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666811776; x=1698347776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VyhdR+JFZF3vUvMpGHJWvJ8DCkfPBmGnMQymf00KSJg=;
 b=nUB0dL5HZ+mBWxGq+5Hle1DWl1i8dmKrzCEu/RQ5rn05pj0+F2J0sbL0
 wPsT0aM8YbzDdY4X8XSXiDMeObNkfhsAwraZ7Y84+G70m4teAgd/vkqvo
 5cCG37x1uqueQrMeTwYZ46XM8Hzl8pZSpigwhG83xaX0A3QmruHnAKjp+
 gJSQSftnQ5A2fHLtlRqgc/ryKdpsn5U5tWjoWQpgRYMe4GIQrtIaZKEUO
 f4tn7Nz31e22oE9D/S6OSCGau2mfCCtaWNlE0X8fcvafDVSiOISvmaQHi
 4LwWKKWpufw6qmS8hPuC7AY4KsX2Zax67e/NNkhoH/jcWl2qh3gLI9P4C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306769452"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306769452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 12:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610080572"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610080572"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 12:16:11 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, armbru@redhat.com, f4bug@amsat.org,
 marcandre.lureau@redhat.com, thuth@redhat.com, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 2/3] ui/gtk: set the ui size to 0 when invisible
Date: Wed, 26 Oct 2022 12:04:20 -0700
Message-Id: <20221026190421.16922-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221026190421.16922-1-dongwon.kim@intel.com>
References: <20221026190421.16922-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=dongwon.kim@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Make guest displays disconnected when not visible. Setting ui size to 0
is used to indicate that the display is disconnected. When the VC is
visible again, the ui size is set to associated window's size again which
makes the display reconnected and available to the guest. 

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index a1fb42f34d..46c3135f6d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1270,10 +1270,12 @@ static void gd_menu_switch_vc(GtkMenuItem *item, void *opaque)
     GtkDisplayState *s = opaque;
     VirtualConsole *vc;
     GtkNotebook *nb = GTK_NOTEBOOK(s->notebook);
+    GdkWindow *window;
     gint page;
 
     vc = gd_vc_find_current(s);
     vc->gfx.visible = false;
+    gd_set_ui_size(vc, 0, 0);
 
     vc = gd_vc_find_by_menu(s);
     gtk_release_modifiers(s);
@@ -1281,6 +1283,9 @@ static void gd_menu_switch_vc(GtkMenuItem *item, void *opaque)
         page = gtk_notebook_page_num(nb, vc->tab_item);
         gtk_notebook_set_current_page(nb, page);
         gtk_widget_grab_focus(vc->focus);
+        window = gtk_widget_get_window(vc->gfx.drawing_area);
+        gd_set_ui_size(vc, gdk_window_get_width(window),
+                       gdk_window_get_height(window));
         vc->gfx.visible = true;
     }
 }
@@ -1312,6 +1317,7 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
     GtkDisplayState *s = vc->s;
 
     vc->gfx.visible = false;
+    gd_set_ui_size(vc, 0, 0);
     gtk_widget_set_sensitive(vc->menu_item, true);
     gd_widget_reparent(vc->window, s->notebook, vc->tab_item);
     gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(s->notebook),
@@ -1347,6 +1353,7 @@ static gboolean gd_win_grab(void *opaque)
 static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
+    GdkWindow *window;
     VirtualConsole *vc = gd_vc_find_current(s);
 
     if (vc->type == GD_VC_GFX &&
@@ -1385,6 +1392,10 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
         gd_update_geometry_hints(vc);
         gd_update_caption(s);
     }
+
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    gd_set_ui_size(vc, gdk_window_get_width(window),
+                   gdk_window_get_height(window));
     vc->gfx.visible = true;
 }
 
@@ -1709,7 +1720,9 @@ static gboolean gd_configure(GtkWidget *widget,
 {
     VirtualConsole *vc = opaque;
 
-    gd_set_ui_size(vc, cfg->width, cfg->height);
+    if (vc->gfx.visible) {
+        gd_set_ui_size(vc, cfg->width, cfg->height);
+    }
     return FALSE;
 }
 
-- 
2.30.2


