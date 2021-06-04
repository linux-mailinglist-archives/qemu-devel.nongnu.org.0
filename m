Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81039BD2A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:32:15 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCk2-00047M-IA
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRM-00033k-5G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRF-0003qI-Jr
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id h3so5705257wmq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJVHeJ+pGUaeyhH82Xlk1CVXigUjkgZJpWNOfvUWY7I=;
 b=PY8oliISMAt52zE7hZsr9LggbMNl1bp9EeWSqY8xK51X9QvcsR4jbQqJbQvGts43Po
 AKGV6IsvAZ1fl/YZCtcVQSsC0chw76tmhbYghNA4/Oxtz41KX5X/ZxlaC56LrxqVHx8U
 PbxzVKYdqS23JEOZwJpWdieQn5VXVJeYWZsEVB9nBCQPJH/hgwgFUBzNdeNWT2tRvAgN
 C06ChacCiSspBaOL1N3IaD/TGjCEdPD2zx6DWx4zFBgqo6RaTeUbGE+PbLaH6u71ZV3l
 Y9X8kTLT9QhEePgvfrvon9MjUpc5gg0oeRPI1jwbWLtoYe/ZUJDUUzx5nxr9FjB8ZkQW
 4ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJVHeJ+pGUaeyhH82Xlk1CVXigUjkgZJpWNOfvUWY7I=;
 b=XF8Eu1qyzk8okgk4HQXXYqREl79WGaGgBM5uxy12Mcvn9sGvP7IDYXQgNuif69Txs0
 +4FVgRkBCE9tnrXciWlLbBilu6nGuAYe8IoFZrimAYDzjX2ltMO/U48BFsRkTbMNzy1O
 6iCZo8mekN7HMwJ1ygJ7T6SZmMcBfD5t+aiUfyUo6R2c7zB1jW3SKzmUh4GuqhwFcBva
 VZav2VX+B26DdCpYOdsfC8rWC5A8JJZ310jG6had0MKVI7ggvbKzwC3LKhOy/1vbVOUZ
 kf3ZE95WzivSDJ0G2FqfTTW65LTFqp/d8XndEBG5QWYmfuYB/YDNpF0Vyrg/48j+RG4T
 fjPA==
X-Gm-Message-State: AOAM533QJwdNnI4z2LSc0iZ02UYpJ0wr1uaehiCe2U4hEidQq45hh1qm
 L0SndWG1+aUMYHENp3zI+3BZmg==
X-Google-Smtp-Source: ABdhPJz0QBWmax7VXt+wuolZVhD6Q26mlg/JFKKYs17/UwILdzxHzv50D3fhS+HhLX5ZjjfajL2nrg==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr4474528wmh.100.1622823168394; 
 Fri, 04 Jun 2021 09:12:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm10457784wmq.0.2021.06.04.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0ECFD1FFE7;
 Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 76/99] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
Date: Fri,  4 Jun 2021 16:52:49 +0100
Message-Id: <20210604155312.15902-77-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

this work is in preparation of making sve_zcr_len_for_el AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v14
  - fix merge failure with CPUARMTBflags update
---
 target/arm/helper-a64.h |  2 ++
 target/arm/helper.h     |  1 -
 target/arm/tcg/helper.c | 12 ++++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..c89406e656 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -118,3 +118,5 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23ccb0f72f..e8df4f7625 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -94,7 +94,6 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_m32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
-DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 38cc7c6a3d..7136c82795 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -999,6 +999,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+#ifdef TARGET_AARCH64
+
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -1122,6 +1124,14 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+#else
+
+QEMU_ERROR("this should have been optimized away!")
+CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                 ARMMMUIdx mmu_idx);
+
+#endif /* TARGET_AARCH64 */
+
 static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
@@ -1183,6 +1193,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
+#ifdef TARGET_AARCH64
 void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
@@ -1190,6 +1201,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 
     env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
 }
+#endif /* TARGET_AARCH64 */
 
 static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 {
-- 
2.20.1


