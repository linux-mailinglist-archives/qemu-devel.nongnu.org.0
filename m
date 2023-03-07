Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB76AE0A3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXQj-000638-SW; Tue, 07 Mar 2023 08:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZXQi-00061z-0k
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:32:36 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZXQf-0004NE-T6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:32:35 -0500
Received: by mail-lf1-x12b.google.com with SMTP id d36so13918398lfv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678195951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJIOqYGcrLuBB+vfh1ICFpmgWUbJCg/3JQQnp+mg7Vk=;
 b=lpMHDjjcguA/cSCQDAYOAKyFG8JXezXOg70fNr+DJesZ19A6jlg6Libzn23ZYrhfpY
 7LgLkWEVplH0Fae9PpQJwxKXiN8sjF4lO4BFL95+d1atIOLmDE/OWRSlfOvZf+9r7KfR
 Qsdcc1fqR4rbQYnyjs/ZJUmVll5XhmRWkU9XeY6diPU6OgoWzIw6jpLEBXhxWxmZgxa7
 d4OZbgFIq8D9bWKrSRdF/vVJlMcD3hPb+Jf0/OyvEtpUh9Ho2Mv9Pr3UQbSaitTbMMCU
 Rgwe8rDs+xisRxI3Dsof+wtqlD+9R1ofzgn51ZSA7VyZc5kjcgID5h1lFa8kDJgK4w6n
 mbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJIOqYGcrLuBB+vfh1ICFpmgWUbJCg/3JQQnp+mg7Vk=;
 b=HymCvq76IQsDeoZbE5WGqcXz4Law3YVErFB0OIzolsoJvb6Xxh6BE8K5pG5nKiD1va
 s7wgNJn4gwn+Xop1X71jNHyjUiqypX6T1mRpGDYsoa65yxKEHCUSFigT/od9tXEheIhW
 DkGo4Yb6Nd8calwbAF6gVZdkaYUM8nFgpbFqTl32mCU3bmAdFda9Xkig4e418H1yc+M6
 XIzkBRedE8k3xqsVDe8fPPbdDe8c9c99araknuv61Iv4jS09p9bT9ZDwitXSgRBbxQzo
 nbOchl1xSnprp4WAAsYWy2YTcEVpLkfK14EvQ87oj4BlmH1477/RehXzGnurkjoEqGtn
 DVsw==
X-Gm-Message-State: AO0yUKUyakd8vXzj0F39+NubfRe488im2IozUPPXFlJeaWzp4+YG+9gJ
 sHjPkswa2xOEdA961nTCR67UuSskwH80HHm1tOm4wReRmU+VEQ==
X-Google-Smtp-Source: AK7set/CPo41ebvUtxC1a/+K77tnRLbOPC3+sgj/kYluMp9sKGwPGgKasvevKskuIx4baMEJ4wVfFTzLTW2rhNS3Vnk=
X-Received: by 2002:a19:f00f:0:b0:4dd:ab9a:24a4 with SMTP id
 p15-20020a19f00f000000b004ddab9a24a4mr4345823lfc.5.1678195951344; Tue, 07 Mar
 2023 05:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-18-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-18-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Mar 2023 17:32:19 +0400
Message-ID: <CAJ+F1CK_JSTy4WUqazvOOvRRxj2ZwvZLaC8AvVgvG9KvQwhZpg@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] ui/dbus: do not require opengl & gbm
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Mar 7, 2023 at 3:59 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Allow to build & use the DBus display without 3d/GPU acceleration support=
.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build             |  2 --
>  ui/dbus-listener.c      | 15 +++++++++++++--
>  ui/dbus.c               |  8 ++++++++
>  tests/qtest/meson.build |  2 +-
>  ui/meson.build          |  4 ++--
>  5 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 6bcab8bf0d..a73d050946 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1746,8 +1746,6 @@ dbus_display =3D get_option('dbus_display') \
>             error_message: '-display dbus requires glib>=3D2.64') \
>    .require(gdbus_codegen.found(),
>             error_message: gdbus_codegen_error.format('-display dbus')) \
> -  .require(opengl.found() and gbm.found(),
> -           error_message: '-display dbus requires epoxy/egl and gbm') \
>    .allowed()

This change enables compilation of dbus on win32, although it requires
additional fixes. I'll update it with:
+  .require(targetos !=3D 'windows',
+           error_message: '-display dbus is not available on Windows') \

