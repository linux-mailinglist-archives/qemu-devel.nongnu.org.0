Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31534078A3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:10:05 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3hk-0007ZO-Fm
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YT-0002Qt-Qd
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YO-0005ZO-1p
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:29 -0400
Received: by mail-lj1-x22e.google.com with SMTP id s3so8172688ljp.11
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKvduzJgehXkAODPrN9r/R56BDLycMZkNN/ybiz9Q1A=;
 b=ShXtDPF5S7fx2b8Y1oJUW5htHIBRDU9Ll8s2l1ydudIBn3aqF4+IVPSloA0tmDTrSH
 4rfJVHtovXqO+TOVfkveKHb0bvfxvmQcJwbPhwJtS0FvmPmv8KK46hanSIlW2KvvK6an
 Ytg1VKXO2mWdsGWb74py9y7NZzO78sZ/UNpS2rf2ocM1jBXsKvQceXSqXNHt8iG4J2Be
 6xh6AH2iy6LclixJoh+Zey6lrjQrIYojIgVc/oEcDePebqRaAIhTN8xx99AZIH4ZlLFJ
 UduNZ29PQpCxxVSz4DJwy+y0UCFsMWjDunWyxmnWxJZMP3sMtL0kV2XFqPdf1ThEA3kX
 wwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKvduzJgehXkAODPrN9r/R56BDLycMZkNN/ybiz9Q1A=;
 b=x4POh63QPIb+wjhDu2rKNgvDS7xTim94pYNQNksq5Qz215yH6IMnUBggV3bwsGOf2a
 da1D9pAOxbs2qAPgrByLXqXwzfL2pBoCB+6ma/xkttBb5io9Usonx1Wz4n+lAEo2KqqI
 4gpekGxfm4a2uEoKEq8CsttZdRUDMAt3YesAMpTrhr+tq60hsuqhW3a21Aza+R+ODGCH
 fDwv3EZU1CZiuBeW7jgfHw28/5Dd65Jwh1qryhCg4z9N84Ji//Z1CqTGpcbAX7j5ZkBa
 /+sqbqMBBh2u8K62HvhNkgru6+a5TCoav4q+X87lIEW/7A9dw8TEU8z6tOqJRESRGwpi
 HyzQ==
X-Gm-Message-State: AOAM531QQA3iSxOrYtDxa6ik5iIxQem8cx2b81rKB0dBxtzZArn1bfp4
 lrKWozJJ1hac07THKaa5iZsboDiVTVz5Lw==
X-Google-Smtp-Source: ABdhPJwXDzx6D3nNED+tPaLGhnEgmj6QdNHeS+WphaHb5TKRRoYafxnLZneiRf3VG4wqIsEBBeCHDA==
X-Received: by 2002:a2e:a4db:: with SMTP id p27mr2312250ljm.161.1631368820104; 
 Sat, 11 Sep 2021 07:00:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:19 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Sat, 11 Sep 2021 16:00:00 +0200
Message-Id: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22e.google.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The Zb[abcs] extensions have complete public review and are nearing
ratifications. These individual extensions are one part of what was
previously though of as the "BitManip" (B) extension, leaving the
final details of future Zb* extensions open as they will undergo
further public discourse.

This series updates the earlier support for the B extension by
 - removing those instructions that are not included in Zb[abcs]
 - splitting this into 4 separate extensions that can be independently
   enabled: Zba (addressing), Zbb (basic bit-manip), Zbc (carryless
   multiplication), Zbs (single-bit operations)
 - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
   instructions are not included in Zb[abcs])

For the latest version of the public review speicifcaiton
(incorporating some editorial fixes and corrections from the review
period), refer to:
  https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-31-g2af7256.pdf


Changes in v11:
- Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.
- Fix typos in commit message.

Changes in v10:
- New patch
- New patch, fixing regressions discovered with x264_r.
- New patch, fixing correctnes for clzw called on a register with undefined
  (as in: not properly sign-extended) upper bits.
- Retested with CF3 and SPEC2017 (size=test, size=ref); addressing new
  regressions (due to bugs in gen_clzw) from testing with SPEC2017 using
  different optimization levels
