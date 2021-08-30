Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B53FB77C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 16:05:02 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhuB-0007lw-G9
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mKhqt-0005Cq-2u
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:01:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mKhqq-0007Ql-H4
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:01:30 -0400
Received: by mail-ed1-x52a.google.com with SMTP id j13so16459279edv.13
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEXhE5VCwR3lvTmQm+0RHT6BKAptZR9+wLH8xPIpIjY=;
 b=cJmpyRQlNWd3A9TmpGezw6NN3o1x8nRzhb7ZJpDhyh6FKhaDQIKyqWfQnCBws7G5k4
 GraXHqnhrN6mVSsCX954PfxRbnnStvfgnXzCprxjhllhcQOq44YFtTAks8hVSy3NCEEs
 ELDqo8tbBIcSMg3REpOt/aORvAGW4Pqx89cKZl60fnaoY6cXApXrOEsfVIGw+PJYG7Wf
 pudDPlRmziT6Bz4hLqMaqafW3Rz5zTmybqP0v8Wtr+hSxsIYis9l2haII6YgeRJOpFZH
 9uVQMeChtaJXGCCR7BpuHh6k/wbjBgxG8PKrtBt6jilXPh/f7NbmUkLQFLpYsXRMbwzR
 8jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEXhE5VCwR3lvTmQm+0RHT6BKAptZR9+wLH8xPIpIjY=;
 b=BNYTPGXszeIK7lqtimhazviQQ8DEsK42V2RQLpCoteEcdRbBii15uod5mWt7jKLUTd
 snGNBxehGD69XM8uYYeyUNzLxfT1/mtq1UfWKBARcHNYS3MPPWBSgTk91FNp0eEXl0PR
 ZQt63BknxBO7Ou9N9hPkPnxXQ/PYYbEdZtwW3LpkwXXh2Zr3e3OvWnjJEPkqd6Ckz1xy
 Y20hy4uAfviSJ8LIpfKL/E5l4aThr6kUPEOKCLftXntE3SD3GI3Z4waxnH5gT7ZbB6aA
 G6tHhlzah4M4dndJcEiMLPux/FjEPB3zLJtqzbtk+eIMo67gKa2HxWtkbbl5mlA7TLq8
 ETjQ==
X-Gm-Message-State: AOAM530Dh0SSYtt837yF9wCIxMfyv0X7Hw0sg12LKNKe9yiMmgh03kPY
 KuCRQSEQLO1WiYgwgpq7LZGC0UzexFUVhCazFds=
X-Google-Smtp-Source: ABdhPJxBeAO/AicyyC6VRtqoHujd0mUU+PGlUFMdNW7gh36OhPJbvHZRvIJGiCQVVX9V5IfM7OXnOo55E7ELOMzZR5M=
X-Received: by 2002:aa7:d9d3:: with SMTP id v19mr24414262eds.257.1630332085670; 
 Mon, 30 Aug 2021 07:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210824222226.22528-1-eugeneh@nvidia.com>
In-Reply-To: <20210824222226.22528-1-eugeneh@nvidia.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 30 Aug 2021 18:01:13 +0400
Message-ID: <CAJ+F1CLM6n7r-ic5t853gwGGfnETV0GwFQnG-21OHQgbpf1PMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Use EGL device extension in display initialization.
To: Eugene Huang <eugeneh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d5168305cac7440d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000d5168305cac7440d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 2:22 AM Eugene Huang <eugeneh@nvidia.com> wrote:

