Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BA6B735A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbexh-0005vX-0g; Mon, 13 Mar 2023 05:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbexf-0005v8-4L
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:59:23 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbexb-0001ta-Tm
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:59:22 -0400
Received: by mail-lf1-x12f.google.com with SMTP id d36so14910328lfv.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678701553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jq6sHHZi9rJa5fzwFD5rJLMr3eMuJQEcaKz1Z2X26jk=;
 b=eEe4wDnTr24FPXTKnE5omTBjxSERgDUU5K22XmwGnd+zZRaBt3vlEg2l46vJWxz0Ff
 /MXAC6WU653tDsmRPC/v4sEyLQADnm0BasEIZ8XUKG3aMlhjFNC/QrhFcHVttMV1oDW1
 FgvZHjch9l2XwN85ZfEmOemu0Q0NWTGOUBfsdB7uce1ic/WlOuZ/21tylyrTrvOYdkYh
 ShLXfQTWIQUHJbe2lyIwsCcs6zqX5Ke5CXQwKH276l/74/62w7KxnrcOL9CeLAN+Vcpi
 lMwigR9UnCKMwsgbUVp68wITbUMSq/IYp1AaUsNUAWHFLEWMf3YZIo/3mRsUGfSzD1Na
 p6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678701553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jq6sHHZi9rJa5fzwFD5rJLMr3eMuJQEcaKz1Z2X26jk=;
 b=alu4f9o5VZ8amFYJAm7vLJdg1jFZytp66pyKtFqLcevRewcynwm9zRzK/zClDoicp2
 6fkNRGnrJkA4TBt77sNxlyho1GlwYLEF7hyZv3WaSfdQqknsyOsm3xaVQj10sDQS4yDd
 W9dkX8AkE0RDFcjQccnxgELgf6WlzrWBix2vDtlOPUBRq/NgWa0PRV1Gi66skftMnYH1
 t169vk6LN0msFLmg8tR9JGTVzq7mvEcAEI2Za6m/R5GAxzhkX/lvW1xWzOqXwIZU7TdL
 ZSgokrb3313gMyfSepPEXORafQ4+PIsJOq5uR2iTL3UpiftnA4J8BaXcujkGPqu338PL
 uf3g==
X-Gm-Message-State: AO0yUKW69kv55/h6ZKROiKIKO3gHkq/qGoi44Jv0fzxUlineVTBIIz7i
 ru1O8b0krvosnrodSWplBdgtYUbqbz9jhn8jNv4=
X-Google-Smtp-Source: AK7set8IYAlBE8jzQ4vELmb9/b2bFCRTDNDlzFMocCVBqSA3dh8VsW8JvedixhNCTQTt681OnVyelxTuqyvOK2RzGTo=
X-Received: by 2002:a05:6512:206:b0:4dd:a9e5:aa09 with SMTP id
 a6-20020a056512020600b004dda9e5aa09mr10562760lfo.11.1678701553076; Mon, 13
 Mar 2023 02:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-17-marcandre.lureau@redhat.com>
 <ZAsBG9DQp07DuzTL@redhat.com>
In-Reply-To: <ZAsBG9DQp07DuzTL@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Mar 2023 13:59:01 +0400
Message-ID: <CAJ+F1CJFLqx+HqZM97XaHEpfmiGb6o8tN7sP9MfQ0CRsqaROsg@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] ui: introduce egl_init()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

