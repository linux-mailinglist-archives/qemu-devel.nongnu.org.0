Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F029E05CF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 16:03:37 +0200 (CEST)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMul5-0004B8-Ic
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 10:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuH9-00039W-Ms
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuH7-0001Qz-W5
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44022)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMuH7-0001Qh-Q2
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id c2so12856005wrr.10
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wnRZsm7NhaxxnhkKjePsOV7gMBnf+WiZW/Dfozs982c=;
 b=Y4VqBYqDwKVlE+6g3Ie+UcS4074xFHqLbYGA6Y1gzLajVCQ9btyHlmFsLYv8tWkTOc
 X9XFtKCISt2PYxUXDugPvF+nFyHsJZyS+8NVNmHH0MBz4N74PHdm4nztttWkJFhqCIcz
 VhPxvjggPkp9SffsjP56xWLaMhsy36xF8BwmG+dzxCDhV7gn7H+r+0QlCBVhLDN0iXDl
 SNxjtoMTt12dyCi/lRrU/roKLfTwikI18uNSho6fBllgC73j0/hq+96H6JbTaqU317Lo
 ffLhbV6QlIKF8unQTl2H//Y8E1Gw3szqPijrHD9Y3qON6Cz1OCcQxnlspr59s39/+nYS
 rZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wnRZsm7NhaxxnhkKjePsOV7gMBnf+WiZW/Dfozs982c=;
 b=IXKiKyGJvQgu2eGOdzqfOSOxwUcnhDwK4Qa9a3fjmpQx/uxcfDCrqbx+SkBm0LzhyL
 /ohHOnu2bvVh5jwmqZeAXjC6p98Xg/F4c7ahAXjnliGvdAi/j8FbfpxztE3j7q3qdU4Y
 3KqblPcs8FpuzLnpwjH1ZyU4S5nddKcv2+vABXU6qOtScFlfoqRkYA4NuYUv/X5kmLr2
 Qc1uhUgRV917/LNDDY/kd3DbBKDTx7hB1vIWWjeSSCc1/IySAUV4ke5evqk9MHVwytW4
 Lfzx2XOihG9YBRkP2v4akxXlWUwPpGF2c+FUjxt6vFlPDLi1D8T4ILd0ZHw6Z3krDb+/
 pWbw==
X-Gm-Message-State: APjAAAXtw0QQCd9tN3meDpJI23Wa9OXTNUS+UAXSD68+c6i6ki2a1q7A
 blvWlmGiYMuQ6tO86I/0VOI+3nd9YVo=
X-Google-Smtp-Source: APXvYqxUqq2OO2OTrGUeWdstqyLalXBuX3Q40b7kXkpWXd/QHHxFSqVDyKFLIRbiWaWQZgy8rwxuhw==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr3561086wrv.335.1571751156292; 
 Tue, 22 Oct 2019 06:32:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm20263856wma.1.2019.10.22.06.32.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 06:32:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/41] target/arm: Add HELPER(rebuild_hflags_{a32, a64, m32})
Date: Tue, 22 Oct 2019 14:31:18 +0100
Message-Id: <20191022133134.14487-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022133134.14487-1-peter.maydell@linaro.org>
References: <20191022133134.14487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191018174431.1784-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h |  4 ++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1fb2cb5a777..3d4ec267a2c 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -90,6 +90,10 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37424e3d4dd..b2d701cf004 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11220,6 +11220,30 @@ void arm_rebuild_hflags(CPUARMState *env)
     env->hflags = rebuild_hflags_internal(env);
 }
 
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.20.1


