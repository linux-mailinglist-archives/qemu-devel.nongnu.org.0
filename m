Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404E4BA075
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:59:22 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgNV-0002DO-Hq
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKg7a-0007Dp-3V
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:42:56 -0500
Received: from [2607:f8b0:4864:20::c29] (port=43581
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKg7W-0000ly-Rz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:42:52 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so4632366oos.10
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 04:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=krREP9j6DXjKSzQj4+Mk/0+MmDmRM+x4Ee7UxudZ+7M=;
 b=J+axpVg17qyu10ZIxunX+84qkEhOlCfYOt942SVDHaeChgMyj3+CkNr0USbNm8XzNU
 dpwKDW+wrloLwHP+CLSBmzhFZ2ahJUkFByt5Dfg5XRvgVWatTkuhEkRJTvqpUmgiOrPS
 YKOyh9zyKCb5MSEMZEFjf51xjsRYhf+BflTX22Xz9aBfXMvutJ/L8IdX4MW08zz7PD1X
 NFIpFL/aUOImteDTTPVpwdz3nvHFTStCUzeVDFlkWLHxB9DEZHvimvWnCaB1Ist88QlT
 ri42ksQIQvNgWnB857HkDlINM7yqHqU2PkZ4SmEE78y0TPGmYse9JmO9+B5QydutKQti
 18eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=krREP9j6DXjKSzQj4+Mk/0+MmDmRM+x4Ee7UxudZ+7M=;
 b=0PTgZBlZzMu31to9aeX3GeXBmngjE6hBg4lf+1eD0nCrhoNbQmGK9hSV82Ys4+UR4v
 cANHe4zWLjo43UEh47Li6UNLRWyLti5oX0YPqQSubacyWPa8K7FVlF+iNmt/UC/Q9CyL
 7eungXfF0Th5RGL6snyJ293nxRpfAkasmHxQb0tXFAL85Sud4T2eE0TUcKF3a8DnLIG7
 ksnen6p+42ucDAPGUQd/cMFXbCkwhNvPZc7REPHOeW7hKV0xyNgNi1bm6ukM9bepcOf7
 0HSItZFoZbnBxEv8Im7m5l930yM52zOPxMM5ZqAEPtQlb5TMOcBygPR7BwSZjlltIeQc
 tygg==
X-Gm-Message-State: AOAM532YmYVHVvobIV7JACjbM0qa8pbzHqaXOraAzgMwq4lnAm0zzkKf
 8FjjdBHiKH71NQBBkPQzk6uS6JoYTBS39Xn6mGw=
X-Google-Smtp-Source: ABdhPJz241X3biLPfCaaElop/cOllnJF8auY1HXirIBtSq7OyF0tbx7Y1o3bfByWBDBWe631phTfEHkWzX2HLDOIGCI=
X-Received: by 2002:a05:6870:f78d:b0:d2:73ff:93a8 with SMTP id
 fs13-20020a056870f78d00b000d273ff93a8mr846408oab.193.1645101769475; Thu, 17
 Feb 2022 04:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <20220217115829.2314347-13-marcandre.lureau@redhat.com>
 <CAMVc7JWYPZv9yWg0OQfoHQrwaZkb++crxePYQWKTD+af--NLGA@mail.gmail.com>
In-Reply-To: <CAMVc7JWYPZv9yWg0OQfoHQrwaZkb++crxePYQWKTD+af--NLGA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 17 Feb 2022 21:42:38 +0900
Message-ID: <CAMVc7JW0e5cPGQB986mW2HL-dAn1-u3f7me2=o4n13ka=1Tvjw@mail.gmail.com>
Subject: Fwd: [PATCH v2 12/12] ui/dbus: fix texture sharing
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I mistakenly dropped CC (again). My apologies.

---------- Forwarded message ---------
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, Feb 17, 2022 at 9:38 PM
Subject: Re: [PATCH v2 12/12] ui/dbus: fix texture sharing
To: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


On Thu, Feb 17, 2022 at 9:02 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The DBus listener naively create, update and destroy textures without
> taking into account other listeners. The texture were shared, but
> texture update was unnecessarily duplicated.
>
> Teach DisplayGLCtx to do optionally shared texture handling. This is
> only implemented for DBus display at this point, however the same
> infrastructure could potentially be used for egl-headless & VNC
> listeners for example, or other future combinations.

egl-headless only needs one DisplayChangeListener per console since
its output is propagated by ui/console. The vnc protocol is for remote
access and therefore cannot have OpenGL textures. The functionality is
unique to dbus.

>
> Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/console.h | 10 ++++++++++
>  ui/console.c         | 26 ++++++++++++++++++++++++++
>  ui/dbus-listener.c   | 11 -----------
>  ui/dbus.c            | 24 ++++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 11 deletions(-)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 18a10c0b7db0..0f84861933e1 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -290,10 +290,20 @@ typedef struct DisplayGLCtxOps {
>                                 QEMUGLContext ctx);
>      int (*dpy_gl_ctx_make_current)(DisplayGLCtx *dgc,
>                                     QEMUGLContext ctx);
> +    void (*dpy_gl_ctx_create_texture)(DisplayGLCtx *dgc,
> +                                      DisplaySurface *surface);
> +    void (*dpy_gl_ctx_destroy_texture)(DisplayGLCtx *dgc,
> +                                      DisplaySurface *surface);
> +    void (*dpy_gl_ctx_update_texture)(DisplayGLCtx *dgc,
> +                                      DisplaySurface *surface,
> +                                      int x, int y, int w, int h);
>  } DisplayGLCtxOps;
>
>  struct DisplayGLCtx {
>      const DisplayGLCtxOps *ops;
> +#ifdef CONFIG_OPENGL
> +    QemuGLShader *gls; /* optional shared shader */
> +#endif
>  };
>
>  DisplayState *init_displaystate(void);
> diff --git a/ui/console.c b/ui/console.c
> index 102fcf0a5068..b9188559fb12 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1066,6 +1066,27 @@ static void displaychangelistener_gfx_switch(Displ=
ayChangeListener *dcl,
>      }
>  }
>
> +static void dpy_gfx_create_texture(QemuConsole *con, DisplaySurface *sur=
face)
> +{
> +    if (con->gl && con->gl->ops->dpy_gl_ctx_create_texture) {
> +        con->gl->ops->dpy_gl_ctx_create_texture(con->gl, surface);
> +    }
> +}
> +
> +static void dpy_gfx_destroy_texture(QemuConsole *con, DisplaySurface *su=
rface)
> +{
> +    if (con->gl && con->gl->ops->dpy_gl_ctx_destroy_texture) {
> +        con->gl->ops->dpy_gl_ctx_destroy_texture(con->gl, surface);
> +    }
> +}
> +
> +static void dpy_gfx_update_texture(QemuConsole *con, DisplaySurface *sur=
face,
> +                                   int x, int y, int w, int h)
> +{
> +    if (con->gl && con->gl->ops->dpy_gl_ctx_update_texture) {
> +        con->gl->ops->dpy_gl_ctx_update_texture(con->gl, surface, x, y, =
w, h);
> +    }
> +}
>
>  static void displaychangelistener_display_console(DisplayChangeListener =
*dcl,
>                                                    QemuConsole *con,
> @@ -1078,6 +1099,7 @@ static void displaychangelistener_display_console(D=
isplayChangeListener *dcl,
>      if (!con || !console_compatible_with(con, dcl, errp)) {
>          if (!dummy) {
>              dummy =3D qemu_create_placeholder_surface(640, 480, nodev);
> +            dpy_gfx_create_texture(con, dummy);
>          }
>          displaychangelistener_gfx_switch(dcl, dummy);
>          return;
> @@ -1098,6 +1120,7 @@ static void displaychangelistener_display_console(D=
isplayChangeListener *dcl,
>                                           con->scanout.texture.width,
>                                           con->scanout.texture.height);
>      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
> +        dpy_gfx_create_texture(con, con->surface);
>          displaychangelistener_gfx_switch(dcl, con->surface);
>      }
>
> @@ -1634,6 +1657,7 @@ void dpy_gfx_update(QemuConsole *con, int x, int y,=
 int w, int h)
>      if (!qemu_console_is_visible(con)) {
>          return;
>      }
> +    dpy_gfx_update_texture(con, con->surface, x, y, w, h);
>      QLIST_FOREACH(dcl, &s->listeners, next) {
>          if (con !=3D (dcl->con ? dcl->con : active_console)) {
>              continue;
> @@ -1678,12 +1702,14 @@ void dpy_gfx_replace_surface(QemuConsole *con,
>
>      con->scanout.kind =3D SCANOUT_SURFACE;
>      con->surface =3D surface;
> +    dpy_gfx_create_texture(con, surface);
>      QLIST_FOREACH(dcl, &s->listeners, next) {
>          if (con !=3D (dcl->con ? dcl->con : active_console)) {
>              continue;
>          }
>          displaychangelistener_gfx_switch(dcl, surface);
>      }
> +    dpy_gfx_destroy_texture(con, old_surface);
>      qemu_free_displaysurface(old_surface);
>  }
>
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 81c119b13a2c..a287edd2fc15 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -42,7 +42,6 @@ struct _DBusDisplayListener {
>
>      DisplayChangeListener dcl;
>      DisplaySurface *ds;
> -    QemuGLShader *gls;
>      int gl_updates;
>  };
>
> @@ -240,10 +239,6 @@ static void dbus_gl_gfx_update(DisplayChangeListener=
 *dcl,
>  {
>      DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener, =
dcl);
>
> -    if (ddl->ds) {
> -        surface_gl_update_texture(ddl->gls, ddl->ds, x, y, w, h);
> -    }
> -
>      ddl->gl_updates++;
>  }
>
> @@ -285,15 +280,11 @@ static void dbus_gl_gfx_switch(DisplayChangeListene=
r *dcl,
>  {
>      DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener, =
dcl);
>
> -    if (ddl->ds) {
> -        surface_gl_destroy_texture(ddl->gls, ddl->ds);
> -    }
>      ddl->ds =3D new_surface;
>      if (ddl->ds) {
>          int width =3D surface_width(ddl->ds);
>          int height =3D surface_height(ddl->ds);
>
> -        surface_gl_create_texture(ddl->gls, ddl->ds);
>          /* TODO: lazy send dmabuf (there are unnecessary sent otherwise)=
 */
>          dbus_scanout_texture(&ddl->dcl, ddl->ds->texture, false,
>                               width, height, 0, 0, width, height);
> @@ -403,7 +394,6 @@ dbus_display_listener_dispose(GObject *object)
>      g_clear_object(&ddl->conn);
>      g_clear_pointer(&ddl->bus_name, g_free);
>      g_clear_object(&ddl->proxy);
> -    g_clear_pointer(&ddl->gls, qemu_gl_fini_shader);
>
>      G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
>  }
> @@ -414,7 +404,6 @@ dbus_display_listener_constructed(GObject *object)
>      DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);
>
>      if (display_opengl) {
> -        ddl->gls =3D qemu_gl_init_shader();
>          ddl->dcl.ops =3D &dbus_gl_dcl_ops;
>      } else {
>          ddl->dcl.ops =3D &dbus_dcl_ops;
> diff --git a/ui/dbus.c b/ui/dbus.c
> index 22c82d2f323a..8e2e4c9cad28 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -55,11 +55,33 @@ dbus_is_compatible_dcl(DisplayGLCtx *dgc,
>      return dcl->ops =3D=3D &dbus_gl_dcl_ops || dcl->ops =3D=3D &dbus_con=
sole_dcl_ops;
>  }
>
> +static void
> +dbus_create_texture(DisplayGLCtx *ctx, DisplaySurface *surface)
> +{
> +    surface_gl_create_texture(ctx->gls, surface);
> +}
> +
> +static void
> +dbus_destroy_texture(DisplayGLCtx *ctx, DisplaySurface *surface)
> +{
> +    surface_gl_destroy_texture(ctx->gls, surface);
> +}
> +
> +static void
> +dbus_update_texture(DisplayGLCtx *ctx, DisplaySurface *surface,
> +                    int x, int y, int w, int h)
> +{
> +    surface_gl_update_texture(ctx->gls, surface, x, y, w, h);
> +}
> +
>  static const DisplayGLCtxOps dbus_gl_ops =3D {
>      .dpy_gl_ctx_is_compatible_dcl =3D dbus_is_compatible_dcl,
>      .dpy_gl_ctx_create       =3D dbus_create_context,
>      .dpy_gl_ctx_destroy      =3D qemu_egl_destroy_context,
>      .dpy_gl_ctx_make_current =3D qemu_egl_make_context_current,
> +    .dpy_gl_ctx_create_texture =3D dbus_create_texture,
> +    .dpy_gl_ctx_destroy_texture =3D dbus_destroy_texture,
> +    .dpy_gl_ctx_update_texture =3D dbus_update_texture,
>  };
>
>  static NotifierList dbus_display_notifiers =3D
> @@ -90,6 +112,7 @@ dbus_display_init(Object *o)
>      g_autoptr(GDBusObjectSkeleton) vm =3D NULL;
>
>      dd->glctx.ops =3D &dbus_gl_ops;
> +    dd->glctx.gls =3D qemu_gl_init_shader();
>      dd->iface =3D qemu_dbus_display1_vm_skeleton_new();
>      dd->consoles =3D g_ptr_array_new_with_free_func(g_object_unref);
>
> @@ -126,6 +149,7 @@ dbus_display_finalize(Object *o)
>      g_clear_object(&dd->iface);
>      g_free(dd->dbus_addr);
>      g_free(dd->audiodev);
> +    g_clear_pointer(&dd->glctx.gls, qemu_gl_fini_shader);
>      dbus_display =3D NULL;
>  }
>
> --
> 2.34.1.428.gdcc0cd074f0c
>

