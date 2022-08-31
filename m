Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46495A7E47
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:08:47 +0200 (CEST)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNSY-00062g-Tk
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNPL-0002Bt-O2
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:05:27 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNPJ-0003nL-W9
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:05:27 -0400
Received: by mail-lj1-x22c.google.com with SMTP id q16so14542527ljp.8
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=m1MfnVemuTh/uZctmqKZJGI2XeeHKkWXkNQShh8gqhg=;
 b=oOaDb2rZEmzetqGDL2p9VNpK1HHQgbsAjirsBGgcN/aOc5OktE2xURL3BdFGf6lN1A
 JQbUojhIFfCSF3Z7/VLI19nkXPjD4A+xcgn+Pty+Dkdhg8rTivF07ffpXYBUKbMbTfWH
 7/IJWLZhjynwupHn0mVnP9a8GSzeExZuyNlywuZljMFjVSWV6OY9fsb9lqHVH5Zr2oWA
 +8WEuu+MKjPcggTN55V4gx7lj3M/FrPgB5XmjeW49wEQs39gl+5S1jw3gY7XXtc+ywqC
 up8MFURd1Fb2CwjJGoGtXgKeaCvGvkazyv+9+UBAdjNvgtc/dTmnNyKR6Z4sfI9c1mEZ
 aHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=m1MfnVemuTh/uZctmqKZJGI2XeeHKkWXkNQShh8gqhg=;
 b=bNmZXP+Tp5JhcoYemA2UjPS/dZIy5qRBy0v2pU3Nj+ih0z1eF4kHKEFFAGyL3eZJK+
 hyRgCQuN4U29JoHzb7H6rwOICCTzJYclrLzNWMUiZmlCN9agpIKBzhx5F6UY4qDs/iPb
 Z2Jkc10uvdBthmj9VIybj3eatxurR3+uHpDDyx7LMRr9pkjKA0a3tV2W37VeLpI3ruR5
 eHS8n+hu/vgdS3+howyRT/tHOUV7MWA0QeYtaO67Jv49q/6+olcEQv0KvQ8BgQQtS26X
 +wSsSrdncl6ihVXg1RGdRIaHC2nwzB9xSNxop43aEgWrmd/VGPm4sJoiJ1BRWz/mfaav
 PthQ==
X-Gm-Message-State: ACgBeo0rJC2z7l7N/Svt64sUGG29cnYMPfYmke+1Gb25rOczsyMXzovY
 S8CSyKI/7PB/OxRGizmZM9VuO9fmPgGJ+T9xXlA=
X-Google-Smtp-Source: AA6agR6LZhU170BMPj1rdRRohRCmGdj8xI4YFUYc4p5thfew5BsXXYAeJeoUlwPaaNRsAqbC4PZ+Zs0gbOJ8e+i+II4=
X-Received: by 2002:a2e:9942:0:b0:265:e313:7fb7 with SMTP id
 r2-20020a2e9942000000b00265e3137fb7mr3586868ljj.449.1661951124277; Wed, 31
 Aug 2022 06:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-7-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-7-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:05:12 +0400
Message-ID: <CAJ+F1CJAzNKESGowwnykcWC46L5UF0EJ8uYkxM+oaVi=hjbOyA@mail.gmail.com>
Subject: Re: [PATCH 06/51] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000658d2905e789269d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000658d2905e789269d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 1:59 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Replace the existing logic to get the directory for temporary files
> with g_get_tmp_dir(), which works for win32 too.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Makes sense to me here,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  util/qemu-sockets.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 83f4bd6fd2..0c41ca9e42 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr=
,
>      if (saddr->path[0] || abstract) {
>          path =3D saddr->path;
>      } else {
> -        const char *tmpdir =3D getenv("TMPDIR");
> -        tmpdir =3D tmpdir ? tmpdir : "/tmp";
> -        path =3D pathbuf =3D g_strdup_printf("%s/qemu-socket-XXXXXX", tm=
pdir);
> +        path =3D pathbuf =3D g_strdup_printf("%s/qemu-socket-XXXXXX",
> +                                         g_get_tmp_dir());
>      }
>
>      pathlen =3D strlen(path);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000658d2905e789269d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 1:59 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Replace the existing logic to get the directory for temporary files<br>
with g_get_tmp_dir(), which works for win32 too.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Makes sense to me here,</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau =
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.=
com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
<br>
=C2=A0util/qemu-sockets.c | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 83f4bd6fd2..0c41ca9e42 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,<=
br>
=C2=A0 =C2=A0 =C2=A0if (saddr-&gt;path[0] || abstract) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D saddr-&gt;path;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *tmpdir =3D getenv(&quot;TMPDIR&quo=
t;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpdir =3D tmpdir ? tmpdir : &quot;/tmp&quot;;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D pathbuf =3D g_strdup_printf(&quot;%s/=
qemu-socket-XXXXXX&quot;, tmpdir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D pathbuf =3D g_strdup_printf(&quot;%s/=
qemu-socket-XXXXXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_=
get_tmp_dir());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0pathlen =3D strlen(path);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000658d2905e789269d--

