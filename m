Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F63FB46E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:18:24 +0200 (CEST)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfIw-0001Hb-9s
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGc-0006pS-7Y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:54 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGV-0004UK-Uu
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:53 -0400
Received: by mail-lf1-x133.google.com with SMTP id m18so16280093lfl.10
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJxrnISwEXQRS2WcwTJlqB8GFrK/gHsxblNNv1TYnhc=;
 b=xDyMpdP77QecZGypjnpxsI6CBqtFm7lwVcjT2/Kwk0+3rZPVav8n1SxefFn7x2LhRQ
 cLbix9v2dCjE7S9PKy19JhkdCXxdXB7pEc/p/dEUtpd0+NWmDSQrxEpKNwfkRnqZ9xzu
 CZ2s1q2xTV59GjIzcwz9mBthr6qmt+e0wn5huNxxATbuu8CWV/klchN9V1RKjXJpzVU6
 nxB0QW8FxLnDLu/tB2t1N1S3RpPdeev8zJWB6X29vxBmO3VQ9aMTMwLquR2yKNg+F93f
 OQLbIMIUMKtzy+H30cIVdRk35ZWqJ+7HDMJKJD+HKXgHNEOz3j2BGJeTI4e0I0CNPUSl
 B2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJxrnISwEXQRS2WcwTJlqB8GFrK/gHsxblNNv1TYnhc=;
 b=VltkCYQDstc/ewksfykMrOVfwg/PsLwzoNMq3evOz5P6vm9plTs2+v7GPRrEu+n3Vj
 BQx4vJyNCEH6nR2opwdmyGi9/9+9mcyWTVJcDjEa3gs/Ebt5b/A1BsWAJfj1omb7Rg8V
 7vXzqfwkIeQpY3iAie+F4lzmT6HO3fArDkLquB173acDvznQDzAap8hX+A22+9FlE6Rn
 OVGTxUesYzuj9/S1UhXHU6Tt8iI3jrphylGRAq3AdKAI5GgDi2S5OtUCigXYW0gqpqHw
 meXlWV1ZGU1G3Hwc7Pwa1Cg7HSaDMK95Nxdo7pN6a43MVbv/w9ADmTt9VY1LTyFSQoUx
 Aiqg==
X-Gm-Message-State: AOAM5301nnrey2Z6RUNo4fvUX3jkZVUO5BPU2lNr7pNjsud+JXT0pD0v
 9qTg61qXH6HbuFHYFMnUVpL+GQ59U9ce0wuq
X-Google-Smtp-Source: ABdhPJwvZPrXfzYUz1dXyTb9z7rNQzW94q6rKZ/h7gxVslmReyjkJZnfVOzarE7ZsTPG2+cY9Qsi3A==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr16142009lfp.108.1630322144434; 
 Mon, 30 Aug 2021 04:15:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:44 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/14] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Mon, 30 Aug 2021 13:14:58 +0200
Message-Id: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
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


Sorry for the resend, but the v5 from a few minutes ago was a v6 and I
forgot to update the 'Series-version' on it.

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
 target/riscv/insn_trans/trans_rvb.c.inc | 343 +++++++++---------------
 target/riscv/translate.c                |  94 +------
 8 files changed, 370 insertions(+), 448 deletions(-)

-- 
2.25.1


