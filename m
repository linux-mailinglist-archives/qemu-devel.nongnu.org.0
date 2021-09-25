Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B949418318
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:14:29 +0200 (CEST)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Ni-0004fz-Vn
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mU93e-0002I8-Be
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:42 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mU93c-0006jf-5P
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:42 -0400
Received: by mail-ua1-x92b.google.com with SMTP id p9so8721434uak.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9HUb/dxfmy2GRUqKoXBYU9Ov+Iizb52+iqITK0tEFg=;
 b=anmzGviu/ftPr0dUOoBCXxCnJrBjfyf1NF0mQlVOLHizsuU6Oq51auspJfF56YGVTj
 +FZikFlW01Qiblx19EqMNtlwLiox61Sa+WTAlOc4fkRc/BcCj2DxdWsv1ZW0kWXYw/0j
 Ev2SIxfV5Az2je/maJK26afNq6MLE2y6sbgtfleSbljT3gJL4tNX4M8fvTpkKP6+xYV3
 HRtmUpYPQpp9vIgp3Rvupq53P/k3mckXCTjhL6ETXP0ePqEEE26m3JI6aO+fgPYL9sa7
 EA/XGsvLOyAaCQsHyJ8Bz8CX5LWjPUTnzzKMe7T29mPwdR7/J7/aMJhBXVgg2hOX8FWC
 VJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9HUb/dxfmy2GRUqKoXBYU9Ov+Iizb52+iqITK0tEFg=;
 b=Wg47tlJj9jcrWxNT8+/l5KzzPlERVAQQXOYJYTpkdswHoo//bCIp2QsY/Vp4SqP9bP
 EuImqU2x341bNT57u3XO94/QZICwD7QS7JTPNgoHuMKMxbS3yOEpBtYneTr1nngduDIT
 +4gj5XRMGKH9ozmWqvcdHD5XbfKQM+NZypXE3QZr2quSg+OAIOr0y9JqQD7wnecP9bwk
 t8VFAKgylmJ35/XbHXbeH73jsLHBPEcCziUHaEZSt4qq8Bk2UiPtWSZPtZ/Fz3uxts7T
 l+7Mb1BUqIc6UQyo+HzoLSilXehN9A/5htYexRyZBMqBVhpW6KVYjot+sWlNE5JgaptB
 RKxQ==
X-Gm-Message-State: AOAM533IOvUKTScr+qIi+WGqdNO1mOJs3zoXmr3BVrPJl80/iXfZiNK1
 S+NHZfB/PHJgCWCOQyRCHtD7IplIPrvOHDcvqzxatIn4sOcwmfiG
X-Google-Smtp-Source: ABdhPJyR2Z3JxqxDoSc+ox30ABzPkfYa1YpD0ndPo1uJ9ti30E8BQm10EPscsa6QIFExlr6HSkoh4rCuD5L6ruWZDv8=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr5986451uae.85.1632581618072; 
 Sat, 25 Sep 2021 07:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <dde592d4-35fc-8f33-009b-cc6a0e4460ad@amsat.org>
In-Reply-To: <dde592d4-35fc-8f33-009b-cc6a0e4460ad@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 25 Sep 2021 08:53:26 -0600
Message-ID: <CANCZdfo-YTGs3gLi1T+BKa5a1EhQ1ZpfhbR_x27n0uOKt3xE5A@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006991d305ccd307fd"
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006991d305ccd307fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 25, 2021, 4:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> On 9/22/21 08:14, Warner Losh wrote:
> > Create dummy signal queueing function so we can start to integrate othe=
r
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
> > @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env)=
;
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
> > + * Queue a signal so that it will be send to the virtual CPU as soon a=
s
> > + * possible.
> > + */
> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
> > +{
> > +    return 1;
>
> Shouldn't we abort() here or at least call qemu_log_mask(LOG_UNIMP)?
>

Sure. This code is just a placeholder for the moment so that I can prepare
the full signal.c later, but still be able to submit my next 3 patch series
which add aarch64, arm and riscv64. It can be anything you'd like without
generating conflicts.

When I spin the next version I'll have at least an abort here.

Warner

> +}
> >
> >   void signal_init(void)
> >   {
> >
>

--0000000000006991d305ccd307fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Sep 25, 2021, 4:50 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On 9/22/21 08:14, Warner Losh wrote:=
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
t=3D"_blank" rel=3D"noreferrer">imp@bsdimp.com</a>&gt;<br>
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
&gt; + * Queue a signal so that it will be send to the virtual CPU as soon =
as<br>
&gt; + * possible.<br>
&gt; + */<br>
&gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return 1;<br>
<br>
Shouldn&#39;t we abort() here or at least call qemu_log_mask(LOG_UNIMP)?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sur=
e. This code is just a placeholder for the moment so that I can prepare the=
 full signal.c later, but still be able to submit my next 3 patch series wh=
ich add aarch64, arm and riscv64. It can be anything you&#39;d like without=
 generating conflicts.</div><div dir=3D"auto"><br></div><div dir=3D"auto">W=
hen I spin the next version I&#39;ll have at least an abort here.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Warner</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
&gt; +}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void signal_init(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; <br>
</blockquote></div></div></div>

--0000000000006991d305ccd307fd--

