Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C536E39BE4A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:15:02 +0200 (CEST)
Received: from localhost ([::1]:57306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDPR-0002Xj-Rk
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNC-0007ur-UT
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNA-00020l-Tv
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z8so9998281wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q8h+n24TrWRUxnaytAqdbGvuFIoi1mcRJzQRuLb50YQ=;
 b=OVAumHYklZRMtwRNTiCaSZlgF4QkU5a0aQPMUKMfJ67aVsDtkJxZ4wXFMgJNg2jNRE
 R7EbQqyN3+zU8k3ian76Gpyor1iea8pwgjfaUz6VLIFHNeMnfc3ciQRomR78kMSDxxH6
 z8Qpz1qGrieO5m/3CjzZfnw+t374pgevuuuWxOmIEAjgTySUmMbLWMyU3xu2ScejJewP
 d3cSE+BwNpTAJxCg2KabRaJ2jEXDTc229qqRTh0OXooR1QxvYpztjanGMggl3lUbK3Vz
 Z7sggk9piSf7TTBJY6CfVEr0mreZAw1qZsvYLWgLZ+P8dfgpEAk0iYh4iALznyCAJ8H8
 IX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8h+n24TrWRUxnaytAqdbGvuFIoi1mcRJzQRuLb50YQ=;
 b=ZbkH9kG0F4YMJpmqf5jK/iQd1K3vdjHvZoVMLm6836on76hyl30IMpN75w6HkVtlNR
 OgLrr7XMJAVZgHBtekOtaFbyI5YH45y2TMieWu4vWbSipIkoY3KH06EaXcBGEJkbRz+F
 Bdac8GbLPwBRwMsGwag/8qkFJK1lmrkelk7J2jFI2BCibsfRWZUVhaa4tSl+wPwhlbcB
 /GMQsoNE1gsyYm6Lzi8rEGJO9fZoNcXdvm09a2+Hf08C7x4Zd8nELA7ymjkJ4n6YHcDm
 cPw+lEG4InBdvERKRcgfcFUNYajvaEaIjX5WxMXA5dJosG8z6vJ2YRjdGT2cEa19GYJx
 47LQ==
X-Gm-Message-State: AOAM532glOAUe04gwwM/gFc2tod5aFwrhaf0YzW+gY0CWGc3UlgqAZYS
 4marMSeItJDU5d4qKcBnH5uWmQ==
X-Google-Smtp-Source: ABdhPJxweXeM0C8cPpbzf4aVKymFRYAbku1nYroKp34BFmbglNMoAWh7IUpWB5XTXFRwS1Tqcr1tVw==
X-Received: by 2002:adf:bc06:: with SMTP id s6mr5147755wrg.250.1622826759038; 
 Fri, 04 Jun 2021 10:12:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c23sm9282915wme.37.2021.06.04.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B17C01FFF5;
 Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 81/99] target/arm: tcg-sve: rename the narrow_vq and
 change_el functions
Date: Fri,  4 Jun 2021 16:52:54 +0100
Message-Id: <20210604155312.15902-82-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

make them canonical for the module name.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-sve.h         | 6 +++---
 linux-user/syscall.c             | 2 +-
 target/arm/cpu-exceptions-aa64.c | 2 +-
 target/arm/tcg/cpregs.c          | 2 +-
 target/arm/tcg/helper-a64.c      | 2 +-
 target/arm/tcg/tcg-sve.c         | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
index 5855bb4289..46e42d1139 100644
--- a/target/arm/tcg/tcg-sve.h
+++ b/target/arm/tcg/tcg-sve.h
@@ -21,9 +21,9 @@ uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
 bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
                            Error **errp);
 
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq);
 
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
-                           int new_el, bool el0_a64);
+void tcg_sve_change_el(CPUARMState *env, int old_el,
+                       int new_el, bool el0_a64);
 
 #endif /* TCG_SVE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index db4b7b1e46..4cfbe72b21 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10877,7 +10877,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 vq = MIN(vq, cpu->sve_max_vq);
 
                 if (vq < old_vq) {
-                    aarch64_sve_narrow_vq(env, vq);
+                    tcg_sve_narrow_vq(env, vq);
                 }
                 env->vfp.zcr_el[1] = vq - 1;
                 arm_rebuild_hflags(env);
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
index adaf3bab17..1a3e1d6458 100644
--- a/target/arm/cpu-exceptions-aa64.c
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -119,7 +119,7 @@ void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+        tcg_sve_change_el(env, cur_el, new_el, is_a64(env));
     }
 
     if (cur_el < new_el) {
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 9d3c9ae841..9d4ac66281 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5814,7 +5814,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_zcr_len_for_el(env, cur_el);
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f261f13b2c..e169c03c63 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1042,7 +1042,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
      * Note that cur_el can never be 0.  If new_el is 0, then
      * el0_a64 is return_to_aa64, else el0_a64 is ignored.
      */
-    aarch64_sve_change_el(env, cur_el, new_el, return_to_aa64);
+    tcg_sve_change_el(env, cur_el, new_el, return_to_aa64);
 
     qemu_mutex_lock_iothread();
     arm_call_el_change_hook(env_archcpu(env));
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 908d2c2f2c..25d5a5867c 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -95,7 +95,7 @@ bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
  * may well be cheaper than conditionals to restrict the operation
  * to the relevant portion of a uint16_t[16].
  */
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq)
 {
     int i, j;
     uint64_t pmask;
@@ -124,7 +124,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
 /*
  * Notice a change in SVE vector size when changing EL.
  */
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
+void tcg_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -162,6 +162,6 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
-- 
2.20.1


