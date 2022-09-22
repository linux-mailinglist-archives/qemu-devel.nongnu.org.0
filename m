Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA35E6C82
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:59:39 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSME-0000Zl-Lc
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSIi-0005IY-1n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:56:00 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSIg-00038Q-9g
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:55:59 -0400
Received: by mail-lj1-x22e.google.com with SMTP id z20so12305570ljq.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xWeZyYGBbHrk1fhcVkDMamj4mNRyhGdrKIQiCdmHRhs=;
 b=lj8bo+7EQGhGIpAmlNrp4z7xe6YtJN4asQ27qpI9IPqDEsSZaRkCaUVaGBFSlssHNk
 Hx2qKGjSvbPT1rD/jodjaZRhbpCnAoo7T9PWO7bMEvzAm1Bj1yyyR+2DcpsZzrrLpZRH
 NEGkT3icMwYtWwLCB/gbdTY1VqQx43RusM6DDH9ChYIo2P0F3vZYiAFO819xesU854lI
 eE3B5E0hOgBiodDrzst0SwPh2CbM4yNw9N0lSz+vDMeOdL6XXgUBFCdZbI2Yph1RqQSA
 N/CTIWBUIclZ+mvxpGqAptXjlqWNeWyIisWBneTeAvkqUNFee/0Dpktd7E2XIhyNHl30
 2jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xWeZyYGBbHrk1fhcVkDMamj4mNRyhGdrKIQiCdmHRhs=;
 b=YqW+VC9sjJufl2D7xg18y26XqzFWr2ho29i/DzYdmXSobwR3F2+R70HFh/oiRwpzV+
 +EEZd2cDtj3ZCgJy3JP1C5f+pthl4UvLUThG9MKnTFHM+qJ0tzzgyP1A9+SuZgL5zGB3
 D6F2ZX5y77x1c0VewcBShAqDvUIB64WRCtbLhOw9Dkp/MohRHL47B+NO/KO9/MdR9H/a
 pis/gyQ07gly2kf25xfyOIatgKnNBJZ9rQKfWKvRZXmvs0k6J1w3Bzrdku8eB5ENj7bV
 5Z4Bhmiq6X5o6JBEbkpit24OzRgpWp5mDzGapQXWeRzRs0ygYGBL6+JVMPssRAfTXgvo
 mwwQ==
X-Gm-Message-State: ACrzQf04/b/u/Ntqi2xRedUOZX36pzJvUQuL9IKpuSpZ0SmEkQpEz5by
 YvdmbUj7kvWpwT2YATHlC1G1UpqgeCEe6D3h0cM=
X-Google-Smtp-Source: AMsMyM6OUQeh6KYeoeWfGOH2wW/O06pOO40ExX7dQP1shdZHfIMIAPoIio7Q/q8ERzI0AlEsRxljH3o0rJo/OPU6r94=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr1603262ljp.267.1663876556161; Thu, 22
 Sep 2022 12:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-19-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-19-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:55:44 +0200
Message-ID: <CAJ+F1CLCX1hbc9ps3nosh76r_MFmp2DrkTwb2Mqi7hEtsEHFAw@mail.gmail.com>
Subject: Re: [PATCH v2 18/39] tests/qtest: libqtest: Install signal handler
 via signal()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000148afe05e949731a"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22e.google.com
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

--000000000000148afe05e949731a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 2:32 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
> ---
>
> (no changes since v1)
>
>  tests/qtest/libqtest.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 8b804faade..f46a21fa45 100644
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
>

I would rather make the usage of signal() specific to WIN32, but it's up to
the maintainers to decide what's best.

Thomas, Laurent, opinions?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000148afe05e949731a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:32 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
At present the codes uses sigaction() to install signal handler with<br>
a flag SA_RESETHAND. Such usage can be covered by the signal() API<br>
that is a simplified interface to the general sigaction() facility.<br>
<br>
Update to use signal() to install the signal handler, as it is<br>
available on Windows which we are going to support.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0tests/qtest/libqtest.c | 14 +++-----------<br>
=C2=A01 file changed, 3 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 8b804faade..f46a21fa45 100644<br>
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
+=C2=A0 =C2=A0 signal(SIGABRT, sighandler_old);<br></blockquote><div><br></=
div><div>I would rather make the usage of signal() specific to WIN32, but i=
t&#39;s up to the maintainers to decide what&#39;s best.</div></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Thomas, Laurent, o=
pinions?<br></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000148afe05e949731a--

