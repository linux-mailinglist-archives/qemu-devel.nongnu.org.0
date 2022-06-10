Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04050546A23
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:12:13 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhF6-0005HA-19
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAq-0007P8-Jo
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAo-0007Ep-0X
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso1287423wml.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mIlgmlGOPKTsIk6YpdxQ/xbvRXZOJ3IbXgYz6v6Juw4=;
 b=XBX4bdk7yNPq16S1IjkLN/NQSHSUiG5MVoY/1Zox3ujlaQ0YVkXjHy+kJZFy438JEX
 JKDVZUK8idbXAjKRGzZgKyuFqkEDYax0e3y0o6DCY248FjGHej4UxGJOKWIpg2C5pmtz
 ZI+ncPkymTEJ9Cc92jzL6+podH3e1gMFUOBDBCbtSo5HqF4MliGltPbq9l79306Mmiyp
 8etsZm2b2JYA4YUh4Rq3zOdkVYRAo+WZL9HXUJ+6MNThhga5JQSmwysT1q0eP10K5ZHW
 Q3KBxr34ZNU12LQjSbJj0Wf+7VHwbvqlanZlX+8KtgGzrfO2TlQB4WaACDYcnchfRXK+
 Yd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIlgmlGOPKTsIk6YpdxQ/xbvRXZOJ3IbXgYz6v6Juw4=;
 b=M64UTJHABPp11kjZD/JQthS0AvAyVCF4hZrITD82tFlUNSmUxClNxh/mvHoBTdOpc/
 /b52wWxgEAZ6If15RZXq9i9v5w0a38I2zV/cxO34e104grzKbwyY1wpyNNNVWFk5jZbM
 6sFKSv7ZROL6lOpNOAOip9nqO/7F9RkeYy2kebJ9u5P8q6aGDLMTf9m0PwZwsS0DJS61
 vfOSLeQctAGyILBaZGO4bGLOYLPWuBJ4TYEJgnltMgHHKyJycDsP6O9cKw8flqVV1uDU
 LeMS8ey8UAeBeRxSps+Br119HdFdWek34JanUwyGPWtuYqyH7CStbbk4vd2D3aENAUuH
 EsMA==
X-Gm-Message-State: AOAM531hxFjHK5xvgOjaIaJtd/ROzyFokdhYOlXuiRSlfgjiVOH48f7P
 uwft5hiGHDhQSanEUgxmMafhtWplMf6H7w==
X-Google-Smtp-Source: ABdhPJxR1GKh0gvMbkijix5dO4vKCgVd78AtQuA3758u2R9MDGMLILxmWWibbR+FLopEbqJL3zKZZA==
X-Received: by 2002:a05:600c:4e0c:b0:39c:519f:9f35 with SMTP id
 b12-20020a05600c4e0c00b0039c519f9f35mr437287wmq.153.1654877264636; 
 Fri, 10 Jun 2022 09:07:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] target/arm: Move exception_target_el out of line
Date: Fri, 10 Jun 2022 17:07:13 +0100
Message-Id: <20220610160738.2230762-4-peter.maydell@linaro.org>
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

Move the function to op_helper.c, near raise_exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 16 +---------------
 target/arm/op_helper.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a1bae4588ae..af9de2dbe52 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1098,21 +1098,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
 
-static inline int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /*
-     * No such thing as secure EL1 if EL3 is aarch32,
-     * so update the target EL to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
-
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
                                                  uint64_t sctlr)
@@ -1339,6 +1324,7 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
+int exception_target_el(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd6688702..97c8c9ec778 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,6 +28,21 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
+int exception_target_el(CPUARMState *env)
+{
+    int target_el = MAX(1, arm_current_el(env));
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 void raise_exception(CPUARMState *env, uint32_t excp,
                      uint32_t syndrome, uint32_t target_el)
 {
-- 
2.25.1


