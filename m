Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4406A345E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPB4-0002aE-QI; Sun, 26 Feb 2023 17:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Htj7YwgKCuMXRTXYFKFLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--smostafa.bounces.google.com>)
 id 1pWPB3-0002ZS-9R
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:29 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Htj7YwgKCuMXRTXYFKFLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--smostafa.bounces.google.com>)
 id 1pWPB1-0003xP-LW
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:29 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536cad819c7so101140687b3.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7JsPmexuAA9KVUzOd9TgH6d0EGckRDRiNS9iokJg500=;
 b=Zwp7YavjE/frjrlSWGTt0I6RZT2O85YDZka1L0zDcaj0r72NDFZ2MOsKu16ESbrl85
 jQRx07Fjq2eFMXvmbJQYEtgy9zxkiHt88hxQTLBRXtXugCGSWKmPgxUs0+2ctVYw/lP/
 nzv/zS9ILl3WNNc5rzkbabgfRA0TZ5wYUpMbtSrTUfzE87Tsj5AjZny1nQ2Iq5VfWvwL
 YAI4KMmpNtILsyoHkxiW+gkWI2uSkVkuTJ+9exbpolIVgAnxqeXZoUqqM9S/jM2iK+T4
 jvd3OY7m37PqNCUtNdDCaWDS9GKHAfG//7P8vM+dWog9istZLUEXDhqVq5h8XWXPLbya
 opyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7JsPmexuAA9KVUzOd9TgH6d0EGckRDRiNS9iokJg500=;
 b=DxeJRSIyXw80DE/fplqmtKECYi1GdiSdgdVulnZrtmafUixV63iNdZg63n56k0J4aN
 Bp+bcU2S/NU2fqLPBinRpspZxZkktSOrU1suAz4Hn/S8nX/4rKh1QUrWzEqe2DGdQAF8
 FwFJuDhtmsor7hcnfH5UTugM68OS2noOmFH5dSh9+sLz9QF1VbECSUkbxNXpB+gvXMp2
 0M8YPwtKMonHAOc98yhgQYQoTGgiIf9hBgkIUnmldWHJNV9eqoI3B3q7yaSiOyISsX+Z
 w81FJKthjM3dG0q9dl4TleqF6NbidoUby7r3j2in5whLEmgauUoVucyXI9QAtLmJaA6A
 rI6A==
X-Gm-Message-State: AO0yUKVBV9JCpe6g3iXbJmVI8Qv0rZBQblwuTUezc2aEnWVc9IRTW+nf
 dUydzFEzO74eNi2QdgIoURNQbSembmqAecxOB3ebkpwcQFCdzEzCCMEe2G8s9GbmR3gluWhALRD
 h+cqb0C8NNeKNMtZDCS1g/o1Cd1n4YKp+nQqQOET2iCbWYFXzQfzelD1V6zA7KTJxnQ==
X-Google-Smtp-Source: AK7set9vQazgrpdszKTNFi48w5hfqs8/66ZjxcMYRNT45IMJqAegqRintip95fyf54Mn3RG1l3z0jGgzn6rJGQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:101:b0:886:7517:31a5 with SMTP
 id o1-20020a056902010100b00886751731a5mr1011117ybh.404.1677449246099; Sun, 26
 Feb 2023 14:07:26 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:50 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-12-smostafa@google.com>
Subject: [RFC PATCH v2 11/11] hw/arm/smmuv3: Add knob to choose translation
 stage and enable stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3Htj7YwgKCuMXRTXYFKFLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
index bc4ec202f4..ebffc7e5f5 100644
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
@@ -245,14 +246,20 @@ static void smmuv3_init_regs(SMMUv3State *s)
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
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
@@ -508,10 +515,6 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
             goto bad_ste;
         }
-
-        /* This is still here as stage 2 has not been fully enabled yet. */
-        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-        goto bad_ste;
     }
 
     if (STE_S1CDMAX(ste) != 0) {
@@ -739,7 +742,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
         return 0;
     }
 
@@ -1801,6 +1804,18 @@ static const VMStateDescription vmstate_smmuv3 = {
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
@@ -1817,6 +1832,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
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
2.39.2.637.g21b0678d19-goog


