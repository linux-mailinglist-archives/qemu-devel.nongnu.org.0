Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A12C49D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:25:30 +0100 (CET)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2I4-00077b-PT
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ki2Gv-0006eY-Ol
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:24:17 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ki2Gu-0004rZ-82
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:24:17 -0500
Received: by mail-ed1-x543.google.com with SMTP id a15so4112141edy.1
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MszC8hrU0HPD1crrHXZgzS/1TEI3PYDeGS5CdTGM2kg=;
 b=Ytt35iSvsJ+Jgha8o9kFEOPPu9yssEXdQqzAB5+ZcI63I5SDROhasd85h/YUoeAEx8
 5IkCUuVfLIFl9gBE0STnLl4ICAbSGVuj8d8mbJg0/t5YnbhtDFrqmFb7gWayjZN59MYF
 rruedK6HXSdGclxW2zOLlRVpiZNl5Y/aF0lHfrDSLcZE8o0XbA7YOuumFfpu/eR8pbz1
 a4FMShLwsVtmFhGqi2eyIBFUYTwO2/0LRK/cbyeH5hc9x+uJiY+xFSu6NMrWRuoxrva2
 m3NxBfDjYr1cT6eBiM2ECMqbZ3DbXrMOYNbdwa2VUFmYAYsfMDud3h5wAG2GKgTl8keF
 6tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MszC8hrU0HPD1crrHXZgzS/1TEI3PYDeGS5CdTGM2kg=;
 b=VViDa4Ub3zPr336qQPWwX1yn6k/0maLnwD5yf+wod0MCCdd8UjAtRlIWTnYxfbDW/S
 lq4egIRoEToq8zULq0S/oafUeHuVlZSOD9DGofHN9wlI632LeLbXTHpuWq4cR0uUG+qG
 coV6i7clCbGVxNimS9EMUnN6SDGhRKYgvNZ43fneWYfUcDhOaP57fPEYOa3VwmCuGARO
 7hChHbWg/+40mii0beisZbP02v5opVx3BSzAXMr7pS9KuF9ZVux4WMAG2H0SLGEmVp+N
 xuuwT1BXuq3/De8K2nG32KdHsxLYb5nIjGt/kkNXHz5toivJK6S3VfEf2mlQJGXMWym7
 joEQ==
X-Gm-Message-State: AOAM532dGS1SSshwxI/XxeKZxLkRmSiy618vVCTidhvOm+2dkYjYKbk0
 fg0+2Phq36RoXJgWSMW1ytzVi8DZK57MlyUtgts=
X-Google-Smtp-Source: ABdhPJy53M/gc00wh4vbvHLr5ySDad8OYHWN3BoV5E3PvCjNLlkgsLGwhsyn8a3J7RbLq2hY5lIRS67i7Iv3YvQJkdM=
X-Received: by 2002:aa7:c3c4:: with SMTP id l4mr5283649edr.314.1606339454941; 
 Wed, 25 Nov 2020 13:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20201125191833.964753-1-sw@weilnetz.de>
In-Reply-To: <20201125191833.964753-1-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Nov 2020 01:24:03 +0400
Message-ID: <CAJ+F1CL_ByOhpHaVpiQdp+yHNO8gwtK5a2c0DOucV_xG-WW=mQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2] nsis: Fix build for 64 bit installer
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000099bd2305b4f50c28"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000099bd2305b4f50c28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 11:22 PM Stefan Weil <sw@weilnetz.de> wrote:

> Pass cpu instead of cpu_family to the NSIS installer script.
>
> That script checks for "x86_64" which is the cpu value,
> while cpu_family is "x86".
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 5062407c70..8a99c948d3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1956,7 +1956,7 @@ if host_machine.system() =3D=3D 'windows'
>      '@OUTPUT@',
>      get_option('prefix'),
>      meson.current_source_dir(),
> -    host_machine.cpu_family(),
> +    host_machine.cpu(),
>      '--',
>      '-DDISPLAYVERSION=3D' + meson.project_version(),
>    ]
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000099bd2305b4f50c28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 11:22 PM Stef=
an Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pass cpu instea=
d of cpu_family to the NSIS installer script.<br>
<br>
That script checks for &quot;x86_64&quot; which is the cpu value,<br>
while cpu_family is &quot;x86&quot;.<br>
<br>
Signed-off-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"=
_blank">sw@weilnetz.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 5062407c70..8a99c948d3 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1956,7 +1956,7 @@ if host_machine.system() =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0&#39;@OUTPUT@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0get_option(&#39;prefix&#39;),<br>
=C2=A0 =C2=A0 =C2=A0meson.current_source_dir(),<br>
-=C2=A0 =C2=A0 host_machine.cpu_family(),<br>
+=C2=A0 =C2=A0 host_machine.cpu(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;--&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;-DDISPLAYVERSION=3D&#39; + meson.project_version()=
,<br>
=C2=A0 =C2=A0]<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000099bd2305b4f50c28--

