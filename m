Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA90737D39B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:40:17 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtmK-0007gq-VK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWU-0006Bz-91
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:54 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWP-0005pD-Ev
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:53 -0400
Received: by mail-il1-x133.google.com with SMTP id v13so20957507ilj.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E98zYgOb8svCo31J0cZx6NXuFYRvLAQi1ckb6DzE2jE=;
 b=d6yRBqVmHDZpfjAwNSNtYCIRbKLIxar8oc4mtq32Q3Yr8Zpz6f2tZ4eXl1NUm4mhs+
 yoOkvhYWzLVHOy+UhbfRELjGvisLBo1OmDTBiTM3hninDSVwTWmRKKaLB/qqYGLF/14Q
 AF31oR/4G8/ptJjWGSMsfEwBkseyDA5+yBsrWx9q7jEX8mzA1aPVcezkAtHniZJcuxGK
 +aSQnkCy0gLqU3lBkIlShOR8CYQXcDrf4m2kAIDKg9CiybJG23U9pF78dZbgNLRNeeAw
 TZjXWCd0FU9DyO4UBdlQJ39bfNLGe3Sg7enV0BtZaKYlPDjMFzhe2lDfJfod7bIV+OUO
 6lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E98zYgOb8svCo31J0cZx6NXuFYRvLAQi1ckb6DzE2jE=;
 b=i7FPDcEW6YYZi2OHa537/OOgMFN/g8LS3b5O3QSbp3E1SY8iKnjG0muHp8QrBdJc63
 4++nzmd1d5mQ01WvxMbx3v/FECjRjt1eMUFwmUjveCPDpS39F/eHy8+pe3BlnePQ1Ynj
 m5ubRrTLHwKC6KmKmH5shBcoVowRngJcsP8Sv6Pup3zkCEXZ5H42GU5R80ba0V5c828i
 K+hI0/0osSXGYxKN2vxM4SjiebVk+wB5UkYyKYcO5h2m6D6UEM4arJ5a0mh7KQ5KgSyl
 FSbL0tV8fy/f1Q7gzFEqxQQstXyEiu2fCCI5GF5tFzw8pKmWGksEke3mv/MWCVsRcvx1
 L8Ug==
X-Gm-Message-State: AOAM532ExEUYJxXCSp9/gP5+b2YHCpPOCPoXJA3OmxWgm88avlNGyl7l
 7Yp25IApbR4M8LkmrrocWKvs8RV0AWf5WsCVQIlHw3TyWJsWwzpdSP04LOq4CmZHwzUelEVbuKW
 tddWVoWSxLgfFYW9lgzakP2kCDffhCbHLIJkbgmMZwpIklcTtU4v/ePTBu41U0dcSrXrWTIeNHg
 ==
X-Google-Smtp-Source: ABdhPJzZ3Kx2rEaaN/Isoto4oF8Ugeq6CDpryB6ZUAtPNSmCCnOMg9PKYOJV6CMCsmtM1JbZP0TPqQ==
X-Received: by 2002:a92:c8d2:: with SMTP id c18mr32812839ilq.81.1620843827933; 
 Wed, 12 May 2021 11:23:47 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:47 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/3] target/arm: Add support for FEAT_TLBIOS
Date: Wed, 12 May 2021 12:23:36 -0600
Message-Id: <20210512182337.18563-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 43 ++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5802798c3069..7986a217acdd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4076,6 +4076,11 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4adb017f81a2..59e9847133a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7198,6 +7198,46 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbios_reginfo[] = {
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8570,6 +8610,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbios, cpu)) {
+        define_arm_cp_regs(cpu, tlbios_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2


