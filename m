Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B5499A05
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:48:25 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7CJ-0003Pe-KR
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nC7A4-00016e-8s
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:46:04 -0500
Received: from [2607:f8b0:4864:20::92d] (port=41901
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nC79x-0008SZ-Go
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:46:01 -0500
Received: by mail-ua1-x92d.google.com with SMTP id l1so31844544uap.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 13:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7Sq20bh3D6hXMajVd7tJmgE6pUXXTlqcMycj3pAdUk=;
 b=JEr9u19b/91MTdB8O9JVjvGpcVpI2oV21UMe7di7TYvUAfoaRUA9omUiTiJCzKS4se
 pTzfKWyI2hJroJLiQ7KRVg6onXEaJmnfo3BgAjatvKA1G/LJvHlzlthGuGrJMV9oR4eB
 /Cth1rd9goWKpbdjDQad4Nn0/+xHfGFce0uUo4V7FZOVcii1yp3kRIdioiLYuQz7CIWD
 0WHBvWVutSeN+wGhfxjLBgNY+UjTBLW9fLJdzxQR1/vE31AJcnLc8I5IbDSw0uGB4FIk
 a79lNUVXstcMapm3ni1ecfq8WtPrRzCg2lt6lWUuZQQ92AqDEtfYxk+4vLzIEJn/StQ5
 bMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7Sq20bh3D6hXMajVd7tJmgE6pUXXTlqcMycj3pAdUk=;
 b=QyGX51eOMu0kc2JxKyEJUMeE6t/hsCAKko9F/HPZJyAGgL6YuTNAfZLsQ61+xxvemZ
 rgLJcqRK/2HQ/I2TvbkEvrdYAIovJfd1cXzbRwTKQM0/E1SAg3XaaMOFLTucaRfVw3kd
 A6lFj9TqNtlPD2U8h6gpimI7EHWwCOYflF77ejUiqZzyPF7U0p5ylxqHX8nkyJS/XwqQ
 G4QRKt3tXDsGP5tI+6F54Ocq97ifAjBWZ1d6IpLqUPPjW9BX4+4rsmIZ1FaXuItnzhFu
 jBKKZ2fw/zCb5pimtNopoDbD7cWHSrfO9GRepLtNEpClDVXZhD1r4sD9TGLhsCBj/uEt
 SwFg==
X-Gm-Message-State: AOAM533fNwX+mpx71S9n3TLH4yhxrQ+xCEwGT7rHLuluUcqe/WcNRPaT
 rqNwlDwWrr8mt6n3VquIOKUMM/KjTQ49PUWBNlpa8w==
X-Google-Smtp-Source: ABdhPJyE89S4B/X+xVmi5H27kUA91ASanNu1TS79f/J/6Q9+KUVqQc0IpZCXUBrPOYMntJ9Z2cmMGckAq+Nr3dMIDdw=
X-Received: by 2002:a05:6102:3a12:: with SMTP id
 b18mr282325vsu.13.1643060742702; 
 Mon, 24 Jan 2022 13:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-17-imp@bsdimp.com>
 <594f2f8a-4cef-0bd1-f4ce-129d30dac311@linaro.org>
In-Reply-To: <594f2f8a-4cef-0bd1-f4ce-129d30dac311@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 24 Jan 2022 14:45:31 -0700
Message-ID: <CANCZdfqV7N8kpjvq9zX_qSALmJ8C0Z2_-z6q4c7QQhp9zYK-YQ@mail.gmail.com>
Subject: Re: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e9e2af05d65ae3e2"
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9e2af05d65ae3e2
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 23, 2022 at 7:05 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/10/22 3:19 AM, Warner Losh wrote:
> > +static inline void host_to_target_siginfo_noswap(target_siginfo_t
> *tinfo,
> > +        const siginfo_t *info)
> > +{
> > +    int sig, code;
> > +
> > +    sig = host_to_target_signal(info->si_signo);
>
> You now have a target signo, so...
>
> > +    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS ==
> sig ||
> > +            SIGTRAP == sig) {
>
> ... you need TARGET_SIGFOO in the comparision.
>
> Though, really, I think the categorization that Peter suggested is a
> better way to
> structure this.
>

How about both? Both is good? I've reworked based on Peter's suggestion, but
still have a need to be careful about target vs host signal numbers.
Thanks! I'd overlooked it.

Warner

--000000000000e9e2af05d65ae3e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 23, 2022 at 7:05 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 1/10/22 3:19 AM, Warner Losh wrote:<br>
&gt; +static inline void host_to_target_siginfo_noswap(target_siginfo_t *ti=
nfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const siginfo_t *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int sig, code;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sig =3D host_to_target_signal(info-&gt;si_signo);<br>
<br>
You now have a target signo, so...<br>
<br>
&gt; +=C2=A0 =C2=A0 if (SIGILL =3D=3D sig || SIGFPE =3D=3D sig || SIGSEGV =
=3D=3D sig || SIGBUS =3D=3D sig ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIGTRAP =3D=3D sig) {<br>
<br>
... you need TARGET_SIGFOO in the comparision.<br>
<br>
Though, really, I think the categorization that Peter suggested is a better=
 way to <br>
structure this.<br></blockquote><div><br></div><div>How about both? Both is=
 good? I&#39;ve reworked based on Peter&#39;s suggestion, but</div><div>sti=
ll have a need to be careful about target vs host signal numbers. Thanks! I=
&#39;d overlooked it.</div><div><br></div><div>Warner=C2=A0</div></div></di=
v>

--000000000000e9e2af05d65ae3e2--

