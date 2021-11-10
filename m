Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4C44CD2A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 23:55:31 +0100 (CET)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwV8-0003Tj-GY
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 17:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwTo-0002eW-IH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:54:08 -0500
Received: from [2607:f8b0:4864:20::92f] (port=42551
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwTm-0006L9-CT
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:54:08 -0500
Received: by mail-ua1-x92f.google.com with SMTP id t13so8118908uad.9
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 14:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLriAuiKr1DPf2a/wIoYRfbemI9aa1LA+E7driEk05c=;
 b=XXzw+gEJ8l4NO3/y1YVtu/U3uOfHdhqaE7SO1yVxmGHu4NJlmyAvWXMtAdo6mmCRtG
 kGjZpHYlypn++UQ8rYS/MJWPFTBcr5rYvQlmAwe93A1tGm47clm3dYrxaIeoyAy4gWwG
 v5BZmQsjN1riUTvdlYIS4qx1/Lxzy2RoQd7kiWnemPL9kZpCdT6vFfI/jFmamCN27Owp
 kPwekk8HjRjkh01WFyI9/cBAqp5CVX5GM3b+Mek9I1yAmkVW3wkcwKoomRk2OjZtEtaL
 QN86eqdApsY3boXGZSOaX+vj9N+yR80Sp7OLIFnFInmbEC9JRf00yLOnnLH5nCdWEAFr
 41YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLriAuiKr1DPf2a/wIoYRfbemI9aa1LA+E7driEk05c=;
 b=vlNO+deOidcEGrqYm9RmDA88m0pTA72FyGyF1WljM9cWeBqv1MPmgRCi9uKAwdOgyF
 b6ws1ocste7jDTbvE09A+POg96roWigSnHXMFQMbdkit22tYGCUrqXoHSjIp1vW7vUok
 pA2x2lQo7nVCei/J2G75LCTjNc8e/Tarqu2jeX26aGhhwYisKHD1FgvRcqNCTIrtETL9
 wxKIkSnsyeNzk0ET6bldGJ0+vmtp9OceGTHvt1GGhMiKb6LnmJt/Fpw+y4IboJbj4mHu
 fFblf8XnalK5jUlkUrduz4xr9lDsBn9KhUywQ25ZCuOsf6DH7WzyV/WrR1ZHnYHvywT8
 saTA==
X-Gm-Message-State: AOAM533Xn4i8xjQpcu9pEq4WloYL5Zb3zBp3dJF3/FqD0J7XZXYDKzpP
 2Qsheawss/QD/2PXf1fXeSuGzAeDakeR/3Sn9k5emg==
X-Google-Smtp-Source: ABdhPJxmclicsrMM3sVmupyTgC4ancR4BmABasOOjRRgUTxuzJUqeSI46BfqrOqanDZOVMPPaO65YsGZr1yUL+HSeF0=
X-Received: by 2002:a67:fdc3:: with SMTP id l3mr3607694vsq.42.1636584844865;
 Wed, 10 Nov 2021 14:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-5-imp@bsdimp.com>
 <c9e84889-e365-6277-3a62-3a76c05075db@linaro.org>
In-Reply-To: <c9e84889-e365-6277-3a62-3a76c05075db@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 15:53:54 -0700
Message-ID: <CANCZdfotsf8j4wpNwaWYiuoAW+c_wf-qbo3aLbmKdQjebFphcA@mail.gmail.com>
Subject: Re: [RFC v2 4/6] common-user: Adjust system call return on FreeBSD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000052c85c05d0771aa7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052c85c05d0771aa7
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 9:59 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/10/21 5:31 PM, Warner Losh wrote:
> > All the *-users generally use the Linux style of negative return codes
> > for errno. FreeBSD returns errno, not -errno. Add ifdefs for FreeBSD to
> > make the adjustment on the 4 hosts that we have support for.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   common-user/host/aarch64/safe-syscall.inc.S | 5 +++++
> >   common-user/host/arm/safe-syscall.inc.S     | 5 +++++
> >   common-user/host/i386/safe-syscall.inc.S    | 5 +++++
> >   common-user/host/x86_64/safe-syscall.inc.S  | 5 +++++
> >   4 files changed, 20 insertions(+)
> >
> > diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> > index bc1f5a9792..6584950ccf 100644
> > --- a/common-user/host/aarch64/safe-syscall.inc.S
> > +++ b/common-user/host/aarch64/safe-syscall.inc.S
> > @@ -64,6 +64,11 @@ safe_syscall_start:
> >       svc     0x0
> >   safe_syscall_end:
> >       /* code path for having successfully executed the syscall */
> > +#ifdef __FreeBSD__
> > +        b.cc    2f              /* Convert to Linux -ERRNO convention */
> > +        neg     x0, x0
> > +2:
> > +#endif
>
> I think it should be a little odd to mention Linux.
>

Yea, from my view of hacking on Unix and Unix-derived systems for the
last 30 years, Linux is the outlier in returning -errno. However, the
'norms'
have shifted, I guess, so I'm happy with your suggestion...


> How about
>
>      /*
>       * FreeBSD kernel returns C bit set with positive errno.
>       * Encode this for use in bsd-user as -errno:
>       *    x0 = !c ? x0 : -x0
>       */
>      csneg  x0, x0, x0, cc
>

Ah, better assembler. Good!


>
> > +++ b/common-user/host/arm/safe-syscall.inc.S
> > @@ -78,6 +78,11 @@ safe_syscall_start:
> >       swi     0
> >   safe_syscall_end:
> >       /* code path for having successfully executed the syscall */
> > +#ifdef __FreeBSD__
> > +        bcc     2f
> > +        neg     r0, r0
>
>         negcs   r0, r0
>
> I just can't help myself.  :-)


I can relate... Really :)

