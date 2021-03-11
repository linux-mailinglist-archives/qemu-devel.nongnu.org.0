Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41645338036
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:23:49 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTie-0008PL-AH
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTdi-0004KU-8E
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:42 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTda-00049q-7b
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:18:42 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MoNMu-1m4Ywi0tWS-00okY5; Thu, 11 Mar 2021 23:18:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] target/m68k: reformat m68k_features enum
Date: Thu, 11 Mar 2021 23:18:26 +0100
Message-Id: <20210311221827.2595898-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311221827.2595898-1-laurent@vivier.eu>
References: <20210311221827.2595898-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jJhmzEZMbApwm0FdxCVUj2ShjGahmvaTThpZVfciltqosyktFOJ
 1Lqijb9k5dqpzlaDXCdU9EK3sHFkUFHJNsxO9UvBALCcnJZVBci+S08gbg3/G69CORJQ4Tm
 aoPw2BbmaH9fBMoOfmT/JfnDqa12j3yQYq/bZxsb5IyfgKFqT5jdnJxAPzI0xJc6gNFyl6D
 7udu6YBBnX/PdcZZruCMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4xQ3q7aL+Ys=:2I1JS8rSrT5gyOaIxptZcP
 g6IftZRbKdcV4eCHBu3hhg8eK1lKUC7vgOlQqYJ/CcY6B2KnBlAVBVENiRiS3EFosMGzQOEgF
 /5mA0qJWEj2jOdZHbotAet/YsgWGwhh19l6Rpl6X83pre4BmNVQx7V8d3WLfnsHhE9E8fSCL/
 zJ4dFr9rVAHwZBb/DMWmpOtK+lA6wMFpialo0whbfYApRLBs8swUWalWB260BHAOv/zcATeOL
 tKDVuwKzR/u785axbaBTwJoM9G97z1/Q2Ddpbg6FqTevnZN+R64f3nHgicvskQSfpnfwWZYxb
 lEabMsTz5wC61ZQTs+aMQoSwFOPHVhiQsLky5YJ+79HNdUkCG2nznOClMTsyj/6ZjxpJgNdbl
 YMDRU3NlryCtRmeZIBRYBnE30ojkR/8hkishtfkVFjAzMAH5SmURvucSuUcSPnH0krTC8LSZy
 OF1WsKwlHg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Move the feature comment from after the feature name to the preceding line to
allow for longer feature names and descriptions without hitting the 80
character line limit.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h | 66 +++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7c3feeaf8a64..ce558e9b03e7 100644
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
2.29.2


