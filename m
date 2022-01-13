Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18B48D39D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 09:30:04 +0100 (CET)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7vUh-0005jA-Am
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 03:30:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n7vTc-0004rn-Aq
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:28:56 -0500
Received: from [2a00:1450:4864:20::435] (port=33288
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n7vTZ-0006AT-EO
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:28:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id d19so8783015wrb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qivCDPKqLR7G/2lz5qh50eTx0hpw0yXqDeZOD84P12M=;
 b=MS2eviIpjTJjOyM2k5/9shh5TIPf93Ezhnc8uS6Xxni7mEPoan9QEWUVftkbZThmF8
 /tpHwzDoSyvUNdsTovXyAW7KyJP7LTdD+ho1lT/bIk55in6GdkcmngqfeH4TzVz93W4g
 +Ug69vLqh7R+rVdmRopzdI6B0Iuv/GbfDuujZwFPqaWAs/wMMHcMWcfFOlmMlIZxYI8D
 5UtVznoqIo2iJljD9nMx5t/pWsF99qj4+/3pWhAimKLJvaZFUmu71BPFb0rnrOLYmQcN
 9mJKVPBTLwxUMJGrmUrL82ccEJQ2ihxJyzdnNp7Mbrp3n0UV2DV2yAQYATI7a3567Q49
 UwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qivCDPKqLR7G/2lz5qh50eTx0hpw0yXqDeZOD84P12M=;
 b=EgngLMYBs7BqhtiD49nAZAfGjXVvIvaEhDLPryipaA1qQODNRqieGSQAcJ269eq/zA
 di7MEOiOay8g4dpFhynXAo8clSRjGUHjzop3eqFm1UJmQQxEgPSru9un3x24hRxtgkgh
 O6a4C/DZ+cy2FtIl4wWF9DkSgEqiWkb2Wh1Sy1+Uniy4eJVkseHShxQ1QfS37JFk8LTa
 0RrW9QQtY/+dNMVHIiVVmYleu7Ib/eU6W+ThgRAAfYJ4TtXNW1GVT1nAqX+r7nden67W
 ux5iF935zfTN9eACY8gyNSbDYqDoMrgAw4azDuxV1Y10KMacW27kQB1JgdmZ2A6shCLP
 B0Pg==
X-Gm-Message-State: AOAM531CIqnU/1an3Cem+tiy7GBCCE778LnkcRqSgjxaLW8WJpmYUHWp
 tc93bU8S+ettDMnKiU+hmNFdAVchzIv0wUzFYgirPw==
X-Google-Smtp-Source: ABdhPJyQc1Gjl+qdVQNNX1QsoryCCJ0pUM1ceo6795AsI7RiKM2ph1H311h4YQtcPXjE7GHGj1aY/IPvjr21kXLBLeo=
X-Received: by 2002:a5d:5409:: with SMTP id g9mr2934037wrv.120.1642062530535; 
 Thu, 13 Jan 2022 00:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
 <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
 <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
 <CAAeLtUAiFhD0o1YAtz8R5uzn77Wj_LG8D2unAMrdmmRaMAYt-Q@mail.gmail.com>
 <CAKmqyKPbZ+N2fb_LY80OzrBfKi35P1C_Thx5_O0h_6X1ThUggw@mail.gmail.com>
In-Reply-To: <CAKmqyKPbZ+N2fb_LY80OzrBfKi35P1C_Thx5_O0h_6X1ThUggw@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 13 Jan 2022 09:28:39 +0100
Message-ID: <CAAeLtUB8Mz-=m6R2Amm56Q+Jtpdn=JixXJ7ykaCCHc7W_Byb8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 13 Jan 2022 at 06:07, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Thu, Jan 13, 2022 at 1:42 AM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > Alistair,
> >
> > Do you (and the other RISC-V custodians of target/riscv) have any opini=
on on this?
> > We can go either way =E2=80=94 and it boils down to a style and process=
 question.
>
> Sorry, it's a busy week!
>
> I had a quick look over this series and left some comments below.


Thank you for taking the time despite the busy week =E2=80=94 I can absolut=
ely
relate, as it seems that January is picking up right where December
left off ;-)

