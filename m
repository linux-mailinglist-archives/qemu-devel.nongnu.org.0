Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1D400591
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:11:44 +0200 (CEST)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEbF-000510-3h
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMEXt-0002kT-2A
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:08:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMEXq-0000kq-Rm
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:08:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i6so116086wrv.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmx0YDYLjxu3FFFZlXNS/SOVUaz9ecdAKQGM19plsbY=;
 b=frf3UsKCzTruXmVXa5di7nq90++ZEDieHDUw7qmpRZPNtsvVOSRr8HKAPtnN1bCUd6
 rHX/bBeXc6B2X3k8sEFYIGklJUx5e5btvnTU/LnKYQmwOTp1MnM5CZPVwos5n1DeeCo6
 af1SE4D28Aa0s0a8yCZr14uk34PdXEeMiQhgDMKcWifMIbjXNWQ2rk9q4VahzZezDgDc
 8ixufkBC5kU0vPPLsS3MeyZOE957SFWFTfpafBhukS1Bw9dQqHLOEkCpSlHWZKMy44Lc
 8MIJf2QHzjui585ISQVDPM9tM3K7/tziZDI+pS/VELoPAkHdrqE4LzgbTyKkGRvtkz6K
 HToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmx0YDYLjxu3FFFZlXNS/SOVUaz9ecdAKQGM19plsbY=;
 b=EGXchEdgW/hDSgaAzQwy27oWCJdSaILkfKTWwtXzH/4ucq9xB5CU9XZblfw6lE8PyR
 cO0SCk5Zz35PZb4FSwuEwnJpWzXffN2ptXHmSxxW+ZAdwYIf3s5w8oBgG6DeSCfUKXEW
 QPHIRuapB+jWBtGtaAMjHJJXoC+wiUsvREZ50fpV5qcMjLc1rTj/90WnRzEW5ps6mImR
 rUtbqxFoCg/g8hnWoEwLHO2r60T41MH9K1kSo4ohFZ4TYp3LS/axVC9xJVfigZLwL1XK
 msvfmSjkITEff23ie4RHi9/hIV2Zfglr99q8uEeUTkai7V/3G8me8jUqcA4ELbheCsHl
 y2IA==
X-Gm-Message-State: AOAM5328OkeVsh6SjW70Iw79UzOzvSO38KEyV5IdRsCs22jSdqbheVJN
 2R+4+SI37Va2nRXxlHX+5hr78+CG07oy4+zS3Umr7wyBEg7Wv8bZ534=
X-Google-Smtp-Source: ABdhPJwkiV0y6S4V0Up8vID99Eicxqmfv7J8/yim0PCLI6h4qiPuAEhRbWUhDQ4eXh8AyBw5ZDn6n1AM7GIlqJGkA68=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr598912wre.326.1630696088565; 
 Fri, 03 Sep 2021 12:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
 <20210903170100.2529121-4-philipp.tomsich@vrull.eu>
 <2970e9a3-f210-8d30-b875-4c8bc15ca3c1@linaro.org>
In-Reply-To: <2970e9a3-f210-8d30-b875-4c8bc15ca3c1@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 3 Sep 2021 22:07:57 +0300
Message-ID: <CAAeLtUB88X+RwXgUP_pKnN8Q4vUVvYn2jyriXf6FFEJZVz8FEQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/14] target/riscv: slli.uw is only a valid encoding
 if shamt first in 64 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000188b6505cb1c0521"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42f.google.com
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

--000000000000188b6505cb1c0521
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Sept 2021 at 21:45, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/3/21 7:00 PM, Philipp Tomsich wrote:
> > @@ -652,5 +652,15 @@ static bool trans_slli_uw(DisasContext *ctx,
> arg_slli_uw *a)
> >   {
> >       REQUIRE_64BIT(ctx);
> >       REQUIRE_ZBA(ctx);
> > +
> > +    /*
> > +     * The shamt field is only 6 bits for RV64 (with the 7th bit
> > +     * remaining reserved for RV128).  If the reserved bit is set
> > +     * on RV64, the encoding is illegal.
> > +     */
> > +    if (a->shamt >= TARGET_LONG_BITS) {
> > +        return false;
> > +    }
> > +
> >       return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
>
> As previously stated, drop this patch.
> It is done correctly inside gen_shift_imm_fn.


Good catch: I just looked through the changed translate.c and this does
address the slli.uw case.  I won't be able to retest this tonight, though.
I'll send the updated series as soon as possible, though.

--000000000000188b6505cb1c0521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 3 Sept 2021 at 21:45, Richard=
 Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hend=
erson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 9/3/21 7:00 PM, Philipp Tomsich wrote:<br>
&gt; @@ -652,5 +652,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_=
slli_uw *a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE_64BIT(ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE_ZBA(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* The shamt field is only 6 bits for RV64 (with t=
he 7th bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* remaining reserved for RV128).=C2=A0 If the res=
erved bit is set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* on RV64, the encoding is illegal.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (a-&gt;shamt &gt;=3D TARGET_LONG_BITS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return gen_shift_imm_fn(ctx, a, EXT_NONE, ge=
n_slli_uw);<br>
<br>
As previously stated, drop this patch.<br>
It is done correctly inside gen_shift_imm_fn.</blockquote><div><br></div><d=
iv>Good catch: I just looked through the changed translate.c and this does<=
/div><div>address the slli.uw case.=C2=A0 I won&#39;t be able to retest thi=
s tonight, though.</div><div>I&#39;ll send the updated series as soon as po=
ssible, though.</div></div></div>

--000000000000188b6505cb1c0521--

