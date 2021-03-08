Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A1330D2B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:15:38 +0100 (CET)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEnR-0005Yg-De
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEkB-0002r7-Qh
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:12:15 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45214
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEk9-0001sT-Bf
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:12:15 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEk4-0004B0-OP; Mon, 08 Mar 2021 12:12:13 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon,  8 Mar 2021 12:11:54 +0000
Message-Id: <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 2/3] target/m68k: reformat m68k_features enum
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the feature comment from after the feature name to the preceding line to
allow for longer feature names and descriptions without hitting the 80
character line limit.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.h | 66 +++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7c3feeaf8a..ce558e9b03 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -475,36 +475,58 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
  */
 
 enum m68k_features {
-    M68K_FEATURE_M68000,   /* Base m68k instruction set */
+    /* Base m68k instruction set */
+    M68K_FEATURE_M68000,
     M68K_FEATURE_M68010,
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
     M68K_FEATURE_M68040,
     M68K_FEATURE_M68060,
-    M68K_FEATURE_CF_ISA_A, /* Base Coldfire set Rev A. */
-    M68K_FEATURE_CF_ISA_B, /* (ISA B or C). */
-    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
-    M68K_FEATURE_BRAL, /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
+    /* Base Coldfire set Rev A. */
+    M68K_FEATURE_CF_ISA_A,
+    /* (ISA B or C). */
+    M68K_FEATURE_CF_ISA_B,
+    /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
+    M68K_FEATURE_CF_ISA_APLUSC,
+    /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
+    M68K_FEATURE_BRAL,
     M68K_FEATURE_CF_FPU,
     M68K_FEATURE_CF_MAC,
     M68K_FEATURE_CF_EMAC,
-    M68K_FEATURE_CF_EMAC_B,   /* Revision B EMAC (dual accumulate). */
-    M68K_FEATURE_USP, /* User Stack Pointer. (680[012346]0, ISA A+, B or C).*/
-    M68K_FEATURE_MSP, /* Master Stack Pointer. (680[234]0) */
-    M68K_FEATURE_EXT_FULL,    /* 68020+ full extension word. */
-    M68K_FEATURE_WORD_INDEX,  /* word sized address index registers. */
-    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers. */
-    M68K_FEATURE_LONG_MULDIV, /* 32 bit mul/div. (680[2346]0, and CPU32) */
-    M68K_FEATURE_QUAD_MULDIV, /* 64 bit mul/div. (680[2346]0, and CPU32) */
-    M68K_FEATURE_BCCL,  /* Bcc with Long branches. (680[2346]0, and CPU32) */
-    M68K_FEATURE_BITFIELD, /* BFxxx Bit field insns. (680[2346]0) */
-    M68K_FEATURE_FPU,   /* fpu insn. (680[46]0) */
-    M68K_FEATURE_CAS,   /* CAS/CAS2[WL] insns. (680[2346]0) */
-    M68K_FEATURE_BKPT,  /* BKPT insn. (680[12346]0, and CPU32) */
-    M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
-    M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
-    M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
-    M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
+    /* Revision B EMAC (dual accumulate). */
+    M68K_FEATURE_CF_EMAC_B,
+    /* User Stack Pointer. (680[012346]0, ISA A+, B or C). */
+    M68K_FEATURE_USP,
+    /* Master Stack Pointer. (680[234]0) */
+    M68K_FEATURE_MSP,
+    /* 68020+ full extension word. */
+    M68K_FEATURE_EXT_FULL,
+    /* word sized address index registers. */
+    M68K_FEATURE_WORD_INDEX,
+    /* scaled address index registers. */
+    M68K_FEATURE_SCALED_INDEX,
+    /* 32 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_LONG_MULDIV,
+    /* 64 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_QUAD_MULDIV,
+    /* Bcc with Long branches. (680[2346]0, and CPU32) */
+    M68K_FEATURE_BCCL,
+    /* BFxxx Bit field insns. (680[2346]0) */
+    M68K_FEATURE_BITFIELD,
+    /* fpu insn. (680[46]0) */
+    M68K_FEATURE_FPU,
+    /* CAS/CAS2[WL] insns. (680[2346]0) */
+    M68K_FEATURE_CAS,
+    /* BKPT insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_BKPT,
+    /* RTD insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_RTD,
+    /* CHK2 insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_CHK2,
+    /* MOVEP insn. (680[01234]0, and CPU32) */
+    M68K_FEATURE_MOVEP,
+    /* MOVEC insn. (from 68010) */
+    M68K_FEATURE_MOVEC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
-- 
2.20.1


