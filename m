Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066B48E454
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:43:54 +0100 (CET)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GJU-0004kZ-UN
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:43:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8G9U-0003Z5-MM
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:33:35 -0500
Received: from [2607:f8b0:4864:20::935] (port=36473
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8G9S-0004rR-Li
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:33:32 -0500
Received: by mail-ua1-x935.google.com with SMTP id r15so15392582uao.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 22:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNwx21nmAcBXYaeoznU7kIQS9JuOvC/iEaC+Er2jdmk=;
 b=t2IGrfchYaR0381hXqe0SmdFqVFY2MUNGHUzi3iratvMfVFD1gf1CJB5G6qap6IUeZ
 KRhMexsdji2AySzqYjHMf1mwcm/T8o5aj94s8o6mkpqVV2nIFQcQkBOkEmAPDrwVeZfx
 ZeKXCmUINmh7QL8Dx1Jo0tskx8+yvaAe+It1FUoIhMq8NOzKIP21TbRSLi2fF+AOidmJ
 x6mBEy/Bp5/jIcpvwYZ0+oPvPrvsgFGpsDP44TFhl25lOuN7n9ZcK0vjPm0RzkxDxdXz
 a73wVQIZ4u4ihMj8hBsgUG9Y3s02h+tRR3hk0yDeViAfGbz1UJIUcstKcOXbdeLkAwjK
 KS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNwx21nmAcBXYaeoznU7kIQS9JuOvC/iEaC+Er2jdmk=;
 b=XKZrH5kjtFzvbPGXq7fjWHa/FeKrE7CukutTy70ESz0TKSw77Wta4guTdL6L/y0JI2
 1hltFEPU1uJORw+JiGybNSLWUleoXjCuZjlJY8z2NJB7zDd4k8PsK2rbMHmUPBvre4f6
 6LnYnbmqT6rTpy5N0he8vpbIxCJarGFddiwUj/Tf9wSZVYpLYy1t+MbKd0oRYr78eGr4
 x+ri3GfoaPFAM2K9pJXEJ5brRwYgEs5FBLmNVpfeAZLqgJFPQsg14WeO1G5IhjS2U92J
 R3N7vTz1/DpfMrBXuk/J/MUxDQHb9RlbwWb3bd7YH21A2JHDuccrmmRt7hrttVp6XxR5
 BVZw==
X-Gm-Message-State: AOAM531bZnUPA/YFoGfHqzw69hcyWfEc/pcIjrw4wIrit7dxXBA5F/mW
 JtVQiSbvkS7Ab6fx84ydUNu+8l5qEbucdCfEo6uZQg==
X-Google-Smtp-Source: ABdhPJy4MPry19BSrHRtdxokvk55l7a4lilO0+bcZdyfsueK2m+I2iGhgtXTl8UyoZzq8Tx1rA6DrOCSwyXRYLnVw6E=
X-Received: by 2002:a05:6102:ecf:: with SMTP id
 m15mr2806732vst.68.1642142009153; 
 Thu, 13 Jan 2022 22:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-6-imp@bsdimp.com>
 <CAFEAcA8T8xXv6+2hJ50oQpob7=7nFTh=sGGhcMxJnPfvZyHM7g@mail.gmail.com>
In-Reply-To: <CAFEAcA8T8xXv6+2hJ50oQpob7=7nFTh=sGGhcMxJnPfvZyHM7g@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 13 Jan 2022 23:33:17 -0700
Message-ID: <CANCZdfo=S8BA-iPukYnQ7HrDd90m77LTxnb9s62OLqPBXDjXpA@mail.gmail.com>
Subject: Re: [PATCH 05/30] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000020774c05d584fb06"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000020774c05d584fb06
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 10:13 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
> > linux-user. The prior adjustment of register 15 isn't needed, so remove
> > that. Remove a redunant comment (that code in FreeBSD never handled
> > break points).
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_cpu.h | 23 +++--------------------
> >  1 file changed, 3 insertions(+), 20 deletions(-)
> >
> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> > index c526fc73502..05b19ce6119 100644
> > --- a/bsd-user/arm/target_arch_cpu.h
> > +++ b/bsd-user/arm/target_arch_cpu.h
> > @@ -21,6 +21,7 @@
> >  #define _TARGET_ARCH_CPU_H_
> >
> >  #include "target_arch.h"
> > +#include "signal-common.h"
> >
> >  #define TARGET_DEFAULT_CPU_MODEL "any"
> >
> > @@ -64,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
> >              }
> >              break;
> >          case EXCP_SWI:
> > -        case EXCP_BKPT:
> >              {
> > -                /*
> > -                 * system call
> > -                 * See arm/arm/trap.c cpu_fetch_syscall_args()
> > -                 */
> > -                if (trapnr == EXCP_BKPT) {
> > -                    if (env->thumb) {
> > -                        env->regs[15] += 2;
> > -                    } else {
> > -                        env->regs[15] += 4;
> > -                    }
> > -                }
>
> So the previous code was implementing BKPT as a way to do
> a syscall (added in commit 8d450c9a30). Was that just a mistake ?
>

I did some digging and I'm at a loss for why this code was ever here.


> >                  n = env->regs[7];
> >                  if (bsd_type == target_freebsd) {
> >                      int ret;
> > @@ -171,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
> >              queue_signal(env, info.si_signo, &info);
> >              break;
> >          case EXCP_DEBUG:
> > -            {
> > -
> > -                info.si_signo = TARGET_SIGTRAP;
> > -                info.si_errno = 0;
> > -                info.si_code = TARGET_TRAP_BRKPT;
> > -                info.si_addr = env->exception.vaddress;
> > -                queue_signal(env, info.si_signo, &info);
> > -            }
> > +        case EXCP_BKPT:
> > +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
> env->regs[15]);
> >              break;
> >          case EXCP_YIELD:
> >              /* nothing to do here for user-mode, just resume guest code
> */
>
> Looks like it now matches the freebsd kernel behaviour, anyway.
>

Yea. That's why I went ahead and made the change rather than slavishly
carry it
over for something weird I couldn't find out about... I think it's an old
mistake...
I'll update the commit message to specifically note it.


> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>

--00000000000020774c05d584fb06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 10:13 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:26, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in<br>
&gt; linux-user. The prior adjustment of register 15 isn&#39;t needed, so r=
emove<br>
&gt; that. Remove a redunant comment (that code in FreeBSD never handled<br=
>
&gt; break points).<br>
&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/arm/target_arch_cpu.h | 23 +++--------------------<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch=
_cpu.h<br>
&gt; index c526fc73502..05b19ce6119 100644<br>
&gt; --- a/bsd-user/arm/target_arch_cpu.h<br>
&gt; +++ b/bsd-user/arm/target_arch_cpu.h<br>
&gt; @@ -21,6 +21,7 @@<br>
&gt;=C2=A0 #define _TARGET_ARCH_CPU_H_<br>
&gt;<br>
&gt;=C2=A0 #include &quot;target_arch.h&quot;<br>
&gt; +#include &quot;signal-common.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #define TARGET_DEFAULT_CPU_MODEL &quot;any&quot;<br>
&gt;<br>
&gt; @@ -64,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_SWI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_BKPT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* syste=
m call<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* See a=
rm/arm/trap.c cpu_fetch_syscall_args()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (trapnr =
=3D=3D EXCP_BKPT) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (env-&gt;thumb) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 env-&gt;regs[15] +=3D 2;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 env-&gt;regs[15] +=3D 4;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
So the previous code was implementing BKPT as a way to do<br>
a syscall (added in commit 8d450c9a30). Was that just a mistake ?<br></bloc=
kquote><div><br></div><div>I did some digging and I&#39;m at a loss for why=
 this code was ever here.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D en=
v-&gt;regs[7];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsd_=
type =3D=3D target_freebsd) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int ret;<br>
&gt; @@ -171,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *e=
nv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_signal(env, info=
.si_signo, &amp;info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_DEBUG:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_signo=
 =3D TARGET_SIGTRAP;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_errno=
 =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_code =
=3D TARGET_TRAP_BRKPT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_addr =
=3D env-&gt;exception.vaddress;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_signal(=
env, info.si_signo, &amp;info);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_BKPT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_sig_fault(TARGET_SIGT=
RAP, TARGET_TRAP_BRKPT, env-&gt;regs[15]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_YIELD:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* nothing to do here =
for user-mode, just resume guest code */<br>
<br>
Looks like it now matches the freebsd kernel behaviour, anyway.<br></blockq=
uote><div><br></div><div>Yea. That&#39;s why I went ahead and made the chan=
ge rather than slavishly carry it</div><div>over for something weird I coul=
dn&#39;t find out about... I think it&#39;s an old mistake...</div><div>I&#=
39;ll update the commit message to specifically note it.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000020774c05d584fb06--

