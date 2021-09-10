Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253A406D24
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:50:20 +0200 (CEST)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgv5-0000XP-EF
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mOgsY-0007N7-I2
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:47:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mOgsK-00027R-Md
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:47:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x6so2703368wrv.13
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/SireHdATS8Pbhm9WvKkuymI9xKYWFbAOkuA1L8ruq8=;
 b=q+eqngHUhB+NVQqForNqsRawUtWRZm+7i78cjf8GjenWy8d2YhwWEDT2h6oYwtic8h
 murH/Gex0KDQhZPSGuzNBs3EYspMiWw1ZELO1t8+he0XrgvluRtrFZ4BFv1uve6awAH3
 qn1SRf8jx1bvw9Hh216oEkgbBRp6MFMiEHnz2q1fLPR5XgII3/1oY7w70dbEIzNCOT4n
 JepzbxnN8n5/aL5qIvT/O5GB94CTkmyEuSCZXFEIZhiJZj8zRyRvro25H/KGOdj1+JUK
 lNpq/p/RVIf5/J0KV1ALQP362FkjUBhUEYu8zQiAYyI0PZ31Odr/P4q03anIWjFMSTDe
 ja9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/SireHdATS8Pbhm9WvKkuymI9xKYWFbAOkuA1L8ruq8=;
 b=b+zRs+cMp1P4Ag0RNegYVTUMmE23BVVw4Igj7cwjSxPdTsjwk1ubYQAwS6DWOANXD9
 iM9ddQlfoDmid1SuN5A3qroefgZP4oKaEGo4wc8VYrgHUPYRGFDBxQPqaxsTybN+HNhr
 aysXALxh8nn0+Dcm+uNXckQRRI+6Lp+MHp4WRxTyS0GfupEwVk8VZSCd7xbLY+lBsLes
 DKjn4kZVlroNGyYVyiTrkUKECAIAkOvxuXMkSQ7+3fcsMczqhhkuP4fXPRUgycSEroGV
 2W9wzEJd5YbfCWPa+decT9m3/DpNp5PVij5JquHLnOHotjknpkzJtVgJXlbUrr5Avq/f
 dbEA==
X-Gm-Message-State: AOAM532Q5SFH84qpEsoBCeSgtREhC/36H1uj5MUuirqlOjSXvBp+Io0M
 9Ojm+60GQ+N77/TyOj9Btl1r8SH5BhynQGsSBh0zEZXrFSej86nU
X-Google-Smtp-Source: ABdhPJzx21obO5x23+IsZZmzVuxf8i/2PLpu+h+Q8hEuZp2pxYZ7UjgJYmQ1layMsjJ5r83aAl3pV2A1GzBTi/hMOLc=
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr9796631wrq.90.1631281646080; 
 Fri, 10 Sep 2021 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
 <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
 <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
 <CAAeLtUAstVXF563xWGP3DjPCdPaN4GO8kr5S5LXVQnWu8eqDZQ@mail.gmail.com>
 <641dcee6-0577-35e3-0b58-2acdc2b80c2d@linaro.org>
In-Reply-To: <641dcee6-0577-35e3-0b58-2acdc2b80c2d@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 10 Sep 2021 16:47:15 +0300
Message-ID: <CAAeLtUD2QL43+=F3F-HfZ7S2+7FLmsyvdWnr0GO5-aXKPUzGBA@mail.gmail.com>
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000b2c6c05cba45b12"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b2c6c05cba45b12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Sept 2021 at 16:40, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/10/21 3:36 PM, Philipp Tomsich wrote:
> > Richard,
> >
> > Did you have a chance to consider what to do with clzw?
> > I would prefer to avoid the extra extension instructions and change the
> implementation
> > (and would update the commit message to provide more context), but if
> you insist on
> > setting 'ctx->w' I'll just have the extra extensions emitted than delay
> this series further=E2=80=A6
>
> I don't mind not setting ctx->w, but bear in mind that UXL is going to
> automatically set
> this flag when executing RV32 on RV64.  That's why I have written a tcg
> patch set to
> eliminate unnecessary sign-extensions.
>

Ok, thanks!  Updated patches follow, once all test workloads have run=E2=80=
=A6

Just wondering regarding the UXL-comment: the clzw instruction will be an
illegal encoding for RV32 (the w-form instructions are present on RV64
only), so it should never be encountered in a RV32 instruction stream.  Did
you mean that clz (the instruction operating on xlen-registers) would have
ctx->w set for RV32 executing on RV64 ... or am I missing something
fundamental?

Philipp.

--0000000000000b2c6c05cba45b12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Sept 2021 at 16:40,=
 Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">rich=
ard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 9/10/21 3:36 PM, Philipp Tomsich wrote:<br>
&gt; Richard,<br>
&gt; <br>
&gt; Did you have a chance to consider what to do with clzw?<br>
&gt; I would prefer to avoid the extra extension instructions and change th=
e implementation <br>
&gt; (and would update the commit message to provide more context), but if =
you insist on <br>
&gt; setting &#39;ctx-&gt;w&#39; I&#39;ll just have the extra extensions em=
itted than delay this series further=E2=80=A6<br>
<br>
I don&#39;t mind not setting ctx-&gt;w, but bear in mind that UXL is going =
to automatically set <br>
this flag when executing RV32 on RV64.=C2=A0 That&#39;s why I have written =
a tcg patch set to <br>
eliminate unnecessary sign-extensions.<br></blockquote><div><br></div>Ok, t=
hanks!=C2=A0 Updated patches follow, once all test workloads have run=E2=80=
=A6</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ju=
st wondering regarding the UXL-comment: the clzw=C2=A0instruction will be a=
n illegal encoding for RV32 (the w-form instructions are present on RV64 on=
ly), so it should never be encountered in a RV32 instruction stream.=C2=A0 =
Did you mean that clz (the instruction operating on xlen-registers) would h=
ave ctx-&gt;w set for RV32 executing on RV64 ... or am I missing something =
fundamental?</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">Philipp.</div><div class=3D"gmail_quote"><br></div></div>

--0000000000000b2c6c05cba45b12--

