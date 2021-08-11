Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D93E8EED
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 12:44:26 +0200 (CEST)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDlii-0001Qy-OY
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 06:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDlhJ-0000WM-Nm
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:42:57 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDlhH-0000n2-9q
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:42:57 -0400
Received: by mail-ej1-x636.google.com with SMTP id w5so3398757ejq.2
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+c3zVorVqCe/X5gIKAoQTdfSRiwsQEJqCSYN8kapQzk=;
 b=DcN0hO02cFTxN98pqkUogk6Z86WTL+flRpj7jn0ln9BobdAf/b9SMtZFFKaPWLrgXL
 +eNemJnsntFNV/rqORc0D5q5q0saGHkxsOqMDzhsGWgQfOUbZAsHdt5fjsrzAT4Jwgm1
 A8Lna+e1GUMuwmNJ6Qw3PLi+hjUks7Rn3e+qDNdEm26trQyvxbpJq6gRc3sQvEmRiVef
 fQg97syjt9GTu3BOVsj70KBvvd1wTO0vHg6fo+8s/2RASCgG4rMa4LsIJeb8nJ09UBc/
 pgzGHcLS7RAq3HZRSBnahKYnU+042zQjSd5sKdiB64hHhIrX+rQh7Ud3+IfDSPxnQ7PK
 E19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+c3zVorVqCe/X5gIKAoQTdfSRiwsQEJqCSYN8kapQzk=;
 b=CEQZ+HYwXG+3x1vclkJnIscmhO9EN+a5MBCDR1CBOb4fY4gKCWtTePxq5ylPo19IQy
 gNzDr+CFhGWezdj++/sPeK42mY051fpuJNB69d8koFjb3tC3kXehBcMhhrBSFcClowUM
 o8a7PsqHdoiOX/ytiLJRW1WZ1pRFFMB0tSdKkf9tkTLhkh8JMyfuiDfdkuKXNiZH1YYO
 /sWDJuSzNdP1wkTb5HVu4ZnM7Wl4gf8tEBzuu+jyime9e/xqDK8cptvAfqOtelvXwpnR
 4PZvJZ8QkDmjTmXGpoZWmOtqXTfxN+gmE9VxcKJv1VIEMFRnwG7MP7Pob2qiRZHw4Y1a
 xD8Q==
X-Gm-Message-State: AOAM533HTeDNfwyM3tMknZGaFqLnbvj/yhxb563khYPR63fHskgXyabu
 3fU6HQvs1jBVVEXI1bAd/WpR18dfu9gPN/fojDg=
X-Google-Smtp-Source: ABdhPJwRH/wZVKdSt3x8tX7OVpuSVb0JhYGlh0u3u1veJzsCngFGjD5zaMuUyL3jj6FxEAc6yMT09BU+8n/yA1clYco=
X-Received: by 2002:a17:907:3e05:: with SMTP id
 hp5mr2945109ejc.527.1628678572816; 
 Wed, 11 Aug 2021 03:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
 <CAJ+F1CJGfZBR69gfO4kGxvh73=JRX-w2knZ-AemCoK3pit7XOw@mail.gmail.com>
 <BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB3192.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB3192.namprd12.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 11 Aug 2021 14:42:40 +0400
Message-ID: <CAJ+F1C+dmfpRCWfSSMV6F0mxtb0TJ3PQekvzOeR2vCUtSjMhAQ@mail.gmail.com>
Subject: Re: [PATCH] Use EGL device extension in display initialization.
To: Eugene Huang <eugeneh@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000c93de705c94647fe"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c93de705c94647fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 11, 2021 at 11:58 AM Eugene Huang <eugeneh@nvidia.com> wrote:

> Hi,
>
>
>
> I have had some hard time to set up git send-email. I am not even sure if
> it is doable here. I read that attachments can be used a last resort for
> first timers. Here are the attachments. Hope it works.
>
>
>

Unfortunately, the patches still fail to apply.
https://patchew.org/QEMU/BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB31=
92.namprd12.prod.outlook.com/

