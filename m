Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DF2ED163
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:08:13 +0100 (CET)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVxU-0000P7-8b
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqQ-0003xB-A2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:54 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0006vf-I3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:49 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c7so7830110edv.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cunFXnZMvk3CFCIa7DsUvUGnpCBzaF1o2EkKuHdWb5U=;
 b=IImZSMoATrwE2r1/wOJxrEGYuW8zBMlvw6O25E2uCPRG8L5T/DOJGeG2onKlNHVFoW
 7fY809Dlak1E2NbiTuONLd/NcVLhFgzYCsBw0DncKljLzU9IvvDyH6OCVTqFj7hjQZlD
 1faZDdTkbVNULsvXZ38QR6xdpa5fRI/B7jr9TtU5E3vkwRQaxKRklEu9crluvi3wwtXn
 TK9bmLHkE/XgyCmsAnHDdMH6VsXEfBgAxP79wOb9ZFEZkfWwiGy7/Uj7cCJRQY1GWlmT
 LKamZzehz93Q5iwnqDOq8WhD6O9XgR2tBYJS+9I7xAGjAAxvT/lKA80+tz+B2XAmnhG2
 p1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cunFXnZMvk3CFCIa7DsUvUGnpCBzaF1o2EkKuHdWb5U=;
 b=e57S70bP/F2J/NHgYdkxAAhOzWdJhLJ+Iu8U6cCACK5or4it4OceiRafqv8EwNYKCc
 /3ldpik9I3d6WquwOGItm9Z4ZDXjWb9zla7vIrEeGXoHXzvjo1VIhl3sJvpST/hy826q
 z379V6De2fwwkfXHYqM6I9CltR3Yse9NkntO1l8jNBwMXFzjCmlxvMo0s5Qj3kRU+GkO
 UrDWKSnnGOtpvK4eDjFUXbL1cXi9WnfFO3wnAItrfIfGW2Cj+8+MqDyemsWFfQlwBhxg
 hmOmuX8BoWeCyuec1cvymPoJMdhkirkIBgQHUA+qipwvCu5qAejPTevG6UzFoJzXmlGl
 yRFQ==
X-Gm-Message-State: AOAM531+m1v+QQ0Yfs96Uzbl+jl8j32K/Mo/kExZEKp50guG972SQuUH
 xKLus8+CDby0eILDc6pvXfNWeDZEWqzJKw==
X-Google-Smtp-Source: ABdhPJyR2o8a8j39gKuGUeNnJFnJy9sLxvoBJ2UKtLSuKlyk3gjl4VDZRlvDhgnMj01TnEGuelCfGQ==
X-Received: by 2002:a05:6402:1d0f:: with SMTP id
 dg15mr1768758edb.1.1610028044421; 
 Thu, 07 Jan 2021 06:00:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] gtk: remove CONFIG_GTK_GL
Date: Thu,  7 Jan 2021 15:00:34 +0100
Message-Id: <20210107140039.467969-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_GTK_GL is defined if OpenGL is present and GTK+
is 3.16 or newer.  Since GTK+ 3.22 is the minimum supported
version, just use CONFIG_OPENGL instead.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      |  7 -------
 meson.build    |  1 -
 ui/gtk.c       | 16 ++++++++--------
 ui/meson.build |  3 +--
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 2dd772a60c..c6d09b225e 100755
--- a/configure
+++ b/configure
@@ -415,7 +415,6 @@ cfi_debug="false"
 seccomp="auto"
 glusterfs="auto"
 gtk="$default_feature"
-gtk_gl="no"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
@@ -3626,9 +3625,6 @@ if test "$opengl" != "no" ; then
     opengl_cflags="$($pkg_config --cflags $opengl_pkgs)"
     opengl_libs="$($pkg_config --libs $opengl_pkgs)"
     opengl=yes
-    if test "$gtk" = "yes" && $pkg_config --exists "$gtkpackage >= 3.16"; then
-        gtk_gl="yes"
-    fi
   else
     if test "$opengl" = "yes" ; then
       feature_not_found "opengl" "Please install opengl (mesa) devel pkgs: $opengl_pkgs"