> Signed-off-by: Eugene Huang <eugeneh@nvidia.com>
> ---
>  ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index 6d0cb2b5cb..ce0971422b 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -1,6 +1,8 @@
>  /*
>   * Copyright (C) 2015-2016 Gerd Hoffmann <kraxel@redhat.com>
>   *
> + * Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights
> reserved.
> + *
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> @@ -351,11 +353,26 @@ static EGLDisplay
> qemu_egl_get_display(EGLNativeDisplayType native,
>      EGLDisplay dpy =3D EGL_NO_DISPLAY;
>
>      /* In practise any EGL 1.5 implementation would support the EXT
> extension */
> -    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {
> +    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")
> +        && epoxy_has_egl_extension(NULL, "EGL_EXT_platform_device")
> +        && (epoxy_has_egl_extension(NULL, "EGL_EXT_device_base")
> +        || epoxy_has_egl_extension(NULL, "EGL_EXT_device_enumeration")))=
 {
>          PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =3D
>              (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");
>          if (getPlatformDisplayEXT && platform !=3D 0) {
> -            dpy =3D getPlatformDisplayEXT(platform, native, NULL);
> +            if (platform =3D=3D EGL_PLATFORM_DEVICE_EXT) {
> +                static const int MAX_DEVICES =3D 4;
> +                EGLDeviceEXT eglDevs[MAX_DEVICES];
> +                EGLint numDevices;
> +
> +                PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D
> +                    (PFNEGLQUERYDEVICESEXTPROC)
> +                eglGetProcAddress("eglQueryDevicesEXT");
>

It should handle the case where returned eglQueryDevicesEXT is NULL.

+                eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &numDevices);
>

You need to handle the success return value, as well as the case where
numDevices =3D=3D 0.

(surprisingly, we don't need to care about memory of eglDevs?)


> +                dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);
> +            } else {
> +                dpy =3D getPlatformDisplayEXT(platform, native, NULL);
> +            }
>          }
>      }
>
> @@ -388,6 +405,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dp=
y,
>          EGL_ALPHA_SIZE, 0,
>          EGL_NONE,
>      };
> +
> +    static const EGLint conf_att_pbuffer[] =3D {
> +        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
> +        EGL_RED_SIZE, 8,
> +        EGL_GREEN_SIZE, 8,
> +        EGL_BLUE_SIZE, 8,
> +        EGL_DEPTH_SIZE, 1,
> +        EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,
> +        EGL_NONE
> +    };
> +
>      EGLint major, minor;
>      EGLBoolean b;
>      EGLint n;
> @@ -413,8 +441,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy=
,
>      }
>
>      b =3D eglChooseConfig(qemu_egl_display,
> -                        gles ? conf_att_gles : conf_att_core,
> -                        &qemu_egl_config, 1, &n);
> +        gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_EXT =
?
> conf_att_pbuffer : conf_att_core),
> +        &qemu_egl_config, 1, &n);
>      if (b =3D=3D EGL_FALSE || n !=3D 1) {
>          error_report("egl: eglChooseConfig failed (%s mode)",
>                       gles ? "gles" : "core");
> @@ -436,6 +464,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy,
> DisplayGLMode mode)
>
>  int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)
>  {
> +    // Try EGL Device Extension
> +    if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) =
{
> +        return 0;
> +    }
> +
>  #ifdef EGL_MESA_platform_gbm
>      return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);
>  #else
> --
> 2.17.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d5168305cac7440d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 2:22 AM Eugen=
e Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com">eugeneh@nvidia.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com" target=3D"_b=
lank">eugeneh@nvidia.com</a>&gt;<br>
---<br>
=C2=A0ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----<br>
=C2=A01 file changed, 37 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c<br>
index 6d0cb2b5cb..ce0971422b 100644<br>
--- a/ui/egl-helpers.c<br>
+++ b/ui/egl-helpers.c<br>
@@ -1,6 +1,8 @@<br>
=C2=A0/*<br>
=C2=A0 * Copyright (C) 2015-2016 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel=
@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
=C2=A0 *<br>
+ * Copyright (c) 2021, NVIDIA CORPORATION &amp; AFFILIATES. All rights res=
erved.<br>
+ *<br>
=C2=A0 * This library is free software; you can redistribute it and/or<br>
=C2=A0 * modify it under the terms of the GNU Lesser General Public<br>
=C2=A0 * License as published by the Free Software Foundation; either<br>
@@ -351,11 +353,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDispl=
ayType native,<br>
=C2=A0 =C2=A0 =C2=A0EGLDisplay dpy =3D EGL_NO_DISPLAY;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* In practise any EGL 1.5 implementation would support=
 the EXT extension */<br>
-=C2=A0 =C2=A0 if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_bas=
e&quot;)) {<br>
+=C2=A0 =C2=A0 if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_bas=
e&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; epoxy_has_egl_extension(NULL, &quot=
;EGL_EXT_platform_device&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (epoxy_has_egl_extension(NULL, &quo=
t;EGL_EXT_device_base&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || epoxy_has_egl_extension(NULL, &quot;EGL_EXT=
_device_enumeration&quot;))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatfo=
rmDisplayEXT =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *) eglGetProcAddress(=
&quot;eglGetPlatformDisplayEXT&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (getPlatformDisplayEXT &amp;&amp; plat=
form !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy =3D getPlatformDisplayEXT(pl=
atform, native, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (platform =3D=3D EGL_PLATFORM=
_DEVICE_EXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const int M=
AX_DEVICES =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGLDeviceEXT eglDe=
vs[MAX_DEVICES];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGLint numDevices;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PFNEGLQUERYDEVICES=
EXTPROC eglQueryDevicesEXT =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (PFN=
EGLQUERYDEVICESEXTPROC)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGetProcAddress(=
&quot;eglQueryDevicesEXT&quot;);<br></blockquote><div><br></div><div>It sho=
uld handle the case where returned eglQueryDevicesEXT is NULL.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglQueryDevicesEXT=
(MAX_DEVICES, eglDevs, &amp;numDevices);<br></blockquote><div><br></div><di=
v>You need to handle the success return value, as well as the case where nu=
mDevices =3D=3D 0.</div><div><br></div><div>(surprisingly, we don&#39;t nee=
d to care about memory of eglDevs?)<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy =3D getPlatfor=
mDisplayEXT(platform, eglDevs[0], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy =3D getPlatfor=
mDisplayEXT(platform, native, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -388,6 +405,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EGL_ALPHA_SIZE, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EGL_NONE,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 static const EGLint conf_att_pbuffer[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_RED_SIZE, 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_GREEN_SIZE, 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_BLUE_SIZE, 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_DEPTH_SIZE, 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_NONE<br>
+=C2=A0 =C2=A0 };<br>
+<br>
=C2=A0 =C2=A0 =C2=A0EGLint major, minor;<br>
=C2=A0 =C2=A0 =C2=A0EGLBoolean b;<br>
=C2=A0 =C2=A0 =C2=A0EGLint n;<br>
@@ -413,8 +441,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0b =3D eglChooseConfig(qemu_egl_display,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gles ? conf_att_gles : conf_att_core,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;qemu_egl_config, 1, &amp;n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gles ? conf_att_gles : (platform =3D=3D EGL_PL=
ATFORM_DEVICE_EXT ? conf_att_pbuffer : conf_att_core),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;qemu_egl_config, 1, &amp;n);<br>
=C2=A0 =C2=A0 =C2=A0if (b =3D=3D EGL_FALSE || n !=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;egl: eglChooseConfig f=
ailed (%s mode)&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gles ? &quot;gles&quot; : &quot;core&quot;);<br>
@@ -436,6 +464,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, Di=
splayGLMode mode)<br>
<br>
=C2=A0int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mo=
de)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 // Try EGL Device Extension<br>
+=C2=A0 =C2=A0 if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =
=3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0#ifdef EGL_MESA_platform_gbm<br>
=C2=A0 =C2=A0 =C2=A0return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mo=
de);<br>
=C2=A0#else<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d5168305cac7440d--

