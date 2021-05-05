Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDE3734E8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:16:39 +0200 (CEST)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leApq-0004A4-IZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAjF-00059h-B8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAjB-0001uH-HR
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620194984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kHGcQeH/YsVoKE6U8oVby4nJ8sCvLALF+LYet0BZAg=;
 b=BspldtMX868GUIx5kTLWMznZ6sNGjJj+Qnt+dnws4CH6B0vcdRbhAW9baAuxIT+Ks442xE
 NgoEVIERSfAfzBXIjnbZ5ZSHkHOTZHlB90Cq/vGW/mNjvUVN9LwTgVUA2KApR8Sj2IojUa
 /7asdoeXPskDRSeUSKFQ739NS6eYti0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Ch6Z1j8zN42uwNptFQPCNA-1; Wed, 05 May 2021 02:09:43 -0400
X-MC-Unique: Ch6Z1j8zN42uwNptFQPCNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4D38042A8
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 06:09:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69B0B5C22A;
 Wed,  5 May 2021 06:09:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8FAE18007A3; Wed,  5 May 2021 08:09:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 8/9] ui/gtk: move struct GtkDisplayState to ui/gtk.h
Date: Wed,  5 May 2021 08:09:00 +0200
Message-Id: <20210505060901.828658-9-kraxel@redhat.com>
In-Reply-To: <20210505060901.828658-1-kraxel@redhat.com>
References: <20210505060901.828658-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Want place gtk clipboard code in a separate C file, which in turn
requires GtkDisplayState being in a header file.  So move it.  No
functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/gtk.h | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
 ui/gtk.c         | 55 ----------------------------------------------
 2 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 5ae0ad60a600..6e751794043f 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -18,12 +18,15 @@
 #include <gdk/gdkwayland.h>
 #endif
 
+#include "ui/console.h"
 #include "ui/kbd-state.h"
 #if defined(CONFIG_OPENGL)
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
 #endif
 
+#define MAX_VCS 10
+
 typedef struct GtkDisplayState GtkDisplayState;
 
 typedef struct VirtualGfxConsole {
@@ -83,6 +86,60 @@ typedef struct VirtualConsole {
     };
 } VirtualConsole;
 
+struct GtkDisplayState {
+    GtkWidget *window;
+
+    GtkWidget *menu_bar;
+
+    GtkAccelGroup *accel_group;
+
+    GtkWidget *machine_menu_item;
+    GtkWidget *machine_menu;
+    GtkWidget *pause_item;
+    GtkWidget *reset_item;
+    GtkWidget *powerdown_item;
+    GtkWidget *quit_item;
+
+    GtkWidget *view_menu_item;
+    GtkWidget *view_menu;
+    GtkWidget *full_screen_item;
+    GtkWidget *copy_item;
+    GtkWidget *zoom_in_item;
+    GtkWidget *zoom_out_item;
+    GtkWidget *zoom_fixed_item;
+    GtkWidget *zoom_fit_item;
+    GtkWidget *grab_item;
+    GtkWidget *grab_on_hover_item;
+
+    int nb_vcs;
+    VirtualConsole vc[MAX_VCS];
+
+    GtkWidget *show_tabs_item;
+    GtkWidget *untabify_item;
+    GtkWidget *show_menubar_item;
+
+    GtkWidget *vbox;
+    GtkWidget *notebook;
+    int button_mask;
+    gboolean last_set;
+    int last_x;
+    int last_y;
+    int grab_x_root;
+    int grab_y_root;
+    VirtualConsole *kbd_owner;
+    VirtualConsole *ptr_owner;
+
+    gboolean full_screen;
+
+    GdkCursor *null_cursor;
+    Notifier mouse_mode_notifier;
+    gboolean free_scale;
+
+    bool external_pause_update;
+
+    DisplayOptions *opts;
+};
+
 extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
diff --git a/ui/gtk.c b/ui/gtk.c
index 1ea12535284a..7da288a25156 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -60,7 +60,6 @@
 #include "chardev/char.h"
 #include "qom/object.h"
 
-#define MAX_VCS 10
 #define VC_WINDOW_X_MIN  320
 #define VC_WINDOW_Y_MIN  240
 #define VC_TERM_X_MIN     80
@@ -119,60 +118,6 @@
 static const guint16 *keycode_map;
 static size_t keycode_maplen;
 
-struct GtkDisplayState {
-    GtkWidget *window;
-
-    GtkWidget *menu_bar;
-
-    GtkAccelGroup *accel_group;
-
-    GtkWidget *machine_menu_item;
-    GtkWidget *machine_menu;
-    GtkWidget *pause_item;
-    GtkWidget *reset_item;
-    GtkWidget *powerdown_item;
-    GtkWidget *quit_item;
-
-    GtkWidget *view_menu_item;
-    GtkWidget *view_menu;
-    GtkWidget *full_screen_item;
-    GtkWidget *copy_item;
-    GtkWidget *zoom_in_item;
-    GtkWidget *zoom_out_item;
-    GtkWidget *zoom_fixed_item;
-    GtkWidget *zoom_fit_item;
-    GtkWidget *grab_item;
-    GtkWidget *grab_on_hover_item;
-
-    int nb_vcs;
-    VirtualConsole vc[MAX_VCS];
-
-    GtkWidget *show_tabs_item;
-    GtkWidget *untabify_item;
-    GtkWidget *show_menubar_item;
-
-    GtkWidget *vbox;
-    GtkWidget *notebook;
-    int button_mask;
-    gboolean last_set;
-    int last_x;
-    int last_y;
-    int grab_x_root;
-    int grab_y_root;
-    VirtualConsole *kbd_owner;
-    VirtualConsole *ptr_owner;
-
-    gboolean full_screen;
-
-    GdkCursor *null_cursor;
-    Notifier mouse_mode_notifier;
-    gboolean free_scale;
-
-    bool external_pause_update;
-
-    DisplayOptions *opts;
-};
-
 struct VCChardev {
     Chardev parent;
     VirtualConsole *console;
-- 
2.31.1


