Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F953F4E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:43:09 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID2R-0000VP-PO
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0E-0006Dq-Hk
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:50 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0A-0006HI-LN
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:50 -0400
Received: by mail-lf1-x129.google.com with SMTP id y34so39119820lfa.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwjCbhw/7/F5PdXGh26uq9X6qb4Q4zRMpe7Sf5ZfADA=;
 b=S31LY2y86RCr9U6BRA//XfWG4+ccF4T675MKp32RPjrOryfpbDrY8//lq335cqplnH
 I6KOKY2hXzVWwvR55y4mPy3FdeORISHgGu8KHeeBJl3bCT4sGl2rnIeZg8Rzjz2IAJ5u
 Pdr3A0SMLf2AuxE4Fr/oBx54cA/m6AyrSWIk7I1f1dj2jeAL4kj3iwAa7Jg3D7x5B0uU
 QldpAPGWPv0RcZgGOfMboxmvrembU6Nv2vF7ZD1TmMO1WtpKrtpanSc4UUwVd2AAjVqV
 4siHA0hia4tqvQN9RnkG7nCqDptV2PWMoP9me5bBEq43zgJjDfwn/2V+9LrcOutAwGh2
 9ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwjCbhw/7/F5PdXGh26uq9X6qb4Q4zRMpe7Sf5ZfADA=;
 b=qajOb1IqSnHIHbc4QAK9LajuBaRWUczxo/ywZG20zmzac5XRKrO1i5VArw8Bb67EeI
 CSWNnCad3a8c7sQ1p6dYzM8oJDJhP9BLfZetpVVpZOpaLQKzNfzllR2e/9SLKZ7NJQhh
 UkKqK797g4k1GftGkAg5BlMvmlTRH+kxSnzmO4TW5l20umqCqppWAoDFTxGN32dLOR6O
 9B/4u7AwPya50v11i/2MVM14oGuXEUWpDNM7S3PHoi5foPpfGgiR0or8S1dIesuiYXka
 eW1iyeiOD1sSigdB3nUaRs69hGn9IdTO2/1jGmyuDKcYgXlOWimnPKhm3IkHEYF7XoMK
 KCLg==
X-Gm-Message-State: AOAM5332h6BBJCQl5SSE5YPUJCM5nx5PhxeKc5WU9i8Fgh+zovuH5jR0
 elC/dlUQRwNwrADj2AsoAypdaiyUHVsZlnvC
X-Google-Smtp-Source: ABdhPJwGmdto58S2Dz5+J0A4xr5UIshMhEkkxRSHR9cx/A3t/yGn4BuxrkT5dVblONQsTbCykvH3KQ==
X-Received: by 2002:a05:6512:1385:: with SMTP id
 p5mr26052090lfa.447.1629736842080; 
 Mon, 23 Aug 2021 09:40:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:41 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Mon, 23 Aug 2021 18:40:23 +0200
Message-Id: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x129.google.com
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

For the latest version of the public review specificaiton
(incorporating some editorial fixes and corrections from the review
period), refer to:
  https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-31-g2af7256.pdf


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

Philipp Tomsich (15):
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
  target/riscv: rewrite slli.uw implementation to mirror formal spec
  disas/riscv: Add Zb[abcs] instructions

 disas/riscv.c                           | 157 ++++++++++-
 target/riscv/bitmanip_helper.c          |  65 +----
 target/riscv/cpu.c                      |  31 +--
 target/riscv/cpu.h                      |   7 +-
 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              | 111 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 344 +++++++++---------------
 target/riscv/translate.c                |  94 +------
 8 files changed, 364 insertions(+), 451 deletions(-)

-- 
2.25.1


