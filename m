Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50B406CF4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:38:03 +0200 (CEST)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgjC-0006Kc-Jr
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mOghW-0004hH-7N
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:36:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mOghS-0002xn-Ms
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:36:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id n5so2660661wro.12
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C+dqxZ1jmgnV95OhuqA0NZRVNTqOwR5CueYrQ9kqk9w=;
 b=vfhEYTOTGEVBB4J0g9QKaFbxntLW/xTQ/SNgFi6uk48CE5nsbsG/P9tz9oFKKTmehy
 vELvDsqii9sSv0Fyw0UEpcAJcI3ALggIwYC8gCDFywQ3BWbQATIXjUnYFkPbatPArld0
 jiuyLRXeYpA1p9/SqzrvKPPtOLuTbvbAT/6+SHAT6O/7z9bIPl7V215SPNaF2eCXUfpS
 qEjfAOzKOK471PDEafKp0GriCmoDnaZ1c2n/Ku5TXJK0FCt5SdqOINZVkAVgH10W9HL4
 deC+A7oPm861kk4s20MOIXTXOc6EjbqaOoTHoaF6hAG6ZqyG7k8Jz1YIw/2ff210CvBd
 DVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+dqxZ1jmgnV95OhuqA0NZRVNTqOwR5CueYrQ9kqk9w=;
 b=rdi9Ygwt0ACN/y3lmLuyPFCnhSBycyWnLU5dhJcqEsN6avxgdE18snFWpRisnUVw9U
 zPSccUiWYqcABOUUDhSvSbOn7EIQAqMPd02Qll2520nJhkyzIAhbOFcocgCotm6pJ9c6
 aw5Rg3kycVFUCs5sb+Rx2Hd9U5+2D7vK/NMcrpgs2eWJYRRewDriVka4B7ZF2xy/YKvS
 IRGNWxhC1AdDYLXXbI06dqcvp9wxBg/s98bEsuVZmX+7tuwWhmLyoRpSrmjqEGTacxkS
 3mKsN5QVwflF4zn53CkMrsyqZxbjJOR0U/BBYsO5bf6i69qrGE6MMnVf6gE8TJJfQ8TG
 GTKw==
X-Gm-Message-State: AOAM532kgwJDuICdrPeTUk9IWovCRoif/tTTJ3JX8HMYY//BZiInoOxB
 dVp5Y/Vxt6v65GSijTQr9qZYH2RizDojBpr6X2FsZg==
X-Google-Smtp-Source: ABdhPJwyRfw/0x/ohJvvRfoK9u8oy48CoF1KVBXunwCKE0qcE9HKOvM0abhD6oqE0xkcaMNt/dMlZRoHzaPBpCTRYRg=
X-Received: by 2002:a5d:6750:: with SMTP id l16mr9745103wrw.174.1631280971493; 
 Fri, 10 Sep 2021 06:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
 <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
 <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
In-Reply-To: <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 10 Sep 2021 16:36:00 +0300
Message-ID: <CAAeLtUAstVXF563xWGP3DjPCdPaN4GO8kr5S5LXVQnWu8eqDZQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5c74405cba43216"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x436.google.com
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

--000000000000d5c74405cba43216
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard,

Did you have a chance to consider what to do with clzw?
I would prefer to avoid the extra extension instructions and change the
implementation (and would update the commit message to provide more
context), but if you insist on setting 'ctx->w' I'll just have the extra
extensions emitted than delay this series further=E2=80=A6

Thanks,
Philipp.

On Sun, 5 Sept 2021 at 12:01, Philipp Tomsich <philipp.tomsich@vrull.eu>
wrote:

> On Sun 5. Sep 2021 at 11:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 9/4/21 10:35 PM, Philipp Tomsich wrote:
> > > Assume clzw being executed on a register that is not sign-extended,
> such
> > > as for the following sequence that uses (1ULL << 63) | 392 as the
> operand
> > > to clzw:
> > >       bseti   a2, zero, 63
> > >       addi    a2, a2, 392
> > >       clzw    a3, a2
> > > The correct result of clzw would be 23, but the current implementatio=
n
> > > returns -32 (as it performs a 64bit clz, which results in 0 leading
> zero
> > > bits, and then subtracts 32).
> > >
> > > Fix this by changing the implementation to:
> > >   1. shift the original register up by 32
> > >   2. performs a target-length (64bit) clz
> > >   3. return 32 if no bits are set
> > >
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > ---
> > >
> > > Changes in v10:
> > > - New patch, fixing correctnes for clzw called on a register with
> undefined
> > >    (as in: not properly sign-extended) upper bits.
> >
> > But we have
> >
> >      return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
> >
> > should *not* be undefined.  Ah, what's missing is
> >
> >      ctx->w =3D true;
> >
> > within trans_clzw to cause the extend to take effect.
> >
> > There are a few other "w" functions that are missing that set, though
> they use EXT_NONE so
> > there is no visible bug, it would probably be best to set w anyway.
>
>
> I had originally considered that (it would have to be ctx->w =3D true;
> and EXT_SIGN),
> but that has the side-effect of performing an extension on the result
> of the clzw as
> well (i.e. bot get_gpr and set_gpr are extended).
>
> However, this is not what clzw does: it only ignores the upper bits
> and then produces
> a result in the value-range [0..32]. An extension on the result of
> either a clz or clzw
> is never needed (we have been fighting that problem in GCC and had to
> use patterns
> for the combiner), so I don't want to introduce this inefficiency in qemu=
.
>
> If you have EXT_SIGN (or _ZERO), we will end up with 2 additional
> extensions (one
> on the argument, one on the result) in addition to the 2 other tcg
> operations that we
> need (i.e. clzi/subi for the extending case, shli/clzi for the proposed
> fix).
>
> So I believe that this commit is the best fix:
> 1. It doesn't mark this as a w-form (i.e. ignores the high-bits on the
> input _and_
> extends the output), as it only treats the input as 32bit, but the
> output is xlen.
> 2. It doesn't introduce any unnecessary extensions, but handles the
> case in-place.
>
> Philipp.
>

