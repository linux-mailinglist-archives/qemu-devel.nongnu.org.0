Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D683E23F2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:25:41 +0200 (CEST)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuEe-00029O-Dj
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBuDo-0001TJ-BT
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:24:48 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBuDm-00014H-3R
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:24:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id y7so11813856eda.5
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8CzNgCgnfPaWs+t9YcNNnEByrArB+BR0LMxbjKc5rs=;
 b=ejFv64oyTJuemnKIC4wiGFB5NZGglnWZKbNnxk7pr9u4ECij0MARgJIeADR82bIBSr
 jJsM4rsGrHOIOUbaQDth4ClHSHXje81LO63Q1A0dAVOUwQNVq/aI34sUpROyZH5Xhr9t
 FFX0t1l1HGDveEx9CoW16HJIi6LbpCVQjbxNyUJFLQj2wuuzmnUpWo7ZjEBUY/aGRbJB
 iT2cDUQyN1wjg5LG3z1V8qGnC68sFv1IwUyygUAzzsylrjxfHH227TzJLx80PWjygH0I
 D/kTQa24thdKh8D3rkdoMeqy1lU2QURLjvZqqc5YUv+1AN4cGTZHP2vYTM99HZYogMHU
 4OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8CzNgCgnfPaWs+t9YcNNnEByrArB+BR0LMxbjKc5rs=;
 b=YQwqMurL4GNgWS1oKAEwMjyuEiLCZAz+frnwlJbd6UklpZoyac+Bvkx8KbT7nqVY5w
 XD514HYsKHH05YHJNONxwyvmzOyT+Z2uu+c6Yan4JBMXp7Jv5XDOvL7XCdzZ3R4X+YMc
 +1vFdqFFaTV5evIO7RIYwzIHcVrFd1uCQCuqHlp12AG0g97YUYvCymSX7N4eZTprkbYL
 XMQAHz67bNmZFIuRdkqUvV/n54ub7i1dnqN5v5st142nRy4alZZSqkIqqMmvYhFcA6/u
 JvpoveoATtb69DcxVoxkAQOczXcxCWVXToktbr0lPMEAXEpYpzdAoMs9JzbEETB+3UEF
 xZEg==
X-Gm-Message-State: AOAM5304yD6sjEK8IrBQE4Pb5jkpzzlffe/UlSMsea+Mzzz2f84yimQ1
 /EqvB8vOxyADjCSSaZSBO0WI/kvuj2pHDKbTTMM=
X-Google-Smtp-Source: ABdhPJxO6gqtv6Fdp2s6NBtXxwTyQqsZnHaNsIWNg4H82OgEQ/CQKsnLUPYxZGTeUxjpca3+Qb+fzgNlO4HYBDKD1cA=
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr11613540edy.53.1628234684196; 
 Fri, 06 Aug 2021 00:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 6 Aug 2021 11:24:32 +0400
Message-ID: <CAJ+F1CJGfZBR69gfO4kGxvh73=JRX-w2knZ-AemCoK3pit7XOw@mail.gmail.com>
Subject: Re: [PATCH] Use EGL device extension in display initialization.
To: Eugene Huang <eugeneh@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000f66b1705c8deed94"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f66b1705c8deed94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang <eugeneh@nvidia.com> wrote:

> This patch enables running generic EGL devices such as Nvidia=E2=80=99s i=
n
> headless mode. It assumes single device. More work is needed to support
> multiple devices.
>
>
>
> Signed-off-by: Eugene Huang <eugeneh@nvidia.com>
>

Thanks for the patch. It isn't correctly formatted and git apply fails  (
https://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB31=
92.namprd12.prod.outlook.com/).
Please use git send-email.

