Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B573544804
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:53:10 +0200 (CEST)
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEqj-0005JO-BL
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7V-0001cB-S1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7T-00062u-40
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d14so22478158wra.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=biefxwiMWkFplUNyCYS3rTOiD6++qV4YkTvNGi9PTWE=;
 b=CImkj7CcSzsMXUFeUgr4OgjlVtoTEaUrxxXD1UxdxuMTBDPNY7KSZC9J2nQWZBpt2k
 AyCywy2PkhKYOMmNXD4p+bbpHrTAiMbc0Uus7iSejXEQKXJh86oLwi3owSaQcKM/ZViW
 abc8KSlz7HB/POQDmTkRlEYGZ33reKuv6bhKHWSgS3WOFoFP7dyEKc9ff/V9xmh1X8D0
 r3fonp6SyqK10HTOuhTNTritWpI02Rl6ihch2CEQ15YaRjrjIoFWC0wQAkaKpdVeghOF
 aw6dkMN6m9oLNE/I8Tyku9Szvsgg+jAmORHnOYDkpz0yRQXe159Xl8rp13yxCF+fnN5r
 CXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=biefxwiMWkFplUNyCYS3rTOiD6++qV4YkTvNGi9PTWE=;
 b=qRSejLiOANJZNK/BxElUlyufP9EvXeSojt26AFDoZlsQ5XEQB9hh/Z0kFK52czHKZ8
 MbJZ32J17zotJg5yND+9GQxRsWH4qtzAMgfin2WylOENKjYgC1BjXDDMXpT1ub3fjTq2
 dfivAbPXcNDosSl//xTBTt0DPlMvIejz6MtaWpzBU1O6B1weh5B1yMro3FfTWiKjPQ12
 ELiGdUC0Er0G+7DvGlmLUlN0sD0ik0/flPp3/9o47npwr5RWMFd5Extl5HaUB8fXUG7Y
 907S93EX7dWhp/o4qIT5Y+vQD9gOHSOuYBv3XtxJ+ayZ3F4gvxVrPKrKxdKs4OANOXAj
 /HUw==
X-Gm-Message-State: AOAM532twcXasMADxcQPrMO2mH3vQXxKNHacxrKSzTsoCUZoYeGKTCrG
 Li4eINAxyV1qNQNjd9w8NQpnYZSI1irlJg==
X-Google-Smtp-Source: ABdhPJzHbC1ruV0FObJphmwh3QEAiJmtcR/l1A3fxtESRWeu9RJp5mi9pJFbNVIkwqMYb+917mk6VA==
X-Received: by 2002:a05:6000:152:b0:216:160:2e60 with SMTP id
 r18-20020a056000015200b0021601602e60mr27315852wrx.663.1654765582316; 
 Thu, 09 Jun 2022 02:06:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/55] target/arm: Remove fp checks from sve_exception_el
Date: Thu,  9 Jun 2022 10:05:21 +0100
Message-Id: <20220609090537.1971756-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Instead of checking these bits in fp_exception_el and
also in sve_exception_el, document that we must compare
the results.  The only place where we have not already
checked that FP EL is zero is in rebuild_hflags_a64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1bd77af7e50..4f4044c688d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6129,11 +6129,15 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
 };
 
-/* Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  This excludes the check for whether the exception
+ * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
+ * be found by testing 0 < fp_exception_el < sve_exception_el.
+ *
+ * C.f. the ARM pseudocode function CheckSVEEnabled.  Note that the
+ * pseudocode does *not* separate out the FP trap checks, but has them
+ * all in one function.
  */
 int sve_exception_el(CPUARMState *env, int el)
 {
@@ -6151,18 +6155,6 @@ int sve_exception_el(CPUARMState *env, int el)
         case 2:
             return 1;
         }
-
-        /* Check CPACR.FPEN.  */
-        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN)) {
-        case 1:
-            if (el != 0) {
-                break;
-            }
-            /* fall through */
-        case 0:
-        case 2:
-            return 0;
-        }
     }
 
     /*
@@ -6180,24 +6172,10 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-
-            switch (FIELD_EX32(env->cp15.cptr_el[2], CPTR_EL2, FPEN)) {
-            case 1:
-                if (el == 2 || !(hcr_el2 & HCR_TGE)) {
-                    break;
-                }
-                /* fall through */
-            case 0:
-            case 2:
-                return 0;
-            }
         } else if (arm_is_el2_enabled(env)) {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TFP)) {
-                return 0;
-            }
         }
     }
 
@@ -11168,19 +11146,21 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
 
         /*
-         * If SVE is disabled, but FP is enabled,
-         * then the effective len is 0.
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL > FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
          */
-        if (sve_el != 0 && fp_el == 0) {
-            zcr_len = 0;
-        } else {
-            zcr_len = sve_zcr_len_for_el(env, el);
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
+            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
-- 
2.25.1


