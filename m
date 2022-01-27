Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9055949E94A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:51:36 +0100 (CET)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8vm-0003eB-8F
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD7qq-0005tZ-Tr
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:42:24 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=45704
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD7qp-0008IC-2M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:42:24 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id l14so963118vko.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/A0GV9gzIxfK7/P9mwAV2zMasIu6+KMafD61zNX7sw=;
 b=p7lAYtrarev2M2hBA+juXR4TNWlr4VQQ8cQuZvMUSIvo7MMuawRaiT286Y8ZbATrkh
 IEURUvCIMZA5LdKORLRaKngBKANgSCSPXUVD/9Y7xoKixWfaITkV1gn3OsC3FiFXoDNN
 w0KkO04t/aYyFFC+oDqomWmj0jzXI5eqvM2+08lDWnXfIfejvWIFZ1UShdf+KzFYw3s8
 QULwYDn3H7luNTOuVJCSUHpnujDONd7TPA/ZiWSleS1HHsWYjhbmzbb1Ji9lTsxkECqI
 T3yAqFHxy7ARgvX/54jvxbT/utt2cHbaXTXPKl5B9AO02XqeQYzhbyJKmNdeaCRvrCub
 7Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/A0GV9gzIxfK7/P9mwAV2zMasIu6+KMafD61zNX7sw=;
 b=WEmXCfZ6nmE0P2ZMlu7r/rd3xYKYjKbxVNlIOTv1lbPDPBt1gLqLBQZR2U2GZBh0ap
 PBJBvVRsXrhRMQRYm00OTcPplcqBfFc2R/9+4aIFv3sSqmVGv9Rc0oMUP8gxU6IlLTXX
 NN9rw6alR0ueYtu0lin88m0s+qshid6/c0n2xvJQpRiDaqyl+f/YNIM1gO1Ec3MAJf+o
 rlTgmrCmwGyjUPmkkiIpakbyMirbp/JhihssQSgKrQozFeQ90DRPfs51nxL0gmAki5in
 LozeXayTu18Cxq5+pj+yIinyQTWISfJGyHgGC5oKDAL20ItsiAt7PbUO+bnjk6TsxJFN
 5pbQ==
X-Gm-Message-State: AOAM531UoVQ3stYnq/vyLbQYpXaEVY4o4g4Kmeal6AbxVGwIJocXQgQJ
 Dm8jDqAHb73HVsLA9SUmbwguWadEVF1yPRl6qLY2gg==
X-Google-Smtp-Source: ABdhPJz56Yv52mOdCnAs4f3fdRSgBdIkNTflmXkRv20XogBd8DIccLdTkVqumDfYEEg2FwRyct4BRImgN9WA10SgI3g=
X-Received: by 2002:a05:6122:50d:: with SMTP id
 x13mr2054023vko.40.1643301741869; 
 Thu, 27 Jan 2022 08:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-4-imp@bsdimp.com>
 <03e3ca07-2aa3-c738-551d-2ac7e2c47483@linaro.org>
In-Reply-To: <03e3ca07-2aa3-c738-551d-2ac7e2c47483@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Jan 2022 09:42:10 -0700
Message-ID: <CANCZdfrujXXdTG+QtjeqXKbUN4yvEJLi1f5c1GU9RQD3k3qQ1A@mail.gmail.com>
Subject: Re: [PATCH v2 03/40] bsd-user/arm/signal.c: Implement
 setup_sigframe_arch for arm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000095521f05d6930067"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konrad Witaszczyk <def@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000095521f05d6930067
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 10:56 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/25/22 12:29, Warner Losh wrote:
> > Fix the broken context setting for arm. FreeBSD's get_mcontext does not
> > fill in the vfp info. It's filled in in sigframe(). This corresponds to
> > the new setup_sigframe_arch which fills in mcontext, then adjusts it to
> > point to the vfp context in the sigframe and fills in that context as
> > well. Add pointer to where this code is done.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/arm/signal.c               | 50 +++++++++++++++++++----------
> >   bsd-user/freebsd/target_os_signal.h |  2 +-
> >   2 files changed, 34 insertions(+), 18 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > diff --git a/bsd-user/freebsd/target_os_signal.h
> b/bsd-user/freebsd/target_os_signal.h
> > index 7491629477a..43700d08f71 100644
> > --- a/bsd-user/freebsd/target_os_signal.h
> > +++ b/bsd-user/freebsd/target_os_signal.h
> > @@ -4,7 +4,7 @@
> >   #include "target_os_siginfo.h"
> >   #include "target_arch_signal.h"
> >
> > -abi_long setup_sigframe_arch(CPUArchState *regs, abi_ulong frame_addr,
> > +abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,
> >                                struct target_sigframe *frame, int flags);
> >
> >   /* Compare to sys/signal.h */
>
> Should be in patch 2.
>

Yea, I back merged those changes after making them on blitz and landed it
in the
wrong spot. Good eye.

Warner


> r~
>

--00000000000095521f05d6930067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 10:56 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/25/22 12:29, Warner Losh wrote:<br>
&gt; Fix the broken context setting for arm. FreeBSD&#39;s get_mcontext doe=
s not<br>
&gt; fill in the vfp info. It&#39;s filled in in sigframe(). This correspon=
ds to<br>
&gt; the new setup_sigframe_arch which fills in mcontext, then adjusts it t=
o<br>
&gt; point to the vfp context in the sigframe and fills in that context as<=
br>
&gt; well. Add pointer to where this code is done.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 50 +++++++++++++++++++----------<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/target_os_signal.h |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 34 insertions(+), 18 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/ta=
rget_os_signal.h<br>
&gt; index 7491629477a..43700d08f71 100644<br>
&gt; --- a/bsd-user/freebsd/target_os_signal.h<br>
&gt; +++ b/bsd-user/freebsd/target_os_signal.h<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;target_os_siginfo.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;target_arch_signal.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -abi_long setup_sigframe_arch(CPUArchState *regs, abi_ulong frame_addr=
,<br>
&gt; +abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct target_sigframe *frame, in=
t flags);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Compare to sys/signal.h */<br>
<br>
Should be in patch 2.<br></blockquote><div><br></div><div>Yea, I back merge=
d those changes after making them on blitz and=C2=A0landed it in the</div><=
div>wrong spot. Good eye.</div><div><br></div><div>Warner</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000095521f05d6930067--

