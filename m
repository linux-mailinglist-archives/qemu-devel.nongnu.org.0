Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933714467A0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:13:44 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2md-00032d-Nc
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2i3-0004AY-G5
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:09:00 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:37696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2i1-0002uF-F0
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:08:59 -0400
Received: by mail-ua1-x92a.google.com with SMTP id l43so18327417uad.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbQHhaYp8FTpqPysPfme9O/tCiPncSFKKQH3ADep+Iw=;
 b=3+o9tCT6Ah+Q2bXL+HPpmfYGzQPYch2iWfWvKRz9FBiY/UznoIr7OlOoVWGYuqUgZg
 gsB2vn+oSqAzc3avNXYGZGXj1uj9mfTKUDvD6pKVNd6bBEKJd2Oxs+oyyMc806K0PaSH
 7NFNbyfXXEyC+eh/Vd+pkxoekzQoRDncp8oQDi3sUu5tVBfIpagUyZmavuaIMTghPIfK
 0RyIP99h2D3a8Ji8vD27oNGhuO/XeTswugtfVTsvQjW3FeWoOVQ2P8YGYQnNVZo+SZi3
 c0pL381Q4mrKv0qrN+uhCrLgwBRGVvrMeuthWM+8aHk7wfpgTDSAeAKOrNvmBXGH1HLL
 QR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbQHhaYp8FTpqPysPfme9O/tCiPncSFKKQH3ADep+Iw=;
 b=mN2quhUUHesMPI3pjw8Ea1dvTspRH5HelQXMOW69lrzPNJuoc57xQDqnb9rtclN97N
 3fnj0A5Ut56AbUulIF21xd+iKLGzU/sXMERYCUbabEMKVYFDoPOIbTHiruB3w3px79dU
 ccOyL3zRzI8Sba+V/WSgDjDw8NqvjzVrE152CC4zpksDNKPqqNO5T73J6qpb8iXUGlDc
 mW2Jc3qqBdkxN+NIWfnBGn8igjYh7RauZ8wqUrXJgMUp7iO2YJFYNLwn9yM1BlziGu5j
 qpMrZYWeUnT0tgJZ7xIlycxDUAkQtidtM40Pheb95g0yMUUrZExLixfKOh4FZQpHO5MI
 94og==
X-Gm-Message-State: AOAM533JwiqDZgsQZIfapM/lo5j1a39S1EdcfJo7sBuZvb8/IuBIKO9P
 2TPmYFS09mZh4CNWVYynI6K04YfLDNVpvFuwNs4r4w==
X-Google-Smtp-Source: ABdhPJxxSdKuU8qi2hr2iuTNB9q9p2n7SoJgg2vHIqy7qo4d9JsxBozxZx413woAl86Cjr06Po+fwGeSmLPSp4DXBKg=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr74222338vsh.30.1636132136300; 
 Fri, 05 Nov 2021 10:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-12-imp@bsdimp.com>
 <fd711f1c-380a-80f2-2382-ef5aaf3b697e@linaro.org>
In-Reply-To: <fd711f1c-380a-80f2-2382-ef5aaf3b697e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 5 Nov 2021 11:08:45 -0600
Message-ID: <CANCZdfqg-svHj-bUVSquxNRsnyvMK=_zoJMpT6WirNkxOoNtNA@mail.gmail.com>
Subject: Re: [PATCH v4 11/36] bsd-user/x86_64: Move functions into signal.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ca452105d00db274"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca452105d00db274
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 10:25 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 11:18 PM, Warner Losh wrote:
> > Move the current inline functions into sigal.c. This will increate the
> > flexibility of implementation in the future.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/x86_64/signal.c             | 56 +++++++++++++++++++++++++++-
> >   bsd-user/x86_64/target_arch_signal.h | 43 ++++-----------------
> >   2 files changed, 63 insertions(+), 36 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> > +abi_long set_sigtramp_args(CPUX86State *env, int sig,
> > +                           struct target_sigframe *frame,
> > +                           abi_ulong frame_addr,
> > +                           struct target_sigaction *ka);
> > +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
> flags);
> > +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
> srflag);
> > +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
> > +                                abi_ulong *target_uc);
>
> with of course the same comment as for i386.
>

of course... :)

Warner

--000000000000ca452105d00db274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 10:25 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/4/21 11:18 PM, Warner Losh wrote:<br>
&gt; Move the current inline functions into sigal.c. This will increate the=
<br>
&gt; flexibility of implementation in the future.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/x86_64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 56 +++++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0bsd-user/x86_64/target_arch_signal.h | 43 ++++------------=
-----<br>
&gt;=C2=A0 =C2=A02 files changed, 63 insertions(+), 36 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
&gt; +abi_long set_sigtramp_args(CPUX86State *env, int sig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigframe *frame,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong frame_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigaction *ka);<br>
&gt; +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
flags);<br>
&gt; +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
srflag);<br>
&gt; +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_s=
f,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong *target_uc);<br>
<br>
with of course the same comment as for i386.<br></blockquote><div><br></div=
><div>of course... :)</div><div><br></div><div>Warner</div></div></div>

--000000000000ca452105d00db274--

