Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE323DCD22
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 19:56:24 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLWUB-0001ih-Gs
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 13:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ5-0006mH-5D
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ4-0005aP-3S
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:55 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ2-0005Xp-9z
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:54 -0400
Received: by mail-pg1-x542.google.com with SMTP id i32so3742820pgl.10
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=hZHwdPeEBA2AK5wNx1xD+5hnv39LM/tC0jfD0A5B9JMZUCZTWzkFMUPZNiEzngiD00
 DykvZK+XCp5mXLSW/kIvFMiPG/+Z/qcVp2MTHBboWNgE0kWVw10akFp1WFWyw7a8ektb
 i2GDDDv9z8nSyFOt/H/xBAajBs/pSb0rGnuuL/kFq1zRi0h1T22qz17cBDxKonMsTX5W
 hhIu4giEickQYIXnUhG6qR2HwVSl6HsdNTq8/a3+UtCdnqiiD1rXHhMK9cpQsnsiOzW0
 p7BBEw4hppAnlx4NXa9vwJx2ayxuot/3Y3sm1gtgzHHDRTxDmap79oEzLBXjcU5Y+aVI
 fiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=bJMd+RLLfDpl3FZwMUOjzLgeUgFYu6rMu4fmlAEMWcq7DX5eYikgX617YyQEs+b55s
 WzNjiSBUEcjhrNC/7AR6Xmm/nsjA+eQmTJ57pu1EZdOWmfZ7CQD9U/YjKQr+u2iSSGfd
 BcTQaEuJvrYwFX7QoLenuYfEO1QzaHzu4yLBz/vfEO6pDijkcAPi1ZW3bOreCpWkLkmR
 M5UkUCJCR9prXWBHzutOuKBE5o2Dc2pW7xPODR2l5xDAKYkvvbMvmAyy2eU+SAyjwWxx
 bCkgCXD8gdyAwa0PVZpYYD1pKc1Zs4fMg2age/C/PX6gJ9xc+ba5vUf/q36VRcM5UyhL
 Sxnw==
X-Gm-Message-State: APjAAAWeRP2jroTTgFohpoFU/b8mvK+9M70eHEl6yyaR3yEvKhmufR1M
 bR1KfGNNv8PJx1irtNnHjXFly7pTXL8=
X-Google-Smtp-Source: APXvYqxq7auk0JHXIH29XkI5jKNf7Ond3xfOrSuFv2JmuxA0/fyQHjbm5vPeKYcffjEI7r/D6b6J9g==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr12857107pjr.62.1571420690907; 
 Fri, 18 Oct 2019 10:44:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/22] target/arm: Add HELPER(rebuild_hflags_{a32, a64,
 m32})
Date: Fri, 18 Oct 2019 10:44:24 -0700
Message-Id: <20191018174431.1784-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h |  4 ++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1fb2cb5a77..3d4ec267a2 100644
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
index 37424e3d4d..b2d701cf00 100644
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
2.17.1


