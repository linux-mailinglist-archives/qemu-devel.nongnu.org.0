Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D756339BD87
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:45:51 +0200 (CEST)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCxC-0007AK-V5
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCI3-0008Jt-7q
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHc-0005pv-Ro
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso5901647wmj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nGP6Z5x0fcvCA1VqJc1xqqHTfKci3f1/omLPFccgrE=;
 b=rYrBGRRKUpmtFoVFXwQDQZhTI56HGv0MSBw/8FGkC1Wcjuet3fUoIZiQjf+DQuUqwC
 z4HprW60hoQme4+MsVmcNa6ubCxEJHr7owrpzpAXlqHruAp3/wKRshqydHctNhVCuP/v
 TpXU3bwe7feRBXO//YJ+UHkQ4Dzc24DngLhNnYHOFXOGUd05Xc8zIAUYfpRDtJk9N7wo
 p3pdHe3MdTT/CdiChZvFd3mY3KUSjidE3fLkk6H310oPCsY6qKGyJFxQbWh2dvDBFZcv
 4zdJXvaiihDdbV3PRa+3fF8VDS1EwPU+OQbLytjuTP6I8s6aldexm74oOyFu3AAIUB1Z
 8ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nGP6Z5x0fcvCA1VqJc1xqqHTfKci3f1/omLPFccgrE=;
 b=Mczs4lj9PXRVS7+ejAazDKr8V/HOdbgrkpVz5Wo3nkJbUmMc6XhmPDM3T3sgJhCTNk
 0jqBQOnvl2iLy8oh4UC76Zd8S+DsddObzx3T9tiaFvRi6m85S8jgMWr0cSHfmsUukrwW
 v+xsdHr4dWf5cYooh9G9vwTHpMWQFh+BDSbpwt0lyBpX4NWU5spWdW1MHrUS1ipv+D8b
 S8JaDYGVsosJqu4LBFSGMQ+HBgXcdgzn0/RNaoUYB7/G8TIuxw+ZBPmkzqwMmJcoHOi2
 asfYwGTT+r2oKEC5XEQ4y7YEYGKVmOFD3+OB0G/NYpUg7J02ZqQ9achzQW7/ek5COUGd
 e1jQ==
X-Gm-Message-State: AOAM5339HLIEubiRga9YpfiZ2B/vYJYFHhKGS5XCpDvrf6YnhRNsr3Q4
 o0SmqNreqBCuH+KBU3d74lP+CA==
X-Google-Smtp-Source: ABdhPJyj39mimfWxe+zWeLQCaYyqe044Jcf1UlOUjY0dBWSagS2u1SYw1YMMMc5Lpr2+tv6RT7gFSg==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr4323372wmj.174.1622822571487; 
 Fri, 04 Jun 2021 09:02:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a123sm10341991wmd.2.2021.06.04.09.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CD941FFF1;
 Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 79/99] target/arm: tcg: restrict ZCR cpregs to
 TARGET_AARCH64
Date: Fri,  4 Jun 2021 16:52:52 +0100
Message-Id: <20210604155312.15902-80-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

restrict zcr_el1, zcr_el2, zcr_no_el2, zcr_el3 reginfo,
and the related SVE functions to TARGET_AARCH64.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/cpregs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 8422da4335..56d56f7f81 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5791,6 +5791,8 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+#ifdef TARGET_AARCH64
+
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
@@ -5843,6 +5845,8 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
     .writefn = zcr_write, .raw_writefn = raw_write
 };
 
+#endif /* TARGET_AARCH64 */
+
 static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
@@ -7572,6 +7576,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
 
+#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
         if (arm_feature(env, ARM_FEATURE_EL2)) {
@@ -7584,7 +7589,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
@@ -7614,7 +7618,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
-#endif
+#endif /* TARGET_AARCH64 */
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
-- 
2.20.1


