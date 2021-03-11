Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F509337F6E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:13:42 +0100 (CET)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKScn-0002FO-Fa
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSYz-0006c3-L7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:46 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:33381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSYw-0004xm-1Q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:45 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MYeV3-1lFu0e39tL-00VgRv; Thu, 11 Mar 2021 22:09:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] target/m68k: reformat m68k_features enum
Date: Thu, 11 Mar 2021 22:09:28 +0100
Message-Id: <20210311210934.1935587-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311210934.1935587-1-laurent@vivier.eu>
References: <20210311210934.1935587-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sKmoVwHrc2rugZUczC7p1JGt/bStYchDJ8ABrsELnYydaCsCnju
 1al+MuKjbcNYwG9pHwHc8slHJJqJF3hMmcL4V5zqGdlXss345CnfhglRFO2sXW/BSPpwjMt
 yttqeawepxNOQ9+MeAudKTSHVWcuaOEVXDqRIGGYHeQ7oLmzQTGMw7LKtOuqs/MeJxWwYkI
 mUI7za93RIJS+I+Nj3DDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6IMlN5zMgQw=:cR7eEYKnGUOkcqUAsUuYAs
 NW5TnrEsRrTjzhWxxc9fo6Gy+qnImpzlgW/p3TlUTq28EPMYrBiBwoFfPH9gi3hvhWMGowR1e
 DriDJZImcQXsUZ+pwbEAMA51heIuRKwEWzYOm+o1+tQxZQV5vePPldGlYPyKC/Hdi2AIeEWWh
 DJGLpX0hZ4ptvQWvYky9UzMx8x+kIAex9F1q6iUqsNaD+Zd1s/ExTJWKIDWbZnclwaxmy7xag
 KWxaZ0KBi+Ia+ombEiybEIsoSC2BkP8hy2uLfpzXUmd7sfxHAh805IE95zFLkVdahRK8ZwE+P
 Nx2VPiHYABUO6MpCfE1UL0l4YsUqeHRww1LCi5N/dUrCB5/N+SmreMrUzmmABwnpbCsJSmEWd
 4TONphindNSJv503X8c7BY8dHQUMwGst98pQaZMZQcFKP1eYN2YYlRYA9TWu/VfWXO4yworT7
 0pDwskFn3w==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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


