Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FF49001F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 03:11:31 +0100 (CET)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9HUY-0006Um-Iy
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 21:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9HT6-0005iy-4N
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:10:00 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=38491
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9HT4-0007Bf-0z
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:09:59 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id h16so9504354vkp.5
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 18:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QbbsLQpKoTcHGIF/VuVFcWBeHayvmqqfDAKfzqkMqt0=;
 b=G3AZvKZ44CDppOwqd9RXzSns8XJ0bDoUSS0FHqyAXvoRe5chZmfjk8LpGakx98sZtC
 FTDbi3lmGQwtjHX9fEdAKOYdCIdy0zyTCT6M0VXUT8k4j8qsMGccg1rDLTY2rkZF1Jvb
 uiiNHtSWt5kfcr8kjaf3g1fgfej8feTU0d+J8b0MduMJeEDPUtrmzodYxuZUO6GL+A9m
 ZDp8BAjr4iMFpLptDeNAElk0wJw3YKbgz8mzPxT7nuZYqA+zFnxDEuhCC9X5asOZHB/n
 6JAE0UzjVD4UUHVQKHjZFdHr2o1dvPpwVY7OqKZ6tchaTd7Ru3ZpLR9rR9rfolylfsK+
 4sGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QbbsLQpKoTcHGIF/VuVFcWBeHayvmqqfDAKfzqkMqt0=;
 b=WifEwHn++CxSj3GJNyCriKW6OjwhrhcsRHLSOTvWs9bIs0l/rPKIRzbAPhYMATKIib
 CVtkzT1fyr/vS7mMVwE7HmhQpsNrrA+cBofXyQXOM0Sqm8Ru37IauGnQbk8roMoQIw5c
 vQKX+rr/kmxs4rW7o/nXCbPnlbIOLNaEBMz3PLTdNON993Jw9wSMDtDVpIU+DMa2zh0E
 86le1OOEQAWgnyzYsN+J78uqXi4fOi7WGOlLNjGvCjrlG4y1XhFlHk9sUZBA87gY5mGz
 RV1ZqPb8XL+RkWI5FCS02gpUO+9KbZnX4nd1XEqlaHVsLR5LDkAzNQ3rppwtnpblZbHD
 WPag==
X-Gm-Message-State: AOAM533tAWOtyci+u6hKFTG+8dH5dL3WTMACJlgfPzT3g09eDOc/DAYP
 utZCeasYGT9QqK1JGNwtRwMx8vTXefwgByNZ4SfwiFWCgM4=
X-Google-Smtp-Source: ABdhPJyYACOgJZDggZl+ojSzPgVVSMckHyZwr+L+o+wyjxrEoi7iWCl7MAD3pjNaX7aDd4S963p7Jk+bi2LE7DckOEM=
X-Received: by 2002:a1f:2844:: with SMTP id o65mr7408086vko.2.1642385394133;
 Sun, 16 Jan 2022 18:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-28-imp@bsdimp.com>
 <CAFEAcA-qmK3BNJccDDYznPkG4559f5Kwqz7h7HNom3fuPP1TgA@mail.gmail.com>
In-Reply-To: <CAFEAcA-qmK3BNJccDDYznPkG4559f5Kwqz7h7HNom3fuPP1TgA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 19:09:43 -0700
Message-ID: <CANCZdfqnpqC_2xeHkTN2UWHv9M=LNw9mWdnMWaNqnZNUkv47Yg@mail.gmail.com>
Subject: Re: [PATCH 27/30] bsd-user/signal.c: process_pending_signals
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000080e805d5bda69d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000080e805d5bda69d
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 4:55 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:57, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Process the currently queued signals.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index c954d0f4f37..1dd6dbb4ee1 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -781,6 +781,40 @@ static void handle_pending_signal(CPUArchState
> *cpu_env, int sig,
> >
> >  void process_pending_signals(CPUArchState *cpu_env)
>
> I won't review this, because I favour using the logic that
> linux-user does here.
>

I've rewritten it to use that, I believe (I'll check that belief before
v2), so likely a good call.

Warner

--0000000000000080e805d5bda69d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 4:55 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:57, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Process the currently queued signals.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 34 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index c954d0f4f37..1dd6dbb4ee1 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -781,6 +781,40 @@ static void handle_pending_signal(CPUArchState *c=
pu_env, int sig,<br>
&gt;<br>
&gt;=C2=A0 void process_pending_signals(CPUArchState *cpu_env)<br>
<br>
I won&#39;t review this, because I favour using the logic that<br>
linux-user does here.<br></blockquote><div><br></div><div>I&#39;ve rewritte=
n it to use that, I believe (I&#39;ll check that belief before v2), so like=
ly a good call.</div><div><br></div><div>Warner=C2=A0</div></div></div>

--0000000000000080e805d5bda69d--