>
>  have_virtfs =3D get_option('virtfs') \
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 2e87ed7e9a..85692f1b27 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -27,9 +27,11 @@
>  #include "dbus.h"
>  #include <gio/gunixfdlist.h>
>
> +#ifdef CONFIG_OPENGL
>  #include "ui/shader.h"
>  #include "ui/egl-helpers.h"
>  #include "ui/egl-context.h"
> +#endif
>  #include "trace.h"
>
>  struct _DBusDisplayListener {
> @@ -48,6 +50,7 @@ struct _DBusDisplayListener {
>
>  G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
>
> +#ifdef CONFIG_OPENGL
>  static void dbus_update_gl_cb(GObject *source_object,
>                             GAsyncResult *res,
>                             gpointer user_data)
> @@ -229,12 +232,14 @@ static void dbus_gl_refresh(DisplayChangeListener *=
dcl)
>          ddl->gl_updates =3D 0;
>      }
>  }
> +#endif
>
>  static void dbus_refresh(DisplayChangeListener *dcl)
>  {
>      graphic_hw_update(dcl->con);
>  }
>
> +#ifdef CONFIG_OPENGL
>  static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
>                                 int x, int y, int w, int h)
>  {
> @@ -242,6 +247,7 @@ static void dbus_gl_gfx_update(DisplayChangeListener =
*dcl,
>
>      ddl->gl_updates++;
>  }
> +#endif
>
>  static void dbus_gfx_update(DisplayChangeListener *dcl,
>                              int x, int y, int w, int h)
> @@ -296,6 +302,7 @@ static void dbus_gfx_update(DisplayChangeListener *dc=
l,
>          DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
>  }
>
> +#ifdef CONFIG_OPENGL
>  static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
>                                 struct DisplaySurface *new_surface)
>  {
> @@ -311,6 +318,7 @@ static void dbus_gl_gfx_switch(DisplayChangeListener =
*dcl,
>                               width, height, 0, 0, width, height);
>      }
>  }
> +#endif
>
>  static void dbus_gfx_switch(DisplayChangeListener *dcl,
>                              struct DisplaySurface *new_surface)
> @@ -361,6 +369,7 @@ static void dbus_cursor_define(DisplayChangeListener =
*dcl,
>          NULL);
>  }
>
> +#ifdef CONFIG_OPENGL
>  const DisplayChangeListenerOps dbus_gl_dcl_ops =3D {
>      .dpy_name                =3D "dbus-gl",
>      .dpy_gfx_update          =3D dbus_gl_gfx_update,
> @@ -378,6 +387,7 @@ const DisplayChangeListenerOps dbus_gl_dcl_ops =3D {
>      .dpy_gl_release_dmabuf   =3D dbus_release_dmabuf,
>      .dpy_gl_update           =3D dbus_scanout_update,
>  };
> +#endif
>
>  const DisplayChangeListenerOps dbus_dcl_ops =3D {
>      .dpy_name                =3D "dbus",
> @@ -406,11 +416,12 @@ dbus_display_listener_constructed(GObject *object)
>  {
>      DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);
>
> +    ddl->dcl.ops =3D &dbus_dcl_ops;
> +#ifdef CONFIG_OPENGL
>      if (display_opengl) {
>          ddl->dcl.ops =3D &dbus_gl_dcl_ops;
> -    } else {
> -        ddl->dcl.ops =3D &dbus_dcl_ops;
>      }
> +#endif
>
>      G_OBJECT_CLASS(dbus_display_listener_parent_class)->constructed(obje=
ct);
>  }
> diff --git a/ui/dbus.c b/ui/dbus.c
> index ebf03bd84d..904f5a0a6d 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -30,8 +30,10 @@
>  #include "qom/object_interfaces.h"
>  #include "sysemu/sysemu.h"
>  #include "ui/dbus-module.h"
> +#ifdef CONFIG_OPENGL
>  #include "ui/egl-helpers.h"
>  #include "ui/egl-context.h"
> +#endif
>  #include "audio/audio.h"
>  #include "audio/audio_int.h"
>  #include "qapi/error.h"
> @@ -41,6 +43,7 @@
>
>  static DBusDisplay *dbus_display;
>
> +#ifdef CONFIG_OPENGL
>  static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
>                                           QEMUGLParams *params)
>  {
> @@ -84,6 +87,7 @@ static const DisplayGLCtxOps dbus_gl_ops =3D {
>      .dpy_gl_ctx_destroy_texture =3D dbus_destroy_texture,
>      .dpy_gl_ctx_update_texture =3D dbus_update_texture,
>  };
> +#endif
>
>  static NotifierList dbus_display_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(dbus_display_notifiers);
> @@ -112,10 +116,12 @@ dbus_display_init(Object *o)
>      DBusDisplay *dd =3D DBUS_DISPLAY(o);
>      g_autoptr(GDBusObjectSkeleton) vm =3D NULL;
>
> +#ifdef CONFIG_OPENGL
>      dd->glctx.ops =3D &dbus_gl_ops;
>      if (display_opengl) {
>          dd->glctx.gls =3D qemu_gl_init_shader();
>      }
> +#endif
>      dd->iface =3D qemu_dbus_display1_vm_skeleton_new();
>      dd->consoles =3D g_ptr_array_new_with_free_func(g_object_unref);
>
> @@ -152,7 +158,9 @@ dbus_display_finalize(Object *o)
>      g_clear_object(&dd->iface);
>      g_free(dd->dbus_addr);
>      g_free(dd->audiodev);
> +#ifdef CONFIG_OPENGL
>      g_clear_pointer(&dd->glctx.gls, qemu_gl_fini_shader);
> +#endif
>      dbus_display =3D NULL;
>  }
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..f23a4aaa24 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -101,7 +101,7 @@ qtests_i386 =3D \
>     'numa-test'
>    ]
>
> -if dbus_display
> +if dbus_display and targetos !=3D 'windows'
>    qtests_i386 +=3D ['dbus-display-test']
>  endif
>
> diff --git a/ui/meson.build b/ui/meson.build
> index 0b2d0d21d1..330369707d 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -85,7 +85,7 @@ if dbus_display
>                                            '--generate-c-code', '@BASENAM=
E@'])
>    dbus_display1_lib =3D static_library('dbus-display1', dbus_display1, d=
ependencies: gio)
>    dbus_display1_dep =3D declare_dependency(link_with: dbus_display1_lib,=
 include_directories: include_directories('.'))
> -  dbus_ss.add(when: [gio, pixman, opengl, gbm, dbus_display1_dep],
> +  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
>                if_true: [files(
>                  'dbus-chardev.c',
>                  'dbus-clipboard.c',
> @@ -93,7 +93,7 @@ if dbus_display
>                  'dbus-error.c',
>                  'dbus-listener.c',
>                  'dbus.c',
> -              )])
> +              ), opengl, gbm])
>    ui_modules +=3D {'dbus' : dbus_ss}
>  endif
>
> --
> 2.39.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