On Fri, Mar 10, 2023 at 2:07=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Mar 07, 2023 at 03:56:35PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Future patches will introduce EGL support on win32 (too late for 8.0
> > though). Having a common place for EGL initialization and error handlin=
g
> > will make it simpler.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/ui/egl-helpers.h |  2 ++
> >  ui/dbus.c                |  7 +------
> >  ui/egl-headless.c        | 16 ++++++++--------
> >  ui/egl-helpers.c         | 25 +++++++++++++++++++++++++
> >  ui/spice-core.c          |  7 +------
> >  5 files changed, 37 insertions(+), 20 deletions(-)
> >
> > diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> > index c92dd90e33..53d953ddf4 100644
> > --- a/include/ui/egl-helpers.h
> > +++ b/include/ui/egl-helpers.h
> > @@ -65,4 +65,6 @@ int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, =
DisplayGLMode mode);
> >  EGLContext qemu_egl_init_ctx(void);
> >  bool qemu_egl_has_dmabuf(void);
> >
> > +bool egl_init(const char *rendernode, DisplayGLMode mode, Error **errp=
);
> > +
> >  #endif /* EGL_HELPERS_H */
> > diff --git a/ui/dbus.c b/ui/dbus.c
> > index f529928f0b..ebf03bd84d 100644
> > --- a/ui/dbus.c
> > +++ b/ui/dbus.c
> > @@ -451,12 +451,7 @@ early_dbus_init(DisplayOptions *opts)
> >      DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MODE_OF=
F;
> >
> >      if (mode !=3D DISPLAYGL_MODE_OFF) {
> > -        if (egl_rendernode_init(opts->u.dbus.rendernode, mode) < 0) {
> > -            error_report("dbus: render node init failed");
> > -            exit(1);
> > -        }
> > -
> > -        display_opengl =3D 1;
> > +        egl_init(opts->u.dbus.rendernode, mode, &error_fatal);
> >      }
> >
> >      type_register(&dbus_vc_type_info);
> > diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> > index ae07e91302..ef70e6a18e 100644
> > --- a/ui/egl-headless.c
> > +++ b/ui/egl-headless.c
> > @@ -1,7 +1,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/module.h"
> > -#include "sysemu/sysemu.h"
> > +#include "qapi/error.h"
> >  #include "ui/console.h"
> >  #include "ui/egl-helpers.h"
> >  #include "ui/egl-context.h"
> > @@ -191,21 +191,21 @@ static const DisplayGLCtxOps eglctx_ops =3D {
> >
> >  static void early_egl_headless_init(DisplayOptions *opts)
> >  {
> > -    display_opengl =3D 1;
> > +    DisplayGLMode mode =3D DISPLAYGL_MODE_ON;
> > +
> > +    if (opts->has_gl) {
> > +        mode =3D opts->gl;
> > +    }
> > +
> > +    egl_init(opts->u.egl_headless.rendernode, mode, &error_fatal);
> >  }
> >
> >  static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
> >  {
> > -    DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MODE_ON=
;
> >      QemuConsole *con;
> >      egl_dpy *edpy;
> >      int idx;
> >
> > -    if (egl_rendernode_init(opts->u.egl_headless.rendernode, mode) < 0=
) {
> > -        error_report("egl: render node init failed");
> > -        exit(1);
> > -    }
> > -
> >      for (idx =3D 0;; idx++) {
> >          DisplayGLCtx *ctx;
>
> Why isn't the egl_init() call being made from this egl_headless_init
> method, so egl_rendernode_init() is called at the same logical point
> as before this change ?

For consistency with the other egl_init() callers, called during
qemu_create_early_backends(). That way display_opengl is set early too
(as before).
>
>
> > diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> > index 10772b6471..36b4fc51d9 100644
> > --- a/ui/egl-helpers.c
> > +++ b/ui/egl-helpers.c
> > @@ -19,6 +19,8 @@
> >  #include "qemu/error-report.h"
> >  #include "ui/console.h"
> >  #include "ui/egl-helpers.h"
> > +#include "sysemu/sysemu.h"
> > +#include "qapi/error.h"
> >
> >  EGLDisplay *qemu_egl_display;
> >  EGLConfig qemu_egl_config;
> > @@ -569,3 +571,26 @@ EGLContext qemu_egl_init_ctx(void)
> >
> >      return ectx;
> >  }
> > +
> > +bool egl_init(const char *rendernode, DisplayGLMode mode, Error **errp=
)
> > +{
> > +    ERRP_GUARD();
> > +
> > +    if (mode =3D=3D DISPLAYGL_MODE_OFF) {
> > +        error_setg(errp, "egl: turning off GL doesn't make sense");
> > +        return false;
> > +    }
> > +
> > +#ifdef CONFIG_GBM
> > +    if (egl_rendernode_init(rendernode, mode) < 0) {
> > +        error_setg(errp, "egl: render node init failed");
> > +        return false;
> > +    }
> > +#else
> > +    error_setg(errp, "egl: not available on this platform");
> > +    return false;
> > +#endif
> > +
> > +    display_opengl =3D 1;
> > +    return true;
> > +}
>
> Surely this is going to result in compile errors when !CONFIG_GBM
> because these two lines are going to be flagged as unreachable
> code, due to the 'return false' in the #else branch.

Interestingly, I don't get a warning (-g -O2).. I'll change the code
nonetheless.

>
> > diff --git a/ui/spice-core.c b/ui/spice-core.c
> > index 76f7c2bc3d..b05c830086 100644
> > --- a/ui/spice-core.c
> > +++ b/ui/spice-core.c
> > @@ -820,12 +820,7 @@ static void qemu_spice_init(void)
> >                           "incompatible with -spice port/tls-port");
> >              exit(1);
> >          }
> > -        if (egl_rendernode_init(qemu_opt_get(opts, "rendernode"),
> > -                                DISPLAYGL_MODE_ON) !=3D 0) {
> > -            error_report("Failed to initialize EGL render node for SPI=
CE GL");
> > -            exit(1);
> > -        }
> > -        display_opengl =3D 1;
> > +        egl_init(qemu_opt_get(opts, "rendernode"), DISPLAYGL_MODE_ON, =
&error_fatal);
> >          spice_opengl =3D 1;
> >      }
> >  #endif
> > --
> > 2.39.2
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>


--=20
Marc-Andr=C3=A9 Lureau

