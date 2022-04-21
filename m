Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C73509E8B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:30:20 +0200 (CEST)
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV0t-0001vl-64
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpr-0002oV-NW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpp-0003Qe-R2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id c10so6234376wrb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BePwGfJ5XZrjJA9AlqDcYsFQYq5FiOLMVEDlWQi8GrM=;
 b=PMzk4M48woAwFUg07t1b4tzLxELfAYuONCe0q9VpXUWt66zuZ2iI/zOjHKGm0MESUd
 dUHbc4XEw7N4eQGX+osOdE2tWXGlcqxWJRHt57xyeN7+GtxMIOZRnME3NQXJp2mHGg/i
 hmSmiMyuFSezglBYMQBuJBwZ+m7gmFvZ3Ga7wXzWOimMGjwdPyYbGd3yd7yMFQaDOTvW
 BVEY2zMb9xKiTX4OF2LtrMLk9+ulqBbMnlDA9HCshtoJNyiF9sCBKCeoPtbxd/YbzFSX
 qA2g9Q83A4+3vDqVK1/7gjc7bWMS1JnFSoU14foQlXHB11JfwfMs5SroaGOGVsF8dcld
 Dmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BePwGfJ5XZrjJA9AlqDcYsFQYq5FiOLMVEDlWQi8GrM=;
 b=Ki7fer0356JPrPBYPH5fuN87q/Y/y38UW7l/gXjI3vR6DNL0mNKmjMfe+KX6SAd3o6
 PxnN+ITkIcMZjpaPb0xQW+OCo8JlRGrPSh/V4smN1dzSZKib2jyQ651WZfznf2U8awZT
 hIf5oyjtpBVQjfe3hXIBbnIQNyNBspdJjQLw2/6OAcfZy2LhahGDdipiIRNLtpxqentz
 ZXRnrFqC0ZdSMtaemY9EH34+UBZ13M6bUcsc/fq48qI8NTb+Qd3G+2aWv6Djcv3q1qH/
 UMSR3DjOAzV8pKhpnKR+0BLeFzc8gUJ800nv+9btcCn+iUlib7/SXUvCWu2P/tKR0PCm
 7ZaQ==
X-Gm-Message-State: AOAM530mP6Uo7a5ISgDCVFMKxn9x8dkdJDu17plrml6NAMTuSuGYBGbK
 TxX078/47Ozu08qebU8JOiINthor5g2wfg==
X-Google-Smtp-Source: ABdhPJy76Y2T2bLhRGTvY6Rtv4GLHFGwTjFRmWUf6BgfGIAUWn7BRNRgNZRGibeyU3ZklBvdcUryEw==
X-Received: by 2002:a5d:48cc:0:b0:206:d17:10aa with SMTP id
 p12-20020a5d48cc000000b002060d1710aamr19310591wrs.460.1650539932453; 
 Thu, 21 Apr 2022 04:18:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/31] hw/arm: versal: Add the Cortex-R5Fs
Date: Thu, 21 Apr 2022 12:18:20 +0100
Message-Id: <20220421111846.2011565-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the Cortex-R5Fs of the Versal RPU (Real-time Processing Unit)
subsystem.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Message-id: 20220406174303.2022038-3-edgar.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 10 ++++++++++
 hw/arm/xlnx-versal-virt.c    |  6 +++---
 hw/arm/xlnx-versal.c         | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index d2d3028e185..155e8c4b8cd 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -35,6 +35,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
 
 #define XLNX_VERSAL_NR_ACPUS   2
+#define XLNX_VERSAL_NR_RCPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
 #define XLNX_VERSAL_NR_GEMS    2
 #define XLNX_VERSAL_NR_ADMAS   8
@@ -73,6 +74,15 @@ struct Versal {
             VersalUsb2 usb;
         } iou;
 
+        /* Real-time Processing Unit.  */
+        struct {
+            MemoryRegion mr;
+            MemoryRegion mr_ps_alias;
+
+            CPUClusterState cluster;
+            ARMCPU cpu[XLNX_VERSAL_NR_RCPUS];
+        } rpu;
+
         struct {
             qemu_or_irq irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 7c7baff8b7f..66a2de7e133 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -721,9 +721,9 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Xilinx Versal Virtual development board";
     mc->init = versal_virt_init;
-    mc->min_cpus = XLNX_VERSAL_NR_ACPUS;
-    mc->max_cpus = XLNX_VERSAL_NR_ACPUS;
-    mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->min_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->max_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->default_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
 }
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 4415ee413fc..ebad8dbb6d8 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
+#define XLNX_VERSAL_RCPU_TYPE ARM_CPU_TYPE_NAME("cortex-r5f")
 #define GEM_REVISION        0x40070106
 
 #define VERSAL_NUM_PMC_APB_IRQS 3
@@ -130,6 +131,35 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_rpu_cpus(Versal *s)
+{
+    int i;
+
+    object_initialize_child(OBJECT(s), "rpu-cluster", &s->lpd.rpu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->lpd.rpu.cluster), "cluster-id", 1);
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
+        Object *obj;
+
+        object_initialize_child(OBJECT(&s->lpd.rpu.cluster),
+                                "rpu-cpu[*]", &s->lpd.rpu.cpu[i],
+                                XLNX_VERSAL_RCPU_TYPE);
+        obj = OBJECT(&s->lpd.rpu.cpu[i]);
+        object_property_set_bool(obj, "start-powered-off", true,
+                                 &error_abort);
+
+        object_property_set_int(obj, "mp-affinity", 0x100 | i, &error_abort);
+        object_property_set_int(obj, "core-count", ARRAY_SIZE(s->lpd.rpu.cpu),
+                                &error_abort);
+        object_property_set_link(obj, "memory", OBJECT(&s->lpd.rpu.mr),
+                                 &error_abort);
+        qdev_realize(DEVICE(obj), NULL, &error_fatal);
+    }
+
+    qdev_realize(DEVICE(&s->lpd.rpu.cluster), NULL, &error_fatal);
+}
+
 static void versal_create_uarts(Versal *s, qemu_irq *pic)
 {
     int i;
@@ -638,6 +668,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
 
     versal_create_apu_cpus(s);
     versal_create_apu_gic(s, pic);
+    versal_create_rpu_cpus(s);
     versal_create_uarts(s, pic);
     versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
@@ -659,6 +690,8 @@ static void versal_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
     memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
+    memory_region_add_subregion_overlap(&s->lpd.rpu.mr, 0,
+                                        &s->lpd.rpu.mr_ps_alias, 0);
 }
 
 static void versal_init(Object *obj)
@@ -666,7 +699,10 @@ static void versal_init(Object *obj)
     Versal *s = XLNX_VERSAL(obj);
 
     memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
+    memory_region_init(&s->lpd.rpu.mr, obj, "mr-rpu", UINT64_MAX);
     memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
+    memory_region_init_alias(&s->lpd.rpu.mr_ps_alias, OBJECT(s),
+                             "mr-rpu-ps-alias", &s->mr_ps, 0, UINT64_MAX);
 }
 
 static Property versal_properties[] = {
-- 
2.25.1


