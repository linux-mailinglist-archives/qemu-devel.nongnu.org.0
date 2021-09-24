Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C80416A4B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 05:04:52 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTbW7-0007xB-5z
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 23:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTbUG-0006dX-GZ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 23:02:56 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTbUE-0002FJ-It
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 23:02:56 -0400
Received: by mail-io1-xd36.google.com with SMTP id m11so10792678ioo.6
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 20:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/gQ7W+HasXv55VnjdUSQfqKA4IcjbIUgxrkrDHPYp5Q=;
 b=fgrmbkme/ajzFpTycFSyJtw26R+kG4jz+Hb3yr65qGSMH2obtRh1aFhET0w1IXi6Ke
 6baH5tcO8DIaZ/BAZe/Ij4im2pZzq3VvejlYr7NG1lSNyxrr8QCw6X8xtoPjyGw0oufh
 ORs2PeF3scJ6kidXPRrk23GT+7g5e/MFSAzO9tCpR8xGs7UNUymYPirpY5NOK6GCjhLR
 P+lhiUKc6VIrOQt2GBueoK5kWjc5h7bzz29U0ToyUmeGvQZK+8Cy/4Zx+F7NW3Zzl8ei
 zILkdxfbs7DQj8MMX5xuiWXcbhwrBW4TEQi8okqMIWdHo3OjOsN12iWuq66QtgQ5rl6m
 d2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/gQ7W+HasXv55VnjdUSQfqKA4IcjbIUgxrkrDHPYp5Q=;
 b=WlboitRSvGreVcNSi70v5PO5nfkBysLawLj7t0XbJDRVWF4vKkH1TOi+DL2IY1agne
 NUuforYNoS/H2iVCDlecTv7Zh9jTIt4GauOiy4Fai8HvWGKHKRHAz60tLzxOcub/Gtb1
 8suiiYXmxWZb2FZadTEcprI8aN7gjrq+iKZPTlKzcplXI3VHN77F5iuc0o095kOuTU2k
 OT02BYBi/JYNP07uLmclBaP1LWZG34lK95O+NEwk5kCVgKsNq2BNvxsoa5hPj6inukFW
 uK5QAh8PVlCODspE+hJv0+TysvvGssiScTnuEEbVMnbcVdIclnCKZ7CZ4I3BzdfQw3sY
 DAqg==
X-Gm-Message-State: AOAM532RiiRaAT62btAns1VwwPBWdG8i9ANiDgZTTx77Z+KFmyOk/GWP
 NYcLbZqrVXcgydTRyFF5ECSfY1wg5PMUXkh7yyM=
X-Google-Smtp-Source: ABdhPJwj/fy4vpfVLtqzhTYJV5eDvMxuKxXW2R0FAwpII58BO3b46bn+bSc8Z9M0g3p6UmVGuyGT5Kc5bSmGx6MI92o=
X-Received: by 2002:a6b:5913:: with SMTP id n19mr6709698iob.91.1632452572296; 
 Thu, 23 Sep 2021 20:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <CAAeLtUBY4Q-YoWVpp1L6ehG3p9RK3EvQ6JCgaXfhG8Qjyn1Z0g@mail.gmail.com>
In-Reply-To: <CAAeLtUBY4Q-YoWVpp1L6ehG3p9RK3EvQ6JCgaXfhG8Qjyn1Z0g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 13:02:26 +1000
Message-ID: <CAKmqyKMMaGj7uX0bssdMD4Dw-0MfZZnMLrf4hBmfFvY8V83DQQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 7:32 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Alistair,
>
> Is there something that is holding this series up?
> I believe we should avoid having an outdated draft version of the
> bitmanip proposal in 6.2.

Thanks for the ping.

Applied to riscv-to-apply.next

Alistair

