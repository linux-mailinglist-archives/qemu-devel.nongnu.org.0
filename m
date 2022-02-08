Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EA4AD189
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 07:31:58 +0100 (CET)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHK2e-0004Wn-VX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 01:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHJze-0003eq-Gk
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:28:50 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=35582
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHJzc-0002Yj-C2
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:28:50 -0500
Received: by mail-io1-xd2d.google.com with SMTP id 9so19965665iou.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 22:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WUGHNn4InKmg3nKZ9gNxLzB8zqqjuKaGJSxU6WkrW4Q=;
 b=ivUaHR2VStUcXBvt5FF/CMeSdZWCiYlfqnu2mWdoDDWFZdZIc2Gi8MRl0NZ9/KIOk9
 vpZH8a97qHrHFSM0ie0x8IKmCrApAWHDeJgyS0utQtaEb/BKoqydMVMVvl9M05jeHHt6
 b0X8G00iWIXK5g1O0RuN5Q2fRcZdxs+pnaw945zNlbiBLHqIcnbGkAt+sJRo9Rj1mGVz
 gS5qYFJjMnUYxWPcA94TQA/LRQaTysryL2D+UhOou0A2SOhcicKqTYTSvuUwzpAjUijB
 guUnigVdrW2J4zs2kSP8H5jdWp9CW7on9H/2SL9OMwPaptLxhVfVBJAAeTts8OWPqrJL
 K9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUGHNn4InKmg3nKZ9gNxLzB8zqqjuKaGJSxU6WkrW4Q=;
 b=Rp3zn4tyrVYcdxq5Qc0aL0F4kcjEUC+WWP6bsaf6SGv9y++g/jmmdHb3+mQkAJP2p8
 9kOfZlTP9JkfTuOCLvRJYpBu3C2j6zWbUZMWErR/RhXEAzNieO9jqFRCTkZTl60WZGLR
 XKC1qgpszAs0w6y1WrEKYLKI5oSiiOkQfrnpENqv+Ua9RubEUgW+mkM3WQ7Bg0h1M5Rv
 dJuvpaiDyVhX/XL9ND5YI47YCukabJF9GpRjhM4T4pea2gbKQaCVnCD5xqPBgmLS82XW
 HqQsysszTxD7C3S/QxwCJ1ihx+eKA9iT0btYuw/CMdAkL7qUQRYt91pnMZE8wW65v8AA
 QMFg==
X-Gm-Message-State: AOAM533zEhFhiJKffqKA7/IAEKbeVVrVGKNFOaK/XbkRhB38Sq+Zivgf
 w4QM87/8LICcqmvHVcH4cDk9oAHLO70/a+UzLQo=
X-Google-Smtp-Source: ABdhPJz8m1c7qvP8fIRORvfAYb49PLrUMgLkaB3Vvs2WgxEftnz3jezIkEV2Zz6HwsDAgvfO6dvJB/ddmkpyR5ATlYs=
X-Received: by 2002:a02:c956:: with SMTP id u22mr1461583jao.63.1644301727119; 
 Mon, 07 Feb 2022 22:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
 <20220202005249.3566542-4-philipp.tomsich@vrull.eu>
 <CAKmqyKNoHBFQaB9k3+cs2n0n8zFhg1Kv3uQuxhr-6R-pP8UasA@mail.gmail.com>
In-Reply-To: <CAKmqyKNoHBFQaB9k3+cs2n0n8zFhg1Kv3uQuxhr-6R-pP8UasA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Feb 2022 16:28:19 +1000
Message-ID: <CAKmqyKOEMFcKhU3xc1rA2V-S0EVztx6F_DF+3Qjwz6-FvhfHrw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] target/riscv: access configuration through cfg_ptr
 in DisasContext
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 4:07 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Feb 2, 2022 at 11:26 AM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
> > copies (in DisasContext) of some of the elements available in the
> > RISCVCPUConfig structure.  This commit redirects accesses to use the
> > cfg_ptr copied into DisasContext and removes the shallow copies.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - (new patch) test extension-availability through cfg_ptr in
> >   DisasContext, removing the fields that have been copied into
> >   DisasContext directly
> >
> >  target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc   | 104 +++++++++++-----------
> >  target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
> >  target/riscv/translate.c                  |  14 ---
> >  4 files changed, 55 insertions(+), 69 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > index 3cd1b3f877..f1342f30f8 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -806,7 +806,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
> >
> >  static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
> >  {
> > -    if (!ctx->ext_ifencei) {
> > +    if (!ctx->cfg_ptr->ext_ifencei) {
> >          return false;
> >      }
> >
> > diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> > index f85a9e83b4..ff09e345ad 100644
> > --- a/target/riscv/insn_trans/trans_rvv.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> > @@ -74,7 +74,7 @@ static bool require_zve32f(DisasContext *s)
> >      }
> >
> >      /* Zve32f doesn't support FP64. (Section 18.2) */
> > -    return s->ext_zve32f ? s->sew <= MO_32 : true;
> > +    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
> >  }
> >
> >  static bool require_scale_zve32f(DisasContext *s)
> > @@ -85,7 +85,7 @@ static bool require_scale_zve32f(DisasContext *s)
> >      }
> >
> >      /* Zve32f doesn't support FP64. (Section 18.2) */
> > -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> > +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
> >  }
> >
> >  static bool require_zve64f(DisasContext *s)
> > @@ -96,7 +96,7 @@ static bool require_zve64f(DisasContext *s)
> >      }
> >
> >      /* Zve64f doesn't support FP64. (Section 18.2) */
> > -    return s->ext_zve64f ? s->sew <= MO_32 : true;
> > +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
> >  }
> >
> >  static bool require_scale_zve64f(DisasContext *s)
> > @@ -107,7 +107,7 @@ static bool require_scale_zve64f(DisasContext *s)
> >      }
> >
> >      /* Zve64f doesn't support FP64. (Section 18.2) */
> > -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> > +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
> >  }
> >
> >  /* Destination vector register group cannot overlap source mask register. */
> > @@ -174,7 +174,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
> >      TCGv s1, dst;
> >
> >      if (!require_rvv(s) ||
> > -        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
> > +        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {
>
> This fails checkpatch as the line is too long
>
> Can you run checkpatch on the series and re-send it?

Argh, there are too many patches depending on this!

Don't worry about resending it, I'll fixup the failures (assuming that's ok).

Alistair

>
> Alistair

