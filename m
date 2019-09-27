Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EDC09D6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:52:49 +0200 (CEST)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDtU7-0006zM-Qc
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSU-0002Pz-PI
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSQ-00086W-IJ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:42:57 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDrSQ-000863-6u
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:42:54 -0400
Received: by mail-wr1-x444.google.com with SMTP id y19so3150280wrd.3
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dG6U5xvfHaHpDk3CXCVLs61xrDsnr9EUS5qAtKh629M=;
 b=ZWHHWkoNl/6QmjUJ5PiVhzRxbuGU6F1cPKqH10z13Oy6O17oR+JMfUgcJpqb9xAa7p
 j+L/NXINfDMEnRdbdcB/EdpFClrlYkLIjOdXLFWdMD+goxcsuHXaHwC8cDTb4goDfPRZ
 yHLrKhU+g2njFYBd4sxZUcch2Uf1u2dJPUJw1MzIliOxsNg9ECPB6RBibb1OmZROnN6/
 0S8nSpO3YNRNADxhkPTJTR9MhytPVbgcXaO6/OAKWKmuFd5iyc7gVma1Tll+NMDlvlrN
 gfImr7MqnhDpdueOp0ObJFKuXy5Nbhsc8lNZoraS517+JFo7utTjEPzPqyXnunCg47ts
 garA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dG6U5xvfHaHpDk3CXCVLs61xrDsnr9EUS5qAtKh629M=;
 b=RsEns9J+vfBJG5PmYxacLIQri7LXXmNc9XWy5bvghKd6O93qo5BOjyQIu2wNFfRE8o
 E/hVrVCh9NnhhILa54NGXXCRSya1s39YbEz3gzL4l5uNMIXSLhnMOnmbxIlOgF4nA17H
 rptl8ShDTeprkkXiw262R/X30jWRdL/Dwimz3O98Rx1IsSi9VVMwG4gG8qYhCl+NOWNk
 wNt6RNyqishsZR4mc6/PEZNL3bpb6CgODK7g6Fifm1l9TU0JOvuUYJriuHtEQkgvWcsV
 /DbiMqYtDnTBQnZSRjUtzXXNUg5RWvz3v3hPoXVsF7lf9bLtjjnAIHZtdtejYwMHdBPw
 eAIQ==
X-Gm-Message-State: APjAAAWU+b+Mk7VD2vUHYhcfRFyil1iqVgxPT9niEXuIgUZsuSKx+VrR
 7+R9/EKKDB8yzkpxQkS13fWfecaDkX/++A==
X-Google-Smtp-Source: APXvYqyEnG2Rx8or0d9M/cKOrQdUUEyVpoqGGBnFaYLawQFAqj1vTxdhXt4H1sWnWb7HRpak2jADYw==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr7468216wmj.5.1569595372629;
 Fri, 27 Sep 2019 07:42:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y12sm2874539wrn.74.2019.09.27.07.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:42:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] target/arm: fix CBAR register for AArch64 CPUs
Date: Fri, 27 Sep 2019 15:42:41 +0100
Message-Id: <20190927144249.29999-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927144249.29999-1-peter.maydell@linaro.org>
References: <20190927144249.29999-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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

From: Luc Michel <luc.michel@greensocs.com>

For AArch64 CPUs with a CBAR register, we have two views for it:
  - in AArch64 state, the CBAR_EL1 register (S3_1_C15_C3_0), returns the
    full 64 bits CBAR value
  - in AArch32 state, the CBAR register (cp15, opc1=1, CRn=15, CRm=3, opc2=0)
    returns a 32 bits view such that:
      CBAR = CBAR_EL1[31:18] 0..0 CBAR_EL1[43:32]

This commit fixes the current implementation where:
  - CBAR_EL1 was returning the 32 bits view instead of the full 64 bits
    value,
  - CBAR was returning a truncated 32 bits version of the full 64 bits
    one, instead of the 32 bits view
  - CBAR was declared as cp15, opc1=4, CRn=15, CRm=0, opc2=0, which is
    the CBAR register found in the ARMv7 Cortex-Ax CPUs, but not in
    ARMv8 CPUs.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Message-id: 20190912110103.1417887-1-luc.michel@greensocs.com
[PMM: Added a comment about the two different kinds of CBAR]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 507026c9154..bc1130d989d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6733,6 +6733,19 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_CBAR)) {
+        /*
+         * CBAR is IMPDEF, but common on Arm Cortex-A implementations.
+         * There are two flavours:
+         *  (1) older 32-bit only cores have a simple 32-bit CBAR
+         *  (2) 64-bit cores have a 64-bit CBAR visible to AArch64, plus a
+         *      32-bit register visible to AArch32 at a different encoding
+         *      to the "flavour 1" register and with the bits rearranged to
+         *      be able to squash a 64-bit address into the 32-bit view.
+         * We distinguish the two via the ARM_FEATURE_AARCH64 flag, but
+         * in future if we support AArch32-only configs of some of the
+         * AArch64 cores we might need to add a specific feature flag
+         * to indicate cores with "flavour 2" CBAR.
+         */
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             /* 32 bit view is [31:18] 0...0 [43:32]. */
             uint32_t cbar32 = (extract64(cpu->reset_cbar, 18, 14) << 18)
@@ -6740,12 +6753,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar_reginfo[] = {
                 { .name = "CBAR",
                   .type = ARM_CP_CONST,
-                  .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                  .access = PL1_R, .resetvalue = cpu->reset_cbar },
+                  .cp = 15, .crn = 15, .crm = 3, .opc1 = 1, .opc2 = 0,
+                  .access = PL1_R, .resetvalue = cbar32 },
                 { .name = "CBAR_EL1", .state = ARM_CP_STATE_AA64,
                   .type = ARM_CP_CONST,
                   .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 0,
-                  .access = PL1_R, .resetvalue = cbar32 },
+                  .access = PL1_R, .resetvalue = cpu->reset_cbar },
                 REGINFO_SENTINEL
             };
             /* We don't implement a r/w 64 bit CBAR currently */
-- 
2.20.1


