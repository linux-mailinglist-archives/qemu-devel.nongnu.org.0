Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE048D1C8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 06:09:22 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7sMT-0001Hr-HA
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 00:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7sKX-0008LB-8S
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 00:07:21 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=38633
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7sKV-00037T-LT
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 00:07:20 -0500
Received: by mail-io1-xd2c.google.com with SMTP id w7so1708413ioj.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 21:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NGoMtxQ1IfDNA+KeFhdFg7hxozWhmYbsCQrYIH7s+ds=;
 b=SWCC8oTQJq6t6l+hYEoK5eGwcJvJTtrujtVNeyCjPcF6iUDe5xSKF9rw6ifYJhvJF6
 /hOe7tRlNZkpi20Mg07YgJ6aW6x5YkUzt3Fb3htOIPbsBeE+0QxokZpuyA+lTvlw/HWW
 FaA1hBsbUBaEVAMS6FbzcS8/jNhkxJ18Bu8jCRSRdJYgSoI9GfBzzchOHNULbSgbGc/j
 ZkIFi6sgjTU1UZ7B5Xpq1GCFBpDSocPM7Tly8+sR0rZjtAcBN/+/P3J13BWqP/aTjWos
 3wbZ1JDynrW9d3os6lXk1/XF7uPmGtocRKXyT1Ig+qYvhcroVgjjVI3ccU2IblQnde3H
 /O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NGoMtxQ1IfDNA+KeFhdFg7hxozWhmYbsCQrYIH7s+ds=;
 b=uatLP/xPzcpaforx0QD52/qUydY9YahM23qhGCzEUx8sm1BixfduP6A1kl85i6Np2Y
 XFuZvIHzZCHDVZH8k4dIv3iA50ZuISJeMYnwolfrc+aP9P/Fe0wcEcV9zOxOe9YmRzK9
 BYc6v37EErMUWVBHXvtJqqNan3kIx+prUt+K3KyyogVl5b4IaYu04OZ48rquVJUDvZjF
 s1QGL1wk91bt1mrE/bcTZZt+u0gL4QPlX1taFXYxC0+4ug1BF5wAcx25fcIdBrVqVVsT
 AOZ6vBYHD+1tRMD9BO0FWM2qnoIQA0NXDJJpkcvN8IsK61aPYQV/B6eJ3auxjmGWCDle
 cWgQ==
X-Gm-Message-State: AOAM5317b1GOhayCzn+AUmkqOjNrCq8MSOy2OUsHMFy/xJTGEPHoH7et
 2xJ54jOwZAF9p49E7Pb1u1oPMxOocUN1ThlFwBo=
X-Google-Smtp-Source: ABdhPJxiZVJn1BTKWEkIMWRJs6nE97oAVdLtN+Ba+uA92usE87ZdVe1sMo2qY5CBXTNC357BnKa8FiiH2A4I5GKllwY=
X-Received: by 2002:a02:a818:: with SMTP id f24mr1325459jaj.125.1642050438483; 
 Wed, 12 Jan 2022 21:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
 <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
 <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
 <CAAeLtUAiFhD0o1YAtz8R5uzn77Wj_LG8D2unAMrdmmRaMAYt-Q@mail.gmail.com>
In-Reply-To: <CAAeLtUAiFhD0o1YAtz8R5uzn77Wj_LG8D2unAMrdmmRaMAYt-Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jan 2022 15:06:52 +1000
Message-ID: <CAKmqyKPbZ+N2fb_LY80OzrBfKi35P1C_Thx5_O0h_6X1ThUggw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jan 13, 2022 at 1:42 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Alistair,
>
> Do you (and the other RISC-V custodians of target/riscv) have any opinion=
 on this?
> We can go either way =E2=80=94 and it boils down to a style and process q=
uestion.

Sorry, it's a busy week!

I had a quick look over this series and left some comments below.

