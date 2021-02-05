Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36831054E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:01:01 +0100 (CET)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v6y-0006H4-AC
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v36-0001N5-RI
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v34-0001D2-RR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MRr6/MRy2PxC/L4OoNsCzvz7SlfRBaC3wiKt1eWMD0=;
 b=JJDy4T60ftT6Qd9dlIcl2S62LbzhESBGl7af2Td4BvwgR7O38svogMw8iiPfU/VUsyHyrg
 GL5JzV80Ea07CtR343cJMYGKzudlIER3tALnkezdcoGi0tGbxNQT8MliVBSVDv8T9+kNw5
 N9LafZ8blFVgRmQYn2NX9+SHdThbBi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-QvnixZYaORy6sW-z5zernA-1; Fri, 05 Feb 2021 01:56:56 -0500
X-MC-Unique: QvnixZYaORy6sW-z5zernA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 937C0801977
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2DA5D9CC;
 Fri,  5 Feb 2021 06:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EAB4318003B6; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] ui: remove gl_ctx_get_current
Date: Fri,  5 Feb 2021 07:56:06 +0100
Message-Id: <20210205065620.1726554-11-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

There are no users left.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-7-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h     | 2 --
 include/ui/egl-context.h | 1 -
 include/ui/sdl2.h        | 1 -
 ui/console.c             | 6 ------
 ui/egl-context.c         | 5 -----
 ui/egl-headless.c        | 1 -
 ui/gtk.c                 | 2 --
 ui/sdl2-gl.c             | 8 --------
 ui/sdl2.c                | 1 -
 ui/spice-display.c       | 1 -
 10 files changed, 28 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 7a3fc11abf72..ce6c72e37c6b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -201,7 +201,6 @@ typedef struct DisplayChangeListenerOps {
                                QEMUGLContext ctx);
     int (*dpy_gl_ctx_make_current)(DisplayChangeListener *dcl,
                                    QEMUGLContext ctx);
-    QEMUGLContext (*dpy_gl_ctx_get_current)(DisplayChangeListener *dcl);
 
     void (*dpy_gl_scanout_disable)(DisplayChangeListener *dcl);
     void (*dpy_gl_scanout_texture)(DisplayChangeListener *dcl,
@@ -303,7 +302,6 @@ QEMUGLContext dpy_gl_ctx_create(QemuConsole *con,
                                 QEMUGLParams *params);
 void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
 int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
-QEMUGLContext dpy_gl_ctx_get_current(QemuConsole *con);
 
 bool console_has_gl(QemuConsole *con);
 bool console_has_gl_dmabuf(QemuConsole *con);
diff --git a/include/ui/egl-context.h b/include/ui/egl-context.h
index f004ce11a7bc..9374fe41e32b 100644
--- a/include/ui/egl-context.h
+++ b/include/ui/egl-context.h
@@ -9,6 +9,5 @@ QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
 void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
 int qemu_egl_make_context_current(DisplayChangeListener *dcl,
                                   QEMUGLContext ctx);
-QEMUGLContext qemu_egl_get_current_context(DisplayChangeListener *dcl);
 
 #endif /* EGL_CONTEXT_H */
diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 0875b8d56b7e..f85c117a78f2 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -70,7 +70,6 @@ QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
 void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
 int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
                                  QEMUGLContext ctx);
-QEMUGLContext sdl2_gl_get_current_context(DisplayChangeListener *dcl);
 
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl);
 void sdl2_gl_scanout_texture(DisplayChangeListener *dcl,
diff --git a/ui/console.c b/ui/console.c
index d80ce7037c32..c0b1a3689c3d 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1803,12 +1803,6 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
     return con->gl->ops->dpy_gl_ctx_make_current(con->gl, ctx);
 }
 
-QEMUGLContext dpy_gl_ctx_get_current(QemuConsole *con)
-{
-    assert(con->gl);
-    return con->gl->ops->dpy_gl_ctx_get_current(con->gl);
-}
-
 void dpy_gl_scanout_disable(QemuConsole *con)
 {
     assert(con->gl);
diff --git a/ui/egl-context.c b/ui/egl-context.c
index 4aa1cbb50c25..368ffa49d82f 100644
--- a/ui/egl-context.c
+++ b/ui/egl-context.c
@@ -35,8 +35,3 @@ int qemu_egl_make_context_current(DisplayChangeListener *dcl,
    return eglMakeCurrent(qemu_egl_display,
                          EGL_NO_SURFACE, EGL_NO_SURFACE, ctx);
 }
-
-QEMUGLContext qemu_egl_get_current_context(DisplayChangeListener *dcl)
-{
-    return eglGetCurrentContext();
-}
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index fe2a0d1eab98..da377a74af69 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -160,7 +160,6 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_ctx_create       = egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
 
     .dpy_gl_scanout_disable  = egl_scanout_disable,
     .dpy_gl_scanout_texture  = egl_scanout_texture,
diff --git a/ui/gtk.c b/ui/gtk.c
index e1ee0840b377..a0e6b60ac4f5 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -637,7 +637,6 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_ctx_create       = gd_gl_area_create_context,
     .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
     .dpy_gl_ctx_make_current = gd_gl_area_make_current,
-    .dpy_gl_ctx_get_current  = gd_gl_area_get_current_context,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
@@ -654,7 +653,6 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_ctx_create       = gd_egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = gd_egl_make_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
     .dpy_gl_scanout_disable  = gd_egl_scanout_disable,
     .dpy_gl_scanout_texture  = gd_egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index c73d273bf804..82139ba49e8f 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -185,14 +185,6 @@ int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
     return SDL_GL_MakeCurrent(scon->real_window, sdlctx);
 }
 
-QEMUGLContext sdl2_gl_get_current_context(DisplayChangeListener *dcl)
-{
-    SDL_GLContext sdlctx;
-
-    sdlctx = SDL_GL_GetCurrentContext();
-    return (QEMUGLContext)sdlctx;
-}
-
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl)
 {
     struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 5e49709283e5..a203cb0239e1 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -781,7 +781,6 @@ static const DisplayChangeListenerOps dcl_gl_ops = {
     .dpy_gl_ctx_create       = sdl2_gl_create_context,
     .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
     .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
-    .dpy_gl_ctx_get_current  = sdl2_gl_get_current_context,
     .dpy_gl_scanout_disable  = sdl2_gl_scanout_disable,
     .dpy_gl_scanout_texture  = sdl2_gl_scanout_texture,
     .dpy_gl_update           = sdl2_gl_scanout_flush,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 3d3e3bcb2246..dccac4710a5e 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1102,7 +1102,6 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
 
     .dpy_gl_scanout_disable  = qemu_spice_gl_scanout_disable,
     .dpy_gl_scanout_texture  = qemu_spice_gl_scanout_texture,
-- 
2.29.2


