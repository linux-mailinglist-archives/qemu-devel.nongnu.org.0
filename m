Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B745EA781
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:41:57 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoMu-00058a-JI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco65-0004XP-W5
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:24:35 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco62-0003F7-GZ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:24:33 -0400
Received: by mail-lf1-x12d.google.com with SMTP id a2so10827421lfb.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=z5Lv1wur/YBc2qDE7NvzXRSK74c65v38nM3L4XC2PL8=;
 b=ATbof5+giCj//mzIdZdSMuFWueyBl4gMH3rNITGBsiGV1k2J5418v/KqANxYuf0oli
 G9+UA5Mg5qBo4VxGZT4jymAdkgQtZZBeu52l1fqtDFC/3mgkNIYFn4BZKpvtTkqnUG5c
 0oFhIXrNDXemo8H3xjYdvKFOYKyabBqeDYwrI/vFdI93ZyG0BkcUFCXf4Y6b5gwvBog8
 DRCgCRo3E+07mLkMowN2640MXIUD7er4puiBizg9fOy7OWH09s9FTuN4c/DpumEB98+R
 F9G7Z7Dsvo4Tlbvi+HvQ8+k0uPgSS03Q8s0BOWVotfi8Gntf6AyEzyxOH5Kj/q8/5+FU
 s5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=z5Lv1wur/YBc2qDE7NvzXRSK74c65v38nM3L4XC2PL8=;
 b=7RJpg7bBIwIx9FT4d1t+TMkUnza31RJlvajei0GE9xRweCr2hB/B9ERH1hu00Ccrft
 pcLbNaavyZ+gMpiKs1IAS2pYVKk3lNXYGA4WPKdB8PQ0i5+A/i4u2gvaVz0fnR11i/JN
 88BjsXv0rPEG3hW7/Cb5Vl1GnC92aN0o171Xutw4lcJjvz8os+zxCBRYlKhK+/qAsfmo
 Jwx4BkQuRPQ+nre+NeOteUFX8IyZZQ3P2CCk2yDTzQBsXiujkAIsKMIGxOqRsAGw+oft
 MTthar8mJfL9Jpgyx7LgusckbIrU+c0oHPKousvA6vCeTAvZQP9sslWvbGc9+78zr4wI
 Ph8w==
X-Gm-Message-State: ACrzQf1U9Yzp5IhEh5kCs6HY2EvF8FksZTALj5Hg9D2xgPdBVhbYUqc8
 2EeJdt4Ff6/1b1QSSaB+XdQ0mdOo5TrZjRC7p7BOKaHmGRP+dHOk
X-Google-Smtp-Source: AMsMyM718jPCcvgeJ8vx8LahBQsGK/f/0TSYNyu+hJJrlN/UcdLcwPuqzgjIty+pqN0mNrG/WNxvrLZtXG2qyDOzUYM=
X-Received: by 2002:ac2:5e66:0:b0:49e:bce2:3df5 with SMTP id
 a6-20020ac25e66000000b0049ebce23df5mr8542152lfr.362.1664198668827; Mon, 26
 Sep 2022 06:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-36-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-36-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:24:17 +0400
Message-ID: <CAJ+F1CK6Wb9JqTRB3ZYMmk2m=56XmBcb+oOqzLapqcOViTJFBw@mail.gmail.com>
Subject: Re: [PATCH v3 35/54] tests/qtest: libqtest: Install signal handler
 via signal()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007dc0ef05e9947252"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--0000000000007dc0ef05e9947252
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 4:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present the codes uses sigaction() to install signal handler with
> a flag SA_RESETHAND. Such usage can be covered by the signal() API
> that is a simplified interface to the general sigaction() facility.
>
> Update to use signal() to install the signal handler, as it is
> available on Windows which we are going to support.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> (no changes since v1)
>
>  tests/qtest/libqtest.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 269d622fe3..f0ac467903 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -66,7 +66,7 @@ struct QTestState
>  };
>
>  static GHookList abrt_hooks;
> -static struct sigaction sigact_old;
> +static sighandler_t sighandler_old;
>
>  static int qtest_query_target_endianness(QTestState *s);
>
> @@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
>
>  static void setup_sigabrt_handler(void)
>  {
> -    struct sigaction sigact;
> -
> -    /* Catch SIGABRT to clean up on g_assert() failure */
> -    sigact =3D (struct sigaction){
> -        .sa_handler =3D sigabrt_handler,
> -        .sa_flags =3D SA_RESETHAND,
> -    };
> -    sigemptyset(&sigact.sa_mask);
> -    sigaction(SIGABRT, &sigact, &sigact_old);
> +    sighandler_old =3D signal(SIGABRT, sigabrt_handler);
>  }
>
>  static void cleanup_sigabrt_handler(void)
>  {
> -    sigaction(SIGABRT, &sigact_old, NULL);
> +    signal(SIGABRT, sighandler_old);
>  }
>
>  static bool hook_list_is_empty(GHookList *hook_list)
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007dc0ef05e9947252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:03 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
At present the codes uses sigaction() to install signal handler with<br>
a flag SA_RESETHAND. Such usage can be covered by the signal() API<br>
that is a simplified interface to the general sigaction() facility.<br>
<br>
Update to use signal() to install the signal handler, as it is<br>
available on Windows which we are going to support.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0tests/qtest/libqtest.c | 14 +++-----------<br>
=C2=A01 file changed, 3 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 269d622fe3..f0ac467903 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -66,7 +66,7 @@ struct QTestState<br>
=C2=A0};<br>
<br>
=C2=A0static GHookList abrt_hooks;<br>
-static struct sigaction sigact_old;<br>
+static sighandler_t sighandler_old;<br>
<br>
=C2=A0static int qtest_query_target_endianness(QTestState *s);<br>
<br>
@@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)<br>
<br>
=C2=A0static void setup_sigabrt_handler(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 struct sigaction sigact;<br>
-<br>
-=C2=A0 =C2=A0 /* Catch SIGABRT to clean up on g_assert() failure */<br>
-=C2=A0 =C2=A0 sigact =3D (struct sigaction){<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .sa_handler =3D sigabrt_handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .sa_flags =3D SA_RESETHAND,<br>
-=C2=A0 =C2=A0 };<br>
-=C2=A0 =C2=A0 sigemptyset(&amp;sigact.sa_mask);<br>
-=C2=A0 =C2=A0 sigaction(SIGABRT, &amp;sigact, &amp;sigact_old);<br>
+=C2=A0 =C2=A0 sighandler_old =3D signal(SIGABRT, sigabrt_handler);<br>
=C2=A0}<br>
<br>
=C2=A0static void cleanup_sigabrt_handler(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 sigaction(SIGABRT, &amp;sigact_old, NULL);<br>
+=C2=A0 =C2=A0 signal(SIGABRT, sighandler_old);<br>
=C2=A0}<br>
<br>
=C2=A0static bool hook_list_is_empty(GHookList *hook_list)<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007dc0ef05e9947252--

