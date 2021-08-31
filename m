Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B03FC09C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 03:58:37 +0200 (CEST)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKt2q-0004uH-Bb
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 21:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKsz8-0002Bb-0d; Mon, 30 Aug 2021 21:54:46 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKsz5-0003wi-0Z; Mon, 30 Aug 2021 21:54:45 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gz9GR5tr8z89mF;
 Tue, 31 Aug 2021 09:54:07 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 09:54:28 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 31 Aug 2021 09:54:27 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>
Subject: [PATCH 1/1] hw: Add compat machines for 6.2
Date: Tue, 31 Aug 2021 09:54:26 +0800
Message-ID: <20210831015426.101188-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210831015426.101188-1-wangyanan55@huawei.com>
References: <20210831015426.101188-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com, Paolo
 Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 86c8a4ca3d..dbb77b5997 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2783,10 +2783,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_6_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
+
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    virt_machine_6_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
+DEFINE_VIRT_MACHINE(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587d..067f42b528 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_1[] = {};
+const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
+
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 102b223946..1276bfeee4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,6 +93,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_1[] = {};
+const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
+
 GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1bc30167ac..c5da7739ce 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -412,7 +412,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_1_machine_options(MachineClass *m)
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -421,6 +421,18 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
+                      pc_i440fx_6_2_machine_options);
+
+static void pc_i440fx_6_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
                       pc_i440fx_6_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index eeb0b185b1..565fadce54 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -354,7 +354,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_1_machine_options(MachineClass *m)
+static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -362,6 +362,17 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
+                   pc_q35_6_2_machine_options);
+
+static void pc_q35_6_1_machine_options(MachineClass *m)
+{
+    pc_q35_6_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
                    pc_q35_6_1_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..d39fd4e644 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-6.2
+ */
+static void spapr_machine_6_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+
 /*
  * pseries-6.1
  */
 static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_6_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
+DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
 
 /*
  * pseries-6.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e4b18aef49..4d25278cf2 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -791,14 +791,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_2, "6.2", true);
+
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
+    ccw_machine_6_2_instance_options(machine);
 }
 
 static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
+    ccw_machine_6_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
-DEFINE_CCW_MACHINE(6_1, "6.1", true);
+DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
 static void ccw_machine_6_0_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35..463a5514f9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -353,6 +353,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_1[];
+extern const size_t hw_compat_6_1_len;
+
 extern GlobalProperty hw_compat_6_0[];
 extern const size_t hw_compat_6_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe7517..97b4ab79b5 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_6_1[];
+extern const size_t pc_compat_6_1_len;
+
 extern GlobalProperty pc_compat_6_0[];
 extern const size_t pc_compat_6_0_len;
 
-- 
2.19.1


