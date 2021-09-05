Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AEF400EC2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:04:48 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMo50-00031s-J7
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMo28-0001SK-Ng
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:01:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMo25-0002Zi-Rz
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:01:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x6so4992156wrv.13
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+f2x4wL7yvAPA1Adbc1/ZdT/UwhsZFDIdE+VFzi69A=;
 b=sMqmi4cGygeoYbUFnmUETBzlkae1/lHs23jVAezncx9Z91DxElphARAUbSCIba4BhI
 firXm/PbHXSJsZPusnwGqkwjgnqE4cuYEvvZlbKJFFHCQRwmDikphlyyCzGLMFb8/XyB
 7N5Sy/9CANES586Rv48hctWHiFvFY+TJhqseNSkzmtBZ/fWK6NRQtQIgVFWNibE+mMh1
 QZ1djfJobUrvoAmw9Jzlznvt1ZNGi2+Zr4AW6YciRl6pomJCnu/+gA/tIjgUGGLWeMzh
 /im0sfzMZyHUZZ2GqsumgjpxeYF+za9lGD0oZgEbNKxjLIz9EraMkhJfJ5V4FfXXiG7b
 9Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+f2x4wL7yvAPA1Adbc1/ZdT/UwhsZFDIdE+VFzi69A=;
 b=CC5PoM5/GIjy7sxS5loasccy97ts5zH4xNESyjGHFLHrp9EITPu5cYmBhuPeB0wy7Y
 d0PrUs/BPKGY7Bb5A7YMd/xekRm5VNcscEntr0INwK2bbQQ4FPJm3nQGb68dqXUnzJoi
 5QSkPAKsbA1hWZ90Uj74t6UQ+MrdaFOSkf5gI+vNxnzJ3DpsNzn990T2sjX/toD8uZ4b
 yKqmYdtdH/xy81W9YuAeaJk4/U7kOGg+QZWxvToTiDKrV0oREfOHKLAVvy1Kp+PeG3tU
 4nAApxcIo0uggrvhb2gEJtXvlkOgHjW1ihQmaLDvm4YImL2rVVZcxiVj/qB/WkNtC4pn
 3uMA==
X-Gm-Message-State: AOAM533UPKgiv1CCs0yYBKo1pESyAy9LaTIliO2jgX7f9SlUMqjWdmRl
 dJIcbmA2EecPbE+zhrYb3zF1FaThZvO4oI19zbeMzg==
X-Google-Smtp-Source: ABdhPJzpBKwY1MNlxzs48ep/SyyUXbMbSuCPx/2SOEbcg94xvPUpsrVj3nNzyTZVhbJktevg51/PIiBB+WbNxEOR33M=
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr7413989wrq.174.1630832502813; 
 Sun, 05 Sep 2021 02:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
 <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
In-Reply-To: <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Sun, 5 Sep 2021 12:01:31 +0300
Message-ID: <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun 5. Sep 2021 at 11:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/4/21 10:35 PM, Philipp Tomsich wrote:
> > Assume clzw being executed on a register that is not sign-extended, such
> > as for the following sequence that uses (1ULL << 63) | 392 as the operand
> > to clzw:
> >       bseti   a2, zero, 63
> >       addi    a2, a2, 392
> >       clzw    a3, a2
> > The correct result of clzw would be 23, but the current implementation
> > returns -32 (as it performs a 64bit clz, which results in 0 leading zero
> > bits, and then subtracts 32).
> >
> > Fix this by changing the implementation to:
> >   1. shift the original register up by 32
> >   2. performs a target-length (64bit) clz
> >   3. return 32 if no bits are set
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >
> > Changes in v10:
> > - New patch, fixing correctnes for clzw called on a register with undefined
> >    (as in: not properly sign-extended) upper bits.
>
> But we have
>
>      return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
>
> should *not* be undefined.  Ah, what's missing is
>
>      ctx->w = true;
>
> within trans_clzw to cause the extend to take effect.
>
> There are a few other "w" functions that are missing that set, though they use EXT_NONE so
> there is no visible bug, it would probably be best to set w anyway.


I had originally considered that (it would have to be ctx->w = true;
and EXT_SIGN),
but that has the side-effect of performing an extension on the result
of the clzw as
well (i.e. bot get_gpr and set_gpr are extended).

However, this is not what clzw does: it only ignores the upper bits
and then produces
a result in the value-range [0..32]. An extension on the result of
either a clz or clzw
is never needed (we have been fighting that problem in GCC and had to
use patterns
for the combiner), so I don't want to introduce this inefficiency in qemu.

If you have EXT_SIGN (or _ZERO), we will end up with 2 additional
extensions (one
on the argument, one on the result) in addition to the 2 other tcg
operations that we
need (i.e. clzi/subi for the extending case, shli/clzi for the proposed fix).

So I believe that this commit is the best fix:
1. It doesn't mark this as a w-form (i.e. ignores the high-bits on the
input _and_
extends the output), as it only treats the input as 32bit, but the
output is xlen.
2. It doesn't introduce any unnecessary extensions, but handles the
case in-place.

Philipp.