Thanks,
>
> Eugene
>
>
>
> *From:* Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
> *Sent:* Friday, August 6, 2021 12:25 AM
> *To:* Eugene Huang <eugeneh@nvidia.com>
> *Cc:* qemu-devel@nongnu.org
> *Subject:* Re: [PATCH] Use EGL device extension in display initialization=
.
>
>
>
> *External email: Use caution opening links or attachments*
>
>
>
> Hi
>
>
>
> On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang <eugeneh@nvidia.com> wrote:
>
> This patch enables running generic EGL devices such as Nvidia=E2=80=99s i=
n
> headless mode. It assumes single device. More work is needed to support
> multiple devices.
>
>
>
> Signed-off-by: Eugene Huang <eugeneh@nvidia.com>
>
>
>
> Thanks for the patch. It isn't correctly formatted and git apply fails  (
> https://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB=
3192.namprd12.prod.outlook.com/
> <https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc=
hew.org%2FQEMU%2FBYAPR12MB319275649A1403C254A9EA43D9F29%40BYAPR12MB3192.nam=
prd12.prod.outlook.com%2F&data=3D04%7C01%7Ceugeneh%40nvidia.com%7C2d1240b86=
6904cc7971308d958ab4471%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637638=
314899347574%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DEsDRdtG01ja1P9NDZG8ScE7SgC8ZILF=
S6p%2B9mGoklnY%3D&reserved=3D0>).
> Please use git send-email.
>
>
>
> ---
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
>
>
> Given that the function has a lengthy comment to explain it, and this is
> quite archaic stuff, I think you should update the comments with your
> additions.
>
>
>
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
>
> thanks
>
>
>
> --
>
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000c93de705c94647fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 11, 2021 at 11:58 AM Eu=
gene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com">eugeneh@nvidia.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_3560069331736637333WordSection1">
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I have had some hard time to set up git send-email. =
I am not even sure if it is doable here. I read that attachments can be use=
d a last resort for first timers. Here are the attachments. Hope it works.<=
u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0</p></div></div></blockquote><div><br><=
/div><div>Unfortunately, the patches still fail to apply.</div><div><a href=
=3D"https://patchew.org/QEMU/BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12=
MB3192.namprd12.prod.outlook.com/">https://patchew.org/QEMU/BYAPR12MB3192EC=
20271BF35444CE2FF3D9F89@BYAPR12MB3192.namprd12.prod.outlook.com/</a></div><=
div><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=
=3D"overflow-wrap: break-word;" lang=3D"EN-US"><div class=3D"gmail-m_356006=
9331736637333WordSection1"><p class=3D"MsoNormal"><u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Eugene<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b>From:</b> Marc-Andr=C3=A9 Lureau &lt;<a href=3D"m=
ailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.=
com</a>&gt; <br>
<b>Sent:</b> Friday, August 6, 2021 12:25 AM<br>
<b>To:</b> Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com" target=3D=
"_blank">eugeneh@nvidia.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-=
devel@nongnu.org</a><br>
<b>Subject:</b> Re: [PATCH] Use EGL device extension in display initializat=
ion.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table style=3D"background:rgb(255,235,156) none repeat scroll 0% 0%" cellp=
adding=3D"0" border=3D"1">
<tbody>
<tr>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:black">External email: Use caution opening l=
inks or attachments</span></b><span style=3D"font-size:7.5pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:black">
</span><u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang &lt;<a h=
ref=3D"mailto:eugeneh@nvidia.com" target=3D"_blank">eugeneh@nvidia.com</a>&=
gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext">This patch enables running generic EGL devices such as Nvidia=E2=80=99=
s in headless mode. It assumes single device. More work is needed to suppor=
t multiple devices.<u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext">=C2=A0<u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">Sign=
ed-off-by: Eugene Huang &lt;<a href=3D"mailto:eugeneh@nvidia.com" target=3D=
"_blank">eugeneh@nvidia.com</a>&gt;</span><u></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the patch. It isn&#39;t correctly formatt=
ed and git apply fails=C2=A0 (<a href=3D"https://nam11.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB319275649A1=
403C254A9EA43D9F29%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&amp;data=3D=
04%7C01%7Ceugeneh%40nvidia.com%7C2d1240b866904cc7971308d958ab4471%7C43083d1=
5727340c1b7db39efd9ccc17a%7C0%7C0%7C637638314899347574%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;sdata=3DEsDRdtG01ja1P9NDZG8ScE7SgC8ZILFS6p%2B9mGoklnY%3D&amp;reserve=
d=3D0" target=3D"_blank">https://patchew.org/QEMU/BYAPR12MB319275649A1403C2=
54A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com/</a>).
 Please use git send-email.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">---<=
/span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">ui/e=
gl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----</span><u></u><u=
></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">1 fi=
le changed, 37 insertions(+), 4 deletions(-)</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">diff=
 --git a/ui/egl-helpers.c b/ui/egl-helpers.c</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">inde=
