Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19049E85C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:07:51 +0100 (CET)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8FQ-0008NS-OT
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6xN-0003Ql-8U
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:45:06 -0500
Received: from [2607:f8b0:4864:20::a29] (port=44547
 helo=mail-vk1-xa29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6xL-0007q8-27
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:45:04 -0500
Received: by mail-vk1-xa29.google.com with SMTP id b77so2082722vka.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3TUIQXUHPYRbuU1jxFEjYBebytI17VU5H4oIltyPJsE=;
 b=JXuW/QC6o+JgY+SHqC71KTdYao+SVJgdNtS6B5n5xvNoNQ7clu7kGwF/cdGGSlaH3g
 1r9Pgmr8zKgTIPEktr86jXcXbCqHiBDxHv3D72/gh4F0+3+Zv4RCYX6U+Pk5wy+uNO8i
 7UTRwKBVVspXuAjXQA5yBS4YuA2xmpTlnvCFqQgzzOA3cd1OCDYgXxDZAJIgmeAPz9gn
 YvwPNq5ptU9Q+zgkhF3lSHm0D7nQuZ2W/xWxJ9EVlbhm2iubEkfPvc0Ch1JcbUBkd5gl
 0vzDHV7vajNQo5DJpiEfMZohp/RqUTt0Y4Be5oGAoZuLbGfExgpUQWShpm32+VC3rny1
 5hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TUIQXUHPYRbuU1jxFEjYBebytI17VU5H4oIltyPJsE=;
 b=R+jXMnbtWWjTKtgtYD5iH/EfsDeKOo7xH43Ui5LSqeKfIyCrP25dxaJ/M4PXixHU4D
 2/MFa1TzXTregKnqFi7fQHlIf7Q3q7H8Od7oX7lU+K3hKRPOrmP66H/SR/EOKcCJdtGI
 ZICIcslLvPGZ6jUooflvqXypj+BFxe1/w9eFeBg4K1V4HNu6ZiQ70BRSiMl3jNmAdzH5
 Z2rg+7BxD30aKNCff8+ZZwErDhXtmvlcq5OH3O3/o6UUpAoHATbdgygDDeGPadBkyKfq
 pelEAW4Ls0Ne51WSXwJ2eHMdsAmXpp6NUWKozTFdVDc72CxfwFNTKcN9yblFYLB4tUkE
 y8Qg==
X-Gm-Message-State: AOAM532qwGAJ+bXoxJoT3ATmQYSLD7IwiU+/odFQFOHLtW4PHyWy0BI6
 6ovOqxT12r90zzo3ntkwVgNTtWBy68kgsl4cTiSXlg==
X-Google-Smtp-Source: ABdhPJxy5315yoYCZ+laj+pmGmKS1sTxqstGRw+eYvTYzNWPmvRgk5mYakuTXECRYm2pDN5pHDXz1tamd7tEHwENVw8=
X-Received: by 2002:a05:6122:181a:: with SMTP id
 ay26mr1765362vkb.5.1643298299883; 
 Thu, 27 Jan 2022 07:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-5-imp@bsdimp.com>
 <7f758325-524e-9deb-a440-3154e739c2a8@linaro.org>
In-Reply-To: <7f758325-524e-9deb-a440-3154e739c2a8@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Jan 2022 08:44:48 -0700
Message-ID: <CANCZdfp86gHpj-6kbm3siB54nKB_4Pc+CuRic6RejWNY8NTBRg@mail.gmail.com>
Subject: Re: [PATCH v2 04/40] bsd-user/arm/signal.c: get_mcontext should zero
 vfp data
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006cd9d305d692339a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa29.google.com
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

--0000000000006cd9d305d692339a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 10:59 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/25/22 12:29, Warner Losh wrote:
> > FreeBSD's get_mcontext doesn't return any vfp data. Instead, it zeros
> > out the vfp feilds (and all the spare fields). Impelement this
> > behavior. We're still missing the sysarch(ARM_GET_VFPCONTEXT) syscall,
> > though.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/arm/signal.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> > index 9026343b478..6eadc6e3c56 100644
> > --- a/bsd-user/arm/signal.c
> > +++ b/bsd-user/arm/signal.c
> > @@ -109,6 +109,14 @@ abi_long get_mcontext(CPUARMState *env,
> target_mcontext_t *mcp, int flags)
> >       gr[TARGET_REG_LR] = tswap32(env->regs[14]);
> >       gr[TARGET_REG_PC] = tswap32(env->regs[15]);
> >
> > +    /*
> > +     * FreeBSD's set_mcontext doesn't save VFP info, but blanks it out
> instead.
> > +     * Instead, sysarch(ARM_GET_VFPSTATE) is used instead.
> > +     */
>
> Could be rewritten with fewer "instead".  You wanted get_mcontext.
>

Yes. Instead is indeed over used over and over redundantly :)

Thanks!

Warner


> Otherwise,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>

--0000000000006cd9d305d692339a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 10:59 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/25/22 12:29, Warner Losh wrote:<br>
&gt; FreeBSD&#39;s get_mcontext doesn&#39;t return any vfp data. Instead, i=
t zeros<br>
&gt; out the vfp feilds (and all the spare fields). Impelement this<br>
&gt; behavior. We&#39;re still missing the sysarch(ARM_GET_VFPCONTEXT) sysc=
all,<br>
&gt; though.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/arm/signal.c | 8 ++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c<br>
&gt; index 9026343b478..6eadc6e3c56 100644<br>
&gt; --- a/bsd-user/arm/signal.c<br>
&gt; +++ b/bsd-user/arm/signal.c<br>
&gt; @@ -109,6 +109,14 @@ abi_long get_mcontext(CPUARMState *env, target_mc=
ontext_t *mcp, int flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gr[TARGET_REG_LR] =3D tswap32(env-&gt;regs[1=
4]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gr[TARGET_REG_PC] =3D tswap32(env-&gt;regs[1=
5]);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* FreeBSD&#39;s set_mcontext doesn&#39;t save VFP=
 info, but blanks it out instead.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Instead, sysarch(ARM_GET_VFPSTATE) is used inst=
ead.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Could be rewritten with fewer &quot;instead&quot;.=C2=A0 You wanted get_mco=
ntext.<br></blockquote><div><br></div><div>Yes. Instead is indeed over used=
=C2=A0over and over redundantly :)</div><div><br></div><div>Thanks!</div><d=
iv><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Otherwise,<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div>

--0000000000006cd9d305d692339a--

