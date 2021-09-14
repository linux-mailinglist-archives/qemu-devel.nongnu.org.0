Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93F40ABA5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:28:04 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5fW-0005t2-RE
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mQ5cI-0003IK-3S
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:24:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mQ5cF-0001rN-Li
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:24:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2086329wml.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rhbKjs8WuAIbEe7aVlZSPHJFrApN/btjUpSjS9I1D8A=;
 b=RzzoTfrqNwXmGjjfpku1QOsk6asDzvDkkiQLrLybp5w+Hn1oqbrLfHNKUvt5gh8AG0
 xMhOggYV79pE2EVfUdN+CIM0KTxOR3zAf/MOtsU9jF/23eE4GMcyL096yNyvVFCePZui
 EIrHcJ0V/S7yuGNaYEjsrUdjqE1JQ9tK9uIxIK4uSktHLqkON+HrZhNUp9P+qeoEY0lj
 frSCWWjTcgqR0ZNAV0WmerCUClI/6ClbUMdk+rNpqRdJwoxRfPNwEQ41GDeKLS4PPCXo
 Uttnd5hcsh2y07e+ucilRU7BS7c6yWPwvJdspbfUFg8vYBWT64fJwBSWY5vZFtwRbIQB
 SEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rhbKjs8WuAIbEe7aVlZSPHJFrApN/btjUpSjS9I1D8A=;
 b=caUQvmnbLlRuEvxWbt4TB8F2g7xmRZ/86z21GHsEQ4w2eiun+5VRUCdKDb8Pyn2AwB
 nnLoIuQzIt6ncgzjbd7EbGUU3zxgJlA4VACecHBWHe/G/rERDDWG5oQmtEAGPI9aJIGV
 z9ZgIhsOkw39DramRzdQy1TSZr1nDr2ov0j/XJDLPi8pojbRC25c/RjJ571zMjL2XZsb
 KGoHAkkaXC8KZDZmWqyDeY2WhT027hGM6RE2lrSq6d7bLPNp9YQnULtC+GJb9mv+xxR9
 o+GKrMxeaFazH61knNJIhHk77RwN7PZNYH7YJ9ikHEtOoGf8wwlXLKjJDg7YaO9j35zx
 fiGA==
X-Gm-Message-State: AOAM530g2tamXvmQKxqrnuIzgXg7LHWvEFNY0PjbCWxLm8BSyertEzk0
 zzQ5aAtHYmUkvtk07eK5iC6X49KDyAp46PKB4X1Y/g==
X-Google-Smtp-Source: ABdhPJxnaPwuyakKaPXGLg3Q6bPgRi1rHTyGc54LO9DZi8+4ezcatsLSpLAsahylexJz+42n+furk2UFs7iGj0gSi/o=
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr1276831wmj.184.1631615076391; 
 Tue, 14 Sep 2021 03:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-4-philipp.tomsich@vrull.eu>
 <913941ad-2a84-f4a8-0a5a-c64bef026a6f@c-sky.com>
In-Reply-To: <913941ad-2a84-f4a8-0a5a-c64bef026a6f@c-sky.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 14 Sep 2021 12:24:25 +0200
Message-ID: <CAAeLtUBJB3-X9nXeyFcsHNgS+peZ+T_ZbAu0hwyaRDT9x69dzA@mail.gmail.com>
Subject: Re: [PATCH v11 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000009f11205cbf1fdc8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009f11205cbf1fdc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue 14. Sep 2021 at 11:15, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:

>
> On 2021/9/11 =E4=B8=8B=E5=8D=8810:00, Philipp Tomsich wrote:
> > Assume clzw being executed on a register that is not sign-extended, suc=
h
> > as for the following sequence that uses (1ULL << 63) | 392 as the opera=
nd
> > to clzw:
> >       bseti   a2, zero, 63
> >       addi    a2, a2, 392
> >       clzw    a3, a2
> > The correct result of clzw would be 23, but the current implementation
> > returns -32 (as it performs a 64bit clz, which results in 0 leading zer=
o
> > bits, and then subtracts 32).
>
> As the MSB word of  a3 has been cleaned,  the result of current
> implementation will be 23. So there is no
> error here.


Zhiwei,

bits [63:32] on rs (arg1) are not zero-extended, as ctx->w is not being set
(the EXT_ZERO doesn=E2=80=99t have any effect, unless ctx->w is true).  Ple=
ase see
the earlier discussion on this topic in v9 and v10.

Thanks,
Philipp.

Thanks,
> Zhiwei
>
> > Fix this by changing the implementation to:
> >   1. shift the original register up by 32
> >   2. performs a target-length (64bit) clz
> >   3. return 32 if no bits are set
> >
> > Marking this instruction as 'w-form' (i.e., setting ctx->w) would not
> > correctly model the behaviour, as the instruction should not perform
> > a zero-extensions on the input (after all, it is not a .uw instruction)
> > and the result is always in the range 0..32 (so neither a sign-extensio=
n
> > nor a zero-extension on the result will ever be needed).  Consequently,
> > we do not set ctx->w and mark the instruction as EXT_NONE.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >
> > Changes in v11:
> > - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performe=
d.
> >
> > Changes in v10:
> > - New patch, fixing correctnes for clzw called on a register with
> undefined
> >    (as in: not properly sign-extended) upper bits.
> >
> >   target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
> b/target/riscv/insn_trans/trans_rvb.c.inc
> > index 6c85c89f6d..73d1e45026 100644
> > --- a/target/riscv/insn_trans/trans_rvb.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> > @@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)
> >
> >   static void gen_clzw(TCGv ret, TCGv arg1)
> >   {
> > -    tcg_gen_clzi_tl(ret, arg1, 64);
> > -    tcg_gen_subi_tl(ret, ret, 32);
> > +    TCGv t =3D tcg_temp_new();
> > +    tcg_gen_shli_tl(t, arg1, 32);
> > +    tcg_gen_clzi_tl(ret, t, 32);
> > +    tcg_temp_free(t);
> >   }
> >
> >   static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
> >   {
> >       REQUIRE_64BIT(ctx);
> >       REQUIRE_EXT(ctx, RVB);
> > -    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
> > +    return gen_unary(ctx, a, EXT_NONE, gen_clzw);
> >   }
> >
> >   static void gen_ctzw(TCGv ret, TCGv arg1)
>

