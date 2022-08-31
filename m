Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8A5A7FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:18:47 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOYI-0003wB-FS
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOWC-0002Uv-Of
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:16:37 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOWA-000779-Qu
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:16:36 -0400
Received: by mail-lf1-x133.google.com with SMTP id p7so9022684lfu.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=u+9Pwwg8mp17kmBim6JAOh5zhE/Pz15swkNL7ySaIP8=;
 b=gCnorTRnpewmbbj/PiKUjgN7ep+ckzUaIM4apFrmtiBE5I5T2iE1DNwn4xsIXDfIIi
 TAFCiuwOsnm8JMgnZCIB0ijlaew98Xveb7827GhDyHBxHC3Uij/pZtk60Qp1oSqaBM3/
 LbOXnT7PmujuPFqGHMk4kZQuHEgX7MEKSatr7n9I/58os+eRenIPqQrs1ZsQd97Ocs47
 HbUvofQvr5Y9DGCvXaWCEwSJ2j/tHFlln9PU5e2VxHtYM3QVAWQR/Lt7T2KvQ/wwAi+s
 v2E5X5ASi3trxug0EOCErY5RMdCs7YQcXG08h5Qw9u1MZ1Ys/GqQ/V+aVbnT6GluYb3Y
 j2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=u+9Pwwg8mp17kmBim6JAOh5zhE/Pz15swkNL7ySaIP8=;
 b=usfqhmWguVDonhFO2sdvbOe2YkgZfEOqmiRK0I1JTccya/YMV/jC3OzfDhXl+cxpma
 egloZcP6a2H/SvFYgR7QoJ4TAUrCvBdWCAmUjbQ+gV0utKm6h8UdXji1AAsP939bKu6g
 086cWOHQY6Nq3kxKT5ScCqK54MH+AyeP1XeKS5Tjnt6A0HgwaU3tg79PtJ87OsbWW6iI
 wG96vYAIgraoJtzejaydwDz2Azg23qiE6paKHVhLJ6JxEAUXq+ftMyjowTMAc6rgzfpP
 eugxU06MEJSPBt4lbTxibSbb583v1dhZxePgj+TQWo49ZUS6PtX3mrhWvZ5oUgdniORP
 nJPg==
X-Gm-Message-State: ACgBeo307/57eJBgMpLkVJCzZS5CexQsvhKHOPHzOlzIMMlrW4GRFgfg
 Y+9kDAClgC19Mhy+VRdNXJYMneY+OWLlP1SOewU=
X-Google-Smtp-Source: AA6agR6e63HPRhSfj06pRrmU2X0a19CfK9mSA66ovaJ89Wgk9bnjphNsHbmQ5Qv6Lyy9NG3M5Pt/greqFoEbDTDedtI=
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id
 i16-20020ac25b50000000b004945ec21ea5mr6790480lfp.276.1661955392453; Wed, 31
 Aug 2022 07:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-30-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-30-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 18:16:21 +0400
Message-ID: <CAJ+F1C+q2OO2sN2GUFxMVJcdW9PF0wJxCkBTCSX0vCMHT=8Agw@mail.gmail.com>
Subject: Re: [PATCH 29/51] tests/qtest: libqtest: Install signal handler via
 signal()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ccc2bc05e78a2499"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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

--000000000000ccc2bc05e78a2499
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present the codes uses sigaction() to install signal handler with
> a flag SA_RESETHAND. Such usage can be covered by the signal() API
> that is a simplified interface to the general sigaction() facility.
>
> Update to use signal() to install the signal handler, as it is
> avaiable on Windows which we are going to support.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/libqtest.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 1b24a4f1f7..70d7578740 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -68,7 +68,7 @@ struct QTestState
>  QTestState *global_qtest;
>
>  static GHookList abrt_hooks;
> -static struct sigaction sigact_old;
> +static sighandler_t sighandler_old;
>
>  static int qtest_query_target_endianness(QTestState *s);
>
> @@ -181,20 +181,12 @@ static void sigabrt_handler(int signo)
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
>


We should keep the sigaction() version for !WIN32, it has notoriously less
issues, more modern etc. signal() only on win32.

Although in this particular usage, I don't think that makes much
difference...

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ccc2bc05e78a2499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:47 PM Bin=
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
avaiable on Windows which we are going to support.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/libqtest.c | 14 +++-----------<br>
=C2=A01 file changed, 3 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 1b24a4f1f7..70d7578740 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -68,7 +68,7 @@ struct QTestState<br>
=C2=A0QTestState *global_qtest;<br>
<br>
=C2=A0static GHookList abrt_hooks;<br>
-static struct sigaction sigact_old;<br>
+static sighandler_t sighandler_old;<br>
<br>
=C2=A0static int qtest_query_target_endianness(QTestState *s);<br>
<br>
@@ -181,20 +181,12 @@ static void sigabrt_handler(int signo)<br>
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
--<br></blockquote><div><br></div><div><br></div><div>We should keep the si=
gaction() version for !WIN32, it has notoriously less issues, more modern e=
tc. signal() only on win32.<br></div><div><br></div><div>Although in this p=
articular usage, I don&#39;t think that makes much difference...</div><div>=
<br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000ccc2bc05e78a2499--

