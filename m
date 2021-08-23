Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA73F5034
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:14:06 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEST-00009Y-Oj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQE-0006On-EE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:49 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:34784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQ8-0008HL-3C
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:46 -0400
Received: by mail-lj1-x231.google.com with SMTP id f2so33065701ljn.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kn4JCjIZK8db40/+8b9cV2uzqQAj0vQrPXfvKY7arHs=;
 b=x4MgPVialzwJ/H0t66tey7Yxv6rcbN/8xiu2IQjv4WFKzcDvB7pDY+qp1J5C3Y4bfa
 pOVuGK4+HkuV+Uokho7nW61Lck1g8PAFJfLC+StIpdjtpV2jJya1Ybfz8i8XJxyBf2nT
 dprFH4PIJAne2TkeUZPXEn8x59/xyawHEl7+4VS4u5fGbUb6Z70lMRYHcrciWVlZ7Z+N
 iya8BFYkzrJG5zGx6+h6Et9grQei2u8zE1INZ2fH7d+Z1zIK2h6W8LUFgA0ZHLSejN8x
 rfwWuIFb6h/To377E3QOkvVFpuLYqz/857ciRuvL+zZNYy8VK1yrKfBJeDysql4SdEto
 mfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kn4JCjIZK8db40/+8b9cV2uzqQAj0vQrPXfvKY7arHs=;
 b=hEfPRdcw8ZIuac5ZZnoJavWZ20MQYiTgk9PVF3FRLEMnEl94nIZ90Yjv8wykMiBr3b
 oSRA28KB78X0HUSUYqcoAQjKhpOFagXnXTL5/QNmwT1MZ0g00vBRgc3n2f8TmhCEBJrI
 HZrI/1pyUeQ2cWGgoNxzFtU05to65fczrvsiWKDz/dySdPFVVAluhOpNraFPvJhzjhWN
 apQntQOUmIJeLUiTUzzMAKqASUPwlAu4doFjRYthl9DbWEg8M9SSQ1F/IHymt8W71W4X
 kkZ4pSgJkHPErNtG6/XjBqxhNlohHNTi4K/BT4KpsL6XUCwA2li0lncPIDzyoQMUe2nD
 3pXQ==
X-Gm-Message-State: AOAM530JhXG23bzMSTRVBAwl3PVRjAGUDYWYXEMWsLdDxAxznYdlupur
 paASEU3CQwaRhbh+eym5U8Atx3jksC4aJ+EB
X-Google-Smtp-Source: ABdhPJzZqf+hHmiWmRJWYLfW84PAdwI6BYWUOdWbljcVvLNsUumCEdDGY3xiqJNUse7PCoNW0q0vww==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr29107967ljh.472.1629742296658; 
 Mon, 23 Aug 2021 11:11:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:36 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/14] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Mon, 23 Aug 2021 20:11:18 +0200
Message-Id: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x231.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


Changes in v4:
- Drop rewrite of slli.uw (to match formal specification), as it would
  remove an optimization [dropped patch 14/15]
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
 target/riscv/insn_trans/trans_rvb.c.inc | 343 +++++++++---------------
 target/riscv/translate.c                |  94 +------
 8 files changed, 370 insertions(+), 448 deletions(-)

-- 
2.25.1


