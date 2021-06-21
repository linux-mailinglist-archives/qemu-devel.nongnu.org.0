Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC523AE516
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:39:50 +0200 (CEST)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFTB-0001nj-O4
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvFSF-00014e-Vh
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:38:52 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvFSE-0005xb-6A
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:38:51 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id dj3so7000482qvb.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+U9z5mx99xq5kR+vK1njABEMy+CI2V+DRH2XPdHwr4=;
 b=Pv21wyRQZ72qNWNRttiugF6S2w99vu0rVURRmFkqg69me8JYro0vBCxkUVxhBmmbfA
 JcIZBSo3G9LSrVJ002qVLhMbissbqpg/ydy1BsnqtOmxz8c2Oc7l9Ld7zxM6D92aLw2+
 i+4s38oOCwl3mrulBmQouc9o1ogUX1tFsfSsTApRpGoqW90bhzZHXVwA0YFS2DpPxrqE
 fxFEUGuYrEy0knC6zZPB3hrf+P94MsmteWkwFK243yQj/5Kb+i3Ok9eZj3I7fuhonAmk
 Zea8Y9jLmhw30bQ6dcHUCHA+scTLv6+WMPDgP28+W/SbACByMtPFmkQbfBNJMog0+iBq
 H1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+U9z5mx99xq5kR+vK1njABEMy+CI2V+DRH2XPdHwr4=;
 b=Jqh/tUAOjrnBcI9356Kico1DZHghUW7wudpW5mFXIreOVSRiGZcIU1DuIE4I6nqMFu
 TBpJUfyDN1FU2I8gLDk4ek/yTRm+MRF0Ofynz2CKvF3j5uZDnmmIHB/nWRqAAGjjRYeT
 2o83srlfSdAYbqj92QxDLdoEUPIe1PamJ7PR1SC3jC9naWQUU5b6J3PNYQFxJj01+yaH
 uQdBiO517f7Ie7hY6VhkEqs9ATtsWDY3v+FC+S0o2zN7fdjKmB7Avb/G5sCwQpC+ZJB/
 SZe3B6xOW1nmqJ0dBXLHwg8H9mJ0ruBdK/PLw20C8z2aBRn07zBJYZeQdYtOUxoGv7v1
 PhKw==
X-Gm-Message-State: AOAM533DS2QKFUtiN9whkeQ2NgGdZStCrIItFJwkeekaXn26GBoWDurY
 fQJJ0sCLs4jzV2s8EEY+KlZT7zLXwQWvexuSi6s=
X-Google-Smtp-Source: ABdhPJxifQgeMV8MS3Ha3OxUmKjilrRSFlqBcp6aZwh/3Y3OPo45CGIM3fibZTmY+dhlbSBSlk6m8H/F9l269q/FuyI=
X-Received: by 2002:ad4:5426:: with SMTP id g6mr18851913qvt.47.1624264729102; 
 Mon, 21 Jun 2021 01:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
 <20210620215022.1510617-4-richard.henderson@linaro.org>
 <CAK4993hJGbWG067n3cqOg5dBKkvPnEfL6k4appc+=smMQGP7mw@mail.gmail.com>
 <d6236689-c559-f9dd-00c7-a6ea7abed174@amsat.org>
In-Reply-To: <d6236689-c559-f9dd-00c7-a6ea7abed174@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 21 Jun 2021 11:38:13 +0300
Message-ID: <CAK4993j1DL4GoceM9JuG2_aTYJbX+AdHtRoVePRGr04dK6PbTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/avr: Convert to TranslatorOps
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000330df705c5429aca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000330df705c5429aca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The whole series.

On Mon, Jun 21, 2021 at 11:33 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Michael,
>
> On 6/21/21 7:38 AM, Michael Rolnik wrote:
> > Reviewed-by: Michael Rolnik <mrolnik@gmail.com <mailto:mrolnik@gmail.co=
m
> >>
> > Tested-by: Michael Rolnik <mrolnik@gmail.com <mailto:mrolnik@gmail.com>=
>
>
> Are your tags valid for the latest patch or the whole series?
>
> > On Mon, Jun 21, 2021 at 12:50 AM Richard Henderson
> > <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>>
> wrote:
> >
> >     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
> >     <mailto:richard.henderson@linaro.org>>
> >     ---
> >      target/avr/translate.c | 234
> ++++++++++++++++++++++-------------------
> >      1 file changed, 128 insertions(+), 106 deletions(-)
>
>

--=20
Best Regards,
Michael Rolnik

--000000000000330df705c5429aca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The whole series.<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 11:33 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Michael,<br>
<br>
On 6/21/21 7:38 AM, Michael Rolnik wrote:<br>
&gt; Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" t=
arget=3D"_blank">mrolnik@gmail.com</a> &lt;mailto:<a href=3D"mailto:mrolnik=
@gmail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt;&gt;<br>
&gt; Tested-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" tar=
get=3D"_blank">mrolnik@gmail.com</a> &lt;mailto:<a href=3D"mailto:mrolnik@g=
mail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt;&gt;<br>
<br>
Are your tags valid for the latest patch or the whole series?<br>
<br>
&gt; On Mon, Jun 21, 2021 at 12:50 AM Richard Henderson<br>
&gt; &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">=
richard.henderson@linaro.org</a> &lt;mailto:<a href=3D"mailto:richard.hende=
rson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Henderson &lt;<a href=3D"mai=
lto:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linar=
o.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0target/avr/translate.c | 234 ++++++++++++++++=
++++++-------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 128 insertions(+), 106 deleti=
ons(-)<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000330df705c5429aca--

