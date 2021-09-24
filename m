Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CD417C36
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 22:12:49 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrYt-0006dO-R9
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 16:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTrXt-0005xv-GX
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:11:45 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTrXo-0002kh-20
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 16:11:45 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id az15so11245834vsb.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyR74xZOaRi675tAUxn9LSQ1pl4I+Tu+NDo/UygiRKI=;
 b=36TPpGVwqPqDvxlEM9JT8cagyyYUewNJC2HDHWHHBtHajrO5ZwwPCsZdaIBX6KlQGN
 SovMLBcgTfBbatrYieG5P3NZdX6c3vE7adHyNeMzSNxlpaWNHa5CXeb//CN0o55idWG6
 ByygYBhqzCm+9+HohiJz2vPuwQRbERg9b9GAHw3/8zYqii6laTDs2MdPkFKdzBTt/UmW
 R3ft2x03v2X7EHhzOmT/fkdw18sSjF0JNUaHIptvYxtFXBO6s+AShknNTHSAIJW4pLlV
 7xUccwG4g52s23MsVCiz9vD1MbQVCSfo3Egj5387tn04jZXDlPM4UpxE3v+L+KexFAZA
 kc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyR74xZOaRi675tAUxn9LSQ1pl4I+Tu+NDo/UygiRKI=;
 b=NKrvn8C/DWdT9xhwHgrClrJmeX0vAd9vvfJDdfPq1jjmMcIhovCCkFK1bYzsnmFOv9
 2Nu91GYlMlE18EM4LfbU3+Dvag6XZF7IOaF4TPGkKBMJPlom6qauzLbWZ0Y4uhlpv3g6
 0FPD/4iu53KXnsCZlny12bG3n2ZKcRq7kEKDtvExPkeNypUPt+XTpjftz3KibuI3Cgw0
 CVnSvl7K4PKUz2md3hmO7cYJbILOJMzDi7x3H7WSJaOpJJg9o5QUaRKzEkjho0yMk3Js
 DxeiBatc9SVqmTycHfBzMfXwX2b0SDb5JjfKrNIk1zEXqY9brq6aTc1ErOznO548wTFu
 OP2w==
X-Gm-Message-State: AOAM533M94E6O+3LU999uCGczxM4pcgre+9LZdxwSh81UUD4YVzJZZfC
 uKZdsDFGBgvuI1gX84D0xWIOjtsn0dAawyT+ExONjg==
X-Google-Smtp-Source: ABdhPJysy7XhAS6D0G/0PFcwKzWzoUW5g2TINiPjsvTErYrvAtVlRqvOMtRDfVhMSfK4nwIcq0XsTTPrzYmyAZIMlAs=
X-Received: by 2002:a67:eacf:: with SMTP id s15mr11344873vso.44.1632514297531; 
 Fri, 24 Sep 2021 13:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
In-Reply-To: <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 24 Sep 2021 14:11:26 -0600
Message-ID: <CANCZdfpNFhFQk0inNhtb6Ft4vdKtar3jBBjpL6_KfTpf9yj4dA@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cba2ed05ccc35a87"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2d.google.com
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

--000000000000cba2ed05ccc35a87
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

fixed.


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

I'll prep a patch to follow up for both linux and bsd user.


> Also, consider folding in the signal-common.h cleanup soon.
> But don't let either hold you up too much with rebasing.
>

It's on my list. This 'dummy' routine is just to get things linking to
help simplify the rather tangled dependency tree to get things
in, still have them compile and still have at least simple hello
world continue to work. Behind these reviews are three streams
of patches for 3 more architectures: arm, aarch64 and riscv64.

I'll create a patch for both linux-user and fix in bsd-user as part of the
signal.c upstreaming I'm working on.

It brings to mind something else... There's times it might be easier
to refactor between bsd-user and linux-user rather than upstream
something that's largely copied from linux-user. Is there a good
way to do that and talk about the design before I sink a ton of time
into something that's the wrong direction?

Thanks for the reviews and feedback.

Warner


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>

--000000000000cba2ed05ccc35a87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 6:00 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"=
_blank">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 9/21/21 11:14 PM, Warner Losh wrote:=
<br>
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
Whacky whitespace.<br></blockquote><div><br></div><div>fixed.</div><div>=C2=
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
to void.<br></blockquote><div><br></div><div>I&#39;ll prep a patch to follo=
w up for both linux and bsd user.<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Also, consider folding in the signal-common.h cleanup soon.<br>
But don&#39;t let either hold you up too much with rebasing.<br></blockquot=
e><div><br></div><div>It&#39;s on my list. This &#39;dummy&#39; routine is =
just to get things linking to</div><div>help simplify the rather tangled de=
pendency tree to get things</div><div>in, still have them compile and still=
 have at least simple hello</div><div>world continue to work. Behind these =
reviews are three streams</div><div>of patches for 3 more architectures: ar=
m, aarch64 and riscv64.<br></div><div><br></div><div>I&#39;ll create a patc=
h for both linux-user and fix in bsd-user as part of the</div><div>signal.c=
 upstreaming I&#39;m working on.</div><div><br></div><div>It brings to mind=
 something else... There&#39;s times it might be easier</div><div>to refact=
or between bsd-user and linux-user rather than upstream</div><div>something=
 that&#39;s largely copied from linux-user. Is there a good</div><div>way t=
o do that and talk about the design before I sink a ton of time</div><div>i=
nto something that&#39;s the wrong direction?</div><div><br></div><div>Than=
ks for the reviews and feedback.</div><div><br></div><div>Warner<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000cba2ed05ccc35a87--

