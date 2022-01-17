Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F244900C4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:19:57 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JUo-0008AL-KM
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9JNV-0006Yw-QT
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:21 -0500
Received: from [2607:f8b0:4864:20::a35] (port=41530
 helo=mail-vk1-xa35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9JNT-0003Le-In
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:21 -0500
Received: by mail-vk1-xa35.google.com with SMTP id n9so8628319vkq.8
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 20:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojfvGq26Hm9pCPb+dHpHwFr2ay0Vl11NxmdBlekFwVg=;
 b=TElEhagfo39h+dDig5RpTER2YayOOzfeaSgGZMa8Po1xnFYwxf0pnvhy9A7XPhTQ5i
 ddLpkySpTV2Ai0ZEYiDdYpZAZWG11WqXpVvf8ey+l6qmtz6TPoyIeNUU9m/LELWiNkub
 8oQkgrlJ/Zl6AXWPciGV+LC/RwIzgJY2M2ziOqTDVaZMaqEd0zU4bZ2lL7bSYC5Alo/B
 +J6Ae0q55nLyih6wRtQIfZYXySzHcc7L+6o6Nzg/ARwSQ5Ytx9dMqWcA6eZZx5SP/9Nn
 djuWhQHSQeBN1bwTQHnZ8K5Vhc4LTRkS6IukIBuyza5FA5GaxbuGBrvapU/JHYSsQ7NA
 dCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojfvGq26Hm9pCPb+dHpHwFr2ay0Vl11NxmdBlekFwVg=;
 b=MbEN1LXNfZ/MHyrihRtlAl7ibK4RG9MNJLz76LByDTtmCfdCiH6LK5FfkNU959bg3s
 ZsNu1Y7o0eVtyxZYK2JTSfDi0KAM3dWLLKr17SSn3JIkYsHDo3izi03/kXt35oCOT0Sm
 WLmOfujRAwFc3aGWGdNbSyexwvpPgtyM1pKN1HL9Km9idxlVKKpMqCMDo+kXyAaDSBbn
 oEj12EInjY/AqHSJ4o7k4bW/XQBwZpkCqVMxTv03uNgdrJJF+oDaUdNk8pLgPbsRzyif
 OTW5/cgicJ7/+aoSd0FPlqGBYhaEd8Eo+lk8a1lU/2mgp/UYqZtEqTP46FSYNt3kcaqX
 gIfw==
X-Gm-Message-State: AOAM533AUd5+FbqX8QPyjOI2mRhhS+2HDBcnIYPIUCVrh/Bkh9eCZDDq
 okKYkJRH9CRkXkCAy0p9CkvzlDNdDmNNQMZyTmnUfw==
X-Google-Smtp-Source: ABdhPJzHwXr8YDQqMjc/I987c1DoQ/UG8OHaV/s3/YM+bz6c9Eg/6HgJGZaGToT9Z4BLQYVeVHOjGhPeusvUznJVFBA=
X-Received: by 2002:a1f:f287:: with SMTP id q129mr7648006vkh.40.1642392738029; 
 Sun, 16 Jan 2022 20:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-7-imp@bsdimp.com>
 <CAFEAcA8rsxYLs-VjJF+efK=PEQrEh3mn3pTfEyVXz014CmHfqQ@mail.gmail.com>
 <CANCZdfqcik=SkyS9TOUp_Nuu2oSatDmeYU4n0pnRx=ghiytymw@mail.gmail.com>
 <CAFEAcA-dSiEh0QsadkRL=00_ZxJ9H+sSpdK3z71As-fcQ9ZL1g@mail.gmail.com>
In-Reply-To: <CAFEAcA-dSiEh0QsadkRL=00_ZxJ9H+sSpdK3z71As-fcQ9ZL1g@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 21:12:15 -0700
Message-ID: <CANCZdfq6FeCDL1=D57UmLO4P_hCjYcGU-HYj75vDiyhG3US9yA@mail.gmail.com>
Subject: Re: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bb761205d5bf5b07"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa35.google.com
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

--000000000000bb761205d5bf5b07
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 3:22 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 14 Jan 2022 at 06:38, Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Thu, Jan 13, 2022 at 10:15 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>
> >> On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
> >> >
> >> > The code has moved in FreeBSD since the emulator was started, update
> the
> >> > comment to reflect that change. Remove now-redundant comment saying
> the
> >> > same thing (but incorrectly).
> >> >
> >> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> >> > ---
> >> >  bsd-user/arm/target_arch_cpu.h | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> >> > index 05b19ce6119..905f13aa1b9 100644
> >> > --- a/bsd-user/arm/target_arch_cpu.h
> >> > +++ b/bsd-user/arm/target_arch_cpu.h
> >> > @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
> >> >                      int32_t syscall_nr = n;
> >> >                      int32_t arg1, arg2, arg3, arg4, arg5, arg6,
> arg7, arg8;
> >> >
> >> > -                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
> >> > +                    /* See arm/arm/syscall.c
> cpu_fetch_syscall_args() */
> >> >                      if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> >> >                          syscall_nr = env->regs[0];
> >> >                          arg1 = env->regs[1];
> >>
> >> Commit message says we're updating one comment and deleting a
> >> second one; code only does an update, no delete ?
> >
> >
> > Commit is right, commit message is wrong. I'll fix the commit message. I
> got
> > this confused with part 8 where I kinda sorta did something similar (but
> not
> > that similar).
>
> (Maybe you had in mind the similar comment that used to be a few lines
> above this one and which you removed in patch 5?)
>

I think that's where I got confused.

Warner


> With a fixed commit message:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>

--000000000000bb761205d5bf5b07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 3:22 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 14 Jan 2022 at 06:38, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Jan 13, 2022 at 10:15 AM Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, 9 Jan 2022 at 16:26, Warner Losh &lt;<a href=3D"mailto:imp=
@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The code has moved in FreeBSD since the emulator was started,=
 update the<br>
&gt;&gt; &gt; comment to reflect that change. Remove now-redundant comment =
saying the<br>
&gt;&gt; &gt; same thing (but incorrectly).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 bsd-user/arm/target_arch_cpu.h | 2 +-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/ta=
rget_arch_cpu.h<br>
&gt;&gt; &gt; index 05b19ce6119..905f13aa1b9 100644<br>
&gt;&gt; &gt; --- a/bsd-user/arm/target_arch_cpu.h<br>
&gt;&gt; &gt; +++ b/bsd-user/arm/target_arch_cpu.h<br>
&gt;&gt; &gt; @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMSt=
ate *env)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int32_t syscall_nr =3D n;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* See arm/arm/trap.c cpu_fetch_syscall_args() */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* See arm/arm/syscall.c cpu_fetch_syscall_args() */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (syscall_nr =3D=3D TARGET_FREEBSD_NR_syscall) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_nr =3D env-&gt;regs[0];<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg1 =3D env-&gt;regs[1];<br>
&gt;&gt;<br>
&gt;&gt; Commit message says we&#39;re updating one comment and deleting a<=
br>
&gt;&gt; second one; code only does an update, no delete ?<br>
&gt;<br>
&gt;<br>
&gt; Commit is right, commit message is wrong. I&#39;ll fix the commit mess=
age. I got<br>
&gt; this confused with part 8 where I kinda sorta did something similar (b=
ut not<br>
&gt; that similar).<br>
<br>
(Maybe you had in mind the similar comment that used to be a few lines<br>
above this one and which you removed in patch 5?)<br></blockquote><div><br>=
</div><div>I think that&#39;s where I got confused.</div><div><br></div><di=
v>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
With a fixed commit message:<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000bb761205d5bf5b07--

