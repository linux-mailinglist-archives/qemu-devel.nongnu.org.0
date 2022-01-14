Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81048F2A6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 23:53:58 +0100 (CET)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8VSH-0003KY-EH
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 17:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n8VQJ-0002dU-Vd
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 17:51:56 -0500
Received: from [2607:f8b0:4864:20::12a] (port=38858
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n8VQD-00075u-Gd
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 17:51:54 -0500
Received: by mail-il1-x12a.google.com with SMTP id x15so9586165ilc.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YBzT4AV/6LEVj8WfZ4RDag1cqQMAPGzWl6rAMAcvJBI=;
 b=TWQocT0sSaVL6H6/FWrMyPxlOntg+DtyBvg+2KtP7QFYfE2NyMStUS77/Ud1L1Z59w
 mySaxj9JnnkoNilHE4yjQMSkCZ+neWNEXHUpDYF8T9MdwB2scPiUyZAHHEIJPr34dgS9
 YuMRcGNLIT5ZhyfV+BHWwxVgEMz3tvFPoNCGvPkp1PcnrTg0MRafhmYVTEO1a146/Eoh
 nT4wIH4BoCuALOSdEkmkgCE/A7vCv2CDPcU07SqHJeL9rLdyFBOtrsdqL9iI3eRBT12k
 6NIy945TzhWkqHSceX+6yUjUMFhoSdlBB/hfIVnx6tKbRy+CV7B+4F+rzSDVn/E1wdIH
 HQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YBzT4AV/6LEVj8WfZ4RDag1cqQMAPGzWl6rAMAcvJBI=;
 b=0qMeDsZXyLjK9Tb4Or278Qg+1vbXPPTlFb9Ujymx4p8YiA83kDrqUcaQsSQz28oja9
 tcUpk0bJKpKq1jKuti7zPt8KDuaodSqM8q5GnvGmic8wxw3oTO3di2eZNRUaKbOQRd6e
 go+3QOHxhiD1aeKJFRw7m1Ia4khgfQxE+AWMDo8SKh8UgmkSZy8ErLWi1voWXb8GtVWn
 oqU7vhWSDQ7oD4I6gzMKt7JhV1XjLADPyNbDRKXNMygl4mVUNt9RnMt7cm9ZIMLgv9ZZ
 j24U/6+E3ZYtMj5htSVVNfzXjdp0Vi9uMyv9ckMAn6+vsgva+8KXUHW9HQYMnff6YY8V
 IKlw==
X-Gm-Message-State: AOAM531BpvS6tUnyG7vIh/78Q56VkgI2vSgcLvzubqoOxvD1wVplid8O
 BeSLTJlk3QyzlhVNmB6QE5zhCOTWwif3zmFcpvc=
X-Google-Smtp-Source: ABdhPJw3/kybMTm0Ht0VQQSbL9r8QmZtkqN9amGAr0ULs0fjBQkBY66WqWhAvB0+wr9u1nJY5Ii6lUR0REncZ67vwvs=
X-Received: by 2002:a92:3012:: with SMTP id x18mr5164347ile.221.1642200698408; 
 Fri, 14 Jan 2022 14:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
 <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
 <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
 <CAAeLtUAiFhD0o1YAtz8R5uzn77Wj_LG8D2unAMrdmmRaMAYt-Q@mail.gmail.com>
 <CAKmqyKPbZ+N2fb_LY80OzrBfKi35P1C_Thx5_O0h_6X1ThUggw@mail.gmail.com>
 <CAAeLtUB8Mz-=m6R2Amm56Q+Jtpdn=JixXJ7ykaCCHc7W_Byb8w@mail.gmail.com>
In-Reply-To: <CAAeLtUB8Mz-=m6R2Amm56Q+Jtpdn=JixXJ7ykaCCHc7W_Byb8w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 15 Jan 2022 08:51:12 +1000
Message-ID: <CAKmqyKOKTmASs-BD3eZ2mMOGZHqrmh=yo_0+bh8Eb8mtWaCOYA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Alistair Francis <Alistair.Francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 6:28 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> On Thu, 13 Jan 2022 at 06:07, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Thu, Jan 13, 2022 at 1:42 AM Philipp Tomsich
> > <philipp.tomsich@vrull.eu> wrote:
> > >
> > > Alistair,
> > >
> > > Do you (and the other RISC-V custodians of target/riscv) have any opi=
nion on this?
> > > We can go either way =E2=80=94 and it boils down to a style and proce=
ss question.
> >
> > Sorry, it's a busy week!
> >
> > I had a quick look over this series and left some comments below.
>
>
> Thank you for taking the time despite the busy week =E2=80=94 I can absol=
utely
> relate, as it seems that January is picking up right where December
> left off ;-)
>
> >
> > >
> > > Thanks,
> > > Philipp.
> > >
> > > On Mon, 10 Jan 2022 at 12:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> > >>
> > >> On 1/10/22 12:11, Philipp Tomsich wrote:
> > >> > On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org
> > >> > <mailto:f4bug@amsat.org>> wrote:
> > >> >
> > >> >     On 1/10/22 10:52, Philipp Tomsich wrote:
> > >> >     > For RISC-V the opcode decode will change between different v=
endor
> > >> >     > implementations of RISC-V (emulated by the same qemu binary)=
.
> > >> >     > Any two vendors may reuse the same opcode space, e.g., we ma=
y end
> > >> >     up with:
> > >> >     >
> > >> >     > # *** RV64 Custom-3 Extension ***
> > >> >     > {
> > >> >     >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> > >> >     |has_xventanacondops_p
> > >> >     >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> > >> >     |has_xventanacondops_p
> > >> >     >   someone_something  ............ ..... 000 ..... 1100111 @i
> > >> >     > |has_xsomeonesomething_p
> > >> >     > }
> >
> > I don't love this. If even a few vendors use this we could have a huge
> > number of instructions here
> >
> > >> >     >
> > >> >     > With extensions being enabled either from the commandline
> > >> >     >     -cpu any,xventanacondops=3Dtrue
> > >> >     > or possibly even having a AMP in one emulation setup (e.g. a=
pplication
> > >> >     > cores having one extension and power-mangement cores having =
a
> > >> >     > different one =E2=80=94 or even a conflicting one).
> >
> > Agreed, an AMP configuration is entirely possible.
> >
> > >> >
> > >> >     I understand, I think this is what MIPS does, see commit 9d005=
392390:
> > >> >     ("target/mips: Introduce decodetree structure for NEC Vr54xx e=
xtension")
> > >> >
> > >> >
> > >> > The MIPS implementation is functionally equivalent, and I could se=
e us
> > >> > doing something similar for RISC-V (although I would strongly pref=
er to
> > >> > make everything explicit via the .decode-file instead of relying o=
n
> > >> > people being aware of the logic in decode_op).
> > >> >
> > >> > With the growing number of optional extensions (as of today, at le=
ast
> > >> > the Zb[abcs] and vector comes to mind), we would end up with a lar=
ge
> > >> > number of decode-files that will then need to be sequentially call=
ed
> > >> > from decode_op(). The predicates can then move up into decode_op,
> > >> > predicting the auto-generated decoders from being invoked.
> > >> >
> > >> > As of today, we have predicates for at least the following:
> > >> >
> > >> >   * Zb[abcs]
> > >> >   * Vectors
> >
> > I see your point, having a long list of decode_*() functions to call
> > is a hassle. On the other hand having thousands of lines in
> > insn32.decode is also a pain.
> >
> > In saying that, having official RISC-V extensions in insn32.decode and
> > vendor instructions in insn<vendor>.decode seems like a reasonable
> > compromise. Maybe even large extensions (vector maybe?) could have
> > their own insn<extension>.decode file, on a case by case basis.
> >
> > >> >
> > >> > As long as we are in greenfield territory (i.e. not dealing with
> > >> > HINT-instructions that overlap existing opcode space), this will b=
e fine
> > >> > and provide proper isolation between the .decode-tables.
> > >> > However, as soon as we need to implement something along the lines=
 (I
> > >> > know this is a bad example, as prefetching will be a no-op on qemu=
) of:
> > >> >
> > >> >     {
> > >> >       {
> > >> >         # *** RV32 Zicbop Sandard Extension (hints in the ori-spac=
e) ***
> > >> >         prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pre=
f
> > >> >         prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pre=
f
> > >> >         prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pre=
f
> > >> >       }
> > >> >       ori      ............     ..... 110 ..... 0010011 @i
> > >> >     }
> > >> >
> > >> > we'd need to make sure that the generated decoders are called in t=
he
> > >> > appropriate order (i.e. the decoder for the specialized instructio=
ns
> > >> > will need to be called first), which would not be apparent from lo=
oking
> > >> > at the individual .decode files.
> > >> >
> > >> > Let me know what direction we want to take (of course, I have a bi=
as
> > >> > towards the one in the patch).
> > >>
> > >> I can't say for RISCV performance, I am myself biased toward mainten=
ance
> > >> where having one compilation unit per (vendor) extension.
> > >> ARM and MIPS seems to go in this direction, while PPC and RISCV in t=
he
> > >> other one.
> >
> > I think we could do both right?
> >
> > We could add the predicate support, but also isolate vendors to their
> > own decode file
> >
> > So for example, for vendor abc
> >
> > +++ b/target/riscv/insnabc.decode
> > +# *** Custom abc Extension ***
> > +{
> > +  vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_abc_c
> > +  vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_abc_d
> > +}
> >
> > Then there is a decode_abc(), but we support extension abc_c and abc_d
> >
> > That way we can keep all the vendor code seperate, while still
> > allowing flexibility. Will that work?
>
> I'll split this up into multiple series then:
> 1. XVentanaCondOps will use a separate decoder (so no decodetree changes =
in v2).
> 2. A new series that adds predicate support and uses it for Zb[abcs]
> 3. A third series that factors vector out of the insn32.decode and
> puts it into its own decoder.
>
> This will give us the chance to discuss individual design changes at
> their own speed.

Great! Thanks for that

Alistair

>
> Philipp.
>
> >
> > We can also then use predicate support for the standard RISC-V
> > extensions as described by Philipp
> >
> > Alistair

