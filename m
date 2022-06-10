Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E92546A20
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:10:51 +0200 (CEST)
Received: from localhost ([::1]:56944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhDl-0002Dh-SX
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAp-0007Ne-HT
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAn-0007Ej-Mt
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso1361408wms.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nlcnMWx+QO7aCJl1LZ/JfZgTWAgzGNCWH8XM5rMOx9A=;
 b=VQomNPZLhE+NW4GwvQazEPlI1l/w7A6FGF4wE/Aq8tD7H8xxIeVeiD29Ae7J6xqAwP
 3r84WcnvOWknIbyvTfVf5IEL3pdRyUAzh6r8Q9AIU729qG7WC8dU+W1A4rQfiQaDOIer
 AYIKOtXq+BPWYkGMxWwiaL8i5mlGP+QIXqyZtTPki2m0p7KQV9wbTq1+glREfHj9G2AR
 8+3GA6W74PAKzg9sdTAcd7jmobq2OsGx9YiTAvVX7Q7iEhaNpQSMGtw1PJwZw3z7EqTX
 Ew/j2I8ZzT22m+lMiiQTKmmajs9Zg2SZ3ufFx4l13W2ivy70eOD2V81tM4zB/6JEz06j
 ggWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlcnMWx+QO7aCJl1LZ/JfZgTWAgzGNCWH8XM5rMOx9A=;
 b=vwTDXTThyDuuk2qGwWM1DLdazASQ5/57iTO57JLvEAMFRPabiigCGQgmiaYVr9jN+x
 5AWq9c48cR5ZRw8IIsLhlGA4uQ9MT4NGp1k7e9ObL/EG8c9nz3J1HWEgvFci9nhgV8gu
 DCkvok5Dfk7WJMbpFwK5VgfIhMA7gxu2j74MRCREyQXqNlTBI78rMP0dvhSUfPLHUgEL
 AgjGkBiSocjLPKYqr6md8HWF51XdVGcuSXWiTjKGhQLfulkLWOtyqNV6iSMT0Yv4bjWP
 RUqCUks7GmFxxTI8BenoI5gm4ueupnThnOe57cOCW+ELcxlaJ6d6MjSPh5AfJhJdw7Is
 hPvw==
X-Gm-Message-State: AOAM531oijxmy4EWMpQfN8oxkrKTPVGLxOaaMYnfUVzSTkr4YXEgcvs/
 R25VfFbybKtjsIrqLLVeh4Tx89HniFEqDA==
X-Google-Smtp-Source: ABdhPJx0RqSB+eXQ5dpL+cPP3Np/Pvl2Vu131YMSfWJhy41Z3yRs8sNyKvXfU39HBk+wehVAE8ScPw==
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr467019wmj.57.1654877263930; 
 Fri, 10 Jun 2022 09:07:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] target/arm: Add coproc parameter to syn_fp_access_trap
Date: Fri, 10 Jun 2022 17:07:12 +0100
Message-Id: <20220610160738.2230762-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

With ARMv8, this field is always RES0.
With ARMv7, targeting EL2 and TA=0, it is always 0xA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/syndrome.h      |  7 ++++---
 target/arm/translate-a64.c |  3 ++-
 target/arm/translate-vfp.c | 14 ++++++++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d8..c105f9e6ba5 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -185,12 +185,13 @@ static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
         | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
-static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
+static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit,
+                                          int coproc)
 {
-    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
+    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 */
     return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
         | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | 0xa;
+        | (cv << 24) | (cond << 20) | coproc;
 }
 
 static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d438fb89e73..e7525890902 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1162,7 +1162,8 @@ static bool fp_access_check(DisasContext *s)
         s->fp_access_checked = true;
 
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false, 0),
+                           s->fp_excp_el);
         return false;
     }
     s->fp_access_checked = true;
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 40a513b8221..0f797c56fd8 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -219,8 +219,18 @@ static void gen_update_fp_context(DisasContext *s)
 static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        /*
+         * The full syndrome is only used for HSR when HCPTR traps:
+         * For v8, when TA==0, coproc is RES0.
+         * For v7, any use of a Floating-point instruction or access
+         * to a Floating-point Extension register that is trapped to
+         * Hyp mode because of a trap configured in the HCPTR sets
+         * this field to 0xA.
+         */
+        int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
+        uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
+
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
-- 
2.25.1


