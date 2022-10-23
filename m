Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED2609888
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:13:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omk0m-0003js-Ma
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 19:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1omPMU-00072i-KU
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 21:01:11 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1omPMN-0007GD-5h
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 21:01:07 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 63so7448513ybq.4
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 18:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OQB31h/f7oxhL9xYPOAuqTWH3J9NzAV+OOP/48g+sZM=;
 b=sbI7KZ7McT7sdhBy7Wen7dpK4kUjgyX52xo4lkniikaA5pmGIvwn5rOKI2FSpzKyjC
 Y+9KLYPRlHosHfGCNAhK7zSkqqByZxh7GEyQgAy5/CrNM/JcTQ8Ra1B1Ycl/lKTHUW1k
 khIb/s39lPcejDPb9dDld/S6HFIGc5uiJX8deJdV7Za47YJW8yTjAtHx3uz6Xxa2bErz
 9DNeDYgryR/KF7hO0h6XSuxGegnUn+EuY+DJy793g7KLvrum+62oLtBX+EssjgZ1O8mf
 dFCgvbtLXjhhfCgpNlt9DtxyJ0hAhn4Sv/ylzdDhIAB39fXO0ZRnH4zrpd2gbKLUn6O8
 60MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQB31h/f7oxhL9xYPOAuqTWH3J9NzAV+OOP/48g+sZM=;
 b=SKyilgYttGd7Ze1qc/l6YZYpURCvngrmoCwc30V07kyM5HmZRQegX6/YdykgQRB82Q
 mWM8t3RT8gf6yvw7YcQ8Dym8uAOPhpVdi0MF37oUGs3dciJQ2IpNdv+/JcPrfhu7pVw3
 RUYTPfgdmlio03yhyfC1JrQg7CfP8xJWeVUbjD2osejYq/7+0ff3U3vCnUSD5CHP5QPO
 m5TVpXJiAx4sJxRI4OrjqgLc1SQdg8G27rfYJKZxQVynITUXSPX95g8CbeXyX3nR7d1H
 FHh2q0IPWXlZS9JQEfBEMJvJz1rkxzz5WdM/DKc+52v4PciTlbn/M0j8/AKelSNZ372D
 yZxg==
X-Gm-Message-State: ACrzQf0wLUeDFyuA30yP2GxaMWSLVCCnT4QnLAJW3Y8dgHNiEEdNPLhT
 NzOld1FZ/KbABrZ024SxlxZcnhIh0cl8TYLOVHgSYw==
X-Google-Smtp-Source: AMsMyM7sM40JvHtg4nnXsdmJ5ryUncSWWNw0EtK267ZXtRDdmQ+AC9rna4Lb1t56DQJQR9q8NT5nc+cRoHEpOJKGG10=
X-Received: by 2002:a5b:a0f:0:b0:691:6fea:deda with SMTP id
 k15-20020a5b0a0f000000b006916feadedamr23132024ybq.377.1666486853330; Sat, 22
 Oct 2022 18:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAG7Es25Xv=WmA3VbgB2DzMZ7D9XYLe9CAnA3q2mHxiKHONvjcg@mail.gmail.com>
 <2b16297e-5c4a-fcae-6385-1a30e4c3a817@linaro.org>
In-Reply-To: <2b16297e-5c4a-fcae-6385-1a30e4c3a817@linaro.org>
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Sat, 22 Oct 2022 21:00:42 -0400
Message-ID: <CAG7Es26=SX9ffj0GxVuB4L1G+FiU0tafD==pM84hWf6wZnjqJA@mail.gmail.com>
Subject: Re: [PATCH v2] Properly sign extend BBIT branch offset during
 calculation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-trivial@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: multipart/alternative; boundary="000000000000ea78c005eba934ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=cwrogg@umich.edu; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000ea78c005eba934ad
Content-Type: text/plain; charset="UTF-8"

I agree. Here is the corrected patch.
Signed-off-by: Christopher Wrogg <cwrogg@umich.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1251
---
 target/mips/tcg/octeon.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index 8929ad088e..0c787cb498 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -12,7 +12,7 @@
 # BBIT132    111110 ..... ..... ................

 %bbit_p      28:1 16:5
-BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p

 # Arithmetic
 # BADDU rd, rs, rt
--
2.30.2

