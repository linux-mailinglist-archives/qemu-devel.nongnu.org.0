Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923836F8F0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:07:32 +0200 (CEST)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQzb-0008Mx-FE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUX-0007vX-AA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUI-0001QM-Pr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so490387wmh.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gcENlcUoIW2DXr+RXZyS/ON8OhNCnCdIA9S9X9dh+SY=;
 b=G/KtIf0dSrYLEJfhwBkQN3t9hkjVBOfYwrxetK+DrdJuap/S9iUf/qavL55pXODzgB
 hE0wbhpmmpNZ8K9DwDdnjPRl+9PLGBzwZ8qs/8dymlzoHChCm2S4O15uTIaGQ7w2b+Dq
 a2GmqBoHdOYUTbr6slKhptMK5w7A2oyqB4mMi2BRPpt1kgTghkJyDsYMFNOSgfsJVIYk
 dyt7QRh+XKxuBH6A9i80ntOcH7L4omBFabKHKjJZ92+1GBrr+PLo25M+thfNdrLOk544
 +tzTbrO3S3ba+MD/qH5GyAdRbnToDt/eoa3SZkPOGCdkbMVHY690G3nzypsVXgk6JGAG
 QS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcENlcUoIW2DXr+RXZyS/ON8OhNCnCdIA9S9X9dh+SY=;
 b=D/wjYWikKYonvhU4V+CIV3Vk3U5qcEYtbLej8QGRPqZbNQAYO/AcKa8izseoNek/xA
 HFzMYy/DN26VAgFbp18icU/eYVW6gs/uCez6FkPauivcWEpxphUT2d4prYN5cFLvMa7+
 qtBsyxvZXJM9ZyHy8l2u4FUftRKSe9HS6eHGGVw9twQKmPuEmLSmkSb8OBMVPKHIaYKw
 2whSUQAKTQvoZZBh92skRkuQoMPheznpI8Tkfl6srzwkdPz0E++TqO1KS/VhGhc7kjHZ
 Mr/1nk1iIxcPhj/ObkQTsQ7YfUE2B3aSivAoP+MpBDeo8vkGcwtNkSG8nyEXR5bTw6io
 qv2A==
X-Gm-Message-State: AOAM530DGHsvwqLOVw/x4/oYIT/sijS7tRhpmJbK1y9+0pK1nsFLsWfW
 RbfA7HHmiyJpssSox/qzhjfeF+DCt6lpkFZq
X-Google-Smtp-Source: ABdhPJzz9MK6YEwcargc2EkfRzLm9kDPcSbJmADlFkaunwDYn0KCa/vTuulTOLz+y2vZeKgSq/maVw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr15865061wmc.88.1619778909450; 
 Fri, 30 Apr 2021 03:35:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/43] hw: add compat machines for 6.1
Date: Fri, 30 Apr 2021 11:34:36 +0100
Message-Id: <20210430103437.4140-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Cornelia Huck <cohuck@redhat.com>

Add 6.1 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Message-id: 20210331111900.118274-1-cohuck@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              |  7 ++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 17 ++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 9 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index ad6c8fd5376..3d55d2bd62c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -353,6 +353,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_0[];
+extern const size_t hw_compat_6_0_len;
+
 extern GlobalProperty hw_compat_5_2[];
 extern const size_t hw_compat_5_2_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dcf060b7918..1522a3359a9 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -197,6 +197,9 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_6_0[];
+extern const size_t pc_compat_6_0_len;
+
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f01d9041b6..fee696fb0e3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2757,10 +2757,15 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
+
 static void virt_machine_6_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
+DEFINE_VIRT_MACHINE(6, 0)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78183a..cebcdcc3511 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,6 +36,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_0[] = {};
+const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
+
 GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a031..364816efc9d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -96,6 +96,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_0[] = {};
+const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
+
 GlobalProperty pc_compat_5_2[] = {
     { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 46cc951073b..4e8edffeaf6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -415,7 +415,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_0_machine_options(MachineClass *m)
+static void pc_i440fx_6_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -424,6 +424,18 @@ static void pc_i440fx_6_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
+                      pc_i440fx_6_1_machine_options);
+
+static void pc_i440fx_6_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_1_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
                       pc_i440fx_6_0_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 53450190f54..458ed41c65d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -345,7 +345,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_0_machine_options(MachineClass *m)
+static void pc_q35_6_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -353,6 +353,17 @@ static void pc_q35_6_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
+                   pc_q35_6_1_machine_options);
+
+static void pc_q35_6_0_machine_options(MachineClass *m)
+{
+    pc_q35_6_1_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+}
+
 DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
                    pc_q35_6_0_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e4be00b732a..529ff056dd2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4605,14 +4605,25 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-6.0
+ * pseries-6.1
  */
-static void spapr_machine_6_0_class_options(MachineClass *mc)
+static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
+DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
+
+/*
+ * pseries-6.0
+ */
+static void spapr_machine_6_0_class_options(MachineClass *mc)
+{
+    spapr_machine_6_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+}
+
+DEFINE_SPAPR_MACHINE(6_0, "6.0", false);
 
 /*
  * pseries-5.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2972b607f36..56b52d2d309 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -795,14 +795,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_1, "6.1", true);
+
 static void ccw_machine_6_0_instance_options(MachineState *machine)
 {
+    ccw_machine_6_1_instance_options(machine);
 }
 
 static void ccw_machine_6_0_class_options(MachineClass *mc)
 {
+    ccw_machine_6_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
-DEFINE_CCW_MACHINE(6_0, "6.0", true);
+DEFINE_CCW_MACHINE(6_0, "6.0", false);
 
 static void ccw_machine_5_2_instance_options(MachineState *machine)
 {
-- 
2.20.1