@@ -5781,9 +5777,6 @@ if test "$gtk" = "yes" ; then
   echo "CONFIG_GTK=y" >> $config_host_mak
   echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
   echo "GTK_LIBS=$gtk_libs" >> $config_host_mak
-  if test "$gtk_gl" = "yes" ; then
-    echo "CONFIG_GTK_GL=y" >> $config_host_mak
-  fi
 fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 36f1d02190..a729a30d2f 100644
--- a/meson.build
+++ b/meson.build
@@ -2337,7 +2337,6 @@ summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
 summary_info += {'GTK support':       config_host.has_key('CONFIG_GTK')}
-summary_info += {'GTK GL support':    config_host.has_key('CONFIG_GTK_GL')}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..e8474456df 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -396,7 +396,7 @@ static void gd_update_full_redraw(VirtualConsole *vc)
     int ww, wh;
     ww = gdk_window_get_width(gtk_widget_get_window(area));
     wh = gdk_window_get_height(gtk_widget_get_window(area));
-#if defined(CONFIG_GTK_GL)
+#if defined(CONFIG_OPENGL)
     if (vc->gfx.gls && gtk_use_gl_area) {
         gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
         return;
@@ -625,7 +625,7 @@ static const DisplayChangeListenerOps dcl_ops = {
 
 /** DisplayState Callbacks (opengl version) **/
 
-#if defined(CONFIG_GTK_GL)
+#if defined(CONFIG_OPENGL)
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_name             = "gtk-egl",
@@ -644,7 +644,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
 
-#endif /* CONFIG_GTK_GL */
+#endif /* CONFIG_OPENGL */
 
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
@@ -725,7 +725,7 @@ static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
     dpy_set_ui_info(vc->gfx.dcl.con, &info);
 }
 
-#if defined(CONFIG_GTK_GL)
+#if defined(CONFIG_OPENGL)
 
 static gboolean gd_render_event(GtkGLArea *area, GdkGLContext *context,
                                 void *opaque)
@@ -1865,7 +1865,7 @@ static void gd_connect_vc_gfx_signals(VirtualConsole *vc)
 {
     g_signal_connect(vc->gfx.drawing_area, "draw",
                      G_CALLBACK(gd_draw_event), vc);
-#if defined(CONFIG_GTK_GL)
+#if defined(CONFIG_OPENGL)
     if (gtk_use_gl_area) {
         /* wire up GtkGlArea events */
         g_signal_connect(vc->gfx.drawing_area, "render",
@@ -1992,12 +1992,12 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
 
 #if defined(CONFIG_OPENGL)
     if (display_opengl) {
-#if defined(CONFIG_GTK_GL)
+#if defined(CONFIG_OPENGL)
         if (gtk_use_gl_area) {
             vc->gfx.drawing_area = gtk_gl_area_new();
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
         } else
-#endif /* CONFIG_GTK_GL */
+#endif /* CONFIG_OPENGL */
         {
             vc->gfx.drawing_area = gtk_drawing_area_new();
             /*
@@ -2314,7 +2314,7 @@ static void early_gtk_display_init(DisplayOptions *opts)
     assert(opts->type == DISPLAY_TYPE_GTK);
     if (opts->has_gl && opts->gl != DISPLAYGL_MODE_OFF) {
 #if defined(CONFIG_OPENGL)
-#if defined(CONFIG_GTK_GL) && defined(GDK_WINDOWING_WAYLAND)
+#if defined(GDK_WINDOWING_WAYLAND)
         if (GDK_IS_WAYLAND_DISPLAY(gdk_display_get_default())) {
             gtk_use_gl_area = true;
             gtk_gl_area_init();
diff --git a/ui/meson.build b/ui/meson.build
index 013258a01c..d805448c4e 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -63,8 +63,7 @@ if config_host.has_key('CONFIG_GTK')
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
   gtk_ss.add(when: [x11, 'CONFIG_X11'], if_true: files('x_keymap.c'))
-  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
-  gtk_ss.add(when: [opengl, 'CONFIG_GTK_GL'], if_true: files('gtk-gl-area.c'))
+  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c', 'gtk-gl-area.c'))
   ui_modules += {'gtk' : gtk_ss}
 endif
 
-- 
2.29.2



