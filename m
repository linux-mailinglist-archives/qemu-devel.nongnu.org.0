Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0EA5EC70A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:58:10 +0200 (CEST)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odC2D-0006Zs-Ez
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odARP-000149-7l
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:16:03 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:34568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odARN-0004OR-DA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:16:02 -0400
Received: by mail-lj1-x22a.google.com with SMTP id h3so10921231lja.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6P9z585XlPqUTaQjRAEFU/6zH8pMI4ZPYcXKwIGPI5w=;
 b=pKFWCR2iRw4OsHR4713o6/rNMsNbM3y0yxVW5Rn8VzvYUwB48ampgchRhMpJwIDfOS
 IZczZ+eJjvTY86Gp9DdmRTPmgNX+NKXcpARqyOhs8fDnz0sY3Pa1b9Y5Z1W7Wv+K/vSW
 FnKLFL6NvOUV+9CtEmtpdL/dkiO0xBR3/r+mWjZIGyEWD1iuYJyaEKXy14NPHUXUzz3s
 gLVYomoTZg4tZy74uuanDIxbzukYW+HQNj8FbELhG7qI0n3/NE2zxfstt8BsymYJTGSy
 rMv0WGsAMybnQRhtpjmm2OlxcMihgp8c2UbLpt7mpVoq/gciTacZvDWnF5fqy8a02w+V
 EqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6P9z585XlPqUTaQjRAEFU/6zH8pMI4ZPYcXKwIGPI5w=;
 b=Yw0PAhy97uF36uA+cZhO2fCSm7gPKzCW5ZbhekrNirR/t3CSEFupt8KZ6zmXxL5hvb
 3WpeVk1hOmnBks1PM2677VtQ8nqkeDOkWAALId761Fzd5rfIY/q1qxApcGB0K44hsNaW
 mdy6sK/6k8a+vs3/mJJ2ti97OL//Lnv5+1pG1T1tlkdKlHebgzLhs5bmRssDx3idSJvF
 ZnPhenH1e3HXg+XIKH9oI4profXO+SUF2tBiPI0YqTK4lL+mkmMNVkzA4UnCm6iuTGig
 UuaNhFo4UQ/E5EEUZRAD3Jsoup2XQxwvVmqSaYa53ht77d7J0c6JeTw623W6Mzc7Zvj/
 vCMA==
X-Gm-Message-State: ACrzQf23cF5WkLThzqty2HsrmJ5jjbGIzk2dAXCqLVYFUhRX8WvuWlQj
 9owSaaWlunI/Z+WA7oVcmFLVPEQFVlgGaqlNfT4=
X-Google-Smtp-Source: AMsMyM6u6hiLRXW1kYSIzct0+OHLWVbxLT1N3Ui+fhQCSZi2tVuZK6jax82q3rmpzP7lK4DU9GmazBQPx6fhkTCO1No=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr9373998ljn.94.1664284557884; Tue, 27
 Sep 2022 06:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-44-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-44-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 17:15:46 +0400
Message-ID: <CAJ+F1C+BsM16peLANydiBtRamWada6S8Hg5hLYD=Z274AbN_3A@mail.gmail.com>
Subject: Re: [PATCH v4 43/54] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e0c3e605e9a87199"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
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

--000000000000e0c3e605e9a87199
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 27, 2022 at 5:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Make sure QEMU process "to" exited before launching another target
> for migration in the test_multifd_tcp_cancel case.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Add a usleep(1) in the busy wait loop
>
> Changes in v2:
> - Change to a busy wait after migration is canceled
>
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 45c5f5761b..6f9fe13488 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
>      wait_for_migration_pass(from);
>
>      migrate_cancel(from);
> +    /* Make sure QEMU process "to" exited */
> +    while (qtest_probe_child(to)) {
> +        usleep(1);
>

Why not add a qtest_wait_qemu() ? (I think qtest_probe_child() should also
be renamed)


> +    }
>
>      args =3D (MigrateStart){
>          .only_target =3D true,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e0c3e605e9a87199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022 at 5:02 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
Make sure QEMU process &quot;to&quot; exited before launching another targe=
t<br>
for migration in the test_multifd_tcp_cancel case.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
(no changes since v3)<br>
<br>
Changes in v3:<br>
- Add a usleep(1) in the busy wait loop<br>
<br>
Changes in v2:<br>
- Change to a busy wait after migration is canceled<br>
<br>
=C2=A0tests/qtest/migration-test.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index 45c5f5761b..6f9fe13488 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)<br>
=C2=A0 =C2=A0 =C2=A0wait_for_migration_pass(from);<br>
<br>
=C2=A0 =C2=A0 =C2=A0migrate_cancel(from);<br>
+=C2=A0 =C2=A0 /* Make sure QEMU process &quot;to&quot; exited */<br>
+=C2=A0 =C2=A0 while (qtest_probe_child(to)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep(1);<br></blockquote><div><br></div><div=
>Why not add a qtest_wait_qemu() ? (I think qtest_probe_child() should also=
 be renamed)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0args =3D (MigrateStart){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.only_target =3D true,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e0c3e605e9a87199--

