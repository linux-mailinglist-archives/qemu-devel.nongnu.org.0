Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A750B63C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:35:55 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrZq-0001WO-A7
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAH-0005Ur-4Z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAF-0002uV-9Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x18so10357208wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NIplvZLPteSaDUAHt7JEfPh2GX+SAGRpajBGdTIzQe0=;
 b=YiCtjKt4lG7is7rRu0fBVsFDOFHFTHeT/Pc2NJj3qRJB4z1+AbDaivf6OzpDiJy4eB
 tO1rNjoK3h/0RfKdui1IfFlSSJy4YTLzhHeVcQbVxLGMf7OXsjMO74f+JfovUHVpaTRz
 JQFzBLx6nOMuwjAz8yZ1e11uMvDPerpKQLToScjfNOprfZbDNi+fpVTPYkA03gzc2UAY
 rtvw6eo1VR5eSopZ79Pe7rJ4mU7N11cetsQJaSwWNlge9GPgHm3lRAYgfy0N7HguenfV
 jW0QEhVTxIuh+3Zs2gr+mQiiF8bQosRBkPiBy+U2aE3CjzYj5gntfx1h0r6sD6w6RMAn
 xCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NIplvZLPteSaDUAHt7JEfPh2GX+SAGRpajBGdTIzQe0=;
 b=OD0g0IEg9mSOdiZIevK6M8OG9LELveXNwj/+2yBvZPs8SB563Jj8gYtk2kBLjOsYKX
 cQ9ez4i/Ok/s80/kwX+4GPvTOYVkdKyZ8j6ZhES/sMPaYGXJVoei+ERSLfU111KMVUUp
 7z1UxAbHUvig5IkvrISFDvmkTQoW/i0WkWotGzNiuPIUtW107WH427pktGbICdCWbOla
 b5fNL4YNmZi2PkUewRynTsWSdtHk4+EsmDIF49IFrFIEeEqKkAlHIJuCPUJGXH5nuRR5
 LMqm4UdRTxUIjE5IXzLj9UXf8+w4sbsPh+eqe0kXPgFeEUIhjCDmxdAHYrW36x7Ol9O5
 YZGg==
X-Gm-Message-State: AOAM530GqMMTj695EOaWaL+NZsX1EuI5d+zOC1Ew9iqgawvVOvG1k1nP
 1P44XSXGc7NaU4i+H1k3P4dtPBiAlnjjew==
X-Google-Smtp-Source: ABdhPJwKUOm8MlB/v6k0vnh5FtqMu/a7jMeJrt770U0rfymzPtNMMeqMIM7lJMZcY6rv6cl74UhRLg==
X-Received: by 2002:a05:6000:18a8:b0:20a:8a58:1639 with SMTP id
 b8-20020a05600018a800b0020a8a581639mr3022592wri.483.1650621921950; 
 Fri, 22 Apr 2022 03:05:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/61] target/arm: Remove fpexc32_access
Date: Fri, 22 Apr 2022 11:04:21 +0100
Message-Id: <20220422100432.2288247-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

This function is incorrect in that it does not properly consider
CPTR_EL2.FPEN.  We've already got another mechanism for raising
an FPU access trap: ARM_CP_FPU, so use that instead.

Remove CP_ACCESS_TRAP_FP_EL{2,3}, which becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  5 -----
 target/arm/helper.c    | 17 ++---------------
 target/arm/op_helper.c | 13 -------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d2a34f6ea8a..db8ff044497 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2807,11 +2807,6 @@ typedef enum CPAccessResult {
     /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
     CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
     CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
-    /* Access fails and results in an exception syndrome for an FP access,
-     * trapped directly to EL2 or EL3
-     */
-    CP_ACCESS_TRAP_FP_EL2 = 7,
-    CP_ACCESS_TRAP_FP_EL3 = 8,
 } CPAccessResult;
 
 /* Access functions for coprocessor registers. These cannot fail and
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1e91b197e2..63397bbac1d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4784,18 +4784,6 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
-                                     bool isread)
-{
-    if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
-        return CP_ACCESS_TRAP_FP_EL2;
-    }
-    if (env->cp15.cptr_el[3] & CPTR_TFP) {
-        return CP_ACCESS_TRAP_FP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
 static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -5097,9 +5085,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
     { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_ALIAS,
-      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
-      .access = PL2_RW, .accessfn = fpexc32_access },
+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_FPU,
+      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]) },
     { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .resetvalue = 0,
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70b42b55fd0..2b87e8808b6 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -691,19 +691,6 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         target_el = 3;
         syndrome = syn_uncategorized();
         break;
-    case CP_ACCESS_TRAP_FP_EL2:
-        target_el = 2;
-        /* Since we are an implementation that takes exceptions on a trapped
-         * conditional insn only if the insn has passed its condition code
-         * check, we take the IMPDEF choice to always report CV=1 COND=0xe
-         * (which is also the required value for AArch64 traps).
-         */
-        syndrome = syn_fp_access_trap(1, 0xe, false);
-        break;
-    case CP_ACCESS_TRAP_FP_EL3:
-        target_el = 3;
-        syndrome = syn_fp_access_trap(1, 0xe, false);
-        break;
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


