Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB10496E2C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 23:22:15 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBOlx-00009E-P9
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 17:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nBOk9-0007oL-0Y
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 17:20:21 -0500
Received: from [2607:f8b0:4864:20::932] (port=45898
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nBOk6-0000j8-E4
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 17:20:20 -0500
Received: by mail-ua1-x932.google.com with SMTP id b37so6028569uad.12
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=juBjm1na1Gh03Xtp1LqMDrCiDLQ/pgKM5SI5sB+EhEc=;
 b=uqOfP4g2eY96+c31BTGcb6nlC35tSXN7RiCCskIToii7xPZWwTeciGyfK/bYWYDHzz
 huDnzygZhyO8L5dKXAajlt6vPrRTArq8aFBS3Gp3B8GNurIyayQ4PDs918Zb0Johie2U
 Svxqhcp2NHO8ExIQqx3PHGFnULHxIhxm3SOBUBroy7A5G/MQaYkQUULzG3SoZoLMteKl
 Jg86dgOTBPe6TTV85/0g4SU47WsCQe/Wvd/A2FSni7iER6zTuPzC5zc2+ihYcQWyQM8G
 uZ2YnlGL/Pev0pPAb9cTkbeih0CrKzE5XbVGZhw0t4NiNG2cR+iH49jU12ZhQwZvVVq7
 7RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=juBjm1na1Gh03Xtp1LqMDrCiDLQ/pgKM5SI5sB+EhEc=;
 b=iq44ohGhSxd/hJiEQNCge1SvdgJlYzWDuHwFI84gs4/yXO9ll1Vm6eByUXBMf8IDwr
 Wbp0ZaIgTB1JDuRwhEigBC/TkjOcAcClE8GR6Hxrxz8hVmXEBQPphWw0wCdA8NVnLtE9
 uxw4FxZV7gG5VcAYsPYop3umHLdm46qWSGoLgVv3OlqbrrnAfS+Rmgs4a8aQWX46fTsN
 Udr/GRUiLFNPHK3boY2W+Jo+E7d5Xd4FrC029zD6dPWI5gzRGpFFfcaFsZm46CCflnMM
 +OrjorOSOGZ1gwWUI7vjU3VR+3qYts8LM6wUnDGjwo11P0Z+h19PBGOcOJaHWz2Pr2nE
 iOBw==
X-Gm-Message-State: AOAM530unJQlSQcoQ0n9TsKI19PUcfCvzYGpPPFh0ksDPXvp0JCgEoe0
 zGDfajwtvCW+4Xw7xhlNAGb//YtVo/SsR93g9m4lrA==
X-Google-Smtp-Source: ABdhPJz8VZnIm6dxWdh9KaVNW4ckwmCjV4i9IDXmwrKMBxa0ilgZhmmFB8m2RllJeMo6NOPCHHqzTPvUB/yJKy/KVZ8=
X-Received: by 2002:a9f:2a8e:: with SMTP id z14mr3752027uai.85.1642890016828; 
 Sat, 22 Jan 2022 14:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-31-imp@bsdimp.com>
 <CAFEAcA96g9uvq_ukUGG8X6v4vk2ve4QWQepiCp7MEYpb1byt-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA96g9uvq_ukUGG8X6v4vk2ve4QWQepiCp7MEYpb1byt-Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 22 Jan 2022 15:20:05 -0700
Message-ID: <CANCZdfomMupe1v_0yWq+FJTWEmqf0X2HRvpiipuMX8m5nK2E=A@mail.gmail.com>
Subject: Re: [PATCH 30/30] bsd-user/signal.c: do_sigaltstack
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000dbc30605d63323ee"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
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

--000000000000dbc30605d63323ee
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 6:18 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 17:08, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement the meat of the sigaltstack(2) system call with do_sigaltstack.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/qemu.h   |  1 +
> >  bsd-user/signal.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index c643d6ba246..fcdea460ed2 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -226,6 +226,7 @@ int host_to_target_signal(int sig);
> >  void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
> >  void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
> >  long do_sigreturn(CPUArchState *regs, abi_ulong addr);
> > +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
> abi_ulong sp);
> >  int do_sigaction(int sig, const struct target_sigaction *act,
> >                  struct target_sigaction *oact);
> >  void QEMU_NORETURN force_sig(int target_sig);
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index f055d1db407..e5e5e28c60c 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -528,6 +528,72 @@ static void host_signal_handler(int host_sig,
> siginfo_t *info, void *puc)
> >      cpu_exit(thread_cpu);
> >  }
> >
> > +/* do_sigaltstack() returns target values and errnos. */
> > +/* compare to kern/kern_sig.c sys_sigaltstack() and kern_sigaltstack()
> */
> > +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
> abi_ulong sp)
> > +{
> > +    int ret;
> > +    target_stack_t oss;
> > +
> > +    if (uoss_addr) {
> > +        /* Save current signal stack params */
> > +        oss.ss_sp = tswapl(target_sigaltstack_used.ss_sp);
> > +        oss.ss_size = tswapl(target_sigaltstack_used.ss_size);
> > +        oss.ss_flags = tswapl(sas_ss_flags(sp));
> > +    }
>
> This will need some minor changes to work with the sigaltstack
> info being per-thread and in the TaskState struct.
>

Yes. Moving it into the TaskState was easy and got rid if the global.
Thanks for that suggestion earlier in the patch series.

Warrner

--000000000000dbc30605d63323ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 6:18 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 17:08, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement the meat of the sigaltstack(2) system call with do_sigaltsta=
ck.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 bsd-user/signal.c | 66 +++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 67 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index c643d6ba246..fcdea460ed2 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -226,6 +226,7 @@ int host_to_target_signal(int sig);<br>
&gt;=C2=A0 void host_to_target_sigset(target_sigset_t *d, const sigset_t *s=
);<br>
&gt;=C2=A0 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s=
);<br>
&gt;=C2=A0 long do_sigreturn(CPUArchState *regs, abi_ulong addr);<br>
&gt; +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_=
ulong sp);<br>
&gt;=C2=A0 int do_sigaction(int sig, const struct target_sigaction *act,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct t=
arget_sigaction *oact);<br>
&gt;=C2=A0 void QEMU_NORETURN force_sig(int target_sig);<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index f055d1db407..e5e5e28c60c 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -528,6 +528,72 @@ static void host_signal_handler(int host_sig, sig=
info_t *info, void *puc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu_exit(thread_cpu);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +/* do_sigaltstack() returns target values and errnos. */<br>
&gt; +/* compare to kern/kern_sig.c sys_sigaltstack() and kern_sigaltstack(=
) */<br>
&gt; +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_=
ulong sp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +=C2=A0 =C2=A0 target_stack_t oss;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (uoss_addr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Save current signal stack params */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oss.ss_sp =3D tswapl(target_sigaltstack_u=
sed.ss_sp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oss.ss_size =3D tswapl(target_sigaltstack=
_used.ss_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oss.ss_flags =3D tswapl(sas_ss_flags(sp))=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This will need some minor changes to work with the sigaltstack<br>
info being per-thread and in the TaskState struct.<br></blockquote><div><br=
></div><div>Yes. Moving it into the TaskState was easy and got rid if the g=
lobal.</div><div>Thanks for that suggestion earlier in the patch series.</d=
iv><div><br></div><div>Warrner=C2=A0</div></div></div>

--000000000000dbc30605d63323ee--

