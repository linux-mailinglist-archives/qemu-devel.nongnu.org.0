Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BAD489714
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:13:40 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6scM-0006Di-Ty
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6sai-0005Wh-9X
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:11:57 -0500
Received: from [2a00:1450:4864:20::436] (port=41799
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6sag-0003eY-0m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:11:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id v6so25966096wra.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 03:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SNZ1KI6LSWYpTqDoAixQnQjzi5rAp8ElxJiDynwMJvg=;
 b=W1+d9VLvG+PDVUyKe+s1fcatAwYankegsA3V5Tds8uUYHqRqdKvbJmKMXxxQN/FF6r
 UZ0JImYns7Hzf7oPv/1t4fdT6aZGa3ucuEk5UjMpnDyZCfo8Meanq7Vr+PSmyv1wHgwG
 Jnwm0Z7Ld1Y4HaR6QLoY31tqVwJJxVi4IYv55SwzedlGePf8ecB/Ze+33ZIVHCbjN94A
 +jCEQJmuO6GUrqLK+rh/xAdt9S61TvZpfYAc3/DdSAst9hp8lWdUzKebd3mE7FW7dxlD
 HJomOu/Yy0CCQFZFReYOlCQ8/cYMF/FY4HtK2q0Ksqxj3UhAmR+3/2dEQalhi2rz4sIX
 f7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SNZ1KI6LSWYpTqDoAixQnQjzi5rAp8ElxJiDynwMJvg=;
 b=K7bs7P93K0qHpLBgzRmkXujZggX/lIyO81C3csbXdAVcFceLAQ2EeXvtrdxEBiENwQ
 bgoENX83yMBSygWXkbRzujBHJje/HDZ/4WiFY36v+dndgpDm8uzJbG/5Q6v+nyR1TEpz
 BeuTRMwEAYmw7FEqMv07zhXj71G8mJtVDEGOGZKsKMIdgOf/zSSsiCA/XBBPxjusIaTF
 4jS9weaCymeH7QyTBZiQGqR224VSATzGPWU/JfTBiBdUI3cLbinDiCosDeD9inR+5w2b
 kLZj8YD/+nj5ySXFnw+Z/fOYUupv+iPLhUfTKEglQs1uHxmshVjYXcaYn8AXKczxaRJv
 gEgg==
X-Gm-Message-State: AOAM533EBXL+qt2+0D4UjATATfvjJd9wx6PVKJvUJe5NCX0cvBIXHOGg
 OIGX5+220aroYC8zRfkS5zzVZVF9VAojisagg1eYBg==
X-Google-Smtp-Source: ABdhPJx2f2ERcQhYuceLeTKsOQowd0EJOhlpmLNYUbfESNt8ZKBPYv9GYvVuJ2m3e474hDoawhYOAmf/JB9cjqX7ne4=
X-Received: by 2002:a05:6000:16c4:: with SMTP id
 h4mr63514306wrf.312.1641813111667; 
 Mon, 10 Jan 2022 03:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
In-Reply-To: <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 10 Jan 2022 12:11:40 +0100
Message-ID: <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000004f12d705d53867bb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>,
 Alistair Francis <Alistair.Francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004f12d705d53867bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> On 1/10/22 10:52, Philipp Tomsich wrote:
> > For RISC-V the opcode decode will change between different vendor
> > implementations of RISC-V (emulated by the same qemu binary).
> > Any two vendors may reuse the same opcode space, e.g., we may end up
> with:
> >
> > # *** RV64 Custom-3 Extension ***
> > {
> >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> |has_xventanacondops_p
> >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> |has_xventanacondops_p
> >   someone_something  ............ ..... 000 ..... 1100111 @i
> > |has_xsomeonesomething_p
> > }
> >
> > With extensions being enabled either from the commandline
> >     -cpu any,xventanacondops=3Dtrue
> > or possibly even having a AMP in one emulation setup (e.g. application
> > cores having one extension and power-mangement cores having a
> > different one =E2=80=94 or even a conflicting one).
>
> I understand, I think this is what MIPS does, see commit 9d005392390:
> ("target/mips: Introduce decodetree structure for NEC Vr54xx extension")
>

The MIPS implementation is functionally equivalent, and I could see us
doing something similar for RISC-V (although I would strongly prefer to
make everything explicit via the .decode-file instead of relying on people
being aware of the logic in decode_op).

With the growing number of optional extensions (as of today, at least the
Zb[abcs] and vector comes to mind), we would end up with a large number of
decode-files that will then need to be sequentially called from
decode_op(). The predicates can then move up into decode_op, predicting the
auto-generated decoders from being invoked.

As of today, we have predicates for at least the following:

   - Zb[abcs]
   - Vectors

As long as we are in greenfield territory (i.e. not dealing with
HINT-instructions that overlap existing opcode space), this will be fine
and provide proper isolation between the .decode-tables.
However, as soon as we need to implement something along the lines (I know
this is a bad example, as prefetching will be a no-op on qemu) of:

{
  {
    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
  }
  ori      ............     ..... 110 ..... 0010011 @i
}

we'd need to make sure that the generated decoders are called in the
appropriate order (i.e. the decoder for the specialized instructions will
need to be called first), which would not be apparent from looking at the
individual .decode files.

Let me know what direction we want to take (of course, I have a bias
towards the one in the patch).
Philipp.

--0000000000004f12d705d53867bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 11:03, Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 1/10/22 10:52, Philipp Tomsich wrote:<br>
&gt; For RISC-V the opcode decode will change between different vendor<br>
&gt; implementations of RISC-V (emulated by the same qemu binary).<br>
&gt; Any two vendors may reuse the same opcode space, e.g., we may end up w=
ith:<br>
&gt; <br>
&gt; # *** RV64 Custom-3 Extension ***<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0vt_maskc=C2=A0 =C2=A00000000=C2=A0 ..... ..... 110 ..... 1=
111011 @r |has_xventanacondops_p<br>
&gt;=C2=A0 =C2=A0vt_maskcn=C2=A0 0000000=C2=A0 ..... ..... 111 ..... 111101=
1 @r |has_xventanacondops_p<br>
&gt;=C2=A0 =C2=A0someone_something=C2=A0 ............ ..... 000 ..... 11001=
11 @i<br>
&gt; |has_xsomeonesomething_p<br>
&gt; }<br>
&gt; <br>
&gt; With extensions being enabled either from the commandline<br>
&gt;=C2=A0 =C2=A0 =C2=A0-cpu any,xventanacondops=3Dtrue<br>
&gt; or possibly even having a AMP in one emulation setup (e.g. application=
<br>
&gt; cores having one extension and power-mangement cores having a<br>
&gt; different one =E2=80=94 or even a conflicting one).<br>
<br>
I understand, I think this is what MIPS does, see commit 9d005392390:<br>
(&quot;target/mips: Introduce decodetree structure for NEC Vr54xx extension=
&quot;)<br></blockquote><div><br></div><div>The MIPS implementation is func=
tionally equivalent, and I could see us doing something similar for RISC-V =
(although I would strongly prefer to make everything explicit via the .deco=
de-file instead of relying on people being aware of the logic in decode_op)=
.</div><div><br></div><div>With the growing number of optional extensions (=
as of today, at least the Zb[abcs] and vector comes to mind), we would end =
up with a large number of decode-files that will then need to be sequential=
ly called from decode_op(). The predicates can then move up into decode_op,=
 predicting the auto-generated decoders from being invoked.</div><div><br><=
