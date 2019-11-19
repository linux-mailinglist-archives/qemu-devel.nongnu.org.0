Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B110259F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 14:41:29 +0100 (CET)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX3l1-0002kF-PY
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 08:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iX3br-0003Q2-Hf
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:32:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iX3bq-0004DJ-ED
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:31:59 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iX3bq-0004Cr-8Q
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:31:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id l1so3196648wme.2
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J0hxGY0jJpmZh7ivi67CDnclur1WCNLzFEVxxDUt0Cs=;
 b=QH23rFMl7ZvgnihMkOVrb9+Ow/Qi+5ZSRh25JcAxcspRV1O2pf6agofJtlYkAb3NEK
 +UWYfFwkOC7LFcHMf/iAKTaAcJb8Yd3J2AgAZKEqcFSJ6i76xdpLdZFmWK2S7ibfbsFF
 3nrQbezpRkO92HfMDyWlNiO6gVfPfsgs6otFkR+TK1nRZko0qoDUSbegep3uTy8cU5gj
 /u2sPpvcQtKxsE63gisHNF71LC6/OpXG9rxwWNGb3+3Vctj14EbJaEg/6kB8689TxiJ/
 oRqp15FiPCx1yDW3XsrTXrTy7AXMJDN7tP6ADJayZ5Tqx2pT87VBtmoKfAjLTf0wG1vK
 Wu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0hxGY0jJpmZh7ivi67CDnclur1WCNLzFEVxxDUt0Cs=;
 b=nXSGiXtQmAO/XDNJZsSAeDSJ2LIaPLsumbrvUegDEuBiEQAWsKFiWYJ9yjNkkkDRO4
 QMul1rFX451NtQJzkqpMKyeoJIAKEnN/vnaytNYaB3nQknYUKamOUV7O4d14C6LZkZ/V
 0sARbPP4hfOx7jsitZ3EUEhCRVNnLvUguoJHuvh1GrsMXue3J6/QOjsfN1EkRwAFi6pR
 6SWAOO/C/wfV6Wrp16tyQuN4MsBf5Rhtdfh7WrUA3tPKYNUMU83X+lnXOV5nmNuF2Rhk
 6/NtfaDzqsADDi5hTf7Gy/EdDyzO1nZIX5V8Pa4TO1RGM1Wn5u6FAVDOFeFeV0zV7Y6a
 BOcA==
X-Gm-Message-State: APjAAAXgiHHI4wnFa2xNGp7jleELprfxgU0zLPx5b4P8XY1GHiDLPDr7
 6yWfNAPPOYcVvpT8i8l0linjCJ8WkL94Cw==
X-Google-Smtp-Source: APXvYqx2GQ6P+EskR2qc3OyhjBsICf0qmz5X67me2UmtALIsTzx9NVf1buEbLlgoT14dLKJscHbxFQ==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr5801398wmh.101.1574170316567; 
 Tue, 19 Nov 2019 05:31:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm3094905wmk.23.2019.11.19.05.31.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 05:31:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/arm: Relax r13 restriction for ldrex/strex for v8.0
Date: Tue, 19 Nov 2019 13:31:44 +0000
Message-Id: <20191119133145.31466-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191119133145.31466-1-peter.maydell@linaro.org>
References: <20191119133145.31466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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

From: Richard Henderson <richard.henderson@linaro.org>

Armv8-A removes UNPREDICTABLE for R13 for these cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191117090621.32425-3-richard.henderson@linaro.org
[PMM: changed ENABLE_ARCH_8 checks to check a new bool 'v8a',
 since these cases are still UNPREDICTABLE for v8M]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b285b23858e..4d5d4bd8886 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8927,15 +8927,17 @@ static bool trans_SWPB(DisasContext *s, arg_SWP *a)
 static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
 {
     TCGv_i32 addr;
+    /* Some cases stopped being UNPREDICTABLE in v8A (but not v8M) */
+    bool v8a = ENABLE_ARCH_8 && !arm_dc_feature(s, ARM_FEATURE_M);
 
     /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rd == 15 || a->rn == 15 || a->rt == 15
         || a->rd == a->rn || a->rd == a->rt
-        || (s->thumb && (a->rd == 13 || a->rt == 13))
+        || (!v8a && s->thumb && (a->rd == 13 || a->rt == 13))
         || (mop == MO_64
             && (a->rt2 == 15
                 || a->rd == a->rt2
-                || (s->thumb && a->rt2 == 13)))) {
+                || (!v8a && s->thumb && a->rt2 == 13)))) {
         unallocated_encoding(s);
         return true;
     }
@@ -9084,13 +9086,15 @@ static bool trans_STLH(DisasContext *s, arg_STL *a)
 static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
 {
     TCGv_i32 addr;
+    /* Some cases stopped being UNPREDICTABLE in v8A (but not v8M) */
+    bool v8a = ENABLE_ARCH_8 && !arm_dc_feature(s, ARM_FEATURE_M);
 
     /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rn == 15 || a->rt == 15
-        || (s->thumb && a->rt == 13)
+        || (!v8a && s->thumb && a->rt == 13)
         || (mop == MO_64
             && (a->rt2 == 15 || a->rt == a->rt2
-                || (s->thumb && a->rt2 == 13)))) {
+                || (!v8a && s->thumb && a->rt2 == 13)))) {
         unallocated_encoding(s);
         return true;
     }
-- 
2.20.1


