Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B6418A75
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:15:54 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUYgr-0006PT-Cx
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUYfR-0005jd-FV
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:14:25 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:37598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUYfP-0004qA-Al
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:14:25 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id q66so15695927vsa.4
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgQ/ND3QCtNixigj68ftWPTWyynMp2yJvd5cUMH9Lpw=;
 b=4+R3dVGtDTBVzlHINaAbZkRaMbZ2Ijgpfx/AqddXEEp8lWxawMqT37pMWuoakzY+ip
 GZJGV+VE/GU8t6BIoZiYeOxOLTBv5NEn4jfmtQJHRddXEYpQOv2PnZvtFWzuZ1BCx4Ik
 TlkRCsdtZh+fQDdc+pDpFi08WvVLRKKRp+xviJWJMfrJBfx5lSzSYqsVPDjK26IrpNi2
 k5iaia5sOGLCf56dXb1hppBMUkznD4Whoe9u+4JjaEmAAWnruEtHtH7BgoJC8Ac1gDla
 tqKrcBchiLEsurmBueeSNlBmWxFoD07BGBCBk2tOeVQvsqDUulVoe80L48odmoPQdTxK
 K4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgQ/ND3QCtNixigj68ftWPTWyynMp2yJvd5cUMH9Lpw=;
 b=GahSVAYyCWxrkwEjBR8RsZ+a69tTRP7uiE6XY/DuWU78K79ozvO8UUPkHtmkzEe/cC
 IWWnpmysYZcNg3EdCur+Z7rpwlAm++3Dt/0lNfjaaqIMhk2EnH/ihQXMhIlwc7Eojel9
 eXZvlsC1Dfe3OBQhkcECKyz/bVKbc+Bxc38rlNDfOBZ28LU0KIt3FmRqdVR/fkPQr3bU
 rbckiyAA6qgZXEmqxIvBRh3Oyn/ploTXmAXH0CQ4eMJOs+9qtwu7B6ChyTq3auweKgme
 PB9z/N7wZ66rbcxVtPbttvsLtvCKCDYbItW1SE3/qvGBMzsMrJfkdkbM1iQZX1rALKsy
 HidQ==
X-Gm-Message-State: AOAM530/X05n9x4viOpr2Taqaiyk1UMRbYra94Sc2JaV98nHne1qtZtU
 OBuxb+pJlCBfbq2H+DIk5292HODgRNQtNfltyu3m4Q==
X-Google-Smtp-Source: ABdhPJx9MRnpOMS+PK3M33ZFksCvkTN35l6Vw+2EuGD/4T9IfAzXjCX51y1YCdqKYxpV9XXgXyZKlMVa6xYH2TRpskE=
X-Received: by 2002:a05:6102:317a:: with SMTP id
 l26mr16796724vsm.6.1632680059442; 
 Sun, 26 Sep 2021 11:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
In-Reply-To: <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 12:14:08 -0600
Message-ID: <CANCZdfpdy9EFgr-ushGeEnPZFEPD2_sOc4vii+2by9ksbC3YVg@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f9ac3305cce9f219"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f9ac3305cce9f219
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 11:14 PM, Warner Losh wrote:
> > Create dummy signal queueing function so we can start to integrate other
> > architectures (at the cost of signals remaining broken) to tame the
> > dependency graph a bit and to bring in signals in a more controlled
> > fashion.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h   | 1 +
> >   bsd-user/signal.c | 8 ++++++++
> >   2 files changed, 9 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 5a2fd87e44..85d1f8fd2a 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env);
> >   void signal_init(void);
> >   long do_sigreturn(CPUArchState *env);
> >   long do_rt_sigreturn(CPUArchState *env);
> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> >   abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
> abi_ulong sp);
> >
> >   /* mmap.c */
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index ad6d935569..4e7f618944 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -19,6 +19,14 @@
> >   #include "qemu/osdep.h"
> >
> >   #include "qemu.h"
> > +/*
>
> Whacky whitespace.
>

Fixed.


> > + * Queue a signal so that it will be send to the virtual CPU as soon as
> > + * possible.
> > + */
> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
> > +{
> > +    return 1;
> > +}
>
> Both here and in linux-user, there are no error conditions.  We should
> change the return
> to void.
>

In this stubbed out version, there's no errors. But bsd-user can return
-EAGAIN when
alloc_sigqueue fails (which it can if there are no free qemu_sigqueue
structures in
the preallocated list0. However, having said that, nothing checks the
return value
so it's as if it is void... So I'll change it to void here...


> Also, consider folding in the signal-common.h cleanup soon.
> But don't let either hold you up too much with rebasing.
>

I plan to. Once that's cleaned up and into the repo, I'll rebase bsd-user
in the
fork, fold in the changes needed and then look at how I'm going to upstream
things.

Warner


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>

--000000000000f9ac3305cce9f219
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 6:00 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 11:14 PM, Warner Losh wrote:<br>
&gt; Create dummy signal queueing function so we can start to integrate oth=
er<br>
&gt; architectures (at the cost of signals remaining broken) to tame the<br=
>
&gt; dependency graph a bit and to bring in signals in a more controlled<br=
>
&gt; fashion.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 8 ++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 5a2fd87e44..85d1f8fd2a 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env=
);<br>
&gt;=C2=A0 =C2=A0void signal_init(void);<br>
&gt;=C2=A0 =C2=A0long do_sigreturn(CPUArchState *env);<br>
&gt;=C2=A0 =C2=A0long do_rt_sigreturn(CPUArchState *env);<br>
&gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);=
<br>
&gt;=C2=A0 =C2=A0abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss=
_addr, abi_ulong sp);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* mmap.c */<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index ad6d935569..4e7f618944 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -19,6 +19,14 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu.h&quot;<br>
&gt; +/*<br>
<br>
Whacky whitespace.<br></blockquote><div><br></div><div>Fixed.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; + * Queue a signal so that it will be send to the virtual CPU as soon =
as<br>
&gt; + * possible.<br>
&gt; + */<br>
&gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return 1;<br>
&gt; +}<br>
<br>
Both here and in linux-user, there are no error conditions.=C2=A0 We should=
 change the return <br>
to void.<br></blockquote><div><br></div><div>In this stubbed out version, t=
here&#39;s no errors. But bsd-user can return -EAGAIN when</div><div>alloc_=
sigqueue fails (which it can if there are no free qemu_sigqueue structures =
in</div><div>the preallocated list0. However, having said that, nothing che=
cks the return value</div><div>so it&#39;s as if it is void... So I&#39;ll =
change it to void here...=C2=A0</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Also, consider folding in the signal-common.h cleanup soon.<br>
But don&#39;t let either hold you up too much with rebasing.<br></blockquot=
e><div><br></div><div>I plan to. Once that&#39;s cleaned up and into the re=
po, I&#39;ll rebase bsd-user in the</div><div>fork, fold in the changes nee=
ded and then look at how I&#39;m going to upstream</div><div>things.</div><=
div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000f9ac3305cce9f219--

