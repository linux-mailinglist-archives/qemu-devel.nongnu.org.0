Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216574F458A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:48:47 +0200 (CEST)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbryg-0003PL-72
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zMRMYggKCqEXVIBPUTIHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1nbroY-0004Iq-NR
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:22 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:55198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zMRMYggKCqEXVIBPUTIHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--wuhaotsh.bounces.google.com>)
 id 1nbroT-00031k-1X
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:18 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 i19-20020a17090adc1300b001ca70b4a71aso388117pjv.4
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=7y16m+YhgKT9axQ8vzxH2jNiZz8ZOwdWe+v7jicPkRA=;
 b=CAjxTBZ5DCHGqgRFAP0vBgTsvNnqKGZNo3ys8caHzWv+VMd8oRqKLUemGlFhbq7IGr
 S0M67zfwqtEbbRNII5fWZE0st5BaCBKhdkF8ilrkt1AYTNMQU2qlvcVTPZwzvZsr/DgU
 C2YvL+MlQUDya6QLsHSWzSnLgggvGU9FSIcx+UOVd1EizfA1lhNfVPA9RZNfoS99gMeo
 OA5RhDcY/z8jHd4g8KpANPD/Yv6L5BW/DozqmKUyYnTEwE8rdudB1VBW5Fiq3QwDxAYH
 mXJ6YfTymzxLKK8tLoIuU7oYuTRJUWRAFWkswT3YbU7Wht6sWjcbBbvazTEOR/c2ZQ+D
 5dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=7y16m+YhgKT9axQ8vzxH2jNiZz8ZOwdWe+v7jicPkRA=;
 b=fL/mqv2aYAokqJ3k12CbWixyKNPmsSRddvN3n/fZFZq5u3T5JT/9DPTnPb+Q2nDUK0
 Mgfns05dFgV7GdjIZgZDrfhK45owvp29ZVyiWiQV5UvxPND9Z+u2s8ifMVZU55pWBFY7
 /CE1nhCv9p/JqcjGpIj1YEsse3lrncQxdbbpdayr+kHrhfHutZFwuimTlRKHG+YjMLcv
 VFJIfW/+NQFo8W8+j3yYUdDOsH/n2kUN3MtaCr7TkRWg6ougNBAPurg5508DMJ7J+iNz
 fC+ZslsWhTDnsumNxSLd2VBoOsb22YNXDkYvKOQFVh59FJAyY9ppJNeFtxSIufHRHn1z
 /tlw==
X-Gm-Message-State: AOAM530sqAZ/X41+QrOuoXH2vB489YvwRsVdtRGFoMWzNZ/+GbH+dn2P
 gsZ2Tfvzgyryeyx8ZPiLarCpCha4RYyTxg==
X-Google-Smtp-Source: ABdhPJxpusjdlY51IWZ0qzhmN7APqSQp3bJPPBm1r/RABBGCCYfy90xThzOk2vZUIhKUR4DoyMY29C80KzD59Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ce02:b0:153:bd65:5c0e with SMTP
 id k2-20020a170902ce0200b00153bd655c0emr5586875plg.160.1649198284850; Tue, 05
 Apr 2022 15:38:04 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:34 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 05/11] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3zMRMYggKCqEXVIBPUTIHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
module. Since we don't simulate a detailed memory controller, we
need to store this information directly similar to the NPCM7XX's
INCTR3 register.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Titus Rwantare <titusr@google.com>
---
 hw/misc/npcm_gcr.c         | 33 ++++++++++++++++++++++++++++++---
 include/hw/misc/npcm_gcr.h |  1 +
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 2349949599..14c298602a 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -267,7 +267,7 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
     },
 };
 
-static void npcm_gcr_enter_reset(Object *obj, ResetType type)
+static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
 {
     NPCMGCRState *s = NPCM_GCR(obj);
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
@@ -283,6 +283,23 @@ static void npcm_gcr_enter_reset(Object *obj, ResetType type)
     }
 }
 
+static void npcm8xx_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
+
+    switch (type) {
+    case RESET_TYPE_COLD:
+        memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+        /* These 3 registers are at the same location in both 7xx and 8xx. */
+        s->regs[NPCM8XX_GCR_PWRON] = s->reset_pwron;
+        s->regs[NPCM8XX_GCR_MDLR] = s->reset_mdlr;
+        s->regs[NPCM8XX_GCR_INTCR3] = s->reset_intcr3;
+        s->regs[NPCM8XX_GCR_SCRPAD_B] = s->reset_scrpad_b;
+        break;
+    }
+}
+
 static void npcm_gcr_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -326,6 +343,14 @@ static void npcm_gcr_realize(DeviceState *dev, Error **errp)
      * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
      */
     s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;
+
+    /*
+     * The boot block starting from 0.0.6 for NPCM8xx SoCs stores the DRAM size
+     * in the SCRPAD2 registers. We need to set this field correctly since
+     * the initialization is skipped as we mentioned above.
+     * https://github.com/Nuvoton-Israel/u-boot/blob/npcm8mnx-v2019.01_tmp/board/nuvoton/arbel/arbel.c#L737
+     */
+    s->reset_scrpad_b = dram_size;
 }
 
 static void npcm_gcr_init(Object *obj)
@@ -355,12 +380,10 @@ static Property npcm_gcr_properties[] = {
 
 static void npcm_gcr_class_init(ObjectClass *klass, void *data)
 {
-    ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = npcm_gcr_realize;
     dc->vmsd = &vmstate_npcm_gcr;
-    rc->phases.enter = npcm_gcr_enter_reset;
 
     device_class_set_props(dc, npcm_gcr_properties);
 }
@@ -369,24 +392,28 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END != NPCM7XX_GCR_NR_REGS);
     dc->desc = "NPCM7xx System Global Control Registers";
     c->nr_regs = NPCM7XX_GCR_NR_REGS;
     c->cold_reset_values = npcm7xx_cold_reset_values;
+    rc->phases.enter = npcm7xx_gcr_enter_reset;
 }
 
 static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END != NPCM8XX_GCR_NR_REGS);
     dc->desc = "NPCM8xx System Global Control Registers";
     c->nr_regs = NPCM8XX_GCR_NR_REGS;
     c->cold_reset_values = npcm8xx_cold_reset_values;
+    rc->phases.enter = npcm8xx_gcr_enter_reset;
 }
 
 static const TypeInfo npcm_gcr_info[] = {
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index ac3d781c2e..bd69199d51 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -39,6 +39,7 @@ typedef struct NPCMGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
+    uint32_t reset_scrpad_b;
 } NPCMGCRState;
 
 typedef struct NPCMGCRClass {
-- 
2.35.1.1094.g7c7d902a7c-goog