>
> >
> > Thanks,
> > Philipp.
> >
> > On Mon, 10 Jan 2022 at 12:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> On 1/10/22 12:11, Philipp Tomsich wrote:
> >> > On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org
> >> > <mailto:f4bug@amsat.org>> wrote:
> >> >
> >> >     On 1/10/22 10:52, Philipp Tomsich wrote:
> >> >     > For RISC-V the opcode decode will change between different ven=
dor
> >> >     > implementations of RISC-V (emulated by the same qemu binary).
> >> >     > Any two vendors may reuse the same opcode space, e.g., we may =
end
> >> >     up with:
> >> >     >
> >> >     > # *** RV64 Custom-3 Extension ***
> >> >     > {
> >> >     >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> >> >     |has_xventanacondops_p
> >> >     >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> >> >     |has_xventanacondops_p
> >> >     >   someone_something  ............ ..... 000 ..... 1100111 @i
> >> >     > |has_xsomeonesomething_p
> >> >     > }
>
> I don't love this. If even a few vendors use this we could have a huge
> number of instructions here
>
> >> >     >
> >> >     > With extensions being enabled either from the commandline
> >> >     >     -cpu any,xventanacondops=3Dtrue
> >> >     > or possibly even having a AMP in one emulation setup (e.g. app=
lication
> >> >     > cores having one extension and power-mangement cores having a
> >> >     > different one =E2=80=94 or even a conflicting one).
>
> Agreed, an AMP configuration is entirely possible.
>
> >> >
> >> >     I understand, I think this is what MIPS does, see commit 9d00539=
2390:
> >> >     ("target/mips: Introduce decodetree structure for NEC Vr54xx ext=
ension")
> >> >
> >> >
> >> > The MIPS implementation is functionally equivalent, and I could see =
us
> >> > doing something similar for RISC-V (although I would strongly prefer=
 to
> >> > make everything explicit via the .decode-file instead of relying on
> >> > people being aware of the logic in decode_op).
> >> >
> >> > With the growing number of optional extensions (as of today, at leas=
t
> >> > the Zb[abcs] and vector comes to mind), we would end up with a large
> >> > number of decode-files that will then need to be sequentially called
> >> > from decode_op(). The predicates can then move up into decode_op,
> >> > predicting the auto-generated decoders from being invoked.
> >> >
> >> > As of today, we have predicates for at least the following:
> >> >
> >> >   * Zb[abcs]
> >> >   * Vectors
>
> I see your point, having a long list of decode_*() functions to call
> is a hassle. On the other hand having thousands of lines in
> insn32.decode is also a pain.
>
> In saying that, having official RISC-V extensions in insn32.decode and
> vendor instructions in insn<vendor>.decode seems like a reasonable
> compromise. Maybe even large extensions (vector maybe?) could have
> their own insn<extension>.decode file, on a case by case basis.
>
> >> >
> >> > As long as we are in greenfield territory (i.e. not dealing with
> >> > HINT-instructions that overlap existing opcode space), this will be =
fine
> >> > and provide proper isolation between the .decode-tables.
> >> > However, as soon as we need to implement something along the lines (=
I
> >> > know this is a bad example, as prefetching will be a no-op on qemu) =
of:
> >> >
> >> >     {
> >> >       {
> >> >         # *** RV32 Zicbop Sandard Extension (hints in the ori-space)=
 ***
> >> >         prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
> >> >         prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
> >> >         prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
> >> >       }
> >> >       ori      ............     ..... 110 ..... 0010011 @i
> >> >     }
> >> >
> >> > we'd need to make sure that the generated decoders are called in the
> >> > appropriate order (i.e. the decoder for the specialized instructions
> >> > will need to be called first), which would not be apparent from look=
ing
> >> > at the individual .decode files.
> >> >
> >> > Let me know what direction we want to take (of course, I have a bias
> >> > towards the one in the patch).
> >>
> >> I can't say for RISCV performance, I am myself biased toward maintenan=
ce
> >> where having one compilation unit per (vendor) extension.
> >> ARM and MIPS seems to go in this direction, while PPC and RISCV in the
> >> other one.
>
> I think we could do both right?
>
> We could add the predicate support, but also isolate vendors to their
> own decode file
>
> So for example, for vendor abc
>
> +++ b/target/riscv/insnabc.decode
> +# *** Custom abc Extension ***
> +{
> +  vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_abc_c
> +  vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_abc_d
> +}
>
> Then there is a decode_abc(), but we support extension abc_c and abc_d
>
> That way we can keep all the vendor code seperate, while still
> allowing flexibility. Will that work?

I'll split this up into multiple series then:
1. XVentanaCondOps will use a separate decoder (so no decodetree changes in=
 v2).
2. A new series that adds predicate support and uses it for Zb[abcs]
3. A third series that factors vector out of the insn32.decode and
puts it into its own decoder.

This will give us the chance to discuss individual design changes at
their own speed.

Philipp.

>
> We can also then use predicate support for the standard RISC-V
> extensions as described by Philipp
>
> Alistair

