Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CA591212
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:21:54 +0200 (CEST)
Received: from localhost ([::1]:58520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVXq-0002Q8-Uq
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMVTQ-0006nv-Q5
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:17:16 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMVTO-0004VQ-2w
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:17:16 -0400
Received: by mail-yb1-xb35.google.com with SMTP id b144so1649532yba.13
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=3+aA7zar9aQ0yilm0GnctDmWKyuqcNep+BC9yckPE/Q=;
 b=OyyOWHGNFPr3y/isZUBuk1ogZTgU4PTJh/E783b7fpScplbc/4oMi47WQZSrNoyUXx
 kqEvLek5xHFZHHzu/gMiWyODcMAfO/uNtoEhJ9YyB1JKLU4N0GUWZM1Wzx/jbXy2QEJW
 nf1rW4qvuaJ5WOM/9a9P6z3aqRCqI88c6T1B27sGaKIHt3o04C6Ib6CLCwysNm+79KtD
 8lQZpGdZtkXavUdhGybERdRTWKEOGEviqlGA7BEy1wJo+Qw22YW7OTVY425ounBmEeZs
 Xv9y+GmTPNXlJ2lzE68uYAOz/TgtGlzH5JWztqQcB69tOm37dLZmuS3SiOxu6HmcWwHA
 UfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=3+aA7zar9aQ0yilm0GnctDmWKyuqcNep+BC9yckPE/Q=;
 b=i01Dc/7E2vfajDW5SW3elP+ckA/M0shfTgyHaUkx1dnaMv7Rdz+zlsp/FTW9kiFLe+
 FTZq02vm6oDzkwYN+Um4K6mA5KQr21gyB9UOCzSD3lxJ5qGUTWA3ZM/oc8/htcgdWyM6
 d+8+1Xd0rxtgDPyUX0kE8F+B7YMic07oN7/jHyeKn9asPJiReOBOSJMr84AbG+9DOWSG
 U5W2Yh4JbXzpUdKSsKo4Vw6A+xIGhZMiG7p6L77qiQfvkL4LjbgXx3IsrR6A7I+pdJ6H
 LKRvQtSoIy8wqTP8Gva29JJ1EIxLfO2qqmzo0GYjDiC3M4aijhZjlxg7KABV2FnnHJ/9
 tCLw==
X-Gm-Message-State: ACgBeo30hWlaS/vZ/G5ExMEMD3bU9G7EOVvbHai5V+Nyvm486W1lAj/X
 C4lS7pkBqDMv09loNTUhbm5uMLP2ZxC/IICzRGonVQ==
X-Google-Smtp-Source: AA6agR5Qn+j4bxxCUvbpUCf7OqFG/c39hgGCJWR7HuDZUgB+vPv69YHY4dQ+p7Jx+t0q9sz0VgzYiGDleTAZVSm3S2o=
X-Received: by 2002:a25:73c8:0:b0:67b:9efb:fedf with SMTP id
 o191-20020a2573c8000000b0067b9efbfedfmr3582178ybc.517.1660313831974; Fri, 12
 Aug 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
 <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
In-Reply-To: <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 12 Aug 2022 16:17:00 +0200
Message-ID: <CAAeLtUDmvuje+cLB6j+_JjUt3TQaEoJYRypjd=dMNwkFsD0sDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Happy to lower it back into the decode file.
However, I initially pulled it up into the trans-function to more
closely match the ISA specification: there is only one FENCE
instruction with 3 arguments (FM, PRED, and SUCC).
One might argue that the decode table for "RV32I Base Instruction Set"
in the specification lists FENCE.TSO as a separate instruction, but
the normative text doesn't (and FENCE overlaps FENCE.TSO in the
tabular representation) =E2=80=94 so I would consider the table as
informative.

I'll wait until we see what consensus emerges from the discussion.

Philipp.

On Fri, 12 Aug 2022 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 12 Aug 2022 at 14:17, Philipp Tomsich <philipp.tomsich@vrull.eu> =
wrote:
> >
> > Our decoding of fence-instructions is problematic in respect to the
> > RISC-V ISA specification:
> > - rs and rd are ignored, but need to be 0
> > - fm is ignored
> >
> > This change adjusts the decode pattern to enfore rs and rd being 0,
> > and validates the fm-field (together with pred/succ for FENCE.TSO) to
> > determine whether a reserved instruction is specified.
> >
> > While the specification allows UNSPECIFIED behaviour for reserved
> > instructions, we now always raise an illegal instruction exception.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > ---
> >
> >  target/riscv/insn32.decode              |  2 +-
> >  target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 089128c3dc..4e53df1b62 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011 @=
r
> >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> >  or       0000000 .....    ..... 110 ..... 0110011 @r
> >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > +fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
> >  fence_i  000000000000     00000 001 00000 0001111
> >  csrrw    ............     ..... 001 ..... 1110011 @csr
> >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/ins=
n_trans/trans_rvi.c.inc
> > index ca8e3d1ea1..515bb3b22a 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad=
 *a)
> >
> >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> >  {
> > -    /* FENCE is a full memory barrier. */
> > +    switch (a->fm) {
> > +    case 0b0000:
> > +         /* normal fence */
> > +         break;
> > +
> > +    case 0b0001:
> > +         /* FENCE.TSO requires PRED and SUCC to be RW */
> > +         if (a->pred !=3D 0xb0011 || a->succ !=3D 0b0011) {
> > +            return false;
> > +         }
> > +         break;
> > +
> > +    default:
> > +        /* reserved for future use */
> > +        return false;
> > +    }
>
> I think it would be neater to do this decode in the
> .decode file, rather than by hand in the trans function.
>
> thanks
> -- PMM

