Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB35EA7B0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:55:01 +0200 (CEST)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoZR-0006Ni-N3
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco5A-0002hn-If
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:23:38 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco58-0003BS-On
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:23:36 -0400
Received: by mail-lj1-x229.google.com with SMTP id g20so7415787ljg.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Z76lv+xz4Db/pVy/EH6ezpbLvC/2FhJxFOVBXR5mDPU=;
 b=hlGPZdDuHd/0fPc2/d5YIs5sOzHB4Bt0NPIxFyJqDo9aNkiHWh+V7Cqh4F/VfiBjR6
 CWQrZn2eM+A+3mG4KO7TiwWaZ5dAryncPG4Qrl23jbXlXIfpEumZQjvwhjB+phRCJ5Ui
 YVyg6/Up6bo2F2yKys53Y5oQ0IkrUGjcgkdU2FcPGxntd2ooEIfQnlH9U3FrmgAB4NSy
 SJZYlDqYlJow2NNQ3HBJBCkxrBcPWsjjEwIiEWk5g9Gf192wWL7fvV2zbyWjklZgZPCo
 xtUh6LUrZsKSGMyL915RaOThegGKKkQRUnOb+DKZZu4Ztd16hxW6vmTZizvhFNEu32f3
 yomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Z76lv+xz4Db/pVy/EH6ezpbLvC/2FhJxFOVBXR5mDPU=;
 b=CYiSc7wL96rLPSJ+iMtSIUwj+6lUAp1xei8gyOZ+1bAi/KF5LpPPQbPAQmXW8NtRLu
 xBtNgmxXk7gvtVzrjrdpq61I2hiuWumjJL3qFI6u7wy30DFA67PUDDOIBGdSgZC2H7Me
 kyVgekMezV4LWzAk+1Y0jw73HmH1DGbWDaf0S3LnkaZOouNIjRUxTMId6lZBI3cqRc+o
 a8qL12OMPtktZSFmhqUDLWqXaP7McE5WfIRgaZs4aNwTLuSCUDeUqmgXu1c+WlLh2K1X
 3b+z0QtmlKyZpWtYLWOnI5qe4ms78zo3QPtu3l5x6Hs1WCmtVQlmSaitqgxWHJ4fvnye
 UC/w==
X-Gm-Message-State: ACrzQf3JiFMQg2V0qbuINVXLObDkXzSlvU7t1jHUjI2bbKepk5P7tCvH
 lw4MLuCXXl67v6ga6JBIwocLbFH07xj8gOf9jbml1gL//JwBj60e
X-Google-Smtp-Source: AMsMyM7I9UObOci9Q23bmEFje5nuolj1VnwUyp3ORjc4CMmvwZlvoS/g3SY2yTWP83D6QvAShMhVCtusCsiRkm9cjfg=
X-Received: by 2002:a05:651c:1692:b0:26c:37bb:de2 with SMTP id
 bd18-20020a05651c169200b0026c37bb0de2mr7200145ljb.463.1664198611260; Mon, 26
 Sep 2022 06:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-24-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-24-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:23:19 +0400
Message-ID: <CAJ+F1CLccipq1qOSt9V1Kgs0=5G3idi333PQkN+PutdU_LGnCg@mail.gmail.com>
Subject: Re: [PATCH v3 23/54] tests/unit: test-qga: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000000f5c3f05e9946f04"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

--0000000000000f5c3f05e9946f04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_get_tmp_dir() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/unit/test-qga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index b6ea7c7304..b4e0a14573 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -60,7 +60,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data,
> gchar **envp)
>
>      fixture->loop =3D g_main_loop_new(NULL, FALSE);
>
> -    fixture->test_dir =3D g_strdup("/tmp/qgatest.XXXXXX");
> +    fixture->test_dir =3D g_strdup_printf("%s/qgatest.XXXXXX",
> g_get_tmp_dir());
>      g_assert_nonnull(g_mkdtemp(fixture->test_dir));
>
>      path =3D g_build_filename(fixture->test_dir, "sock", NULL);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000f5c3f05e9946f04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:57 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_get_tmp_dir() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
</blockquote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &=
lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.c=
om</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/unit/test-qga.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index b6ea7c7304..b4e0a14573 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -60,7 +60,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, g=
char **envp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;loop =3D g_main_loop_new(NULL, FALSE);<br>
<br>
-=C2=A0 =C2=A0 fixture-&gt;test_dir =3D g_strdup(&quot;/tmp/qgatest.XXXXXX&=
quot;);<br>
+=C2=A0 =C2=A0 fixture-&gt;test_dir =3D g_strdup_printf(&quot;%s/qgatest.XX=
XXXX&quot;, g_get_tmp_dir());<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(g_mkdtemp(fixture-&gt;test_dir));<br>
<br>
=C2=A0 =C2=A0 =C2=A0path =3D g_build_filename(fixture-&gt;test_dir, &quot;s=
ock&quot;, NULL);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000f5c3f05e9946f04--