--000000000000d5c74405cba43216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Richard,<div><br></div><div>Did you have =
a chance to consider what to do with clzw?</div><div>I would prefer to avoi=
d the extra extension instructions and change the implementation (and would=
 update the commit message to provide more context), but if you insist on s=
etting &#39;ctx-&gt;w&#39; I&#39;ll just have the extra extensions emitted =
than delay this series further=E2=80=A6<br></div><div><br></div><div>Thanks=
,<br>Philipp.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun, 5 Sept 2021 at 12:01, Philipp Tomsich &lt;<a hre=
f=3D"mailto:philipp.tomsich@vrull.eu">philipp.tomsich@vrull.eu</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun 5. Sep=
 2021 at 11:11, Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 9/4/21 10:35 PM, Philipp Tomsich wrote:<br>
&gt; &gt; Assume clzw being executed on a register that is not sign-extende=
d, such<br>
&gt; &gt; as for the following sequence that uses (1ULL &lt;&lt; 63) | 392 =
as the operand<br>
&gt; &gt; to clzw:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bseti=C2=A0 =C2=A0a2, zero, 63<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addi=C2=A0 =C2=A0 a2, a2, 392<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clzw=C2=A0 =C2=A0 a3, a2<br>
&gt; &gt; The correct result of clzw would be 23, but the current implement=
ation<br>
&gt; &gt; returns -32 (as it performs a 64bit clz, which results in 0 leadi=
ng zero<br>
&gt; &gt; bits, and then subtracts 32).<br>
&gt; &gt;<br>
&gt; &gt; Fix this by changing the implementation to:<br>
&gt; &gt;=C2=A0 =C2=A01. shift the original register up by 32<br>
&gt; &gt;=C2=A0 =C2=A02. performs a target-length (64bit) clz<br>
&gt; &gt;=C2=A0 =C2=A03. return 32 if no bits are set<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.toms=
ich@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; Changes in v10:<br>
&gt; &gt; - New patch, fixing correctnes for clzw called on a register with=
 undefined<br>
&gt; &gt;=C2=A0 =C2=A0 (as in: not properly sign-extended) upper bits.<br>
&gt;<br>
&gt; But we have<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return gen_unary(ctx, a, EXT_ZERO, gen_clzw);<br>
&gt;<br>
&gt; should *not* be undefined.=C2=A0 Ah, what&#39;s missing is<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;w =3D true;<br>
&gt;<br>
&gt; within trans_clzw to cause the extend to take effect.<br>
&gt;<br>
&gt; There are a few other &quot;w&quot; functions that are missing that se=
t, though they use EXT_NONE so<br>
&gt; there is no visible bug, it would probably be best to set w anyway.<br=
>
<br>
<br>
I had originally considered that (it would have to be ctx-&gt;w =3D true;<b=
r>
and EXT_SIGN),<br>
but that has the side-effect of performing an extension on the result<br>
of the clzw as<br>
well (i.e. bot get_gpr and set_gpr are extended).<br>
<br>
However, this is not what clzw does: it only ignores the upper bits<br>
and then produces<br>
a result in the value-range [0..32]. An extension on the result of<br>
either a clz or clzw<br>
is never needed (we have been fighting that problem in GCC and had to<br>
use patterns<br>
for the combiner), so I don&#39;t want to introduce this inefficiency in qe=
mu.<br>
<br>
If you have EXT_SIGN (or _ZERO), we will end up with 2 additional<br>
extensions (one<br>
on the argument, one on the result) in addition to the 2 other tcg<br>
operations that we<br>
need (i.e. clzi/subi for the extending case, shli/clzi for the proposed fix=
).<br>
<br>
So I believe that this commit is the best fix:<br>
1. It doesn&#39;t mark this as a w-form (i.e. ignores the high-bits on the<=
br>
input _and_<br>
extends the output), as it only treats the input as 32bit, but the<br>
output is xlen.<br>
2. It doesn&#39;t introduce any unnecessary extensions, but handles the<br>
case in-place.<br>
<br>
Philipp.<br>
</blockquote></div></div>

--000000000000d5c74405cba43216--

