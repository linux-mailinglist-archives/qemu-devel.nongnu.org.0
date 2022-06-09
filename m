Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5E544A5C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:37:48 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGTy-0002WR-BR
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7U-0001by-MH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7S-00063j-WC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o8so3625877wro.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aIxMiFOj5OlkrMNI1jLiszeJAUOpuEVyCOWF9sP0Y2w=;
 b=ZC2m5FbCfDchAohCh+UlgwvHp2J/t873YzrMo6IFMAN9+gJvfhwOkbmJ2P0QABjLmY
 nJOWXN3pusATWYgARANTam9uSrR6CgjXHEf1cRsLX1V2nw2QJgC0yqEVhHXVhVB7UDBN
 AQ2Zi1Ovk55YuyXHvS7xSav3xNhdu7vDjQGeoB8Um4SAlD2iLvyDrwc7yIuPmcuTxA0A
 WCc8QjFcUNz/78CVEl9ly1FKvseMuP2teBu6akkxWA7vasDNP9on8bFv0ZTZO2qQjjVr
 a7RjAmgCZe+E9PDvwSx4vM2JpzKLrelM4oR4mHYWHpl9h1YzsvtxD2b/uKrDc8pLkyCi
 d+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aIxMiFOj5OlkrMNI1jLiszeJAUOpuEVyCOWF9sP0Y2w=;
 b=yuiFcMp9+lnCRhTcJkvtmRouAGLdWvlQPkdsOmNvagGO8q5xK8CkTYp1J+1GHCYSpc
 FLLdNrtJpmPSP51BITY5QiBSz3mxiRk16TcYYy8yPjqGtRjJtK9zPBQ68+9nLf937Qj9
 M4bjW7RuUECdGASkOwcn/wKimgiqcG02OCUK/SnPsIMyccL8I6QiCZ+CX8Ue2VxdzM5+
 pu3u+sU4yPnG4lRwF/5rKpmMHK6EEbOXt+8Exb+UUImXJWAWzEOJr5A4EvKvuz5nhMXK
 l/Mi3IEDBs9CCKtH2mRXkA0Lh0+nFTm9ehYUXCEPrecwyGJYofiQYSiH2clcCqC2cdPG
 ja0w==
X-Gm-Message-State: AOAM532zRD+XeiXPYBUcGiJfM85PlRh7VAYfLLDqUIfec2x8GsBMhsD9
 uj7poBVoKb0y8QDLY7EsU4O8TkKrXY6jgw==
X-Google-Smtp-Source: ABdhPJx21/fkSsDQUwFjcrjDGYqxWZ2x32SPamIkAE6zS51/GOnDeWVR3l89BqFcBz3exc2T9m6olQ==
X-Received: by 2002:a05:6000:1888:b0:218:3fab:c510 with SMTP id
 a8-20020a056000188800b002183fabc510mr19871078wri.473.1654765580495; 
 Thu, 09 Jun 2022 02:06:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/55] linux-user/aarch64: Introduce sve_vq
Date: Thu,  9 Jun 2022 10:05:19 +0100
Message-Id: <20220609090537.1971756-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Add an interface function to extract the digested vector length
rather than the raw zcr_el[1] value.  This fixes an incorrect
return from do_prctl_set_vl where we didn't take into account
the set of vector lengths supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 20 +++++++++++++-------
 target/arm/cpu.h                  | 11 +++++++++++
 linux-user/aarch64/signal.c       |  4 ++--
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933a..1d440ffbea4 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,24 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
-        vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        old_vq = sve_vq(env);
 
+        /*
+         * Bound the value of arg2, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild to
+         * sort out the length supported by the cpu.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, ARM_MAX_VQ);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = sve_vq(env);
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e791ffdd6b6..f5af88b686d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3286,6 +3286,17 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
+/**
+ * sve_vq
+ * @env: the cpu context
+ *
+ * Return the VL cached within env->hflags, in units of quadwords.
+ */
+static inline int sve_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, VL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9d..7da0e36c6d4 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = sve_vq(env);
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.25.1