x 7c530c2825..c11610c083 100644</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">--- =
a/ui/egl-helpers.c</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+++ =
b/ui/egl-helpers.c</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">@@ -=
1,6 +1,8 @@</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">/*</=
span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0 * Copyright (C) 2015-2016 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@re=
dhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;</span><u></u><u></u><=
/p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0 *</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+ * =
Copyright (c) 2021, NVIDIA CORPORATION &amp; AFFILIATES. All rights reserve=
d.</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+ *<=
/span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0 * This library is free software; you can redistribute it and/or</span><=
u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0 * modify it under the terms of the GNU Lesser General Public</span><u><=
/u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0 * License as published by the Free Software Foundation; either</span><u=
></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">@@ -=
349,11 +351,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDisplayTy=
pe native,</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 EGLDisplay dpy =3D EGL_NO_DISPLAY;</span><u></u><u></=
u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* In practise any EGL 1.5 implementation would =
support the EXT extension */</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">-=C2=
=A0=C2=A0=C2=A0 if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_ba=
se&quot;)) {</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 if (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_ba=
se&quot;)</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; epoxy_has_egl_extension(=
NULL, &quot;EGL_EXT_platform_device&quot;)</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; (epoxy_has_egl_extension=
(NULL, &quot;EGL_EXT_device_base&quot;)</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || epoxy_has_egl_extension(NULL, &q=
uot;EGL_EXT_device_enumeration&quot;))) {</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFNEGLGETPLATFORMDISPLAYEXTPR=
OC getPlatformDisplayEXT =3D</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void=
 *) eglGetProcAddress(&quot;eglGetPlatformDisplayEXT&quot;);</span><u></u><=
u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (getPlatformDisplayEXT &am=
p;&amp; platform !=3D 0) {</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy =3D get=
PlatformDisplayEXT(platform, native, NULL);</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (platfor=
m =3D=3D EGL_PLATFORM_DEVICE_EXT) {</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 static const int MAX_DEVICES =3D 4;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 EGLDeviceEXT eglDevs[MAX_DEVICES];</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 EGLint numDevices;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D</span><u></u>=
<u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PFNEGLQUERYDEVICESEXTPROC)</span><u><=
/u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 eglGetProcAddress(&quot;eglQueryDevicesEXT&quot;);</span><u></=
u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &amp;numDevices);</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);</span>=
<u></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Given that the function has a lengthy comment to exp=
lain it, and this is quite archaic stuff, I think you should update the com=
ments with your additions.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dpy =3D getPlatformDisplayEXT(platform, native, NULL);</span><=
u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span><u>=
</u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 }</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">@@ -=
386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_ALPHA_SIZE, 0,</span><u><=
/u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_NONE,</span><u></u><u></u=
></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 };</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 static const EGLint conf_att_pbuffer[] =3D {</span><u></u><=
u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,<=
/span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_RED_SIZE, 8,</span><u></u><u></=
u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_GREEN_SIZE, 8,</span><u></u><u>=
</u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_BLUE_SIZE, 8,</span><u></u><u><=
/u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_DEPTH_SIZE, 1,</span><u></u><u>=
</u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT=
,</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_NONE</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 };</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 EGLint major, minor;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 EGLBoolean b;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 EGLint n;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">@@ -=
411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,</spa=
n><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 }</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0b =3D eglChooseConfig(qemu_egl_display,</span><u=
></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gles ? conf_at=
t_gles : conf_att_core,</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;qemu_egl_=
config, 1, &amp;n);</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gles ? conf_att_gles : (platform =
=3D=3D EGL_PLATFORM_DEVICE_EXT ? conf_att_pbuffer : conf_att_core),</span><=
u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;qemu_egl_config, 1, &amp;n);</=
span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 if (b =3D=3D EGL_FALSE || n !=3D 1) {</span><u></u><u=
></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report(&quot;egl: eglCh=
ooseConfig failed (%s mode)&quot;,</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gles ? &quot;gles&quot; : =
&quot;core&quot;);</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">@@ -=
434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, Displa=
yGLMode mode)</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)=
</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">{</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 // Try EGL Device Extension</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =
=3D=3D 0) {</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+=C2=
=A0=C2=A0=C2=A0 }</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">+</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">#ifd=
ef EGL_MESA_platform_gbm</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0 return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, =
mode);</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">#els=
e</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">--
</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">2.17=
.1</span><u></u><u></u></p>
<p class=3D"gmail-m_3560069331736637333gmail-m-5372014696273679682msoplaint=
ext"><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot;">=C2=
=A0</span><u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">Marc-Andr=C3=A9 Lureau<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c93de705c94647fe--

