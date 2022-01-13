Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83E48DEEC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:29:50 +0100 (CET)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86jF-00057V-Jv
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n86i4-0004QD-1s
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:28:36 -0500
Received: from [2607:f8b0:4864:20::935] (port=43556
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n86i2-0005Ib-3T
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:28:35 -0500
Received: by mail-ua1-x935.google.com with SMTP id i5so13336911uaq.10
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JTp2eXg4Kyxdj24y4Qc2ReQWSQt86eyCzLh6WHwWI1U=;
 b=05EZ7pqc8Udly5wxqoYo0nUo/vO87Mzbbmack7XvyQAYVRJS3hFfyq0xNWlRReKYzT
 /3noLi8c5dib80nVshuCyhDar+ClGsqpEmVEq/lzkWRWTPKWyY7s+xO5eNZmRcfkji01
 ep0u04vV0ROcgEI2gSWXQNqbbHETGqCF+f1lLM6R5v58u/DywPhBQH5xPp21PUnsEHI9
 HRWc5v0Zvhror7N2oRkk+pK9hY+E1BIxK2PRorCbZmwiqId638VzwIXBFar81hV9GWbL
 YBWD1iaxcA90kk+VzbF/uYotBjjv3Cj3uFaFRi9tLqSvFLNUheSImLnzTFr2TxkLa73o
 J73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JTp2eXg4Kyxdj24y4Qc2ReQWSQt86eyCzLh6WHwWI1U=;
 b=Z+NbPmn1+gW9YTPxnOudPsmx4p1r3bTlQC85EA1IhmG3no6JbgXxvJIsfwUjjbHqTC
 zzDDAd2numJyA71HHRLkSfx7Ny5RXgJ69QTIJ829wJrBFgAMzL1JClbNIIZ/RXc48juf
 SRcky4AyREtNR6mu5VVv++6IQ91gjIuBgyq8ohEc+RHZXEzNbzrC5MWlHG63F1fug9IA
 mvloBbjV4shIl2XH2zN3p3ZitaX9Ln2Ux30TOyY9hoYjXK5agzWZik13oa/1JQcCmRVc
 h26oDwpaWo30PNvvfwFlvczsh2/Tur1RQ+ynJHYrOOZ7+o44rMEBS1TjRVJfyaj64nCk
 6a2w==
X-Gm-Message-State: AOAM531pqTKZaCMogJ5xo55brldZQ9XGYvIWifLQtEuxsbiHxqrW0ezJ
 16Fc0VxsGNtHcnbebewuDTVVApmNpt1yb0SbT+Qq1w==
X-Google-Smtp-Source: ABdhPJzRhyQvEFmKIReAv2DziICS6NBYLrlmaFETG0F9zs3iYzLG1bB9kLC+uSB3aYnInPgjpndUjSA2AEIFBVj74Do=
X-Received: by 2002:ab0:71d0:: with SMTP id n16mr3233204uao.11.1642105712477; 
 Thu, 13 Jan 2022 12:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-21-imp@bsdimp.com>
 <CAFEAcA8ZMSuxyJiHEBbwnZ3cGyBdUrzSBiigLn7=8jWaH1YO4A@mail.gmail.com>
In-Reply-To: <CAFEAcA8ZMSuxyJiHEBbwnZ3cGyBdUrzSBiigLn7=8jWaH1YO4A@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 13 Jan 2022 13:28:21 -0700
Message-ID: <CANCZdfqcxgaukAiSFyDMqG3q_XOonu_gUbJGYFrHen0JQDvrFg@mail.gmail.com>
Subject: Re: [PATCH 20/30] bsd-user/signal.c: core_dump_signal
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ad1c8805d57c876f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

--000000000000ad1c8805d57c876f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:22 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:48, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Returns 1 for signals that cause core files.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/signal.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index a6e07277fb2..824535be8b8 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -92,6 +92,23 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
> >      }
> >  }
> >
> > +/* Returns 1 if given signal should dump core if not handled. */
> > +static int core_dump_signal(int sig)
> > +{
> > +    switch (sig) {
> > +    case TARGET_SIGABRT:
> > +    case TARGET_SIGFPE:
> > +    case TARGET_SIGILL:
> > +    case TARGET_SIGQUIT:
> > +    case TARGET_SIGSEGV:
> > +    case TARGET_SIGTRAP:
> > +    case TARGET_SIGBUS:
> > +        return 1;
> > +    default:
> > +        return 0;
> > +    }
> > +}
>
> Code is fine, but since this is a static function with no callers
> the compiler is going to emit a warning about that. It's a small
> function, so the easiest thing is just to squash this into the
> following patch which is what adds the code that calls it.
>

Sure thing. I'm still trying to get a feel for right-sizing the chunking...
Since the warning didn't fail the compile, I thought it would be OK,
but can easily fold this in with the first patch to use it.

Warner

--000000000000ad1c8805d57c876f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 1:22 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:48, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Returns 1 for signals that cause core files.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/signal.c | 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index a6e07277fb2..824535be8b8 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -92,6 +92,23 @@ static inline void host_to_target_siginfo_noswap(ta=
rget_siginfo_t *tinfo,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +/* Returns 1 if given signal should dump core if not handled. */<br>
&gt; +static int core_dump_signal(int sig)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (sig) {<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGABRT:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGFPE:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGILL:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGQUIT:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGSEGV:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGTRAP:<br>
&gt; +=C2=A0 =C2=A0 case TARGET_SIGBUS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
Code is fine, but since this is a static function with no callers<br>
the compiler is going to emit a warning about that. It&#39;s a small<br>
function, so the easiest thing is just to squash this into the<br>
following patch which is what adds the code that calls it.<br></blockquote>=
<div><br></div><div>Sure thing. I&#39;m still trying to get a feel for righ=
t-sizing the chunking...</div><div>Since the warning didn&#39;t fail the co=
mpile, I thought it would be OK,</div><div>but can easily fold this in with=
 the first patch to use it.</div><div><br></div><div>Warner=C2=A0</div></di=
v></div>

--000000000000ad1c8805d57c876f--

