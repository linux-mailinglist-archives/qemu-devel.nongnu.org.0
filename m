Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90D44C303A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:47:00 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGKZ-0006aA-O7
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHR-0003Tq-Mm
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:45 -0500
Received: from [2607:f8b0:4864:20::1034] (port=35359
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHK-0008IX-UW
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:45 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so6068554pjt.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMXJInF9ZPVHQDzGiyA7uwA9d5Cdj1thl1LcQZwqB1s=;
 b=KkHFsTJRy0LjWNvZ8w8trx8dpGwc8mAW5RqX7/y6JtMupIxnX270hxHXsvr6PWAQkx
 BxqEKNf0UmnsDfipL9gAWPCDaZio7usWdAQsXV196GJc/kJBBqS03NucX05HbKZEu0YI
 rFccGMy8QCLAbjUgdk2kP6DGaVvA+4E0YjINIf6+86AYYeAAWQOleYzUjwrlSDr19bpq
 iqxR70v9yRrw70vZPuKmrJOgw1ihO3WAE/JX7w0g8iF4TDYRr5qfhSUDt8TCE+LUvM3M
 mp3WdlL2POAL5S7hIO0HyLrgQnwc1g6RqygS7J7TxxaKYUSvpp77lTMiKT6Mw2Uu0UQo
 yV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMXJInF9ZPVHQDzGiyA7uwA9d5Cdj1thl1LcQZwqB1s=;
 b=y9BTzxoxmDK2VY1mBdw8UuYTbBUMB6mNMAnIaVtY8148M+94zCR6BVouysykdcqKe2
 5CDqb1n6YgFDgrsdcduYLlfVb4eDfPDH98FIUFnA28vP07O20u+MneapUHJHnNJCM9ne
 /bc49lU8qkCundn2zADLbH+7VdpBQkgO9Bgg5LaadIbfizl2pL4wEVMd+4f0aW/KTzXV
 dwl+0Ys/pVE97pqpMfdf/gjTxvY1Kb9BHWRWfLLsfZVBiqJ/JYDHeTJDnQY1TugGip7m
 DlA0BRcGTP4XlN1gQPMfF247NZ2m32mpQkFtR5/660JIu09McYtjw5oqGBZ89kuAGTIK
 S3oA==
X-Gm-Message-State: AOAM531t3kwIGpp1/NTduDZ9Vfhavx2fx5nO6QM3TxPGH342uPHycfzX
 5hibQJKi5O/4AiF/0BXo1PMYDrDVgoKFGQ==
X-Google-Smtp-Source: ABdhPJzS33KHKoXlcbCqhYcT0N4kEpASGzBaR+BavwTRo0i1b75m2TB3zXnYpOAOdlbGIsF5w/cFsw==
X-Received: by 2002:a17:903:1249:b0:14e:e477:5019 with SMTP id
 u9-20020a170903124900b0014ee4775019mr3409130plh.53.1645717417568; 
 Thu, 24 Feb 2022 07:43:37 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] tcg/s390x: Distinguish RRF-a and RRF-c formats
Date: Thu, 24 Feb 2022 05:43:24 -1000
Message-Id: <20220224154333.125185-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One has 3 register arguments; the other has 2 plus an m3 field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 57 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d56c1e51e4..b9859251a4 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -183,18 +183,19 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
-    RRF_LOCR    = 0xb9f2,
-    RRF_LOCGR   = 0xb9e2,
-    RRF_NRK     = 0xb9f4,
-    RRF_NGRK    = 0xb9e4,
-    RRF_ORK     = 0xb9f6,
-    RRF_OGRK    = 0xb9e6,
-    RRF_SRK     = 0xb9f9,
-    RRF_SGRK    = 0xb9e9,
-    RRF_SLRK    = 0xb9fb,
-    RRF_SLGRK   = 0xb9eb,
-    RRF_XRK     = 0xb9f7,
-    RRF_XGRK    = 0xb9e7,
+    RRFa_NRK    = 0xb9f4,
+    RRFa_NGRK   = 0xb9e4,
+    RRFa_ORK    = 0xb9f6,
+    RRFa_OGRK   = 0xb9e6,
+    RRFa_SRK    = 0xb9f9,
+    RRFa_SGRK   = 0xb9e9,
+    RRFa_SLRK   = 0xb9fb,
+    RRFa_SLGRK  = 0xb9eb,
+    RRFa_XRK    = 0xb9f7,
+    RRFa_XGRK   = 0xb9e7,
+
+    RRFc_LOCR   = 0xb9f2,
+    RRFc_LOCGR  = 0xb9e2,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -547,8 +548,14 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
-static void tcg_out_insn_RRF(TCGContext *s, S390Opcode op,
-                             TCGReg r1, TCGReg r2, int m3)
+static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
+}
+
+static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, int m3)
 {
     tcg_out32(s, (op << 16) | (m3 << 12) | (r1 << 4) | r2);
 }
@@ -1520,7 +1527,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
         tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
-        tcg_out_insn(s, RRF, LOCGR, dest, TCG_TMP0, cc);
+        tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
     } else {
         /* Emit: d = 1; if (cc) goto over; d = 0; over:  */
         tcg_out_movi(s, type, dest, 1);
@@ -1539,7 +1546,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
         if (v3const) {
             tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
         } else {
-            tcg_out_insn(s, RRF, LOCGR, dest, v3, cc);
+            tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
         }
     } else {
         c = tcg_invert_cond(c);
@@ -1569,7 +1576,7 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
         }
         if (HAVE_FACILITY(LOAD_ON_COND)) {
             /* Emit: if (one bit found) dest = r0.  */
-            tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
+            tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
         } else {
             /* Emit: if (no one bit found) goto over; dest = r0; over:  */
             tcg_out_insn(s, RI, BRC, 8, (4 + 4) >> 1);
@@ -2201,7 +2208,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, SR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, SRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SRK, a0, a1, a2);
         }
         break;
 
@@ -2213,7 +2220,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, NR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, NRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i32:
@@ -2224,7 +2231,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, OR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, ORK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, ORK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i32:
@@ -2235,7 +2242,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, XRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XRK, a0, a1, a2);
         }
         break;
 
@@ -2455,7 +2462,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, SGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, SGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SGRK, a0, a1, a2);
         }
         break;
 
@@ -2467,7 +2474,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, NGR, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i64:
@@ -2478,7 +2485,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, OGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, OGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, OGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i64:
@@ -2489,7 +2496,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, XGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, XGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XGRK, a0, a1, a2);
         }
         break;
 
-- 
2.25.1


