Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CE4ED9A3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:29:30 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtvc-00088S-H5
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:29:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMk-000639-Vt
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:28 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMe-000061-2V
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:26 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4B1EE21CC4;
 Thu, 31 Mar 2022 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648727594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtzRWK6oRCkkVEPihvusUuUO/HWewFUki8lfJUknad0=;
 b=CQhPO7ic4xsLlwzlo784GdXttSGJwHp7TbC/4v3kIwgY9vOVHL45R51PBou8VR0sX0hjFr
 jRrxziVlYoqwwclJrHroUojNoQ2vXk3RjDgJX5pMbdFFYPSm13q5hVwnI3QgsI5YhuwR+/
 luCfafEe2KJDI4twVhhyF609tc1gELI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] rename machine_class_allow_dynamic_sysbus_dev
Date: Thu, 31 Mar 2022 13:53:11 +0200
Message-Id: <20220331115312.30018-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331115312.30018-1-damien.hedde@greensocs.com>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callsite are updated to the new function name
"machine_class_allow_dynamic_device"

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c               | 10 +++++-----
 hw/i386/microvm.c           |  2 +-
 hw/i386/pc_piix.c           |  4 ++--
 hw/i386/pc_q35.c            |  8 ++++----
 hw/ppc/e500plat.c           |  2 +-
 hw/ppc/spapr.c              |  2 +-
 hw/riscv/virt.c             |  2 +-
 hw/xen/xen-legacy-backend.c |  2 +-
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..1442b8840b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2829,12 +2829,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
      * configuration of the particular instance.
      */
     mc->max_cpus = 512;
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_device(mc, TYPE_VFIO_CALXEDA_XGMAC);
+    machine_class_allow_dynamic_device(mc, TYPE_VFIO_AMD_XGBE);
+    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_device(mc, TYPE_VFIO_PLATFORM);
 #ifdef CONFIG_TPM
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+    machine_class_allow_dynamic_device(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262..4f8f423d31 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -756,7 +756,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
         MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo microvm_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b72c03d0a6..27373cb16a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -411,8 +411,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
+    machine_class_allow_dynamic_device(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_device(m, TYPE_VMBUS_BRIDGE);
 }
 
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc1..8221615fa4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -353,10 +353,10 @@ static void pc_q35_machine_options(MachineClass *m)
     m->default_display = "std";
     m->default_kernel_irqchip_split = false;
     m->no_floppy = 1;
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
-    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
+    machine_class_allow_dynamic_device(m, TYPE_AMD_IOMMU_DEVICE);
+    machine_class_allow_dynamic_device(m, TYPE_INTEL_IOMMU_DEVICE);
+    machine_class_allow_dynamic_device(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_device(m, TYPE_VMBUS_BRIDGE);
     m->max_cpus = 288;
 }
 
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index fc911bbb7b..273cde9d06 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -102,7 +102,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 32;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
+    machine_class_allow_dynamic_device(mc, TYPE_ETSEC_COMMON);
  }
 
 static const TypeInfo e500plat_info = {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a4372ba189..70e12d9037 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4586,7 +4586,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "ppc_spapr.ram";
     mc->default_display = "std";
     mc->kvm_type = spapr_kvm_type;
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
+    machine_class_allow_dynamic_device(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
     mc->pci_allow_0_address = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = spapr_get_hotplug_handler;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..b6e2b0051b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1513,7 +1513,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->numa_mem_supported = true;
     mc->default_ram_id = "riscv_virt_board.ram";
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
 
     object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                    virt_set_aclint);
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 085fd31ef7..7c81c4846a 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -722,7 +722,7 @@ static void xen_set_dynamic_sysbus(void)
     ObjectClass *oc = object_get_class(machine);
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
+    machine_class_allow_dynamic_device(mc, TYPE_XENSYSDEV);
 }
 
 int xen_be_register(const char *type, struct XenDevOps *ops)
-- 
2.35.1