- Split off gen_add_uw() fix into a separate patch, as requested.

Changes in v9:
- Retested with CF3 and SPEC2017 (size=test only).
- Rebased to 8880cc4362.
- Update gen_add_uw() to use a temporary instead of messing with
  arg1 (fixes a regression after rebase on CF3 and SPEC2017).
- Rebased to 8880cc4362.
- Picked up Alistair's Reviewed-by, after patman had failed to catch
  it for v8.
- Rebased to 8880cc4362.
- Fixes a whitespace-at-the-end-of-line warning for the rev8 comment
  in insn32.decode
- Rebased to 8880cc4362.

Changes in v8:
- Optimize orc.b further by reordering the shift/and, updating the
  comment to reflect that we put the truth-value into the LSB, and
  putting the (now only) constant in a temporary
- Fold the final bitwise-not into the second and, using and andc.

Changes in v7:
- Free TCG temporary in gen_orc_b().

Changes in v6:
- Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.
- Fixed orc.b (now passes SPEC w/ optimized string functions) by
  adding the missing final negation.

Changes in v5:
- Introduce gen_clmulh (as suggested by Richard H) and use to simplify
  trans_clmulh().

Changes in v4:
- Drop rewrite of slli.uw (to match formal specification), as it would
  remove an optimization.
- Change orc.b to implementation suggested by Richard Henderson
- reorder trans_rev8* functions to be sequential
- rename rev8 to rev8_32 in decoder
- Renamed RV32 variant to zext_h_32.
- Reordered trans_zext_h_{32,64} to be next to each other.

Changes in v3:
- Split off removal of 'x-b' property and 'ext_b' field into a separate
  patch to ensure bisectability.
- The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
  and its use for qualifying the Zba instructions) are moved into
  a separate commit.
- Remove the W-form instructions from Zbs in a separate commit.
- Remove shift-one instructions in a separate commit.
- The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
  its use for qualifying the Zba instructions) are moved into a
  separate commit.
- This adds the Zbc instructions as a spearate commit.
- Uses a helper for clmul/clmulr instead of inlining the calculation of
  the result (addressing a comment from Richard Henderson).
- The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
  are now in a separate commit.
- Moved orc.b and gorc/gorci changes into separate commit.
- Using the simpler orc.b implementation suggested by Richard Henderson
- Moved the REQUIRE_32BIT macro into a separate commit.
- rev8-addition & grevi*-removal moved to a separate commit
- Moved zext.h-addition & pack*-removal to a separate commit.
- Removing RVB moved into a separate commit at the tail-end of the series.

Changes in v2:
- Fix missing ';' from last-minute whitespace cleanups.

Philipp Tomsich (16):
  target/riscv: Introduce temporary in gen_add_uw()
  target/riscv: fix clzw implementation to operate on arg1
  target/riscv: clwz must ignore high bits (use shift-left & changed
    logic)
  target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
  target/riscv: Reassign instructions to the Zba-extension
  target/riscv: Remove the W-form instructions from Zbs
  target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.93
    draft-B)
  target/riscv: Reassign instructions to the Zbs-extension
  target/riscv: Add instructions of the Zbc-extension
  target/riscv: Reassign instructions to the Zbb-extension
  target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
  target/riscv: Add a REQUIRE_32BIT macro
  target/riscv: Add rev8 instruction, removing grev/grevi
  target/riscv: Add zext.h instructions to Zbb, removing
    pack/packu/packh
  target/riscv: Remove RVB (replaced by Zb[abcs])
  disas/riscv: Add Zb[abcs] instructions

 disas/riscv.c                           | 157 ++++++++-
 target/riscv/bitmanip_helper.c          |  65 +---
 target/riscv/cpu.c                      |  30 +-
 target/riscv/cpu.h                      |   7 +-
 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              | 115 +++----
 target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++----------------
 target/riscv/translate.c                |   6 +
 8 files changed, 366 insertions(+), 439 deletions(-)

-- 
2.25.1


