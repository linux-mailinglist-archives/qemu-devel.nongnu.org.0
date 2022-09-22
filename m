Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59ED5E6BED
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:43:21 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obS6S-000223-PN
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obS2P-0005Si-6v; Thu, 22 Sep 2022 15:39:11 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obS2J-0004Mi-4X; Thu, 22 Sep 2022 15:39:04 -0400
Received: by mail-lj1-x22d.google.com with SMTP id c7so12199922ljm.12;
 Thu, 22 Sep 2022 12:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qOf0DmlC18b0/UTyI2J7fjeyg6ra5SB1/TQ9Ft5bD7w=;
 b=E4KmuHaeFQsWSqIZdBJJvvDKeRalgS5VopVRIhK9VSBozPvxu0KgiM2v3InDRyAub4
 QWmzCj6yAlZvIRFP2lPCUqzDuN+zCQzhiKWFBZj5ljEirI2U01cPaHo7dDLjB1XQZquF
 pKfNouOWiT9dLnVfM9Gh3uxe5IP1OfaK3Zt0VcsskhSykTZgS2x+ody4sw0vTqcm4/bv
 UdzIUO5/KyQnJmbuKctWHFsAFE5NjdJJoVJkyy7J0LkJdQQ/rHpHjbGZZEFDfdGuuM0y
 vqCeGZbohpWrQDk/8g0NotB4NN2ADKUwhJfZmxiDIMcQjZCU26z2P1scCLHW1qYH/Dpo
 aUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qOf0DmlC18b0/UTyI2J7fjeyg6ra5SB1/TQ9Ft5bD7w=;
 b=NR4CbCS1uRKxKYUysTTaQpvLwMI0pSEeUSY0EgKmCVC77oVZuc/rLTpA6DiMmVYz6r
 IxToK2LEoiRWEHeb8IklxIniwRWT4jl3Y7SICpCnh95OA/4TciqcjC/QAbSpza6+cJrS
 +czxagiEbfIWFkxa59lowR3/UKcRBj8dU5VgJwgFjsxVwxL62ARck0vBAdJ2LxRagF/o
 JmE+7mcO00l5jBXwZdc5OP9+SBrguwjVwmZbdVBKHeGtppAdbA5AD9Vbe9heFyzQf1NW
 we7rKkDyzycDOf/JF8LQzC2eHVbbEo4ZN6nPeA01FcjVjinFiEnkhKmt7vjfXr2/2eDS
 Y44g==
X-Gm-Message-State: ACrzQf3X4tnVmjfAbT/1teX/9WfzeSUg7QLy0R+dEJICecL6FL4SLRy+
 VzKWePMmjmGKWu9Oa1dZcNy4A5tVqSRCiK0b9NM=
X-Google-Smtp-Source: AMsMyM4zAKfhhhA7CdG7cxPq/RoI/2RZyAmvEQ6JAyn53NlCysofeWYLpREAWM5ReLckUlPD2v0WtW7YtWBiY7WffAY=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr1648483ljn.94.1663875541107; Thu, 22
 Sep 2022 12:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-4-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-4-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:38:49 +0200
Message-ID: <CAJ+F1CJqeQUrK+ky6XE_XSMmof-hLC0RgBD+nR1Q+X+RX9UrZw@mail.gmail.com>
Subject: Re: [PATCH v2 03/39] block: Unify the get_tmp_filename()
 implementation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000094081e05e94936eb"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094081e05e94936eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 2:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present get_tmp_filename() has platform specific implementations
> to get the directory to use for temporary files. Switch over to use
> g_get_tmp_dir() which works on all supported platforms.
>
>
As discussed in v1, there are other things to do while touching this code.
And since it is optional for the series goal, please send this as a
different patch/series.



> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  block.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..d06df47f72 100644
> --- a/block.c
> +++ b/block.c
> @@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs,
> HDGeometry *geo)
>   */
>  int get_tmp_filename(char *filename, int size)
>  {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >=3D MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
>      int fd;
>      const char *tmpdir;
> -    tmpdir =3D getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir =3D "/var/tmp";
> -    }
> +    tmpdir =3D g_get_tmp_dir();
> +
>      if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >=3D size) {
>          return -EOVERFLOW;
>      }
> @@ -891,7 +880,6 @@ int get_tmp_filename(char *filename, int size)
>          return -errno;
>      }
>      return 0;
> -#endif
>  }
>
>  /*
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000094081e05e94936eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:17 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" tar=
get=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
<br>
At present get_tmp_filename() has platform specific implementations<br>
to get the directory to use for temporary files. Switch over to use<br>
g_get_tmp_dir() which works on all supported platforms.<br>
<br></blockquote><div><br></div><div>As discussed in v1, there are other th=
ings to do while touching this code. And since it is optional for the serie=
s goal, please send this as a different patch/series.</div><div><br></div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0block.c | 16 ++--------------<br>
=C2=A01 file changed, 2 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/block.c b/block.c<br>
index bc85f46eed..d06df47f72 100644<br>
--- a/block.c<br>
+++ b/block.c<br>
@@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeome=
try *geo)<br>
=C2=A0 */<br>
=C2=A0int get_tmp_filename(char *filename, int size)<br>
=C2=A0{<br>
-#ifdef _WIN32<br>
-=C2=A0 =C2=A0 char temp_dir[MAX_PATH];<br>
-=C2=A0 =C2=A0 /* GetTempFileName requires that its output buffer (4th para=
m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0have length MAX_PATH or greater.=C2=A0 */<br>
-=C2=A0 =C2=A0 assert(size &gt;=3D MAX_PATH);<br>
-=C2=A0 =C2=A0 return (GetTempPath(MAX_PATH, temp_dir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; GetTempFileName(temp_=
dir, &quot;qem&quot;, 0, filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? 0 : -GetLastError());<br>
-#else<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0const char *tmpdir;<br>
-=C2=A0 =C2=A0 tmpdir =3D getenv(&quot;TMPDIR&quot;);<br>
-=C2=A0 =C2=A0 if (!tmpdir) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpdir =3D &quot;/var/tmp&quot;;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 tmpdir =3D g_get_tmp_dir();<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (snprintf(filename, size, &quot;%s/vl.XXXXXX&quot;, =
tmpdir) &gt;=3D size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOVERFLOW;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -891,7 +880,6 @@ int get_tmp_filename(char *filename, int size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000094081e05e94936eb--