/div><div>As of today, we have predicates for at least the following:</div>=
<div><ul><li>Zb[abcs]</li><li>Vectors<br></li></ul><div>As long as we are i=
n greenfield territory (i.e. not dealing with HINT-instructions that overla=
p existing opcode space), this will be fine and provide proper isolation be=
tween the .decode-tables.</div></div><div>However, as soon as we need to im=
plement something along the lines (I know this is a bad example, as prefetc=
hing will be a no-op on qemu) of:<br></div></div><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>{</di=
v></div><div class=3D"gmail_quote"><div>=C2=A0 {</div></div><div class=3D"g=
mail_quote"><div>=C2=A0 =C2=A0 # *** RV32 Zicbop Sandard Extension (hints i=
n the ori-space) ***</div></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=
=A0 prefetch_i =C2=A0....... 00000 ..... 110 00000 0010011 @cbo_pref</div><=
/div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 prefetch_r =C2=A0.......=
 00001 ..... 110 00000 0010011 @cbo_pref</div></div><div class=3D"gmail_quo=
te"><div>=C2=A0 =C2=A0 prefetch_w =C2=A0....... 00011 ..... 110 00000 00100=
11 @cbo_pref</div></div><div class=3D"gmail_quote"><div>=C2=A0 }</div></div=
><div class=3D"gmail_quote"><div>=C2=A0 ori =C2=A0 =C2=A0 =C2=A0...........=
. =C2=A0 =C2=A0 ..... 110 ..... 0010011 @i</div></div><div class=3D"gmail_q=
uote"><div>}</div></div></blockquote><div class=3D"gmail_quote"><div>we&#39=
;d need to make sure that the generated decoders are called in the appropri=
ate order (i.e. the decoder for the specialized instructions will need to b=
e called first), which would not be apparent from looking at the individual=
 .decode files.</div><div><br></div><div>Let me know what direction we want=
 to take (of course, I have a bias towards the one in the patch).</div><div=
>Philipp.</div><div><br></div></div></div>

--0000000000004f12d705d53867bb--

