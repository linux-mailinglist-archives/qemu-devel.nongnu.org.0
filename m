Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A9417743
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:09:39 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmpW-0006Ks-EG
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTmnr-0004zp-H8
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:07:55 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTmno-0004F7-U0
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:07:55 -0400
Received: by mail-ua1-x930.google.com with SMTP id j19so1104650uag.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KodpJ/kT2lP+k5xPxJYuRtHtZpv6h/s1RYsMiYuf+Uc=;
 b=jShsp+Q2VMF/UnqFLWumiXZISJ0IIjIH1YqJYgh1DehQeAXc9xkdlmtiEquekl0ReQ
 GD/JSialvnf6+hFedAl83MqhB+VBWpr2W7WdQb4kfzaagIWr5toeiloCKh42nS8F1rBb
 i3tNepV9bXAbidpzwM4XxYlk30lKd3P4IiMW/5cQvMSl6gHOGpvDzNU2utrhLLszjSzi
 G3L/PQ0BvysKCAGA7ktL/u6CMGK1+BPhk31dQ3l9T4o/l4WbflVLyXjBQLk8cWnjzBFR
 mC/3DnICfpwfb3mNBfpp/q3ubD8C1XQTtrBoFmR60soepTOR4FYlOVdmIs+LXAGppFzk
 YLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KodpJ/kT2lP+k5xPxJYuRtHtZpv6h/s1RYsMiYuf+Uc=;
 b=u8DDdJVkJ39Hi+TyFC3CcgFS+wz62IEtM91jmC0KuKoHxm46sb39tmjAXDVgvMjxaF
 RDN1Jrkbcm4IwsPIohoO8nmrIice/jCDmQuI1Uw4qrn1i5OGDygAFjZmh6k63pEcVvcj
 fkhxNt9qgFJYBMEYEhxr+s2dkPBJnXpg+jkOkuHpvFB4lXCaryrtee7UwLZFjFiJ5Toy
 mB3pk9qJcE+uS9n1x15ZR/60GUzcOwjAhsN9yH9GVJTdmFE4HKMiIlUPn+7kb9akkvQE
 Ga4Ry3or1p80L1qgd581JQBh2bx3/8IZCdeOzPIniQy90kyWaPNqaFTHeQAMIGeqY/gj
 dEIw==
X-Gm-Message-State: AOAM533vqmRjJPBuZUDnhcS3oAWuo8AWaiXsrzcywEwL5mjsjSB0wbV4
 sB5TOM+Vug5FRIqscn2Z3HA854GScbCxJesrbBEwlg==
X-Google-Smtp-Source: ABdhPJyZjqOZgpIEbzot79Q4gOCNuV9j1vLUxNVX/EM9DiagS3fdEV9o91dKQUEWa4yxGi+qNlmSqOSaBulA4hOVjwU=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr1776830uae.85.1632496071143; 
 Fri, 24 Sep 2021 08:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-3-imp@bsdimp.com>
 <261b4ee5-07d0-ac11-21a6-a5e1c4865fe1@linaro.org>
In-Reply-To: <261b4ee5-07d0-ac11-21a6-a5e1c4865fe1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 24 Sep 2021 09:07:40 -0600
Message-ID: <CANCZdfoZTc=2B+-QauyByt-i-8LY6DDx9Ybwzi-BSq0JFvbC2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006b09e205ccbf1ca3"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b09e205ccbf1ca3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 5:59 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 9:56 PM, Warner Losh wrote:
> > From: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> >
> > Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
> > checking to pread's return value.
> >
> > Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/mmap.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > -        pread(fd, g2h_untagged(start), end - start, offset);
> > +        if (pread(fd, g2h_untagged(start), end - start, offset) =3D=3D=
 -1)
> > +            return -1;
>
> If it's not too annoying wrt rebasing other cleanups, please add the
> braces now.
>

You bet.


>
> r~
>

--0000000000006b09e205ccbf1ca3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 5:59 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 9:56 PM, Warner Losh wrote:<br>
&gt; From: Mika=C3=ABl Urankar &lt;<a href=3D"mailto:mikael.urankar@gmail.c=
om" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added=
<br>
&gt; checking to pread&#39;s return value.<br>
&gt; <br>
&gt; Signed-off-by: Mika=C3=ABl Urankar &lt;<a href=3D"mailto:mikael.uranka=
r@gmail.com" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c | 6 ++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pread(fd, g2h_untagged(start), end - star=
t, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pread(fd, g2h_untagged(start), end - =
start, offset) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
<br>
If it&#39;s not too annoying wrt rebasing other cleanups, please add the br=
aces now.<br></blockquote><div><br></div><div>You bet.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--0000000000006b09e205ccbf1ca3--