>
> Thanks,
> Philipp.
>
> On Mon, 10 Jan 2022 at 12:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> On 1/10/22 12:11, Philipp Tomsich wrote:
>> > On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org
>> > <mailto:f4bug@amsat.org>> wrote:
>> >
>> >     On 1/10/22 10:52, Philipp Tomsich wrote:
>> >     > For RISC-V the opcode decode will change between different vendo=
r
>> >     > implementations of RISC-V (emulated by the same qemu binary).
>> >     > Any two vendors may reuse the same opcode space, e.g., we may en=
d
>> >     up with:
>> >     >
>> >     > # *** RV64 Custom-3 Extension ***
>> >     > {
>> >     >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
>> >     |has_xventanacondops_p
>> >     >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
>> >     |has_xventanacondops_p
>> >     >   someone_something  ............ ..... 000 ..... 1100111 @i
>> >     > |has_xsomeonesomething_p
>> >     > }

I don't love this. If even a few vendors use this we could have a huge
number of instructions here

>> >     >
>> >     > With extensions being enabled either from the commandline
>> >     >     -cpu any,xventanacondops=3Dtrue
>> >     > or possibly even having a AMP in one emulation setup (e.g. appli=
cation
>> >     > cores having one extension and power-mangement cores having a
>> >     > different one =E2=80=94 or even a conflicting one).

Agreed, an AMP configuration is entirely possible.

>> >
>> >     I understand, I think this is what MIPS does, see commit 9d0053923=
90:
>> >     ("target/mips: Introduce decodetree structure for NEC Vr54xx exten=
sion")
>> >
>> >
>> > The MIPS implementation is functionally equivalent, and I could see us
>> > doing something similar for RISC-V (although I would strongly prefer t=
o
>> > make everything explicit via the .decode-file instead of relying on
>> > people being aware of the logic in decode_op).
>> >
>> > With the growing number of optional extensions (as of today, at least
>> > the Zb[abcs] and vector comes to mind), we would end up with a large
>> > number of decode-files that will then need to be sequentially called
>> > from decode_op(). The predicates can then move up into decode_op,
>> > predicting the auto-generated decoders from being invoked.
>> >
>> > As of today, we have predicates for at least the following:
>> >
>> >   * Zb[abcs]
>> >   * Vectors

I see your point, having a long list of decode_*() functions to call
is a hassle. On the other hand having thousands of lines in
insn32.decode is also a pain.

In saying that, having official RISC-V extensions in insn32.decode and
vendor instructions in insn<vendor>.decode seems like a reasonable
compromise. Maybe even large extensions (vector maybe?) could have
their own insn<extension>.decode file, on a case by case basis.

>> >
>> > As long as we are in greenfield territory (i.e. not dealing with
>> > HINT-instructions that overlap existing opcode space), this will be fi=
ne
>> > and provide proper isolation between the .decode-tables.
>> > However, as soon as we need to implement something along the lines (I
>> > know this is a bad example, as prefetching will be a no-op on qemu) of=
:
>> >
>> >     {
>> >       {
>> >         # *** RV32 Zicbop Sandard Extension (hints in the ori-space) *=
**
>> >         prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
>> >         prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
>> >         prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
>> >       }
>> >       ori      ............     ..... 110 ..... 0010011 @i
>> >     }
>> >
>> > we'd need to make sure that the generated decoders are called in the
>> > appropriate order (i.e. the decoder for the specialized instructions
>> > will need to be called first), which would not be apparent from lookin=
g
>> > at the individual .decode files.
>> >
>> > Let me know what direction we want to take (of course, I have a bias
>> > towards the one in the patch).
>>
>> I can't say for RISCV performance, I am myself biased toward maintenance
>> where having one compilation unit per (vendor) extension.
>> ARM and MIPS seems to go in this direction, while PPC and RISCV in the
>> other one.

I think we could do both right?

We could add the predicate support, but also isolate vendors to their
own decode file

So for example, for vendor abc

+++ b/target/riscv/insnabc.decode
+# *** Custom abc Extension ***
+{
+  vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_abc_c
+  vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_abc_d
+}

Then there is a decode_abc(), but we support extension abc_c and abc_d

That way we can keep all the vendor code seperate, while still
allowing flexibility. Will that work?

We can also then use predicate support for the standard RISC-V
extensions as described by Philipp

Alistair

