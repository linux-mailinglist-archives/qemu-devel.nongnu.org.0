Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D12FBAD7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:16:32 +0100 (CET)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1skA-0004n3-5E
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfB-0007W2-Ob
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:21 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf2-00018X-KM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so1692165wrx.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2YsARn3NZ/4E+i3Lxa79q50cQvuJQ6mtJSjjTVFgM00=;
 b=OchYX6QB6ghU7/DO8eYFKSYEVQgdClXjouK2sagvjTbg0oRB1dlSYcckmRpEfiIC4G
 9Yw8T5Zq3EExnpqDlAixxOiTdNZ03UYl4MqXjzOrjKn1yRM7Zmrs1eD0BelQv089Q58O
 u3ha5PxOcmU/bWkBVX4ZR5tkIBQTKxnuvqAhyRQDD88bGQrJIkgJFPsuBYJbRRsrfVyK
 pFO94zoYGRLfGMMvjy16eGf7f5wt7kuemUZj5cwSw5C197nxrTq/RsS8ae+5d0NJljjw
 CxSparB/5V8/iGcpU9idTXhlDi2oQi8r21cC3DYtB0THHIDF07E/UvjYmEgC/p/5dqB8
 EaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2YsARn3NZ/4E+i3Lxa79q50cQvuJQ6mtJSjjTVFgM00=;
 b=QopGpY+NFIaW1wLvdy3VSax11TCBsztY3JZR1BICUQLlVXmF696bcjJ5qRSwKAOCZw
 Yu880yeSNQmGsOOFFin8eTzkabZ3dJuCt1kBf8HzxG3yOxNGECTL2RzE+95E3ksbpZuJ
 bezwOicGuSahWadCsdQ/QTZ39xLsrPZIivb1x5h6LLd1nw5QE6WeuUcZgEd556Q+Cujo
 cCfOPS2Q78j9upEj+pxsFrzYjPUqWf+y3T/Y+XIFTrY8Vh8TV7jUMulTgGzVdUhlronl
 vAaOSn+TPDoDcgRlZqIGWx0ET7k6IL1iHQentC3SD5VdVYO3kXN+gV2jVqUQwITfjPXO
 Fdpw==
X-Gm-Message-State: AOAM531UF1cfXRVfYCQKyJEW/D/QiWfslOZ3QRFiULq77A1E39t8URbJ
 D3q8AdzrxtF5sWo+/mbs2OS8eY6+dlx2EA==
X-Google-Smtp-Source: ABdhPJyxAp2snhxsIHcVzs939xkPGGyk6FG8Re8qF1Q6N9zS3QEvf2orCEoFgwR7+gHfbVcAF1YRXg==
X-Received: by 2002:adf:d238:: with SMTP id k24mr4798609wrh.414.1611069069960; 
 Tue, 19 Jan 2021 07:11:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] target/arm: remove redundant tests
Date: Tue, 19 Jan 2021 15:10:35 +0000
Message-Id: <20210119151104.16264-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In this context, the HCR value is the effective value, and thus is
zero in secure mode. The tests for HCR.{F,I}MO are sufficient.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-1-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    |  8 ++++----
 target/arm/helper.c | 10 ++++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index be18df5464d..4ae22b2086b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -451,14 +451,14 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         break;
 
     case EXCP_VFIQ:
-        if (secure || !(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
-            /* VFIQs are only taken when hypervized and non-secure.  */
+        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
+            /* VFIQs are only taken when hypervized.  */
             return false;
         }
         return !(env->daif & PSTATE_F);
     case EXCP_VIRQ:
-        if (secure || !(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
-            /* VIRQs are only taken when hypervized and non-secure.  */
+        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
             return false;
         }
         return !(env->daif & PSTATE_I);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c5377e7ecb3..b2ea93c4722 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2084,13 +2084,11 @@ static void csselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     CPUState *cs = env_cpu(env);
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool el1 = arm_current_el(env) == 1;
+    uint64_t hcr_el2 = el1 ? arm_hcr_el2_eff(env) : 0;
     uint64_t ret = 0;
-    bool allow_virt = (arm_current_el(env) == 1 &&
-                       (!arm_is_secure_below_el3(env) ||
-                        (env->cp15.scr_el3 & SCR_EEL2)));
 
-    if (allow_virt && (hcr_el2 & HCR_IMO)) {
+    if (hcr_el2 & HCR_IMO) {
         if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
             ret |= CPSR_I;
         }
@@ -2100,7 +2098,7 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    if (allow_virt && (hcr_el2 & HCR_FMO)) {
+    if (hcr_el2 & HCR_FMO) {
         if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
             ret |= CPSR_F;
         }
-- 
2.20.1


