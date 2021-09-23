Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA96416782
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 23:33:26 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTWLM-00029U-TN
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 17:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mTWJv-0001T8-3N
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 17:32:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mTWJn-0001ax-My
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 17:31:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so21186687wrq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdNbrx0oncsyHBcKhKv+xBGz+DqInAcsRuS36p8/MJs=;
 b=R8zak2p4K+jKSjs0CET7yBMbrRBtOvbkoZMgqdFmRjD215lzp8KHZAWKVAqcCMj3ao
 zwwFHyDyie4Oj4hTsmCsHn8BaDqdkHOyiqB8hcJZT9ITTK0HtaLWQpft1M7B3rqYXBH0
 GNT3tyYkphvEw+sOLkV1M6/e/FeAXNqnjq+KGzZ0hb4cqVHODRxMXShmcEJaQWRmMFnG
 2CKxNd5GaQHOSxK4xCVbqNdtyIgawB30Xd0fIVkbF5dSfq/TgYJqTcjMl//BOhQmSePl
 JfTEQR6SA6oKW1FbJAAuGBfDwTUpd4hmS/bJjDEn+Ea5elhdoviP3YYn119rS6ao9osE
 dGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdNbrx0oncsyHBcKhKv+xBGz+DqInAcsRuS36p8/MJs=;
 b=kMDJhoHip3j2Wq3fNWhucCZwC+i5G1fqVmLXh2oSR/0/8D4WHU1zD3LxfE7MSG+Fjq
 shfhsB341hO8BjNizT5SOh2RKp5eGraZzCcdEMyUVOaLsyVZ+C11LafRE4Ks1H6ENVH9
 JjHkDTBfFPlkPK45l4TxyEFqpNGEHncgc93a3s98CcpHEzA8Iudr6QJ/P4lsOuLgrxi8
 Xjz8kZ06m8U1MQLzs0OIrDc5twVF9KJPOypj/aw4SZDnAIQ555Z3v4QJ8bydoWfNiT5e
 3VEb7FIlNPwQxaGVXN/yrvdefjCqtaj2hZJjRKx8djRE5zYAcPvpFD0RuGfoveMrfs79
 GNPw==
X-Gm-Message-State: AOAM530pDakhzvMvSKjtqMxaq+AwuckBPZlnmR1IjLEMEBBtawhwq9qq
 RuOCqT+EOOG+sTtQtznNq+CvLVF5Uy3IpzG2fEO6WbxOuImD/w==
X-Google-Smtp-Source: ABdhPJzVrcqjfZHdMNcmOELt74UbzL0sFU8f2X7FsrC4H15x3vIBWuYwYPKFRHu3QgLEyZDxme0JwCFKstiGZidBEY4=
X-Received: by 2002:a5d:6545:: with SMTP id z5mr7692138wrv.90.1632432704241;
 Thu, 23 Sep 2021 14:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 23 Sep 2021 23:31:33 +0200
Message-ID: <CAAeLtUBY4Q-YoWVpp1L6ehG3p9RK3EvQ6JCgaXfhG8Qjyn1Z0g@mail.gmail.com>
Subject: Re: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x434.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alistair,

Is there something that is holding this series up?
I believe we should avoid having an outdated draft version of the
bitmanip proposal in 6.2.

Thanks,
Philipp.


