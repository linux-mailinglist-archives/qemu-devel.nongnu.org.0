Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4B2F37D8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:02:53 +0100 (CET)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzO0K-0004P8-PW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG9-0003i5-Cb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:09 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG6-0004v1-Ns
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:09 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g20so4628507ejb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vng/gx8rorkYn09/0oPlMUpi1vFh/6zPInpLmXGfoHA=;
 b=kxoLtdFun8+jSvzUA9h+TXqKf3u3oWxlCD0f8QurYXNDMykGeVKyl1NMT677D4mcCb
 wrrjKPcqWBc9+Mgn50Y2ATNayhqc3BvBHwOvjeuPF6coPM1SBOCriiZ0bCuu+84U6bqh
 F+h2A+4F4PLxI8KwEkkk2J93YVWGw5dj3/e3U6KCtdSDMpIOd8/ghAZrNYK2b1KicdtM
 0nIACEkGMCt+k6ttdDw3x675I0rmq4V4+wgL3dvBGIQ22Uf7pVfdETuK27fkE80p6MDs
 PznBO/95k0urfuTbD/qL8QDkPbXWkH9wi3FnDpkTHZWitGK4aT3GmDEb+7u53Wsrj1gw
 0UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vng/gx8rorkYn09/0oPlMUpi1vFh/6zPInpLmXGfoHA=;
 b=noKlV9xK0ZOYoHczeMqXFV63VGtGFC4A6Dz8P2A8WPeq+fcMQxYX3r1iM7Z+udYyhL
 adW+u1UoHqPvBs2McUCQ2jAN7Zw/OQyHkrFiArPoDOVlglSJMHjgzsTSgxPPxMa5nwaY
 B30ZjQ/iwT6DTCiJWMT1WSP7DzY1sUV26xri4vahz3Sw9y/OiceU1o5bIHnsTd2jBJAb
 v6MBzPumsIEQddU5LTWbc31AzrHtsuvMMeKhchaqxNQS0cWS5wpNxNv15z98qQbfpdpg
 CN17q8XrjPxknxG7CL5LSzIt5r+N6kHF9eW+bG+jrxJ7sGVnauDUu7IkSed7R6ACFKXz
 lOSA==
X-Gm-Message-State: AOAM532Ev8fAWLaGlrURwDI+WWub5Bl1ooQCU9etpsG/3kT08DKoMH+8
 52McAb8jepy9X1g1NUK3qg4rCjAmHyOCcA==
X-Google-Smtp-Source: ABdhPJwLm8ye7/pWW5xxBav/vIPI9vMXG+7Wnz1V7qIyfIXZuWyWJM7LHrw1aTLA8Jc+3FL3Exqrvw==
X-Received: by 2002:a17:906:2087:: with SMTP id
 7mr2555431ejq.232.1610471705547; 
 Tue, 12 Jan 2021 09:15:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] gtk: remove CONFIG_GTK_GL
Date: Tue, 12 Jan 2021 18:14:45 +0100
Message-Id: <20210112171450.791427-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_GTK_GL is defined if OpenGL is present and GTK+
is 3.16 or newer.  Since GTK+ 3.22 is the minimum supported
version, just use CONFIG_OPENGL instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      |  7 -------
 meson.build    |  1 -
 ui/gtk.c       | 16 ++++++++--------
 ui/meson.build |  3 +--
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 10f43d59fe..f3877c2efd 100755
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
index 5e95dd6c93..98930bca38 100644
--- a/meson.build
+++ b/meson.build
@@ -2338,7 +2338,6 @@ summary_info += {'SDL support':       sdl.found()}
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
index e6655c94a6..bd2b920504 100644
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



