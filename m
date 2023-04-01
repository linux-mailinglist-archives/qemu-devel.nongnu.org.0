Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663F6D2FB5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYok-0000yT-8g; Sat, 01 Apr 2023 06:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3awwoZAgKCkw60267otou22uzs.q204s08-rs9sz121u18.25u@flex--smostafa.bounces.google.com>)
 id 1piYob-0000ur-Iw
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:33 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3awwoZAgKCkw60267otou22uzs.q204s08-rs9sz121u18.25u@flex--smostafa.bounces.google.com>)
 id 1piYoZ-0002v6-Pp
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:33 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 v7-20020a05600c470700b003ef6ebfa99fso9255351wmo.8
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3LnacweXtaTHJ6qAN/W+TaByNM8t88vuJX4sTOd7WXM=;
 b=in7BOcaVtwIVeotCmFQ54pUI1TADQ+LGmRUpfNdtGSzz4VGt6pfas0TUu8zzXmuzEE
 vcOpxuXpFDT3Tmf9uaDk/F18aqfWUAuhm0isYt0ytxORH8Py7OJIanerwN0PeUVU2MQw
 MeUzQK+XBU67iQgvEq+ynvujbyOxX+WxN3ito50DeXEJolghnys6Ni5mqrofzaPOUyCz
 J0Z7iwgBN1IIWfqWSU0xFDOjMNRu4Z1o8J+HTktbGPHvJyGWrVIrbubuAFcCIii63Swr
 R9hok/YKhRZ8KJ6DfhlxZVSAxvEEAJ8EVOd86HY6FV4TbQcVHEpDufXxnaGZmTh5BF0D
 j9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LnacweXtaTHJ6qAN/W+TaByNM8t88vuJX4sTOd7WXM=;
 b=JecPadxyLVKKgPQk8lSKaWLN+kn9U5fiRwwQoQJrlkB60kbiyG1XMrBek1hSSbhGzs
 GFmNJH321XAYAjIGlyaAQuMMbnoTxANi6JobyIvkEOq5ZJQg3QCFeyfJ3n7uYtKr8tHO
 iBpbL0HANvn48CrJ9dhtsk3r3Dyeodv6fyR+YNjrSR4GFpr6l+X+yuB08w6jrFxriC7K
 kZK2Y5zyEFFLyz/l+hk7kRlGnYv2Ddfdp/wdFsvIvh5zYYEbxLAvApzvk1FfuYa3Kfe8
 m/BuIMb23HrHb42I982K5xzgappL4HI9KPxX7qI8vpnqj39UtUjBOlgb+8ggMmWZEnw6
 gboA==
X-Gm-Message-State: AAQBX9fdF9UVULMyTIst2BGM3lRu9Ef/byfzy3136CXwDOM3GKSIiH5q
 vXfc9Zy7jDh1H5Q3jWJVvqNtfgdReYzHKMrxqywgikAO+LIGn18J7XkdatBxfuvvJUBG0PyiRQU
 uauTBcb/ZqeoVowxDETqrNUWyf2HCfwzQsXqO6Sg+Un8vYyTq97THK/DPTD3vRfajVQ==
X-Google-Smtp-Source: AKy350Z0XefQUZbsgRHEsLLbs4vpSQFfFyK0ihoml6uwJCLF3JCFfZv+K5luaTGdn+yepP/JDezTfzjdlmcjJQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:cce:b0:3ee:136f:bce6 with SMTP
 id fk14-20020a05600c0cce00b003ee136fbce6mr4729514wmb.2.1680346219648; Sat, 01
 Apr 2023 03:50:19 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:53 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-11-smostafa@google.com>
Subject: [RFC PATCH v3 10/10] hw/arm/smmuv3: Add knob to choose translation
 stage and enable stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3awwoZAgKCkw60267otou22uzs.q204s08-rs9sz121u18.25u@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

As everything is in place, we can use a new system property to
advertise which stage is supported and remove bad_ste from STE
stage2 config.

The property added arm-smmuv3.stage can have 3 values:
- "1": Stage-1 only is advertised.
- "2": Stage-2 only is advertised.
- "all": Stage-1 + Stage-2 are supported, which is not implemented in
this patch series.

If not passed or an unsupported value is passed, it will default to
stage-1.

Advertise VMID16.

Don't try to decode CD, if stage-2 is configured.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- Squash knob patch with stage-2 enable patch.
- Don't try to decode CD, if stage-2 is configured.
---
 hw/arm/smmuv3.c         | 34 +++++++++++++++++++++++++---------
 include/hw/arm/smmuv3.h |  1 +
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 826aacf8b1..22b5613d4c 100644
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
@@ -248,14 +249,20 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
-    /**
-     * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
-     *       multi-level stream table
+    /*
+     * Based on sys property, the stages supported in smmu will be advertised.
+     * At the moment "all" is not supported and default to stage-1.
      */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
+    if (s->stage && !strcmp("2", s->stage)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    } else {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+    }
+
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
+    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, VMID16, 1); /* 16-bit VMID */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
     /* terminated transaction will always be aborted/error returned */
@@ -458,10 +465,6 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
         goto bad_ste;
     }
 
-    /* This is still here as stage 2 has not been fully enabled yet. */
-    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-    goto bad_ste;
-
     return 0;
 
 bad_ste:
@@ -740,7 +743,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
         return 0;
     }
 
@@ -1809,6 +1812,18 @@ static const VMStateDescription vmstate_smmuv3 = {
     }
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
@@ -1825,6 +1840,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 6031d7d325..d183a62766 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -62,6 +62,7 @@ struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
+    char *stage;
 };
 
 typedef enum {
-- 
2.40.0.348.gf938b09366-goog