>
> Thanks,
> Philipp.
>
>
> On Sat, 11 Sept 2021 at 16:00, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
> >
> >
> > The Zb[abcs] extensions have complete public review and are nearing
> > ratifications. These individual extensions are one part of what was
> > previously though of as the "BitManip" (B) extension, leaving the
> > final details of future Zb* extensions open as they will undergo
> > further public discourse.
> >
> > This series updates the earlier support for the B extension by
> >  - removing those instructions that are not included in Zb[abcs]
> >  - splitting this into 4 separate extensions that can be independently
> >    enabled: Zba (addressing), Zbb (basic bit-manip), Zbc (carryless
> >    multiplication), Zbs (single-bit operations)
> >  - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
> >    instructions are not included in Zb[abcs])
> >
> > For the latest version of the public review speicifcaiton
> > (incorporating some editorial fixes and corrections from the review
> > period), refer to:
> >   https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-31-g2af7256.pdf
> >
> >
> > Changes in v11:
> > - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.
> > - Fix typos in commit message.
> >
> > Changes in v10:
> > - New patch
> > - New patch, fixing regressions discovered with x264_r.
> > - New patch, fixing correctnes for clzw called on a register with undefined
> >   (as in: not properly sign-extended) upper bits.
> > - Retested with CF3 and SPEC2017 (size=test, size=ref); addressing new
> >   regressions (due to bugs in gen_clzw) from testing with SPEC2017 using
> >   different optimization levels
> > - Split off gen_add_uw() fix into a separate patch, as requested.
> >
> > Changes in v9:
> > - Retested with CF3 and SPEC2017 (size=test only).
> > - Rebased to 8880cc4362.
> > - Update gen_add_uw() to use a temporary instead of messing with
> >   arg1 (fixes a regression after rebase on CF3 and SPEC2017).
> > - Rebased to 8880cc4362.
> > - Picked up Alistair's Reviewed-by, after patman had failed to catch
> >   it for v8.
> > - Rebased to 8880cc4362.
> > - Fixes a whitespace-at-the-end-of-line warning for the rev8 comment
> >   in insn32.decode
> > - Rebased to 8880cc4362.
> >
> > Changes in v8:
> > - Optimize orc.b further by reordering the shift/and, updating the
> >   comment to reflect that we put the truth-value into the LSB, and
> >   putting the (now only) constant in a temporary
> > - Fold the final bitwise-not into the second and, using and andc.
> >
> > Changes in v7:
> > - Free TCG temporary in gen_orc_b().
> >
> > Changes in v6:
> > - Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.
> > - Fixed orc.b (now passes SPEC w/ optimized string functions) by
> >   adding the missing final negation.
> >
> > Changes in v5:
> > - Introduce gen_clmulh (as suggested by Richard H) and use to simplify
> >   trans_clmulh().
> >
> > Changes in v4:
> > - Drop rewrite of slli.uw (to match formal specification), as it would
> >   remove an optimization.
> > - Change orc.b to implementation suggested by Richard Henderson
> > - reorder trans_rev8* functions to be sequential
> > - rename rev8 to rev8_32 in decoder
> > - Renamed RV32 variant to zext_h_32.
> > - Reordered trans_zext_h_{32,64} to be next to each other.
> >
> > Changes in v3:
> > - Split off removal of 'x-b' property and 'ext_b' field into a separate
> >   patch to ensure bisectability.
> > - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
> >   and its use for qualifying the Zba instructions) are moved into
> >   a separate commit.
> > - Remove the W-form instructions from Zbs in a separate commit.
> > - Remove shift-one instructions in a separate commit.
> > - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
> >   its use for qualifying the Zba instructions) are moved into a
> >   separate commit.
> > - This adds the Zbc instructions as a spearate commit.
> > - Uses a helper for clmul/clmulr instead of inlining the calculation of
> >   the result (addressing a comment from Richard Henderson).
> > - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
> >   are now in a separate commit.
> > - Moved orc.b and gorc/gorci changes into separate commit.
> > - Using the simpler orc.b implementation suggested by Richard Henderson
> > - Moved the REQUIRE_32BIT macro into a separate commit.
> > - rev8-addition & grevi*-removal moved to a separate commit
> > - Moved zext.h-addition & pack*-removal to a separate commit.
> > - Removing RVB moved into a separate commit at the tail-end of the series.
> >
> > Changes in v2:
> > - Fix missing ';' from last-minute whitespace cleanups.
> >
> > Philipp Tomsich (16):
> >   target/riscv: Introduce temporary in gen_add_uw()
> >   target/riscv: fix clzw implementation to operate on arg1
> >   target/riscv: clwz must ignore high bits (use shift-left & changed
> >     logic)
> >   target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
> >   target/riscv: Reassign instructions to the Zba-extension
> >   target/riscv: Remove the W-form instructions from Zbs
> >   target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.93
> >     draft-B)
> >   target/riscv: Reassign instructions to the Zbs-extension
> >   target/riscv: Add instructions of the Zbc-extension
> >   target/riscv: Reassign instructions to the Zbb-extension
> >   target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
> >   target/riscv: Add a REQUIRE_32BIT macro
> >   target/riscv: Add rev8 instruction, removing grev/grevi
> >   target/riscv: Add zext.h instructions to Zbb, removing
> >     pack/packu/packh
> >   target/riscv: Remove RVB (replaced by Zb[abcs])
> >   disas/riscv: Add Zb[abcs] instructions
> >
> >  disas/riscv.c                           | 157 ++++++++-
> >  target/riscv/bitmanip_helper.c          |  65 +---
> >  target/riscv/cpu.c                      |  30 +-
> >  target/riscv/cpu.h                      |   7 +-
> >  target/riscv/helper.h                   |   6 +-
> >  target/riscv/insn32.decode              | 115 +++----
> >  target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++----------------
> >  target/riscv/translate.c                |   6 +
> >  8 files changed, 366 insertions(+), 439 deletions(-)
> >
> > --
> > 2.25.1
> >
>