---
>
> ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----
>
> 1 file changed, 37 insertions(+), 4 deletions(-)
>
>
>
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
>
> index 7c530c2825..c11610c083 100644
>
> --- a/ui/egl-helpers.c
>
> +++ b/ui/egl-helpers.c
>
> @@ -1,6 +1,8 @@
>
> /*
>
>   * Copyright (C) 2015-2016 Gerd Hoffmann <kraxel@redhat.com>
>
>   *
>
> + * Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights
> reserved.
>
> + *
>
>   * This library is free software; you can redistribute it and/or
>
>   * modify it under the terms of the GNU Lesser General Public
>
>   * License as published by the Free Software Foundation; either
>
> @@ -349,11 +351,26 @@ static EGLDisplay
> qemu_egl_get_display(EGLNativeDisplayType native,
>
>      EGLDisplay dpy =3D EGL_NO_DISPLAY;
>
>      /* In practise any EGL 1.5 implementation would support the EXT
> extension */
>
> -    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {
>
> +    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")
>
> +        && epoxy_has_egl_extension(NULL, "EGL_EXT_platform_device")
>
> +        && (epoxy_has_egl_extension(NULL, "EGL_EXT_device_base")
>
> +        || epoxy_has_egl_extension(NULL, "EGL_EXT_device_enumeration")))=
 {
>
>          PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =3D
>
>              (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");
>
>          if (getPlatformDisplayEXT && platform !=3D 0) {
>
> -            dpy =3D getPlatformDisplayEXT(platform, native, NULL);
>
> +            if (platform =3D=3D EGL_PLATFORM_DEVICE_EXT) {
>
> +                static const int MAX_DEVICES =3D 4;
>
> +                EGLDeviceEXT eglDevs[MAX_DEVICES];
>
> +                EGLint numDevices;
>
> +
>
> +                PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D
>
> +                    (PFNEGLQUERYDEVICESEXTPROC)
>
> +                eglGetProcAddress("eglQueryDevicesEXT");
>
> +                eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &numDevices);
>
> +                dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);
>

Given that the function has a lengthy comment to explain it, and this is
quite archaic stuff, I think you should update the comments with your
additions.


> +            } else {
>
> +                dpy =3D getPlatformDisplayEXT(platform, native, NULL);
>
> +            }
>
>          }
>
>      }
>
> @@ -386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dp=
y,
>
>          EGL_ALPHA_SIZE, 0,
>
>          EGL_NONE,
>
>      };
>
> +
>
> +    static const EGLint conf_att_pbuffer[] =3D {
>
> +        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
>
> +        EGL_RED_SIZE, 8,
>
> +        EGL_GREEN_SIZE, 8,
>
> +        EGL_BLUE_SIZE, 8,
>
> +        EGL_DEPTH_SIZE, 1,
>
> +        EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,
>
> +        EGL_NONE
>
> +    };
>
> +
>
>      EGLint major, minor;
>
>      EGLBoolean b;
>
>      EGLint n;
>
> @@ -411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy=
,
>
>      }
>
>      b =3D eglChooseConfig(qemu_egl_display,
>
> -                        gles ? conf_att_gles : conf_att_core,
>
> -                        &qemu_egl_config, 1, &n);
>
> +        gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_EXT =
?
> conf_att_pbuffer : conf_att_core),
>
> +        &qemu_egl_config, 1, &n);
>
>      if (b =3D=3D EGL_FALSE || n !=3D 1) {
>
>          error_report("egl: eglChooseConfig failed (%s mode)",
>
>                       gles ? "gles" : "core");
>
> @@ -434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy,
> DisplayGLMode mode)
>
>  int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)
>
> {
>
> +    // Try EGL Device Extension
>
> +    if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) =
{
>
> +        return 0;
>
> +    }
>
> +
>
> #ifdef EGL_MESA_platform_gbm
>
>      return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);
>
> #else
>
> --
>
> 2.17.1
>
>
>

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f66b1705c8deed94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 2:28 AM=
 Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com">eugeneh@nvidia.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_-5372014696273679682WordSection1">
<p class=3D"gmail-m_-5372014696273679682MsoPlainText">This patch enables ru=
nning generic EGL devices such as Nvidia=E2=80=99s in headless mode. It ass=
umes single device. More work is needed to support multiple devices.<u></u>=
<u></u></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><u></u>=C2=A0<u></u><=
/p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">Signed-off-by: Eugene Huang &l=
t;<a href=3D"mailto:eugeneh@nvidia.com" target=3D"_blank">eugeneh@nvidia.co=
m</a>&gt;</span></p></div></div></blockquote><div><br></div><div>Thanks for=
 the patch. It isn&#39;t correctly formatted and git apply fails=C2=A0 (<a =
href=3D"https://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYA=
PR12MB3192.namprd12.prod.outlook.com/">https://patchew.org/QEMU/BYAPR12MB31=
9275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com/</a>). =
Please use git send-email.<br></div><div><br> </div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;" lang=
=3D"EN-US"><div class=3D"gmail-m_-5372014696273679682WordSection1"><p class=
=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-size:8pt;=
font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">---<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">ui/egl-helpers.c | 41 ++++++++=
+++++++++++++++++++++++++++++----<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">1 file changed, 37 insertions(=
+), 4 deletions(-)<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">diff --git a/ui/egl-helpers.c =
b/ui/egl-helpers.c<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">index 7c530c2825..c11610c083 1=
00644<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">--- a/ui/egl-helpers.c<u></u><=
u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+++ b/ui/egl-helpers.c<u></u><=
u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">@@ -1,6 +1,8 @@<u></u><u></u><=
/span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">/*<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0 * Copyright (C) 2015-20=
16 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0 *<u></u><u></u></span><=
/p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+ * Copyright (c) 2021, NVIDIA=
 CORPORATION &amp; AFFILIATES. All rights reserved.<u></u><u></u></span></p=
