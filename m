Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E44900A4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 04:54:31 +0100 (CET)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9J6E-0003IB-FF
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 22:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9J5P-0002VJ-Fn
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 22:53:39 -0500
Received: from [2607:f8b0:4864:20::92d] (port=34352
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9J5N-0008C8-HM
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 22:53:39 -0500
Received: by mail-ua1-x92d.google.com with SMTP id y4so28199127uad.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 19:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aI5qPQHeO1yScTcW1xawd8VmCAVRPgIeBcw1QLBSuHY=;
 b=cNx+hSuO/mwxeYDugBwMx8WVy1Gp095E+wGBTUSaFXK2uZf2tDqcnuSgWOinEqYWsA
 nIXUxjonsNk67dDghHKF/PRpblkQltBv1gWTCiAksAdJ0OaNngwfNvUj85616ZlYblSM
 /fk4LHnE1+IpKErYE4SFwJNZ0W8WmdMKoDY7VV4s1fzVPiXZ3+56BGTYkvpp2Ft1WDdY
 pUSiDKmPTEnj/cmOiBB7K0btXMpcj2q5xkmhz8JOYthiieMaoX9pk7nnrEYoCGv4CUxr
 OOml2CDEdmlQylWEWasLTq2f5WpBfx22O94xFioECVf7kYbAAUg/pyQ25VYQf5fGtP/i
 pT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aI5qPQHeO1yScTcW1xawd8VmCAVRPgIeBcw1QLBSuHY=;
 b=pWm+qL5LKA83Ej5ZG/jd7OvVMkBkn3RVofKDjN5ZZDHtyNi1gVFIm1e9sLLeIoo7Bz
 tx7Q5PVB/sFH5a7Arhj0YXlYOOTsLEivovYs39jw/Sx6JPwgzwCPk7fG9TsKejvyTm0E
 ReOsyJ20T20VC5UjwTc82K8nisHLS3UV1YlzsW3Q1W9F84uAyoQF1nrKcQGXMlL4Ywip
 y3HO7K0o7cnYC0Pwbv0FRLBu+ZD4TUfd/mSEU2QQTlGHnBZGT0tJV3g3S2hfTjxDXNpC
 OzLC/b+0Z5WNNguKYyhXfXPpqnaD1VmymwJGkRuxc8rBodvvNGJoFbRDQj79s3rcB8aB
 byiQ==
X-Gm-Message-State: AOAM532g+PJ9J+V8cdQ5jVa4MBYCQy0dMAgBYAia2DaUWohHJcTMpmnh
 b9X2tzhalFGd1Uwo4i86+mHhquhPgRHU4o0ckE3BJg==
X-Google-Smtp-Source: ABdhPJzkJ/wsvn6EtZ8Gk4L4NwOHyc3c+UH9EZ3Cj/Ow2qo9fnP9GZYUCmFeSUjRFfNrCR0b75WpWN2p3FhpXFjKn8Y=
X-Received: by 2002:a67:edc5:: with SMTP id e5mr7159642vsp.6.1642391615869;
 Sun, 16 Jan 2022 19:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-12-imp@bsdimp.com>
 <CAFEAcA9jUpf9r566_1Rb6FrMjyQA-B9f0dTrEoQXuTBXhoPyAA@mail.gmail.com>
In-Reply-To: <CAFEAcA9jUpf9r566_1Rb6FrMjyQA-B9f0dTrEoQXuTBXhoPyAA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 16 Jan 2022 20:53:32 -0700
Message-ID: <CANCZdfqPy6JKA4qmX=shPDqdFJZLAZxkMT7E_F5tdoTXa9zupw@mail.gmail.com>
Subject: Re: [PATCH 11/30] bsd-user/host/arm/host-signal.h: Implement
 host_signal_*
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d8a6f605d5bf1898"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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

--000000000000d8a6f605d5bf1898
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 12:32 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:33, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> > arm.
> >
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>
> > +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> > +{
> > +    /*
> > +     * In the FSR, bit 11 is WnR. FreeBSD returns this as part of the
> > +     * si_info.si_trapno which we don't have access to here.  We assume
> that uc
> > +     * is part of a trapframe and reach around to get to the si_info
> that's in
> > +     * the sigframe just before it, though this may be unwise.
> > +     */
>
> Yeah, that's pretty nasty. But this function is passed a
> siginfo_t pointer -- isn't that the one you need ?
>

Doh! I feel stupid now... You're right. This is a lot easier than I
thought. I'll fix that.

Warner


> > +    siginfo_t *si;
> > +    si = &((siginfo_t *)uc)[-1];
> > +    uint32_t fsr = si->si_trapno;
> > +
> > +    return extract32(fsr, 11, 1);
> > +}
>
> thanks
> -- PMM
>

--000000000000d8a6f605d5bf1898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 12:32 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:33, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement host_signal_pc, host_signal_set_pc and host_signal_write for=
<br>
&gt; arm.<br>
&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
&gt; +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* In the FSR, bit 11 is WnR. FreeBSD returns this=
 as part of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* si_info.si_trapno which we don&#39;t have acces=
s to here.=C2=A0 We assume that uc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* is part of a trapframe and reach around to get =
to the si_info that&#39;s in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the sigframe just before it, though this may be=
 unwise.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Yeah, that&#39;s pretty nasty. But this function is passed a<br>
siginfo_t pointer -- isn&#39;t that the one you need ?<br></blockquote><div=
><br></div><div>Doh! I feel stupid now... You&#39;re right. This is a lot e=
asier than I thought. I&#39;ll fix that.<br></div><div><br></div><div>Warne=
r<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; +=C2=A0 =C2=A0 siginfo_t *si;<br>
&gt; +=C2=A0 =C2=A0 si =3D &amp;((siginfo_t *)uc)[-1];<br>
&gt; +=C2=A0 =C2=A0 uint32_t fsr =3D si-&gt;si_trapno;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return extract32(fsr, 11, 1);<br>
&gt; +}<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000d8a6f605d5bf1898--

