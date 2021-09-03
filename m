Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70240009D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:37:36 +0200 (CEST)
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Nv-0004TA-WD
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91W-0001q4-TX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:26 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91U-0003bC-4n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:26 -0400
Received: by mail-lj1-x229.google.com with SMTP id i28so9545984ljm.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJhzvNtQAEWlBRqD8qoeRWq8vwNVjIh23PA+u/VXADc=;
 b=YoiLhEtwXN4Nmw+dVMhz9cf4WCKkv4Z/G51buQIHo0ai9V4WXeAjYAlZbb+6sWhmFb
 YrnD7KjaYq+OniAoMYVuDIMvFvOFlF8UXGOVFhMM3pgLuY6in+5B/YD8k6WCE2fYbGCk
 2WbOQzQuLwoejZUA+q/RDWiHNtxW1J4rc/N6MrXabnbQDALViDKo3xGZTSVamJb8vo8j
 fgJFtIU77XwCjHnBYrQIhcrGR/LLo05ux2/W23NMEk57A5qomtgJfJJu3GJbw/DxK3Av
 n7CEbefALZtqM/DQv6MZ91bf+p39d/h2f0P5JUd0en0nPDCCIrPkMgJFzQLUdo74Cq3a
 4rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJhzvNtQAEWlBRqD8qoeRWq8vwNVjIh23PA+u/VXADc=;
 b=Q9x/h3qoyst25yuI01YxTJn1CIRojRzJslnMBxB1apUZ37LU1k2ikVpQRs6qxhRz1K
 3JwX5WQtRkQzcBkRnX2dcEttlRY17r4B9njUhIRBD+OtN7sHSXg3F0b0tbJ8HFn+H2IX
 h9tFxm+r75W4189h+5FZIwXCzhm62REuhD4u4i7j+C6AQK4xT4rwwF5fK952iFh0Zf+0
 ET1ROqtuz2XyMhcRSSiuL0RantW40OKIC8PFDU5QveHVCVH+thIp9jM4mejaHSEC8ezd
 Ji3ACQvPZ2Q0AFmFg5a5SyHiIdmwi0AoxLz8f5Gzkz5MymumadarYAJetnzkRRwkC2cN
 BNrg==
X-Gm-Message-State: AOAM53331CrME73nYKGoIyDRBFA8p510H5JbORnprBCOKMw2zgAFExlP
 TZIlD9n7gEPkmG43CKKLCErr7IY9+09nxYMVnig=
X-Google-Smtp-Source: ABdhPJzYBK5eVVzkOX7mGPX94PiA8p2YDCGd7CBDL/mtuFJFndpANF7mql2jqZh5Q6VOQTdOsFnHwg==
X-Received: by 2002:a2e:b703:: with SMTP id j3mr2873669ljo.63.1630674859684;
 Fri, 03 Sep 2021 06:14:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:19 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/14] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Fri,  3 Sep 2021 15:14:03 +0200
Message-Id: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x229.google.com
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
- Instead of defining a new decoding format, we treat slli.uw as if it
  had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
  and check for validity of the encoding in C code.
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

Philipp Tomsich (14):
  target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
  target/riscv: Reassign instructions to the Zba-extension
  target/riscv: slli.uw is only a valid encoding if shamt first in 64
    bits
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
  target/riscv: Remove RVB (replaced by Zb[abcs]
  disas/riscv: Add Zb[abcs] instructions

 disas/riscv.c                           | 157 ++++++++++-
 target/riscv/bitmanip_helper.c          |  65 +----
 target/riscv/cpu.c                      |  31 +--
 target/riscv/cpu.h                      |   7 +-
 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              | 115 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 341 +++++++++---------------
 target/riscv/translate.c                |  94 +------
 8 files changed, 368 insertions(+), 448 deletions(-)

-- 
2.25.1


