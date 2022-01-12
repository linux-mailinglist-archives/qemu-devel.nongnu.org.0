Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095248C77B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:45:42 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7foi-0007c4-Vf
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n7fRB-00031x-Si
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:21:22 -0500
Received: from [2a00:1450:4864:20::42b] (port=37824
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n7fR9-00011L-30
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:21:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t28so4882691wrb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=meb5AL/9z4eIIqeq8HOcDiT5ngTo6b6vzigjqpXr6to=;
 b=d7IOQ/735fBPmGsHI3hvnEMmq6DjTysBweazJAcTQWUAqGMTu4C9JcbHc/d3ZBniYs
 xXaF/SzOqlncDXDlBDAzhumsheabUFd7uxI2dDhbgElny1N8YsOJ0GZI85oHZX80e/2P
 nL5xATXxPE693dAFN8mB7JwrwyWVc7cLiSl9t9r4qpBqZym/wUXAFQoU0BfR80wfZ45W
 HKu90sj/aSH4/SP75mfx7BsC0cu2iOyfOh0M7gXlDg2JuxRBvKdYTyurpsv+md++VFrh
 x6CzF22rbOEgzKYjJnxdJv8c/AH8lOZEWWiIF3M2BIbP2bQEvY/IvDNNt33s2aet5to4
 Slsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meb5AL/9z4eIIqeq8HOcDiT5ngTo6b6vzigjqpXr6to=;
 b=un50UAUcDZc8wvZSRGgw+z4MGlgJFOFTjszZ1mcj5z4SsKKvSW8wX7lwE2sLTTs2q8
 6hz5/iUH045sr1e+VpavEovhPsOWaUMieFIkLmV/B2QXkE9PnVQaHmtutt9qE4WM2oML
 wJoijvIyJmEgbO+CIqA2kuY4rSKjTRAWmId1A8+7VqqMVK6hrqCCb3xwh7g+cy3gubUu
 ryGZpT7KzjhGyqH9xTDH+aQFVDCtwBEyCeBrZP+nG3wDLQEOHngHZb53vJuuzykvyl/k
 6a2wOhAcELdjN/A9MJJygMZmflju4wg/fhZJIjJqEHc6HcFbNpyarKnScmCh0KuCCFYS
 GMgA==
X-Gm-Message-State: AOAM530tMMJySDa+j339m8TXLJyuwFHV8sy6JIPCzf01nXDT8bBWRehl
 LGgfXpKH9hoCkrkoQthMZoIgR0a97bWSiUrCyx4c8Q==
X-Google-Smtp-Source: ABdhPJzlqAhdKo+4NDOIQywdLEpMFfOuneKCDzoL6D+3sVC3JVZWmfJ05Zlkzu20DHIafYG+3Dde94881aia6mhqLYI=
X-Received: by 2002:adf:ef01:: with SMTP id e1mr178026wro.647.1642000876146;
 Wed, 12 Jan 2022 07:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
 <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
 <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
In-Reply-To: <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 12 Jan 2022 16:21:04 +0100
Message-ID: <CAAeLtUAiFhD0o1YAtz8R5uzn77Wj_LG8D2unAMrdmmRaMAYt-Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000f1a03d05d5641e97"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42b.google.com
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

--000000000000f1a03d05d5641e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alistair,

Do you (and the other RISC-V custodians of target/riscv) have any opinion
on this?
We can go either way =E2=80=94 and it boils down to a style and process que=
stion.

Thanks,
Philipp.

On Mon, 10 Jan 2022 at 12:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> On 1/10/22 12:11, Philipp Tomsich wrote:
> > On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org
> > <mailto:f4bug@amsat.org>> wrote:
> >
> >     On 1/10/22 10:52, Philipp Tomsich wrote:
> >     > For RISC-V the opcode decode will change between different vendor
> >     > implementations of RISC-V (emulated by the same qemu binary).
> >     > Any two vendors may reuse the same opcode space, e.g., we may end
> >     up with:
> >     >
> >     > # *** RV64 Custom-3 Extension ***
> >     > {
> >     >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> >     |has_xventanacondops_p
> >     >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> >     |has_xventanacondops_p
> >     >   someone_something  ............ ..... 000 ..... 1100111 @i
> >     > |has_xsomeonesomething_p
> >     > }
> >     >
> >     > With extensions being enabled either from the commandline
> >     >     -cpu any,xventanacondops=3Dtrue
> >     > or possibly even having a AMP in one emulation setup (e.g.
> application
> >     > cores having one extension and power-mangement cores having a
> >     > different one =E2=80=94 or even a conflicting one).
> >
> >     I understand, I think this is what MIPS does, see commit 9d00539239=
0:
> >     ("target/mips: Introduce decodetree structure for NEC Vr54xx
> extension")
> >
> >
> > The MIPS implementation is functionally equivalent, and I could see us
> > doing something similar for RISC-V (although I would strongly prefer to
> > make everything explicit via the .decode-file instead of relying on
> > people being aware of the logic in decode_op).
> >
> > With the growing number of optional extensions (as of today, at least
> > the Zb[abcs] and vector comes to mind), we would end up with a large
> > number of decode-files that will then need to be sequentially called
> > from decode_op(). The predicates can then move up into decode_op,
> > predicting the auto-generated decoders from being invoked.
> >
> > As of today, we have predicates for at least the following:
> >
> >   * Zb[abcs]
> >   * Vectors
> >
> > As long as we are in greenfield territory (i.e. not dealing with
> > HINT-instructions that overlap existing opcode space), this will be fin=
e
> > and provide proper isolation between the .decode-tables.
> > However, as soon as we need to implement something along the lines (I
> > know this is a bad example, as prefetching will be a no-op on qemu) of:
> >
> >     {
> >       {
> >         # *** RV32 Zicbop Sandard Extension (hints in the ori-space) **=
*
> >         prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
> >         prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
> >         prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
> >       }
> >       ori      ............     ..... 110 ..... 0010011 @i
> >     }
> >
> > we'd need to make sure that the generated decoders are called in the
> > appropriate order (i.e. the decoder for the specialized instructions
> > will need to be called first), which would not be apparent from looking
> > at the individual .decode files.
> >
> > Let me know what direction we want to take (of course, I have a bias
> > towards the one in the patch).
>
> I can't say for RISCV performance, I am myself biased toward maintenance
> where having one compilation unit per (vendor) extension.
> ARM and MIPS seems to go in this direction, while PPC and RISCV in the
> other one.
>

--000000000000f1a03d05d5641e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alistair,<div><br></div><div>Do you (and the other RISC-V =
custodians of target/riscv) have any opinion on this?</div><div>We can go e=
ither way =E2=80=94 and it boils down to a style and process question.</div=
><div><br></div><div>Thanks,<br>Philipp.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 12:30,=
 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@a=
msat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 1/10/22 12:11, Philipp Tomsich wrote:<br>
&gt; On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/10/22 10:52, Philipp Tomsich wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; For RISC-V the opcode decode will change betwe=
en different vendor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; implementations of RISC-V (emulated by the sam=
e qemu binary).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Any two vendors may reuse the same opcode spac=
e, e.g., we may end<br>
&gt;=C2=A0 =C2=A0 =C2=A0up with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # *** RV64 Custom-3 Extension ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0vt_maskc=C2=A0 =C2=A00000000=C2=A0=
 ..... ..... 110 ..... 1111011 @r<br>
&gt;=C2=A0 =C2=A0 =C2=A0|has_xventanacondops_p<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0vt_maskcn=C2=A0 0000000=C2=A0 ....=
. ..... 111 ..... 1111011 @r<br>
&gt;=C2=A0 =C2=A0 =C2=A0|has_xventanacondops_p<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0someone_something=C2=A0 ..........=
.. ..... 000 ..... 1100111 @i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; |has_xsomeonesomething_p<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; With extensions being enabled either from the =
commandline<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-cpu any,xventanacondops=3D=
true<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; or possibly even having a AMP in one emulation=
 setup (e.g. application<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; cores having one extension and power-mangement=
 cores having a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; different one =E2=80=94 or even a conflicting =
one).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I understand, I think this is what MIPS does, see c=
ommit 9d005392390:<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&quot;target/mips: Introduce decodetree structure =
for NEC Vr54xx extension&quot;)<br>
&gt; <br>
&gt; <br>
&gt; The MIPS implementation is functionally equivalent, and I could see us=
<br>
&gt; doing something similar for RISC-V (although I would strongly prefer t=
o<br>
&gt; make everything explicit via the .decode-file instead of relying on<br=
>
&gt; people being aware of the logic in decode_op).<br>
&gt; <br>
&gt; With the growing number of optional extensions (as of today, at least<=
br>
&gt; the Zb[abcs] and vector comes to mind), we would end up with a large<b=
r>
&gt; number of decode-files that will then need to be sequentially called<b=
r>
&gt; from decode_op(). The predicates can then move up into decode_op,<br>
&gt; predicting the auto-generated decoders from being invoked.<br>
&gt; <br>
&gt; As of today, we have predicates for at least the following:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Zb[abcs]<br>
&gt;=C2=A0 =C2=A0* Vectors<br>
&gt; <br>
&gt; As long as we are in greenfield territory (i.e. not dealing with<br>
&gt; HINT-instructions that overlap existing opcode space), this will be fi=
ne<br>
&gt; and provide proper isolation between the .decode-tables.<br>
&gt; However, as soon as we need to implement something along the lines (I<=
br>
&gt; know this is a bad example, as prefetching will be a no-op on qemu) of=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 # *** RV32 Zicbop Sandard Extension (=
hints in the ori-space) ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 prefetch_i =C2=A0....... 00000 ..... =
110 00000 0010011 @cbo_pref<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 prefetch_r =C2=A0....... 00001 ..... =
110 00000 0010011 @cbo_pref<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 prefetch_w =C2=A0....... 00011 ..... =
110 00000 0010011 @cbo_pref<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 ori =C2=A0 =C2=A0 =C2=A0............ =C2=A0 =
=C2=A0 ..... 110 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; we&#39;d need to make sure that the generated decoders are called in t=
he<br>
&gt; appropriate order (i.e. the decoder for the specialized instructions<b=
r>
&gt; will need to be called first), which would not be apparent from lookin=
g<br>
&gt; at the individual .decode files.<br>
&gt; <br>
&gt; Let me know what direction we want to take (of course, I have a bias<b=
r>
&gt; towards the one in the patch).<br>
<br>
I can&#39;t say for RISCV performance, I am myself biased toward maintenanc=
e<br>
where having one compilation unit per (vendor) extension.<br>
ARM and MIPS seems to go in this direction, while PPC and RISCV in the<br>
other one.<br>
</blockquote></div>

--000000000000f1a03d05d5641e97--