>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+ *<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0 * This library is free =
software; you can redistribute it and/or<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0 * modify it under the t=
erms of the GNU Lesser General Public<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0 * License as published =
by the Free Software Foundation; either<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">@@ -349,11 +351,26 @@ static E=
GLDisplay qemu_egl_get_display(EGLNativeDisplayType native,<u></u><u></u></=
span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 EGLDi=
splay dpy =3D EGL_NO_DISPLAY;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
/* In practise any EGL 1.5 implementation would support the EXT extension *=
/<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">-=C2=A0=C2=A0=C2=A0 if (epoxy_=
has_egl_extension(NULL, &quot;EGL_EXT_platform_base&quot;)) {<u></u><u></u>=
</span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 if (epoxy_=
has_egl_extension(NULL, &quot;EGL_EXT_platform_base&quot;)<u></u><u></u></s=
pan></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &amp;&amp; epoxy_has_egl_extension(NULL, &quot;EGL_EXT_plat=
form_device&quot;)<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &amp;&amp; (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_dev=
ice_base&quot;)<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 || epoxy_has_egl_extension(NULL, &quot;EGL_EXT_device_enume=
ration&quot;))) {<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =
=3D<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *) eglGetProcAddress(&quot=
;eglGetPlatformDisplayEXT&quot;);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (getPlatformDisplayEXT &amp;&amp; platform !=3D 0) {<=
u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy =3D getPlatformDisplayEXT(platf=
orm, native, NULL);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (platform =3D=3D EGL_PLATFORM_DE=
VICE_EXT) {<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static cons=
t int MAX_DEVICES =3D 4;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGLDeviceEX=
T eglDevs[MAX_DEVICES];<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGLint numD=
evices;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFNEGLQUERY=
DEVICESEXTPROC eglQueryDevicesEXT =3D<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (PFNEGLQUERYDEVICESEXTPROC)<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eglGetProcA=
ddress(&quot;eglQueryDevicesEXT&quot;);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eglQueryDev=
icesEXT(MAX_DEVICES, eglDevs, &amp;numDevices);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy =3D get=
PlatformDisplayEXT(platform, eglDevs[0], 0);</span></p></div></div></blockq=
uote><div><br></div><div>Given that the function has a lengthy comment to e=
xplain it, and this is quite archaic stuff, I think you should update the c=
omments with your additions.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;" lan=
g=3D"EN-US"><div class=3D"gmail-m_-5372014696273679682WordSection1"><p clas=
s=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-size:8pt=
;font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy =3D get=
PlatformDisplayEXT(platform, native, NULL);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 }<u><=
/u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">@@ -386,6 +403,17 @@ static in=
t qemu_egl_init_dpy(EGLNativeDisplayType dpy,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 EGL_ALPHA_SIZE, 0,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 EGL_NONE,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 };<u>=
</u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 static con=
st EGLint conf_att_pbuffer[] =3D {<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_RED_SIZE, 8,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_GREEN_SIZE, 8,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_BLUE_SIZE, 8,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_DEPTH_SIZE, 1,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,<u></u><u></u></span></=
p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EGL_NONE<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 };<u></u><=
u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 EGLin=
t major, minor;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 EGLBo=
olean b;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 EGLin=
t n;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">@@ -411,8 +439,8 @@ static int=
 qemu_egl_init_dpy(EGLNativeDisplayType dpy,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 }<u><=
/u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
b =3D eglChooseConfig(qemu_egl_display,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gles ? conf_att_gles : conf_att_core,<=
u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;qemu_egl_config, 1, &amp;n);<u></=
u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE=
_EXT ? conf_att_pbuffer : conf_att_core),<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &amp;qemu_egl_config, 1, &amp;n);<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 if (b=
 =3D=3D EGL_FALSE || n !=3D 1) {<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 error_report(&quot;egl: eglChooseConfig failed (%s mode)=
&quot;,<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gles ? &quot;gles&quot; : &quot;core&quot;);<u></u><u=
></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">@@ -434,6 +462,11 @@ int qemu_=
egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode)<u></u><u></u=
></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0int qemu_egl_init_dpy_me=
sa(EGLNativeDisplayType dpy, DisplayGLMode mode)<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">{<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 // Try EGL=
 Device Extension<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 if (qemu_e=
gl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) {<u></u><u></u></=
span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+=C2=A0=C2=A0=C2=A0 }<u></u><u=
></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">+<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">#ifdef EGL_MESA_platform_gbm<u=
></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);<u></u><u></u></span>=
</p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">#else<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">--
<u></u><u></u></span></p>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;">2.17.1<u></u><u></u></span></p=
>
<p class=3D"gmail-m_-5372014696273679682MsoPlainText"><span style=3D"font-s=
ize:8pt;font-family:&quot;Courier New&quot;"><u></u>=C2=A0<u></u></span></p=
>
</div>
</div>

</blockquote></div><br clear=3D"all"></div><div>thanks</div><div><br></div>=
<div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lure=
au<br></div></div></div>

--000000000000f66b1705c8deed94--

