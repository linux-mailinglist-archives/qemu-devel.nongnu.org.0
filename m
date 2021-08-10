Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8133E5116
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 04:36:35 +0200 (CEST)
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDHd3-0003bv-Vn
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 22:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHby-0002u4-Ed
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:35:26 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHbv-0006Wf-LB
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:35:26 -0400
Received: by mail-qk1-x735.google.com with SMTP id w197so19487796qkb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rn2rYErXAPSS+ZlyxXL3yb2fLDGBhBSmcBKkMdAL1tM=;
 b=VzL2tLe45nhQfLumZuCcdqiwla+efMAzF4mx+9069srsqwi0/QqD5ZnUJTaQMisDBf
 AaFAX6uUaQvs2aEz2r7HVx2UZD/WdQVxcCGe5LVvPu4tHcOjdB0JBGekOvPn2ib/eFx1
 cknknqmaG9LCm2dBD1Q4eRvxUMx5A+BaGA2KOhZlnh4QN1XGtJB0pjxZr+OV3IVsA3vx
 TYbiDD8G2uRQXWJfpzb9+Znm0S+CPF1U3a6dFbGAznQzMDSgE1wjYefIK9oRLcBSPJG+
 xJiWwT75SGDPtWmMPd+Ayocq1QW4f6ySUSREbKAkX1MFMR12YvE7fphtQneYWN42XFfb
 pxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rn2rYErXAPSS+ZlyxXL3yb2fLDGBhBSmcBKkMdAL1tM=;
 b=RCYq4eOjvNULx64qNobs30/YhjUoVAnQsCxk5D5iNl4fSWES+6t+N746yPRGNS2ocx
 nXaJDAGmaUeerzeZxA65JJ/3w7VkIWzBojV7+t85B4xKnxsDde3UWBFfpnREqoBF80G3
 Z3UpR+R9IY4TrtesE5ro1O2xTbf3rXDODUzpiFMrRA08MIfkqpCl/1CzmwAPaewilUh6
 LfKrU3OioNHDVB1pjmpF4aht94tSpXQ61/xZ0k0wFyISPkAFadL8+wt1mhuJKELmurz5
 qAfNtB497ytRgxGaeAUnlTGbvivHhEVwBV+SmvwuTIVuVYYt36SF9CCl+OqQhcOoSmSw
 JeFQ==
X-Gm-Message-State: AOAM531dxAzEtgjoJqNIpjpOZBnmMgfWR++B+MUexc414nHHHp5iPaMR
 5ZLZxDETTGUGJi24PTvSLjURqi+T/85u/ST7EMbzDw==
X-Google-Smtp-Source: ABdhPJwdQ3Fcc4KSI3yxaLJNzT0mjBWYVB+gaHaXUB+aoTcFFO8MzjpEd9F5FHGrMr791i9FKEaZUdU2cNGp8R4x/bg=
X-Received: by 2002:a37:9e46:: with SMTP id h67mr14214712qke.195.1628562921860; 
 Mon, 09 Aug 2021 19:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-25-imp@bsdimp.com>
 <530a8f22-9c21-c604-9be4-405ef1f93ba0@linaro.org>
In-Reply-To: <530a8f22-9c21-c604-9be4-405ef1f93ba0@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 9 Aug 2021 20:35:11 -0600
Message-ID: <CANCZdfpctydoWfYgVu30aNK_bOvfqUSwjE_ZByKFtt2m-LtW1w@mail.gmail.com>
Subject: Re: [PATCH for 6.2 24/49] bsd-user: Include more things in qemu.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000073c37705c92b5a80"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000073c37705c92b5a80
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 9, 2021 at 2:31 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > Include more header files to match bsd-user fork.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 6c4ec61d76..02e6e8327a 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -18,11 +18,15 @@
> >   #define QEMU_H
> >
> >
> > +#include "qemu/osdep.h"
> >   #include "cpu.h"
> >   #include "exec/cpu_ldst.h"
> > +#include "exec/exec-all.h"
> > +//#include "trace/trace-bsd_user.h"
> >
> >   #undef DEBUG_REMAP
> >   #ifdef DEBUG_REMAP
> > +#include <stdio.h>
> >   #endif /* DEBUG_REMAP */
>
> osdep.h will have included stdio.h.
>
> > +//#include "target_os_vmparam.h"
> > +//#include "target_os_signal.h"
> > +//#include "hostdep.h"
>
> Delete these?
>

Done. I'll post in v2.  Thanks!

Warner

--00000000000073c37705c92b5a80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 2:31 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Include more header files to match bsd-user fork.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h | 9 +++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 6c4ec61d76..02e6e8327a 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -18,11 +18,15 @@<br>
&gt;=C2=A0 =C2=A0#define QEMU_H<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
&gt; +#include &quot;exec/exec-all.h&quot;<br>
&gt; +//#include &quot;trace/trace-bsd_user.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#undef DEBUG_REMAP<br>
&gt;=C2=A0 =C2=A0#ifdef DEBUG_REMAP<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt;=C2=A0 =C2=A0#endif /* DEBUG_REMAP */<br>
<br>
osdep.h will have included stdio.h.<br>
<br>
&gt; +//#include &quot;target_os_vmparam.h&quot;<br>
&gt; +//#include &quot;target_os_signal.h&quot;<br>
&gt; +//#include &quot;hostdep.h&quot;<br>
<br>
Delete these?<br></blockquote><div><br></div><div>Done. I&#39;ll post in v2=
.=C2=A0 Thanks!</div><div><br></div><div>Warner</div></div></div>

--00000000000073c37705c92b5a80--

