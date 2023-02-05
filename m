Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ADB68AF12
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOba1-0003bi-8a; Sun, 05 Feb 2023 04:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l3rfYwgKCjAeYaefMRMSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--smostafa.bounces.google.com>)
 id 1pObZz-0003bR-BV
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:59 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l3rfYwgKCjAeYaefMRMSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--smostafa.bounces.google.com>)
 id 1pObZx-00019p-O0
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:59 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so3255545wmq.0
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IDX881J6mPSGW5+N+x8YR88zVfkf0HgaxefnSqde+WE=;
 b=P0baRfTFnmkKEfGP2ydl59VRSQl/hC3Wr3l91UzVEdmn3OIGWw39PUjqmG2r8iM05e
 mMlY2m6q1fIN96dGei8fLaOPuhy7m2bxuYVDApizWOjlcFXO4e236BL0jFqWO3yiaWdV
 Zn+weDi3XN2oDB4jbIw7zxTrk/9s7fURl5wzIYs9QfmMRmZXn1ADgg/0B9pvtPe2n+O4
 nVQsYsoGd6sNSKT1ArDhV7guJ9XD/+ZMJRxssxtU3Z3aJEeiDE8Cn71gBGQAhMmFPQFk
 5aQCgjB3ptGtt3F209C/i/KaBCXV2u/CtZb3rMcCSnCRhDidcIhgh5/WvWyDSkDECb2v
 VZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IDX881J6mPSGW5+N+x8YR88zVfkf0HgaxefnSqde+WE=;
 b=rNdjYtejhgeVDDvLTOtqawEW+p3iCY1MeUEj4cjyD534w77MWn/opSXEPl1tXdAIpT
 IX0p3E4e0hI+ZntQOOpxW/M334881tlDOAL8vL0Z29W8wMszvy8Qtc2ZA6VYJy8MNM2B
 0Bp1UYDvQgdx8FBQ2CySPiXqga3RWou7AYyUFe3CayMKl0f2Y+e6tc8WEkht9y9gvyJe
 n8zps70cNOVDzE51jh7sUDcjbR5i87yiC2oaZp71afNR4l4nsrY0ULvh+fEpDnyM/eIx
 xuUU4ObVqwj9E/BZN7R9JMcFQtw5CfmB1/JTjMWY1zby8utlZsW7rmMaSnYtomTvceS4
 QoXg==
X-Gm-Message-State: AO0yUKUIeMkeRdpIFguYD1+0O7MliMolKGba2l2sSISkcbMcnZOZ4D3f
 FG6tAYROvXocOadfTT1GuaI1lwekfH9vzhBZq2oIXkONV35xhkssHDxWhOzTeZ5NnLj7UnCGBhh
 x7DteCoWcBUPVvSCfwjzfWWNhsLy7GMJZFf6rq6TVdsqX3U7ot10FU5tUmWvTMqQOdA==
X-Google-Smtp-Source: AK7set9u0pDKGwJHsgDqoO3yryfC1d+1iKgN6Yzd3pjnnFO/jR5M8TbmOwVjzvkjOTuEpe0ESmQ5WT5JIGF3mg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:a15:b0:3dc:4548:cc43 with SMTP
 id z21-20020a05600c0a1500b003dc4548cc43mr1096219wmp.103.1675590295778; Sun,
 05 Feb 2023 01:44:55 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:59 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-5-smostafa@google.com>
Subject: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3l3rfYwgKCjAeYaefMRMSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a new system property for smmuv3 to choose what translation
stages to advertise.

The property added arm-smmuv3.stage can have 3 values:
- "1": Stage-1 is only advertised.
- "2": Stage-2 is only advertised.
- "all": Stage-1 + Stage-2 are supported, which is not implemented in
this patch series.

If not passed or an unsupported value is passed, it will default to
stage-1.

The property is not used in this patch as stage-2 has not been
enabled yet.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  5 +++++
 hw/arm/smmuv3.c          | 28 +++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 170e88c24a..ec64fb43a0 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -329,6 +329,11 @@ enum { /* Command completion notification */
         })
 
 #define SMMU_FEATURE_2LVL_STE (1 << 0)
+#define SMMU_FEATURE_STAGE1   (1 << 1)
+#define SMMU_FEATURE_STAGE2   (1 << 2)
+
+#define STAGE1_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE1)
+#define STAGE2_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE2)
 
 /* Events */
 
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..54dd8e5ec1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "cpu.h"
@@ -238,6 +239,19 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
+    /*
+     * Based on system property, the stages supported in smmu will be advertised.
+     * At the moment "all" is not supported.
+     * Default stage is 1.
+     */
+    s->features = SMMU_FEATURE_STAGE1;
+    if (s->stage && !strcmp("2", s->stage)) {
+        s->features = SMMU_FEATURE_STAGE2;
+    } else if (s->stage && !strcmp("all", s->stage)) {
+        qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 S1 and S2 nesting not supported, defaulting to S1\n");
+    }
+
     /**
      * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
      *       multi-level stream table
@@ -276,7 +290,6 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->eventq.cons = 0;
     s->eventq.entry_size = sizeof(struct Evt);
 
-    s->features = 0;
     s->sid_split = 0;
     s->aidr = 0x1;
     s->cr[0] = 0;
@@ -1514,6 +1527,18 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
 };
 
+static Property smmuv3_properties[] = {
+    /*
+     * Stages of translation advertised.
+     * "1": Stage 1
+     * "2": Stage 2
+     * "all": Stage 1 + Stage 2
+     * Defaults to stage 1
+     */
+    DEFINE_PROP_STRING("stage", SMMUv3State, stage),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void smmuv3_instance_init(Object *obj)
 {
     /* Nothing much to do here as of now */
@@ -1530,6 +1555,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9b9e1c7baf 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -62,6 +62,7 @@ struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
+    char *stage;
 };
 
 typedef enum {
-- 
2.39.1.519.gcb327c4b5f-goog


