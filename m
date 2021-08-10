Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33C3E5122
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 04:45:23 +0200 (CEST)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDHla-0006mR-TL
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 22:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHkm-00067u-Oe
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:44:32 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHkl-0005GY-9S
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:44:32 -0400
Received: by mail-qt1-x82f.google.com with SMTP id z24so14336385qtn.8
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 19:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7odjHUtzyq0JscxEH5sCcZAFM2BoO9/c4GqUeKQnx2Y=;
 b=QQ+ClpV92wyRlWTuUm5o4F8PvYyAG82AObtxx4Ju0vQ2OCqKnV5Yi9YeTyLhyas7MO
 yjPiHpoID/boBhFYzs3f1sQVvLx8USP6QQdoopxEs7qjSs3eiylgos6T9EcXoxWaGT34
 yXpUf5SnJsITVLJh5AMSVx36NkDqKl0i0uATgykJRKm9zeX7Q+de3IFRmGW4Qhrztkfq
 SWahsUQTZ5dIYWGCu2GH/prKwEOsy+5RZjAzWcs7+qGZ7KiAbmbWYOPWsVplWUZCoPGl
 3i7pC7FMoprEjHn6b/YzqMH1WL0ZLK40BFO8SNN2gf96z2mIs0aYXLngYUgvHuSl2WCb
 80mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7odjHUtzyq0JscxEH5sCcZAFM2BoO9/c4GqUeKQnx2Y=;
 b=ENgKrO1gilzIoLT0gEjQHYrCj7PCj1BTiO2X3s/xCDDmRXZcSYqEeEUlxoqC+FMsA6
 ZhQENolWiFsKg7G7kKBQjOWC/y/uq1BNp+2JBmTNLt1+k2KJ1Rahx0q6adU3qxS04efC
 fTTVmL+4/Joc3hT1YC5hEz/EE/iRdU6CMclHy+HbJ1WXlFM/U2dZ5A0rSdeI5e7Fay6x
 DKUzIP+l8/lynFBzCLX3sORakEGOtN5HcZs2Woj5cFi2ecfLOW9aa9tTFULAg/S0bT3T
 YHcMiNJRcpPM0t6ZCVvtV1vZSIxDez2DPqOE8trvojH3GtwZpboPZ1IBHw+fWyvfL6Kf
 11dw==
X-Gm-Message-State: AOAM530bnxAu5WMACAwgDSMo16p5eG8xs6JaQyI2/jnqUIHlt1t0tVHp
 F5tAc+PxtiiEO9nP8REDMEyA7FS8aKDB50304bHHmQ==
X-Google-Smtp-Source: ABdhPJwoqJ0iNCqRtaGPI4tTogBFQteYyppxOF14tVOPRDRnOOHa9rxtUlUIjhWv3MV54jruIGAAAWC2eptnPr1L15c=
X-Received: by 2002:ac8:777a:: with SMTP id h26mr13078823qtu.235.1628563470210; 
 Mon, 09 Aug 2021 19:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-27-imp@bsdimp.com>
 <59d15760-3c49-e9d4-c6e3-f21a7b84e7ae@linaro.org>
In-Reply-To: <59d15760-3c49-e9d4-c6e3-f21a7b84e7ae@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 9 Aug 2021 20:44:19 -0600
Message-ID: <CANCZdfoT0VTpt0U9vPxzG-Ba8cbh_zWbys_ynGtdV95vThYwkg@mail.gmail.com>
Subject: Re: [PATCH for 6.2 26/49] bsd-user: Create target specific vmparam.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000022e8e805c92b7bee"
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82f.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022e8e805c92b7bee
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 9, 2021 at 2:39 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > +#define TARGET_MAXTSIZ  (128UL*1024*1024)   /* max text size */
> > +#define TARGET_DFLDSIZ  (128UL*1024*1024)   /* initial data size limit
> */
> > +#define TARGET_MAXDSIZ  (512UL*1024*1024)   /* max data size */
> > +#define TARGET_DFLSSIZ  (8UL*1024*1024)     /* initial stack size limit
> */
> > +#define TARGET_MAXSSIZ  (64UL*1024*1024)    /* max stack size */
> > +#define TARGET_SGROWSIZ (128UL*1024)        /* amount to grow stack */
>
> To-do list: KiB and MiB from units.h.
>

Easy enough to do now and merge to our main branch


> > +++ b/bsd-user/qemu.h
> > @@ -44,7 +44,7 @@ extern enum BSDType bsd_type;
> >   #include "target_arch.h"
> >   #include "syscall_defs.h"
> >   #include "target_syscall.h"
> > -//#include "target_os_vmparam.h"
> > +#include "target_os_vmparam.h"
> >   //#include "target_os_signal.h"
> >   //#include "hostdep.h"
>
> Ah, I see.  Well, perhaps just squash the addition of the include to the
> patch that
> introduces the include?
>

Good idea.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

thanks!

Warner

--00000000000022e8e805c92b7bee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 2:39 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; +#define TARGET_MAXTSIZ=C2=A0 (128UL*1024*1024)=C2=A0 =C2=A0/* max tex=
t size */<br>
&gt; +#define TARGET_DFLDSIZ=C2=A0 (128UL*1024*1024)=C2=A0 =C2=A0/* initial=
 data size limit */<br>
&gt; +#define TARGET_MAXDSIZ=C2=A0 (512UL*1024*1024)=C2=A0 =C2=A0/* max dat=
a size */<br>
&gt; +#define TARGET_DFLSSIZ=C2=A0 (8UL*1024*1024)=C2=A0 =C2=A0 =C2=A0/* in=
itial stack size limit */<br>
&gt; +#define TARGET_MAXSSIZ=C2=A0 (64UL*1024*1024)=C2=A0 =C2=A0 /* max sta=
ck size */<br>
&gt; +#define TARGET_SGROWSIZ (128UL*1024)=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* am=
ount to grow stack */<br>
<br>
To-do list: KiB and MiB from units.h.<br></blockquote><div><br></div><div>E=
asy enough to do now and merge to our main branch</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -44,7 +44,7 @@ extern enum BSDType bsd_type;<br>
&gt;=C2=A0 =C2=A0#include &quot;target_arch.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;syscall_defs.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;target_syscall.h&quot;<br>
&gt; -//#include &quot;target_os_vmparam.h&quot;<br>
&gt; +#include &quot;target_os_vmparam.h&quot;<br>
&gt;=C2=A0 =C2=A0//#include &quot;target_os_signal.h&quot;<br>
&gt;=C2=A0 =C2=A0//#include &quot;hostdep.h&quot;<br>
<br>
Ah, I see.=C2=A0 Well, perhaps just squash the addition of the include to t=
he patch that <br>
introduces the include?<br></blockquote><div><br></div><div>Good idea.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>thanks!</div><div><br></div><div>Warner=C2=A0</div>=
</div></div>

--00000000000022e8e805c92b7bee--

