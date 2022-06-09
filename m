Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02539544846
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:07:01 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzF48-0001Mk-Iu
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7K-0001Yp-Gw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7H-00063C-GG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id d14so22478436wra.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vIokLa9eFuxFiVW77KIrOZU1hdMYpdkzIffZFBXlcuc=;
 b=CQqjOu4DBavLPFvIx3KuaWUMdGxL+Q8upq+K2k83UjjqO8avt4fANTtmgyGvENzIlq
 bG0OrlgLufrp6AgPdkr3t7qpHgZT3zuQ0D439n6RukPJIZ5SNUbNuii8qTdWPz4QrjOc
 AVyfC+7kAnk1V2x0ArAjV/RvAQPp5LZDf7QDUl5OU0xmxWSu8YuI5eQ7vQPoLJSchP90
 6T7Y0mBlOzlufl6Zmeo9GhOjGs7ZMvTSMn38YuuxleiRWjt4KOzE7Jq5mHjsB9mtMCQl
 VCtBi165GQz4C2P5vrROmlxyzPwcVyWR7OCnoRXhzMeWWd9DlAvr8x0e35IlhqfvVckp
 W2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIokLa9eFuxFiVW77KIrOZU1hdMYpdkzIffZFBXlcuc=;
 b=AMvyxtzxW2876YLWuIHObXdEjBtc7hwn5QzNckJIttp7OlY0vPPPSOUzvjS1ZmL3fI
 s85nNvdOv/7KiupUK4A+D9vzi4lN0l3ifLGERxUEOPhka3EppeHq0I5HoCU2Lh1GW998
 XB/dcHK+epaHZuy+LVnepQxp8kfeQqEuEa6E8389O/BAFY5abinnaRn5kLpFFeteEkTY
 FwXBENKQZOQurpgAMFgaqR8eHw+cfW2f0TjueKloLnkdfC+c9vMGU4M7ATFgvL90fr4c
 z52WShNCUwqnNe8Abm2gO7WwegFdYLEt5p0q8cHdBqMNOz1kbDGTThZzXV/j4kMZKRkA
 zM8w==
X-Gm-Message-State: AOAM533veghIVQEDxBJFw+6d+RlP5E2dd31Zhcb9iHQSCF+TC65jmsnR
 lFAmSQsCKE5WxSazzfX4yt9ryLBLVpCshQ==
X-Google-Smtp-Source: ABdhPJwakeZ5a6QIKYbtHHG3gWrEtnC0HdHtrsge8p1M/SvAnweUdMCMnUkYwCd8N2hiXnwv/Pu7oA==
X-Received: by 2002:a05:6000:1acc:b0:20f:f12a:a535 with SMTP id
 i12-20020a0560001acc00b0020ff12aa535mr39078137wry.375.1654765568513; 
 Thu, 09 Jun 2022 02:06:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/55] target/arm: Move arm_pamax, pamax_map into ptw.c
Date: Thu,  9 Jun 2022 10:05:07 +0100
Message-Id: <20220609090537.1971756-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-19-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 25 -------------------------
 target/arm/ptw.c    | 25 +++++++++++++++++++++++++
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 28b8cb9fb89..fba650d01ca 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,8 +11,6 @@
 
 #ifndef CONFIG_USER_ONLY
 
-extern const uint8_t pamax_map[7];
-
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2b196ff3e5..563e34ecded 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10814,31 +10814,6 @@ bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
-const uint8_t pamax_map[] = {
-    [0] = 32,
-    [1] = 36,
-    [2] = 40,
-    [3] = 42,
-    [4] = 44,
-    [5] = 48,
-    [6] = 52,
-};
-
-/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
-unsigned int arm_pamax(ARMCPU *cpu)
-{
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /*
-     * id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.
-     */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e4b860d2aee..d754273fa16 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -23,6 +23,31 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
     __attribute__((nonnull));
 
+/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
+static const uint8_t pamax_map[] = {
+    [0] = 32,
+    [1] = 36,
+    [2] = 40,
+    [3] = 42,
+    [4] = 44,
+    [5] = 48,
+    [6] = 52,
+};
+
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-- 
2.25.1


