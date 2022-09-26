Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D103A5EA76D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:37:35 +0200 (CEST)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoIg-0007za-TZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco3H-0001FU-VV; Mon, 26 Sep 2022 09:21:40 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco3F-000327-HD; Mon, 26 Sep 2022 09:21:39 -0400
Received: by mail-lf1-x129.google.com with SMTP id z25so10847087lfr.2;
 Mon, 26 Sep 2022 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ztf8VrvlPomTQ32PdEkrvCuyhvb6kWAYiqIxcCT3TR0=;
 b=nhRve77UqfYBAhq6ewOB32VOm8RPqkEsqFocw0zEozVxgkToblWatOzJ2a5QQJYnWm
 2cy87z3rhrjvf1NKoB8PziYhRxY+ENhVHgCyaIPXiyNNFrjIu8SioMBm1MUaejBQBkGT
 t8i5XOlHXDIRiTiTLie2d7Ql9ypVCCratjI+Y24Br9t7anEzMWb5+mmrjPESlKiK+AHn
 gm73Y0O6yDP3p9FtNn2H5Pqf08EH0V7f0bHKuPm/2V1P7udKYhiGQ6uMFr5I3oVNHnnI
 QmdJs/3AzPHSr4bfdN8hb/NTQQoyHK+IN0hcT7nGCvXSpatRfYK6HdXgR6y4Vl2kWkJ3
 2DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ztf8VrvlPomTQ32PdEkrvCuyhvb6kWAYiqIxcCT3TR0=;
 b=Q+7GawLB43lno+gWbe5mgYR6sPwEBtQ49GAsmf2M7zhznihnOZ0nJwALt9kIcClS2c
 /VYjYJABo9SWRg5CTVxF380vRCfNVcPOMNSLRsr1LYEPWrfN+Ee98KOVhuW0eLveWLSx
 DHUy3p2e5fRsTPQ8CHOafvIuQkSxEtu8hSXQtsWeMI072uSBNbNYL+vlku6zgic8INtK
 ELyVAIR9b+OPCHeBSckksGtyynai9VqzFNvfynM+N8LehU5BtOWS7UrpHwHjcW+prajA
 kXk62GQrWnfnwCg7cuP8FzHVXtzGJFwGsrjRgjoU4nfd68b+/8NI2bgwne9OXIRDgasG
 zBXQ==
X-Gm-Message-State: ACrzQf2O1xFEPkXioJlOenGdb2NMU3ao/JRNnHxv9H3F+AeklaJj2Y5a
 VDsJfY4eJ8gqGVv2iihorr10RDXzp/Sp7IksycY=
X-Google-Smtp-Source: AMsMyM6bMOLmSUzrcGTY9ii82ZlczUUyhX99/9wiqFKbfzZ/raDpjyn6KrWHvTZHxw8AMK8fuUo+2wgEaVYYq3A6ZJI=
X-Received: by 2002:a05:6512:201b:b0:497:a29d:25c1 with SMTP id
 a27-20020a056512201b00b00497a29d25c1mr9412514lfb.276.1664198493609; Mon, 26
 Sep 2022 06:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-20-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-20-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:21:21 +0400
Message-ID: <CAJ+F1CLqSwMMdqQYT-C-6zPHadb9Vb41XyqstAuuaj8dsShJGA@mail.gmail.com>
Subject: Re: [PATCH v3 19/54] tests/qtest: virtio-blk-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000c25e205e994682a"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

--0000000000000c25e205e994682a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 4:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
>  tests/qtest/virtio-blk-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.=
c
> index dc5eed31c8..19c01f808b 100644
> --- a/tests/qtest/virtio-blk-test.c
> +++ b/tests/qtest/virtio-blk-test.c
> @@ -49,10 +49,10 @@ static void drive_destroy(void *path)
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

--0000000000000c25e205e994682a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:09 PM Bin M=
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
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/virtio-blk-test.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c<=
br>
index dc5eed31c8..19c01f808b 100644<br>
--- a/tests/qtest/virtio-blk-test.c<br>
+++ b/tests/qtest/virtio-blk-test.c<br>
@@ -49,10 +49,10 @@ static void drive_destroy(void *path)<br>
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

--0000000000000c25e205e994682a--