On Sat, 11 Sept 2021 at 16:00, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
>
> The Zb[abcs] extensions have complete public review and are nearing
> ratifications. These individual extensions are one part of what was
> previously though of as the "BitManip" (B) extension, leaving the
> final details of future Zb* extensions open as they will undergo
> further public discourse.
>
> This series updates the earlier support for the B extension by
>  - removing those instructions that are not included in Zb[abcs]
>  - splitting this into 4 separate extensions that can be independently
>    enabled: Zba (addressing), Zbb (basic bit-manip), Zbc (carryless
>    multiplication), Zbs (single-bit operations)
>  - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
>    instructions are not included in Zb[abcs])
>
> For the latest version of the public review speicifcaiton
> (incorporating some editorial fixes and corrections from the review
> period), refer to:
>   https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-31-g2af7256.pdf
>
>
> Changes in v11:
> - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.
> - Fix typos in commit message.
>
> Changes in v10:
> - New patch
> - New patch, fixing regressions discovered with x264_r.
> - New patch, fixing correctnes for clzw called on a register with undefined
>   (as in: not properly sign-extended) upper bits.
> - Retested with CF3 and SPEC2017 (size=test, size=ref); addressing new
>   regressions (due to bugs in gen_clzw) from testing with SPEC2017 using
>   different optimization levels
> - Split off gen_add_uw() fix into a separate patch, as requested.
>
> Changes in v9:
> - Retested with CF3 and SPEC2017 (size=test only).
> - Rebased to 8880cc4362.
> - Update gen_add_uw() to use a temporary instead of messing with
>   arg1 (fixes a regression after rebase on CF3 and SPEC2017).
> - Rebased to 8880cc4362.
> - Picked up Alistair's Reviewed-by, after patman had failed to catch
>   it for v8.
> - Rebased to 8880cc4362.
> - Fixes a whitespace-at-the-end-of-line warning for the rev8 comment
>   in insn32.decode
> - Rebased to 8880cc4362.
>
> Changes in v8:
> - Optimize orc.b further by reordering the shift/and, updating the
>   comment to reflect that we put the truth-value into the LSB, and
>   putting the (now only) constant in a temporary
> - Fold the final bitwise-not into the second and, using and andc.
>
> Changes in v7:
> - Free TCG temporary in gen_orc_b().
>
> Changes in v6:
> - Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.
> - Fixed orc.b (now passes SPEC w/ optimized string functions) by
>   adding the missing final negation.
>
> Changes in v5:
> - Introduce gen_clmulh (as suggested by Richard H) and use to simplify
>   trans_clmulh().
>
> Changes in v4:
> - Drop rewrite of slli.uw (to match formal specification), as it would
>   remove an optimization.
> - Change orc.b to implementation suggested by Richard Henderson
> - reorder trans_rev8* functions to be sequential
> - rename rev8 to rev8_32 in decoder
> - Renamed RV32 variant to zext_h_32.
> - Reordered trans_zext_h_{32,64} to be next to each other.
>
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>   patch to ensure bisectability.
> - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
>   and its use for qualifying the Zba instructions) are moved into
>   a separate commit.
> - Remove the W-form instructions from Zbs in a separate commit.
> - Remove shift-one instructions in a separate commit.
> - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
>   its use for qualifying the Zba instructions) are moved into a
>   separate commit.
> - This adds the Zbc instructions as a spearate commit.
> - Uses a helper for clmul/clmulr instead of inlining the calculation of
>   the result (addressing a comment from Richard Henderson).
> - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
>   are now in a separate commit.
> - Moved orc.b and gorc/gorci changes into separate commit.
> - Using the simpler orc.b implementation suggested by Richard Henderson
> - Moved the REQUIRE_32BIT macro into a separate commit.
> - rev8-addition & grevi*-removal moved to a separate commit
> - Moved zext.h-addition & pack*-removal to a separate commit.
> - Removing RVB moved into a separate commit at the tail-end of the series.
>
> Changes in v2:
> - Fix missing ';' from last-minute whitespace cleanups.
>
> Philipp Tomsich (16):
>   target/riscv: Introduce temporary in gen_add_uw()
>   target/riscv: fix clzw implementation to operate on arg1
>   target/riscv: clwz must ignore high bits (use shift-left & changed
>     logic)
>   target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
>   target/riscv: Reassign instructions to the Zba-extension
>   target/riscv: Remove the W-form instructions from Zbs
>   target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.93
>     draft-B)
>   target/riscv: Reassign instructions to the Zbs-extension
>   target/riscv: Add instructions of the Zbc-extension
>   target/riscv: Reassign instructions to the Zbb-extension
>   target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
>   target/riscv: Add a REQUIRE_32BIT macro
>   target/riscv: Add rev8 instruction, removing grev/grevi
>   target/riscv: Add zext.h instructions to Zbb, removing
>     pack/packu/packh
>   target/riscv: Remove RVB (replaced by Zb[abcs])
>   disas/riscv: Add Zb[abcs] instructions
>
>  disas/riscv.c                           | 157 ++++++++-
>  target/riscv/bitmanip_helper.c          |  65 +---
>  target/riscv/cpu.c                      |  30 +-
>  target/riscv/cpu.h                      |   7 +-
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/insn32.decode              | 115 +++----
>  target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++----------------
>  target/riscv/translate.c                |   6 +
>  8 files changed, 366 insertions(+), 439 deletions(-)
>
> --
> 2.25.1
>

