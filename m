Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD74A69E6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:25:15 +0100 (CET)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5KZ-0005iq-Qn
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0KE-0005yV-Vo
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:04:31 -0500
Received: from [2607:f8b0:4864:20::936] (port=38733
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0K9-0007ol-Rl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:04:30 -0500
Received: by mail-ua1-x936.google.com with SMTP id n15so15514306uaq.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ci7EjIgMCbzdSg6cmZntgT+S/pIvfSG+zZnq+psoKVU=;
 b=mpOsK0amxBrOoVt244mEzKvX9vjg6DXTS6xUEcgtaUt7AL2AFT1qy+ztNv7ISyyAqX
 DR+TmLeZbU/y91aQsVdfIbTDvFwq6Cyf6GSlL/WqlRnC1xvMIsxB0248vOAYcM/GDCkK
 Y5lH27YnEBR4qEOWWT4tQ7EA/z3wRmzM1sno4VWyULttHZZI9puw10CXpZWhVkCeKZxP
 7Tq//q8GTaIJFx3WmjUANlfxMVuXBJNzHg30fa8OGfrUTosEKhnbuc9R/UxaJb9t3eth
 yktReIWCGx1qXc93HAgheI+AD6WX00VJgaMmal+4zAtJ7pr3eM1cgkJ9ykR8GWQSFftR
 Z+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ci7EjIgMCbzdSg6cmZntgT+S/pIvfSG+zZnq+psoKVU=;
 b=bODuJsCLY0UYBBH0GftiiZAwwX0HPXwqlO0BGteNxRp6BMv8sD1n0wSVyzkX2Qp2eM
 zti6M5nLesJSv2Pr9EthdNtZ5Y8YnwdP374G5JbE1ZTlRa0UflWtyt+Vw8fY4GbvA+k9
 VicW9Nu6vaz+ipNtV1OCYvEwTqXVvvGszuDH4M8rG6ZOygL5RZVYmCMtmiYN+1kJTKgk
 nU4/flU2RrDqCeKD45LTzy1r0jQMH9BAXB4iTqATKTbWOgK2T+WYRW9PR9EV4TnEcuLX
 ZPqyFM7tS1cAtVHIJxHPR+cyYC1AL0xn9XnflDwffAh35ZbxZDsXUWlhxGdXAoRgV+7A
 7bog==
X-Gm-Message-State: AOAM530oIKOGcbByPOrrL6LKq3lw76L77C4CNjG8DXRoJMdeEJiEO/vy
 Dn+BCFzDBp3WUkjO0GXfiXaCW9S4lTSu+ln3jxUhUA==
X-Google-Smtp-Source: ABdhPJx+z+2DopGffCmiZvzCl9zFhWAiV3j+7vpLERQ4coAv1XZ2KuAli7UEPZgITVqnWW16C7TejAT/9yzUlKczKTA=
X-Received: by 2002:a67:33c9:: with SMTP id z192mr11023204vsz.42.1643749412151; 
 Tue, 01 Feb 2022 13:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20220131195636.31991-1-imp@bsdimp.com>
 <CAFEAcA9Fdn55E8qbzVb_SMLrwvuqsexXXGZA8A7D2qEcho07NA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Fdn55E8qbzVb_SMLrwvuqsexXXGZA8A7D2qEcho07NA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 14:03:21 -0700
Message-ID: <CANCZdfq47r5B8QZEOrqh5bBH3Z2D4OmQjTrUNhj_fMv4kpCX=Q@mail.gmail.com>
Subject: Re: [PULL 00/40] Bsd user arm 2022q1 patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cfbc3d05d6fb3be1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Konrad Witaszczyk <def@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cfbc3d05d6fb3be1
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 9:32 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 31 Jan 2022 at 19:56, Warner Losh <imp@bsdimp.com> wrote:
> >
> > The following changes since commit
> 7a1043cef91739ff4b59812d30f1ed2850d3d34e:
> >
> >   Merge remote-tracking branch
> 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-28
> 14:04:01 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-2022q1-pull-request
> >
> > for you to fetch changes up to 1103d59caaa82c94b4223a5429c31895d2f05217:
> >
> >   bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg name for
> CPUArchState args (2022-01-30 17:13:50 -0700)
> >
> > ----------------------------------------------------------------
> > bsd-user: upstream signal implementation
> >
> > Upstream the bsd-user fork signal implementation, for the most part.
> This
> > series of commits represents nearly all of the infrastructure that
> surround
> > signals, except the actual system call glue (that was also reworked in
> the
> > fork and needs its own series). In addition, this adds the sigsegv and
> sigbus
> > code to arm. Even in the fork, we don't have good x86 signal
> implementation,
> > so there's little to upstream for that at the moment.
> >
> > bsd-user's signal implementation is similar to linux-user's. The full
> context
> > can be found in the bsd-user's fork's 'blitz branch' at
> > https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz which shows
> how these
> > are used to implement various system calls. Since this was built from
> > linux-user's stack stuff, evolved for BSD with the passage of a few
> years, it
> > no-doubt missed some bug fixes from linux-user (though nothing obvious
> stood out
> > in the quick comparison I made). After the first round of reviews, many
> of these
> > improvements have been incorporated.
> >
> > Patchew history:
> https://patchew.org/QEMU/20220125012947.14974-1-imp@bsdimp.com/
> >
>
>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> for any user-visible changes.
>

There was a testing escape, so please see

[PATCH] bsd-user/signal.c: Only copy the _capsicum for FreeBSD_version >
1400026

that I just posted to fix the build on older FreeBSD systems.

Warner

--000000000000cfbc3d05d6fb3be1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 9:32 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Mon, 31 Jan 2022 at 19:56, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 7a1043cef91739ff4b59812d30f1ed2850d=
3d34e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/bonzini-gitlab/t=
ags/for-upstream&#39; into staging (2022-01-28 14:04:01 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-2022q1-pu=
ll-request<br>
&gt;<br>
&gt; for you to fetch changes up to 1103d59caaa82c94b4223a5429c31895d2f0521=
7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg n=
ame for CPUArchState args (2022-01-30 17:13:50 -0700)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; bsd-user: upstream signal implementation<br>
&gt;<br>
&gt; Upstream the bsd-user fork signal implementation, for the most part.=
=C2=A0 This<br>
&gt; series of commits represents nearly all of the infrastructure that sur=
round<br>
&gt; signals, except the actual system call glue (that was also reworked in=
 the<br>
&gt; fork and needs its own series). In addition, this adds the sigsegv and=
 sigbus<br>
&gt; code to arm. Even in the fork, we don&#39;t have good x86 signal imple=
mentation,<br>
&gt; so there&#39;s little to upstream for that at the moment.<br>
&gt;<br>
&gt; bsd-user&#39;s signal implementation is similar to linux-user&#39;s. T=
he full context<br>
&gt; can be found in the bsd-user&#39;s fork&#39;s &#39;blitz branch&#39; a=
t<br>
&gt; <a href=3D"https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu-bsd-user/qemu-=
bsd-user/tree/blitz</a> which shows how these<br>
&gt; are used to implement various system calls. Since this was built from<=
br>
&gt; linux-user&#39;s stack stuff, evolved for BSD with the passage of a fe=
w years, it<br>
&gt; no-doubt missed some bug fixes from linux-user (though nothing obvious=
 stood out<br>
&gt; in the quick comparison I made). After the first round of reviews, man=
y of these<br>
&gt; improvements have been incorporated.<br>
&gt;<br>
&gt; Patchew history: <a href=3D"https://patchew.org/QEMU/20220125012947.14=
974-1-imp@bsdimp.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew=
.org/QEMU/20220125012947.14974-1-imp@bsdimp.com/</a><br>
&gt;<br>
<br>
<br>
<br>
Applied, thanks.<br>
<br>
Please update the changelog at <a href=3D"https://wiki.qemu.org/ChangeLog/7=
.0" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/7.=
0</a><br>
for any user-visible changes.<br></blockquote><div><br></div><div>There was=
 a testing escape, so please see</div><table cellpadding=3D"0" class=3D"gma=
il-ajC" style=3D"border-spacing:0px;line-height:20px;font-family:Roboto,Rob=
otoDraft,Helvetica,Arial,sans-serif;font-size:14px"><tbody><tr class=3D"gma=
il-ajv"><td colspan=3D"2" tabindex=3D"0" class=3D"gmail-gL" style=3D"vertic=
al-align:top;width:auto;padding:2px 0px"><span class=3D"gmail-gI" style=3D"=
vertical-align:top"><br class=3D"gmail-Apple-interchange-newline">[PATCH] b=
sd-user/signal.c: Only copy the _capsicum for FreeBSD_version &gt; 1400026<=
br><br>that I just posted to fix the build on older FreeBSD systems.<br><br=
>Warner</span></td></tr></tbody></table><div>=C2=A0</div></div></div>

--000000000000cfbc3d05d6fb3be1--