--00000000000009f11205cbf1fdc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue 14. Sep 2021 at 11:15, LIU Zhiwei &lt;<a href=3D"mai=
lto:zhiwei_liu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
On 2021/9/11 =E4=B8=8B=E5=8D=8810:00, Philipp Tomsich wrote:<br>
&gt; Assume clzw being executed on a register that is not sign-extended, su=
ch<br>
&gt; as for the following sequence that uses (1ULL &lt;&lt; 63) | 392 as th=
e operand<br>
&gt; to clzw:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bseti=C2=A0 =C2=A0a2, zero, 63<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addi=C2=A0 =C2=A0 a2, a2, 392<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clzw=C2=A0 =C2=A0 a3, a2<br>
&gt; The correct result of clzw would be 23, but the current implementation=
<br>
&gt; returns -32 (as it performs a 64bit clz, which results in 0 leading ze=
ro<br>
&gt; bits, and then subtracts 32).<br>
<br>
As the MSB word of=C2=A0 a3 has been cleaned,=C2=A0 the result of current <=
br>
implementation will be 23. So there is no<br>
error here.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Zhiwe=
i,</div><div dir=3D"auto"><br></div><div dir=3D"auto">bits [63:32] on rs (a=
rg1) are not zero-extended, as ctx-&gt;w is not being set (the EXT_ZERO doe=
sn=E2=80=99t have any effect, unless ctx-&gt;w is true).=C2=A0 Please see t=
he earlier discussion on this topic in v9 and v10.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Philipp.</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
Thanks,<br>
Zhiwei<br>
<br>
&gt; Fix this by changing the implementation to:<br>
&gt;=C2=A0 =C2=A01. shift the original register up by 32<br>
&gt;=C2=A0 =C2=A02. performs a target-length (64bit) clz<br>
&gt;=C2=A0 =C2=A03. return 32 if no bits are set<br>
&gt;<br>
&gt; Marking this instruction as &#39;w-form&#39; (i.e., setting ctx-&gt;w)=
 would not<br>
&gt; correctly model the behaviour, as the instruction should not perform<b=
r>
&gt; a zero-extensions on the input (after all, it is not a .uw instruction=
)<br>
&gt; and the result is always in the range 0..32 (so neither a sign-extensi=
on<br>
&gt; nor a zero-extension on the result will ever be needed).=C2=A0 Consequ=
ently,<br>
&gt; we do not set ctx-&gt;w and mark the instruction as EXT_NONE.<br>
&gt;<br>
&gt; Signed-off-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich@v=
rull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes in v11:<br>
&gt; - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be perform=
ed.<br>
&gt;<br>
&gt; Changes in v10:<br>
&gt; - New patch, fixing correctnes for clzw called on a register with unde=
fined<br>
&gt;=C2=A0 =C2=A0 (as in: not properly sign-extended) upper bits.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/in=
sn_trans/trans_rvb.c.inc<br>
&gt; index 6c85c89f6d..73d1e45026 100644<br>
&gt; --- a/target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt; @@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void gen_clzw(TCGv ret, TCGv arg1)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 tcg_gen_clzi_tl(ret, arg1, 64);<br>
&gt; -=C2=A0 =C2=A0 tcg_gen_subi_tl(ret, ret, 32);<br>
&gt; +=C2=A0 =C2=A0 TCGv t =3D tcg_temp_new();<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_shli_tl(t, arg1, 32);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_clzi_tl(ret, t, 32);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free(t);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static bool trans_clzw(DisasContext *ctx, arg_clzw *a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE_64BIT(ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVB);<br>
&gt; -=C2=A0 =C2=A0 return gen_unary(ctx, a, EXT_ZERO, gen_clzw);<br>
&gt; +=C2=A0 =C2=A0 return gen_unary(ctx, a, EXT_NONE, gen_clzw);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void gen_ctzw(TCGv ret, TCGv arg1)<br>
</blockquote></div></div>

--00000000000009f11205cbf1fdc8--