I'll rework and resend in the next round.

Warner

--00000000000052c85c05d0771aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 10, 2021 at 9:59 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/10/21 5:31 PM, Warner Losh wrote:<br>
&gt; All the *-users generally use the Linux style of negative return codes=
<br>
&gt; for errno. FreeBSD returns errno, not -errno. Add ifdefs for FreeBSD t=
o<br>
&gt; make the adjustment on the 4 hosts that we have support for.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0common-user/host/aarch64/safe-syscall.inc.S | 5 +++++<br>
&gt;=C2=A0 =C2=A0common-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=
=A0| 5 +++++<br>
&gt;=C2=A0 =C2=A0common-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 5 =
+++++<br>
&gt;=C2=A0 =C2=A0common-user/host/x86_64/safe-syscall.inc.S=C2=A0 | 5 +++++=
<br>
&gt;=C2=A0 =C2=A04 files changed, 20 insertions(+)<br>
&gt; <br>
&gt; diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user=
/host/aarch64/safe-syscall.inc.S<br>
&gt; index bc1f5a9792..6584950ccf 100644<br>
&gt; --- a/common-user/host/aarch64/safe-syscall.inc.S<br>
&gt; +++ b/common-user/host/aarch64/safe-syscall.inc.S<br>
&gt; @@ -64,6 +64,11 @@ safe_syscall_start:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0svc=C2=A0 =C2=A0 =C2=A00x0<br>
&gt;=C2=A0 =C2=A0safe_syscall_end:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully execute=
d the syscall */<br>
&gt; +#ifdef __FreeBSD__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 b.cc=C2=A0 =C2=A0 2f=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Convert to Linux -ERRNO convention */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0x0, x0<br>
&gt; +2:<br>
&gt; +#endif<br>
<br>
I think it should be a little odd to mention Linux.<br></blockquote><div><b=
r></div><div>Yea, from my view of hacking on Unix and Unix-derived systems =
for the</div><div>last 30 years, Linux is the outlier in returning -errno. =
However, the &#39;norms&#39;</div><div>have shifted, I guess, so I&#39;m ha=
ppy with your suggestion...</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
How about<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * FreeBSD kernel returns C bit set with positive errno=
.<br>
=C2=A0 =C2=A0 =C2=A0 * Encode this for use in bsd-user as -errno:<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 x0 =3D !c ? x0 : -x0<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0csneg=C2=A0 x0, x0, x0, cc<br></blockquote><div><br></d=
iv><div>Ah, better assembler. Good!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +++ b/common-user/host/arm/safe-syscall.inc.S<br>
&gt; @@ -78,6 +78,11 @@ safe_syscall_start:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0swi=C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 =C2=A0safe_syscall_end:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully execute=
d the syscall */<br>
&gt; +#ifdef __FreeBSD__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcc=C2=A0 =C2=A0 =C2=A02f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0r0, r0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 negcs=C2=A0 =C2=A0r0, r0<br>
<br>
I just can&#39;t help myself.=C2=A0 :-)</blockquote><div><br></div><div>I c=
an relate... Really :)</div><div><br></div><div>I&#39;ll rework and resend =
in the next round.</div><div><br></div><div>Warner</div></div></div>

--00000000000052c85c05d0771aa7--

