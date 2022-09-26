Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9B5EA70B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:24:17 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oco5o-0003y1-Qm
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocntH-0005sa-5K
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:11:20 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocntE-0001Zl-SG
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:11:18 -0400
Received: by mail-lf1-x130.google.com with SMTP id d42so10853527lfv.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7CCkw4XJi7yhyxa1PH7k/tSTGK+BxzfpIWsBzFrzIEM=;
 b=Ao8Ws4p++23z8m6VJAH48MR9f9+sexw2d9pHaKxM0+tFhGKsEQQ/z5c7r4tmHVHCZS
 UJ03xwUyOt64zfxgssxy5Erq5QKPSK6BkOe313chK+24zVJzgOV1dWvXwu5VMudpq4Pn
 7jMqrZRjRBUbG22jW6Xbc1kcorHv2HHVbyxo/uaZmn4e2jkEWg57EiesBvua6oseeb7+
 wr5RIAemNq72IUZkoLoLIwJKpnyjDQ41NZgwp/l+OT36T9lfAoF1HXF97Nlxwt5iBCN5
 t9NFBcloFo4MN3eT7JGhOjCiXSirj6QcF2bC2l3mb978Dl7viZNXNpL+cXHmDfjNl9ro
 vLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7CCkw4XJi7yhyxa1PH7k/tSTGK+BxzfpIWsBzFrzIEM=;
 b=IPddmJFMVwEFKpng7yGBHkZJbPFwoVIEdK1sFF1Z2gFOy7r3uVAwSFZ3eBEfDxmUQd
 DkPaDlEUaiVFNYAODPTexR97PzaxMvn3yc56qCtiUhZeVSJdKHNIkCn51y56M2Gff9KI
 YrBPkRQg0T5U9VMplVLNb4DdYoF5fZqvBTmlzyvoy59tvIGaIqdYJQvsntpUwmXOl6Ia
 9bFPchncopO+Kd/3q7JqxP62QfrMGeTNNKClXP4v4F1j+m+zg63vclMtAlVdJb/g0ZSh
 ejkpy0WiEru6iBpeGi6GtZdrkO1up5Tq+WrQZHjZWJd+rJmr2H/ux8wSSNUAekq3+0nV
 X0gw==
X-Gm-Message-State: ACrzQf00EIO7LRYtykW3m+ZNuGHRYw683U1ggXb191JzBau9H3J+RxvX
 c39UvjelBuPRLJKDAnEWQ1jV5+f9s72x98WaBWKb5K9xlFakga3H
X-Google-Smtp-Source: AMsMyM6aCYfyOCFhtjcuWHy3FNiHIhHR1mBNLuCBPnY5iRo/Z5OEqpt5KJDHwxWf5FDN0lbg6OMEst6+wdk/DUo5D3k=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr9715467lfb.167.1664197875304; Mon, 26
 Sep 2022 06:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-12-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-12-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:11:03 +0400
Message-ID: <CAJ+F1C+eVKapdCP4fMAUkEDPJjHpy9zEKvSY+JXAgcBX=_HZcw@mail.gmail.com>
Subject: Re: [PATCH v3 11/54] tests/qtest: virtio_blk_fuzz: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000318d5c05e994431c"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--000000000000318d5c05e994431c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/fuzz/virtio_blk_fuzz.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c
> b/tests/qtest/fuzz/virtio_blk_fuzz.c
> index 236d078cc8..a9fb9ecf6c 100644
> --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
> @@ -181,10 +181,10 @@ static void drive_destroy(void *path)
>  static char *drive_create(void)
>  {
>      int fd, ret;
> -    char *t_path =3D g_strdup("/tmp/qtest.XXXXXX");
> +    char *t_path;
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(t_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
>      g_assert_cmpint(fd, >=3D, 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert_cmpint(ret, =3D=3D, 0);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000318d5c05e994431c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:41 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_file_open_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/fuzz/virtio_blk_fuzz.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_b=
lk_fuzz.c<br>
index 236d078cc8..a9fb9ecf6c 100644<br>
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c<br>
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c<br>
@@ -181,10 +181,10 @@ static void drive_destroy(void *path)<br>
=C2=A0static char *drive_create(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
-=C2=A0 =C2=A0 char *t_path =3D g_strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br=
>
+=C2=A0 =C2=A0 char *t_path;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(t_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;t_path=
, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(fd, &gt;=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 0);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000318d5c05e994431c--