On Thu, Oct 13, 2022 at 2:33 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/13/22 15:08, Christopher Wrogg wrote:
> > The Octeon specific BBIT instruction incorrectly computes
> > the branch offset. The 16 bit value is not sign extended.
> >
> > Signed-off-by: Christopher Wrogg <cwrogg@umich.edu <mailto:
> cwrogg@umich.edu>>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1251
> > <https://gitlab.com/qemu-project/qemu/-/issues/1251>
> > ---
> >   target/mips/tcg/octeon_translate.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/mips/tcg/octeon_translate.c
> b/target/mips/tcg/octeon_translate.c
> > index 6a207d2e7e..90f7b105cb 100644
> > --- a/target/mips/tcg/octeon_translate.c
> > +++ b/target/mips/tcg/octeon_translate.c
> > @@ -38,7 +38,10 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
> >       }
> >
> >       ctx->hflags |= MIPS_HFLAG_BC;
> > -    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
> > +    a->offset *= 4;
> > +    a->offset = (target_long)(int16_t)a->offset;
> > +    ctx->btarget = ctx->base.pc_next + 4 + a->offset;
>
> This looks wrong, because you're sign-extending after scaling, which gives
> you only 14
> bits of offset instead of 16.
>
> The correct fix should be earlier in decode:
>
> - BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
> + BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p
>
> to indicate a extract a signed field from the instruction.
>
>
> r~
>

--000000000000ea78c005eba934ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I agree. Here is the corrected patch.<div><span class=3D"g=
mail-im" style=3D"color:rgb(80,0,80)">Signed-off-by: Christopher Wrogg &lt;=
<a href=3D"mailto:cwrogg@umich.edu" target=3D"_blank">cwrogg@umich.edu</a>&=
gt;<br>Resolves:=C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/iss=
ues/1251" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/1=
251</a><br></span><div>---<br>=C2=A0target/mips/tcg/octeon.decode | 2 +-<br=
>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/ta=
rget/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode<br>index 8929ad=
088e..0c787cb498 100644<br>--- a/target/mips/tcg/octeon.decode<br>+++ b/tar=
get/mips/tcg/octeon.decode<br>@@ -12,7 +12,7 @@<br>=C2=A0# BBIT132 =C2=A0 =
=C2=A0111110 ..... ..... ................<br>=C2=A0<br>=C2=A0%bbit_p =C2=A0=
 =C2=A0 =C2=A028:1 16:5<br>-BBIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 11 set:1 . 10 =
rs:5 ..... offset:16 p=3D%bbit_p<br>+BBIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 11 se=
t:1 . 10 rs:5 ..... offset:s16 p=3D%bbit_p<br>=C2=A0<br>=C2=A0# Arithmetic<=
br>=C2=A0# BADDU rd, rs, rt<font color=3D"#888888"><br>--<br>2.30.2</font><=
/div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Oct 13, 2022 at 2:33 PM Richard Henderson &lt;<a href=3D=
"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/13/=
22 15:08, Christopher Wrogg wrote:<br>
&gt; The Octeon specific BBIT instruction incorrectly computes<br>
&gt; the branch offset. The 16 bit value is not sign extended.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Wrogg &lt;<a href=3D"mailto:cwrogg@umich.ed=
u" target=3D"_blank">cwrogg@umich.edu</a> &lt;mailto:<a href=3D"mailto:cwro=
gg@umich.edu" target=3D"_blank">cwrogg@umich.edu</a>&gt;&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/125=
1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1251</a> <br>
&gt; &lt;<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1251" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/1251</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/mips/tcg/octeon_translate.c | 5 ++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octe=
on_translate.c<br>
&gt; index 6a207d2e7e..90f7b105cb 100644<br>
&gt; --- a/target/mips/tcg/octeon_translate.c<br>
&gt; +++ b/target/mips/tcg/octeon_translate.c<br>
&gt; @@ -38,7 +38,10 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT =
*a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;hflags |=3D MIPS_HFLAG_BC;<br>
&gt; - =C2=A0 =C2=A0ctx-&gt;btarget =3D ctx-&gt;base.pc_next + 4 + a-&gt;of=
fset * 4;<br>
&gt; + =C2=A0 =C2=A0a-&gt;offset *=3D 4;<br>
&gt; + =C2=A0 =C2=A0a-&gt;offset =3D (target_long)(int16_t)a-&gt;offset;<br=
>
&gt; + =C2=A0 =C2=A0ctx-&gt;btarget =3D ctx-&gt;base.pc_next + 4 + a-&gt;of=
fset;<br>
<br>
This looks wrong, because you&#39;re sign-extending after scaling, which gi=
ves you only 14 <br>
bits of offset instead of 16.<br>
<br>
The correct fix should be earlier in decode:<br>
<br>
- BBIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011 set:1 . 10 rs:5 ..... offset:16 =
p=3D%bbit_p<br>
+ BBIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011 set:1 . 10 rs:5 ..... offset:s16=
 p=3D%bbit_p<br>
<br>
to indicate a extract a signed field from the instruction.<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000ea78c005eba934ad--

