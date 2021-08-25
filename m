Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD83F7B37
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:08:58 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwOW-0004aM-TZ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwHW-00081k-11
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:01:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwHT-0001oC-Mg
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:01:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so15437739wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6nGxFKTw/YCUXneJ5zDE0ZNwkhU/nyhPZTNIMl287b0=;
 b=C92N4VXE2bgl/a5Ycfxz/m/ucSs9w9rkF/Y7/68gGUXKpBeUq2cD5EpGiV5NRf8Ojx
 ho/Crm0b2q2RJ2icIvoK/hjlgt6aWt3Ma3B/41STFYsf/L4Q6S1Zs7z+aOR5K1qRAwvD
 BXWdI3Hn8wn9nI8VlZtDQaiiCOaXGBv9mLxhJpKpLTfZq4BIo8sq/rEbe9gW3T5+HZW2
 I9W5KnDubr/3zGySBwMY8BQN+QY+fvJ6RO/SawBhVmAQsB+IsF1pZgIFSmZ1q0W/ztAJ
 ZGgpZSMuHf8EHVXd/dx5xFdSZhflKGXngdbPKq0+GxN7nzKL9UuY5LRoSLpNungi3oQp
 hY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6nGxFKTw/YCUXneJ5zDE0ZNwkhU/nyhPZTNIMl287b0=;
 b=LXJs5SfbZV9ZFwKaf7AmmRN5+1LdU94jT1A55WdepWr0QOIgMEOi7+dVcRSQqUTMeI
 vr3GeuhXSbg/W9TpzXsoOPQJxjasDA5Sz16Ysf54AbaWtikmb+ShcYG7fwcuUcUtnyre
 n0SAzkpzMsO4Wi5SnQpMefWrfJoOYe1CdbDvQS5V/e/XSD/JMzugczZ/VtKUDytmoGBg
 vpdmYHna36iVJ0kzoY1v51B6jHADsLt8sr7EPzgxKBi04VBljRJaT0OUNHiYP4hyfyxs
 0pbGBNeulfY/82ArosFqGjGSbilIBYOLRzVXtJrJ3+n+cWs+2kNwmILeo3x3XkIbknTQ
 w3fA==
X-Gm-Message-State: AOAM533l925Buf85VgYfFkais9/pJ3tDhR7FRWygks5D/Za+fzva1zsW
 VJnCgj8f+en7q89pyW1YlmJGxptkUZ9Z8uO38VpSrA==
X-Google-Smtp-Source: ABdhPJwIe2DVscxDPuoI2I1OUsQz6TW6EfZVu8WUHS7d2d0tDzzcy9LfAGnfmiJydBVvASHfKD/jWA8YbpTQwbn+11Q=
X-Received: by 2002:a05:600c:2186:: with SMTP id
 e6mr10116425wme.71.1629910894678; 
 Wed, 25 Aug 2021 10:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
 <20210823184248.2209614-8-philipp.tomsich@vrull.eu>
 <7c3e8e3a-62b4-532f-0682-52deb58ec0b9@linaro.org>
In-Reply-To: <7c3e8e3a-62b4-532f-0682-52deb58ec0b9@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 25 Aug 2021 19:01:23 +0200
Message-ID: <CAAeLtUCm8hsgPr2MigazL0hJNK47jAy5ZioC7KdEkLPTwCp-Fw@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] target/riscv: Add instructions of the
 Zbc-extension
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e49ff705ca6533c2"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e49ff705ca6533c2
Content-Type: text/plain; charset="UTF-8"

Resent as a v6 with this change and a bug-fix for orc.b.
This now again passes all of SPEC 2017 w/ a compiler that makes good use of
the Zb[abcs] instructions, including orc.b for string-functions.

On Wed, 25 Aug 2021 at 15:40, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/23/21 11:42 AM, Philipp Tomsich wrote:
> > +static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
> > +{
> > +    REQUIRE_ZBC(ctx);
> > +    return gen_arith(ctx, a, gen_helper_clmul);
> > +}
> > +
> > +
> > +static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
> > +{
> > +    REQUIRE_ZBC(ctx);
> > +    return gen_arith(ctx, a, gen_clmulh);
> > +}
> > +
> > +static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
> > +{
> > +    REQUIRE_ZBC(ctx);
> > +    return gen_arith(ctx, a, gen_helper_clmulr);
> > +}
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index fc22ae82d0..32a067dcd2 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -739,6 +739,12 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv
> arg2)
> >       tcg_gen_add_tl(ret, arg1, arg2);
> >   }
> >
> > +static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
> > +{
> > +     gen_helper_clmulr(dst, src1, src2);
> > +     tcg_gen_shri_tl(dst, dst, 1);
> > +}
> > +
>
> Put this immediately before its use in trans_rvb.c.inc.  I have patches to
> clean up the
> rest of the instances that still remain in translate.c.
>
> With that,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>

--000000000000e49ff705ca6533c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Resent as a v6 with this change and a bug-fix for orc.b.<d=
iv>This now again passes all of SPEC 2017 w/ a compiler that makes good use=
 of the Zb[abcs] instructions, including orc.b for string-functions.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, 25 Aug 2021 at 15:40, Richard Henderson &lt;<a href=3D"mailto:richar=
d.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 8/23/21 11:42 AM, Ph=
ilipp Tomsich wrote:<br>
&gt; +static bool trans_clmul(DisasContext *ctx, arg_clmul *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZBC(ctx);<br>
&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, gen_helper_clmul);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZBC(ctx);<br>
&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, gen_clmulh);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZBC(ctx);<br>
&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, gen_helper_clmulr);<br>
&gt; +}<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index fc22ae82d0..32a067dcd2 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -739,6 +739,12 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv =
arg2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_add_tl(ret, arg1, arg2);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gen_helper_clmulr(dst, src1, src2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tcg_gen_shri_tl(dst, dst, 1);<br>
&gt; +}<br>
&gt; +<br>
<br>
Put this immediately before its use in trans_rvb.c.inc.=C2=A0 I have patche=
s to clean up the <br>
rest of the instances that still remain in translate.c.<br>
<br>
With that,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
r~<br>
</blockquote></div>

--000000000000e49ff705ca6533c2--

