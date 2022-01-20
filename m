Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B300149556E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:32:33 +0100 (CET)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAe6f-0006IF-6q
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAZJe-00089N-LX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:25:36 -0500
Received: from [2a00:1450:4864:20::32c] (port=43625
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAZJF-0004pp-5V
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:25:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so14582979wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MxQ+/K9sLDW9+fxH7+O52SQ+Jhlx5kvAv5onxVfBpGM=;
 b=Fz6kbe/olH5oJ8JE23l5+DPaxMBcUGSJ2DfxycuYjYNmMrKrEAa9ajARDkXF/LvUGH
 7oLm6BaCwFMDjlUuRxJG1xa17bFVrKLR9yrARNHppTAgmzbQFRl1oKJGF0iZPxd22FPp
 O10DY/6SS9yjQysPAmhmOrYlNNUVM3D+ccHg04y4Uca/7z1a+enYfiR4yiufVFmt8ijG
 jME7EKWPOp4zUBMd3cVnNstOIRvkg9qDkM1gl7HK6MDXb2LPOWjy/f1N6/WcoQDIKtpo
 QOxcGd0XCA53YMnE2Ekd9pHxgq2mmVBzkfcUOnYVWROp4ym//u9JjR8p5368hSXix6Wf
 VbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MxQ+/K9sLDW9+fxH7+O52SQ+Jhlx5kvAv5onxVfBpGM=;
 b=xqBRl34K8Vode2iwgvEz3iEocmQIGMmmURzJa0yZ5lV3QJ2QyhYWUGB5Zb/d1THiTt
 0+F6sUkTsbuLeULMf3BUMkdQdWRw40LZk/5bP/eaGFPZvpPJTZBxrgh59Ivj3rq0ZWqP
 rxmYEDHEC/dkiSzD6wxRZylcV6Fq8bxF7obON1LeoUVWTYkGBYC+vUV89EYrR3x1GsDV
 ucFqOGEfBHLOFcdpfCNNUwB3yeUPvTuCI++ABXLwhEch95sS9Vow9mReJrQt8618dfIh
 sVG2vPjrDhiroIGyJwh2G/FfCRX07ZwlC+05DOO/NJ/gxDJNliA5GPFzO2fyU9jTDS+k
 dwsg==
X-Gm-Message-State: AOAM5311a9sEnuf2xOlLqyn3zQ/f6ZAyVMCRc9WKYwRM4+sGfSN3cWj7
 VPWJeQRRGojP8mUFLryFPvwJDr0GazM/JfyBuJRGNA==
X-Google-Smtp-Source: ABdhPJzbKhhez7HnyI3TO5gc9TokaX2+lz/7P+OmVTPIMKe5rWXhPMeZGnigX2cJ9ECj368zhOQ4V9ACPy8r+yVBYNw=
X-Received: by 2002:adf:f683:: with SMTP id v3mr11670157wrp.306.1642692306350; 
 Thu, 20 Jan 2022 07:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <d237abed-fe8c-fb29-3ec0-27a0504eeffc@amsat.org>
In-Reply-To: <d237abed-fe8c-fb29-3ec0-27a0504eeffc@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 20 Jan 2022 16:24:55 +0100
Message-ID: <CAAeLtUCUZh+yx72Cq3L8bHCshdMrX=LJj2vJZcHZL6=RZMmzYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Greg Favor <gfavor@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 at 12:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 13/1/22 21:20, Philipp Tomsich wrote:
> > This adds the decoder and translation for the XVentanaCondOps custom
> > extension (vendor-defined by Ventana Micro Systems), which is
> > documented at https://github.com/ventanamicro/ventana-custom-extensions=
/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> >
> > This commit then also adds a guard-function (has_XVentanaCondOps_p)
> > and the decoder function to the table of decoders, enabling the
> > support for the XVentanaCondOps extension.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > ---
> >
> > Changes in v2:
> > - Split off decode table into XVentanaCondOps.decode
> > - Wire up XVentanaCondOps in the decoder-table
>
> >   static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_=
t opcode)
> >   {
> > @@ -862,6 +874,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
> >           bool (*decode_func)(DisasContext *, uint32_t);
> >       } decoders[] =3D {
> >           { always_true_p,  decode_insn32 },
>
> "always_true" is the first entry,
>
> > +        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>
> so is that ever called?

Please refer to patch 1/2:
1. The guard-function only gates whether a decoder function is enabled/call=
ed.
2. Enabled decoders are iterated over until a decoder handles the
instruction-word=E2=80=94or we run out of decoders.
3. If no enabled decoder handled an instruction word, we raise an
illegal instruction.

This really is just a table-based form of the what would be equivalent
to the following pseudocode:
   if (guard_func_1() && decoder1(=E2=80=A6))
     /* pass */ ;
   else if (guard_func_2() && decoder2(...))
     /* pass */ ;
   [...]
   else
     raise_illegal();

And just as an aside (before we start discussing performance), let's
make sure we all agree that this is perfectly optimizable (I may be
missing a 'const') by a compiler:
1. The number of entries in the array are known at compile-time and
small integer =E2=80=94 a compiler can thus peel the loop.
2. The function pointers are in the same compilation unit, so this can
be converted from indirect to direct calls (a special case of
constant-propagation).
3. Predicate functions (given that they will be very small) can be inlined.

Best,
Philipp.

>
>
> >       };
> >
> >       /* Check for compressed insn */
>

