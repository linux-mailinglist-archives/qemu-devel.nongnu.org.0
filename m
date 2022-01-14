Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DD48E4BB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:12:45 +0100 (CET)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GlQ-0001gE-5c
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8GEb-0005Dd-Oe
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:38:54 -0500
Received: from [2607:f8b0:4864:20::929] (port=41614
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8GEa-0005Uy-3H
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:38:49 -0500
Received: by mail-ua1-x929.google.com with SMTP id p37so15329330uae.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 22:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQ2fc+Gz3vZuFv3MOarOIfLp+5I6xrESd5nj20tzFdY=;
 b=l0dDuutPm+i2hHeix/mh51y/asHPO1u3Lf2SZCSwPVaQ2DUlRUT8fJw7YBFX8tksJx
 xNOkLgP1ltnl5Xb2MZGM+9JxkHpv3x0lZSPLMA+ROolqYbH/oFhM9txCcqUVYj6yF4th
 b5eiBEmnQBQSH/821ppFQH7isL7IlUFGVrLwIsEQLrh4gWN34JqYvk2kvAO3L8YIP60N
 6EP1jQXnsllyUBcHpEDE/uEg9nn4z5ctbp6/LC/o7uEn6540NQ+YbmTvG48K1Yspknb2
 XvVm8rAqByQEIkTjQBE02VQOc0ee+l56syYFByb5+NAC2hFzzMllkbUfhCV3qVEzm+jv
 DOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQ2fc+Gz3vZuFv3MOarOIfLp+5I6xrESd5nj20tzFdY=;
 b=R8PpASxajStjIh9SI5cgOl3Rmfj6yzG5N2KXT1fsGQS8IOLV7W3u8NQMgD87QqKP/R
 sTySVI5jxdcSQ2sRbhQkOG5cfm1+nmbGtrd9Pees745k+5q3AndPB4OqvJ+PJPhJxBcZ
 +8C8BYmSLlIofAoSVqLPOAXkWFGjvWYyFaQU4pDKK9qQAwJ1i5ffV1jM7FuNSdy/afW3
 o06qqWLcqshFO6fM0khdxIW+po5IS0EkN3xfBPmUuuZxpYvuDX3iK5KzoJ95M3QEkDWe
 kd7eL9HkaE8E1wJcrlnX8/BcJzAuv94NTcMsuwe0Kb5zNONt26DmY/bW9adkqn7ESrj+
 zngA==
X-Gm-Message-State: AOAM532/g7aSIcFOyGaEPzeKA0fAUdV8syXk/sNi367aWDdmQ2rPL96d
 p8zxkNxg1OXjzBa/tJy7nh0oLYslkWiZbKZXhm44Qg==
X-Google-Smtp-Source: ABdhPJyM12//jSRkZ45j0cO5COFf133rjY79YM4c6GbTRKMB5/xcZ0E5wpruoJukUCNt1saftfF7nu/Vc73jOTtrdoA=
X-Received: by 2002:a05:6102:3e86:: with SMTP id
 m6mr3497747vsv.77.1642142325779; 
 Thu, 13 Jan 2022 22:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-7-imp@bsdimp.com>
 <CAFEAcA8rsxYLs-VjJF+efK=PEQrEh3mn3pTfEyVXz014CmHfqQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8rsxYLs-VjJF+efK=PEQrEh3mn3pTfEyVXz014CmHfqQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 13 Jan 2022 23:38:34 -0700
Message-ID: <CANCZdfqcik=SkyS9TOUp_Nuu2oSatDmeYU4n0pnRx=ghiytymw@mail.gmail.com>
Subject: Re: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ffc5ba05d5850d32"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
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

--000000000000ffc5ba05d5850d32
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 10:15 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
> >
> > The code has moved in FreeBSD since the emulator was started, update the
> > comment to reflect that change. Remove now-redundant comment saying the
> > same thing (but incorrectly).
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_cpu.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> > index 05b19ce6119..905f13aa1b9 100644
> > --- a/bsd-user/arm/target_arch_cpu.h
> > +++ b/bsd-user/arm/target_arch_cpu.h
> > @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
> >                      int32_t syscall_nr = n;
> >                      int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7,
> arg8;
> >
> > -                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
> > +                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
> >                      if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> >                          syscall_nr = env->regs[0];
> >                          arg1 = env->regs[1];
>
> Commit message says we're updating one comment and deleting a
> second one; code only does an update, no delete ?
>

Commit is right, commit message is wrong. I'll fix the commit message. I got
this confused with part 8 where I kinda sorta did something similar (but not
that similar).

Warner

--000000000000ffc5ba05d5850d32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 10:15 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:26, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The code has moved in FreeBSD since the emulator was started, update t=
he<br>
&gt; comment to reflect that change. Remove now-redundant comment saying th=
e<br>
&gt; same thing (but incorrectly).<br>
&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/arm/target_arch_cpu.h | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch=
_cpu.h<br>
&gt; index 05b19ce6119..905f13aa1b9 100644<br>
&gt; --- a/bsd-user/arm/target_arch_cpu.h<br>
&gt; +++ b/bsd-user/arm/target_arch_cpu.h<br>
&gt; @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int32_t syscall_nr =3D n;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* See arm/arm/trap.c cpu_fetch_syscall_args() */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* See arm/arm/syscall.c cpu_fetch_syscall_args() */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (syscall_nr =3D=3D TARGET_FREEBSD_NR_syscall) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 syscall_nr =3D env-&gt;regs[0];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arg1 =3D env-&gt;regs[1];<br>
<br>
Commit message says we&#39;re updating one comment and deleting a<br>
second one; code only does an update, no delete ?<br></blockquote><div><br>=
</div><div>Commit is right, commit message is wrong. I&#39;ll fix the commi=
t message. I got</div><div>this confused with part 8 where I kinda sorta di=
d something similar (but not</div><div>that similar).</div><div><br></div><=
div>Warner</div></div></div>

--000000000000ffc5ba05d5850d32--

