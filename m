Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A2400CE8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:37:44 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcQ3-0000La-PG
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNq-0005t5-Gj
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:26 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNn-0002pv-Ss
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:25 -0400
Received: by mail-lj1-x22c.google.com with SMTP id d16so4324168ljq.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYiLU0omQb8zc4O/0M0QZzZRlbsZchts4pRIajeol2U=;
 b=DsTbXGazDyi94g1Ktyc8avkgagC6+/95WNcZF5KGJ6nDF0wVDz5t3enfm5tRLXlscP
 EquwmK0xjz4FpCuHB8f/HOFBbB/L1v8+66FtWqLVSeo9Io+Btx8/1lkqMiSzffdzVMWd
 LEyaJ1YZYcNGEBlw/TJPV4MFcqJvlsmRENaPiWVq4ekLeR6o5yOaJAGtccvteM60Cx/C
 LhCvqzUvfzpDPN1VWHlXlZNrbMZwcVNIDls7EMnmvPmsr3GBmiKGHiGofzMIApurNtQV
 IsghTlj/oIGTIKwnndjFqn+aY5qU2o2rVsNlIh/H89U7iqSsMG4IXmonUqK2L0M5KKML
 RFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYiLU0omQb8zc4O/0M0QZzZRlbsZchts4pRIajeol2U=;
 b=EdlRPXfWbBDIgKxt+3Z/cZ7PtIAO2c6NY81yqZGlnFu28Q0g/7wlaxGi2lyYgB1Z9R
 2ehVFzWe6Je4duk3TkuHltY7twXzIJ9roIT4SoucDBVMlwA/Dhfpzav7pRgGvGvESahQ
 q94yHUU9boIriVco7L2fym3E6Z4NQNW8TWksReHwOihKeGDbuw/itnu5C0hxexBgiwf6
 DniwAY99Yr23XAawQGZb5i4N8fy2ld88GPsPscyAq1NTCsU0EgcSU08bxV3olZLXGh27
 TI5AIhh5fQYYwA6lYSLbWs7KkSvkht3oiA2BYg9RAnaovYmai2lrFSRvbzHJBblFLQ+Y
 64Kw==
X-Gm-Message-State: AOAM531tIFXtOSRl4C0XzcTvpA6Gc0xXd0d4+/iszqjSx6/TtOdR+nFH
 mIBPSKzjojFpMn9RfRiaCmGDzDmMrbZha/1OCu0=
X-Google-Smtp-Source: ABdhPJwCZmL0HG8ZKwxfGYq8mUR7bGyGIVT2LfX0SanI1YYl/6c/1huCOhvZzjqjBM6q0xwzpYZ1DA==
X-Received: by 2002:a2e:8504:: with SMTP id j4mr4021821lji.352.1630787719568; 
 Sat, 04 Sep 2021 13:35:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:19 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Sat,  4 Sep 2021 22:34:59 +0200
Message-Id: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22c.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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


Changes in v10:
- New patch, introducing a temporary in gen_add_uw
- New patch, fixing regressions in gen_clzw (discovered with x264_r)
- New patch, fixing correctness for gen_clzw, when called on a register 
  with undefined (as in: not properly sign-extended) upper bits.
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
 target/riscv/insn_trans/trans_rvb.c.inc | 417 ++++++++----------------
 target/riscv/translate.c                |   6 +
 8 files changed, 365 insertions(+), 438 deletions(-)

-- 
2.25.1


