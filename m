Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADE54A1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:56:09 +0200 (CEST)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0s2a-0004wQ-Oo
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o0s13-0004Dj-Gw
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:54:34 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o0s11-0005Dx-NN
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:54:33 -0400
Received: by mail-vs1-xe34.google.com with SMTP id f13so7228597vsp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TuAqi+AFzXNmeHf5cgq/+R41qubP/yNmXinN5w2x5rk=;
 b=oCORJ8YF+iIP0E6RgFarm2AQ+8HTy4ZPm7M9lsrtzr4kOkmKPMnp+Wssm2Jr5n/ims
 zjbDAgRYKPi+/ChjHkp5yU3e6vMKNhkn0wTHPqs3tsyGS6pZESUp+LGtWzGEdlJn88cp
 OdQFkDPxUYq6GpyIFwpI/ToDNrzgu730U7h/NV1pSx5sHFnW6MIuT60YILtDXT5re8Rm
 WAwES40g4nK6QjenF+p42J42Ma7JnNyAHUYXs/sST0PnefkVPeWNuMN4sI6DQo7+49bU
 tbVfM93YutKW7xn4zDcGSCK//SYk5LsmFoRDiCZYoJtpqxAzqloqKHgB+71pKbrrWw91
 o+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuAqi+AFzXNmeHf5cgq/+R41qubP/yNmXinN5w2x5rk=;
 b=ktnrl6ztR6+OHacb5gtnwQ4JoWHeMrgWEZayLFX2bJXnZyWR5hkm4/dpIQ9CC4JxZ0
 8HFIuTVs5/s2aKDqON28a3dYH/TY1majw+vX34IZaFoMKDo/y9r+XaiUO1ue3AC77WRj
 WXP4KEYwZeOlthjVDkuDSD/RGIx6l+jskOqQFY/leyq9UQJG0TUBzkkMu5Y1833TZ7s5
 8zYE6+vmb9uG+hu46C6E1g1m/OYs2WXGsyhJVWVDsGFpNMxzFxOs4+OF4I34sWftT1UE
 /Y1kV7bM/VJKBKaBoO3ECXNtUn2LWwNa/ebNUiYOWBuLWn2wdOrVjnHmVFVDF8Lh4R/z
 raVQ==
X-Gm-Message-State: AJIora/bTPw7KGMOD1HNIwp0I77LgHrjmyhjbuLRG2fRO7eBpPRxdCIu
 2lw6U8n4250W5m8reXUZOjo9Ya1RdRGb2w950T6UMQ==
X-Google-Smtp-Source: AGRyM1vK+gXQhDDKjwQc7knSMmkY6HTqFJSPAOn7toObYGEZk5Yx/OMpWw/WerW8Eed5g0ilH72sxpsVL8klC2jE5OU=
X-Received: by 2002:a67:ef46:0:b0:34b:d418:86c2 with SMTP id
 k6-20020a67ef46000000b0034bd41886c2mr615731vsr.19.1655157269337; Mon, 13 Jun
 2022 14:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-10-imp@bsdimp.com>
 <2d92ee55-0204-64f9-63d0-23a9f40b0490@linaro.org>
In-Reply-To: <2d92ee55-0204-64f9-63d0-23a9f40b0490@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 13 Jun 2022 15:54:18 -0600
Message-ID: <CANCZdfrb+LG2yNmipefi1urJi8SXvkozF0FEvrPGtuJPF5C=GQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] bsd-user: Implement dup and dup2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jessica Clarke <jrtc27@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Gleb Popov <arrowd@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000001629ba05e15b55e7"
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001629ba05e15b55e7
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 13, 2022 at 1:53 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/12/22 13:48, Warner Losh wrote:
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/bsd-file.h           | 14 ++++++++++++++
> >   bsd-user/freebsd/os-syscall.c |  8 ++++++++
> >   2 files changed, 22 insertions(+)
> >
> > diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> > index 500d6ba78b9..73263ba482f 100644
> > --- a/bsd-user/bsd-file.h
> > +++ b/bsd-user/bsd-file.h
> > @@ -491,4 +491,18 @@ static abi_long do_bsd___getcwd(abi_long arg1,
> abi_long arg2)
> >       return get_errno(ret);
> >   }
> >
> > +/* dup(2) */
> > +static abi_long do_bsd_dup(abi_long arg1)
> > +{
> > +
> > +    return get_errno(dup(arg1));
> > +}
> > +
> > +/* dup2(2) */
> > +static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
> > +{
> > +
> > +    return get_errno(dup2(arg1, arg2));
> > +}
>
> Extra lines.  Is this some setting in your editor?  Otherwise,
>

It's an odd quirk of FreeBSD's style from the 90s until 2020... I'm totally
blind to
it most of the time...


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks for this, and all the other reviews.

Warner

--0000000000001629ba05e15b55e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 13, 2022 at 1:53 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 6/12/22 13:48, Warner Losh wrote:<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/bsd-file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 14 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.c |=C2=A0 8 ++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 22 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h<br>
&gt; index 500d6ba78b9..73263ba482f 100644<br>
&gt; --- a/bsd-user/bsd-file.h<br>
&gt; +++ b/bsd-user/bsd-file.h<br>
&gt; @@ -491,4 +491,18 @@ static abi_long do_bsd___getcwd(abi_long arg1, ab=
i_long arg2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return get_errno(ret);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* dup(2) */<br>
&gt; +static abi_long do_bsd_dup(abi_long arg1)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return get_errno(dup(arg1));<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* dup2(2) */<br>
&gt; +static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return get_errno(dup2(arg1, arg2));<br>
&gt; +}<br>
<br>
Extra lines.=C2=A0 Is this some setting in your editor?=C2=A0 Otherwise,<br=
></blockquote><div><br></div><div>It&#39;s an odd quirk of FreeBSD&#39;s st=
yle from the 90s until 2020... I&#39;m totally blind to</div><div>it most o=
f the time...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Thanks for this, and all the other reviews.</div><d=
iv><br></div><div>Warner=C2=A0</div></div></div>

--0000000000001629ba05e15b55e7--

