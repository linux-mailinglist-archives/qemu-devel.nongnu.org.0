Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E085257537A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:55:26 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC27Z-0000pV-RK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0Eb-0000tH-Hv
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EZ-0003Eq-0M
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:33 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EBFnfN003801;
 Thu, 14 Jul 2022 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=u6Q1S1+CtTzr8Bl05JRfoMLGRkvWr5tDDSzeJlXimhE=;
 b=WV7cX/SasuNn+N+hEbLlGdx8sIJe+hdNIR8lCpfqXwM8f0IiepKtarh96kd9t4VRBg84
 D8DI50g+spBxWTR/S9kC2Hbw32jGI2LZJGiG+YWu0wlM4eqQlCZMmMY3DYGNd7Y0JVye
 bRe+ydq2YN0mvQuMS+8P0H33fV6Xw/v1hZ220apv5iDyQK5sUFLVQ/ZF9N0ZT3Mjve15
 ncmhRK0Bc3vfYG2PQEpFbq8+n5S9IaW3P+ojkWHw6W9Kf1pMXj3pPYFTXDsKNMRn4Qit
 +Ac3zSHzRvw26tI5YKIBt93VR3q0B49hrgjvU1wbn61plDW9BfFQbQBFwhYeDyD3qI3e 9Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3habpcsdu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 14:54:28 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26EEsRnf012094
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 14:54:27 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:27 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:26 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 11/11] hw/arm: Add R52 machine
Date: Thu, 14 Jul 2022 16:53:55 +0200
Message-ID: <20220714145355.7225-12-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7Wy6gLpjwuVbWSihFNPakDynNi8OfdB9
X-Proofpoint-ORIG-GUID: 7Wy6gLpjwuVbWSihFNPakDynNi8OfdB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_10,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140064
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_trohmel@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 12:46:13 -0400
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

From: Tobias Röhmel <quic_trohmel@quicinc.com>

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |   5 +
 hw/arm/meson.build                      |   1 +
 hw/arm/r52_machine.c                    | 133 +++++++++++++++
 hw/arm/r52_virt.c                       | 217 ++++++++++++++++++++++++
 include/hw/arm/r52_virt.h               |  61 +++++++
 6 files changed, 418 insertions(+)
 create mode 100644 hw/arm/r52_machine.c
 create mode 100644 hw/arm/r52_virt.c
 create mode 100644 include/hw/arm/r52_virt.h

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377..4df0844080 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -42,3 +42,4 @@ CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
+CONFIG_CORTEX_R52_VIRT=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 219262a8da..72ec0bb656 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -565,3 +565,8 @@ config ARMSSE
     select UNIMP
     select SSE_COUNTER
     select SSE_TIMER
+
+config CORTEX_R52_VIRT
+    bool
+    select ARM_GIC
+    select PL011
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 2d8381339c..2a0cdb9c83 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -43,6 +43,7 @@ arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
+arm_ss.add(when: 'CONFIG_CORTEX_R52_VIRT', if_true: files('r52_virt.c', 'r52_machine.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
diff --git a/hw/arm/r52_machine.c b/hw/arm/r52_machine.c
new file mode 100644
index 0000000000..33e9764793
--- /dev/null
+++ b/hw/arm/r52_machine.c
@@ -0,0 +1,133 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/arm/r52_virt.h"
+#include "hw/boards.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+
+struct r52MachineState {
+    MachineState parent_obj;
+
+    ArmR52VirtState soc;
+
+    bool secure;
+    bool virt;
+
+    struct arm_boot_info binfo;
+};
+
+#define TYPE_R52_MACHINE   MACHINE_TYPE_NAME("r52")
+OBJECT_DECLARE_SIMPLE_TYPE(r52MachineState, R52_MACHINE)
+
+
+static bool r52_get_secure(Object *obj, Error **errp)
+{
+    r52MachineState *s = R52_MACHINE(obj);
+
+    return s->secure;
+}
+
+static void r52_set_secure(Object *obj, bool value, Error **errp)
+{
+    r52MachineState *s = R52_MACHINE(obj);
+
+    s->secure = value;
+}
+
+static bool r52_get_virt(Object *obj, Error **errp)
+{
+    r52MachineState *s = R52_MACHINE(obj);
+
+    return s->virt;
+}
+
+static void r52_set_virt(Object *obj, bool value, Error **errp)
+{
+    r52MachineState *s = R52_MACHINE(obj);
+
+    s->virt = value;
+}
+
+static void r52_init(MachineState *machine)
+{
+    r52MachineState *s = R52_MACHINE(machine);
+    uint64_t ram_size = machine->ram_size;
+
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_ARMR52VIRT);
+
+    object_property_set_bool(OBJECT(&s->soc), "secure", s->secure,
+                             &error_fatal);
+    object_property_set_bool(OBJECT(&s->soc), "virtualization", s->virt,
+                             &error_fatal);
+
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+
+    s->binfo.ram_size = ram_size;
+    s->binfo.loader_start = 0;
+    s->binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+    arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
+}
+
+static void r52_machine_instance_init(Object *obj)
+{
+    r52MachineState *s = R52_MACHINE(obj);
+
+    /* Default to secure mode being disabled */
+    s->secure = false;
+    /* Default to virt (EL2) being enabled */
+    s->virt = true;
+}
+
+static void r52_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Cortex-R52 platform";
+    mc->init = r52_init;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
+    mc->ignore_memory_transaction_failures = true;
+    mc->max_cpus = ARMR52_VIRT_NUM_APU_CPUS;
+    mc->default_cpus = ARMR52_VIRT_NUM_APU_CPUS;
+
+    object_class_property_add_bool(oc, "secure", r52_get_secure,
+                                   r52_set_secure);
+    object_class_property_set_description(oc, "secure",
+                                          "Set on/off to enable/disable the ARM "
+                                          "Security Extensions (TrustZone)");
+
+    object_class_property_add_bool(oc, "virtualization", r52_get_virt,
+                                   r52_set_virt);
+    object_class_property_set_description(oc, "virtualization",
+                                          "Set on/off to enable/disable emulating a "
+                                          "guest CPU which implements the ARM "
+                                          "Virtualization Extensions");
+}
+
+static const TypeInfo r52_machine_init_typeinfo = {
+    .name       = TYPE_R52_MACHINE,
+    .parent     = TYPE_MACHINE,
+    .class_init = r52_machine_class_init,
+    .instance_init = r52_machine_instance_init,
+    .instance_size = sizeof(r52MachineState),
+};
+
+static void r52_machine_init_register_types(void)
+{
+    type_register_static(&r52_machine_init_typeinfo);
+}
+
+type_init(r52_machine_init_register_types)
diff --git a/hw/arm/r52_virt.c b/hw/arm/r52_virt.c
new file mode 100644
index 0000000000..edf3dadb0e
--- /dev/null
+++ b/hw/arm/r52_virt.c
@@ -0,0 +1,217 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/arm/r52_virt.h"
+#include "hw/intc/arm_gic_common.h"
+#include "hw/misc/unimp.h"
+#include "hw/boards.h"
+#include "sysemu/kvm.h"
+#include "sysemu/sysemu.h"
+#include "kvm_arm.h"
+
+#define GIC_NUM_SPI_INTR 160
+
+#define ARM_PHYS_TIMER_PPI  30
+#define ARM_VIRT_TIMER_PPI  27
+#define ARM_HYP_TIMER_PPI   26
+#define ARM_SEC_TIMER_PPI   29
+#define GIC_MAINTENANCE_PPI 25
+
+#define GIC_BASE_ADDR       0xaf000000
+#define GIC_REDIST_ADDR       0xaf100000
+
+static const uint64_t uart_addr[ARMR52_VIRT_NUM_UARTS] = {
+    0x9c090000,
+};
+
+static const int uart_intr[ARMR52_VIRT_NUM_UARTS] = {
+    5,
+};
+
+static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
+{
+    return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
+}
+
+static void armr52_virt_init(Object *obj)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ArmR52VirtState *s = ARMR52VIRT(obj);
+    int i;
+    int num_apus = MIN(ms->smp.cpus, ARMR52_VIRT_NUM_APU_CPUS);
+
+    object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
+
+    for (i = 0; i < num_apus; i++) {
+        object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
+                                &s->apu_cpu[i],
+                                ARM_CPU_TYPE_NAME("cortex-r52"));
+    }
+
+    object_initialize_child(obj, "gic", &s->gic, gicv3_class_name());
+
+
+    for (i = 0; i < ARMR52_VIRT_NUM_UARTS; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i],
+                                TYPE_PL011);
+    }
+}
+
+static void armr52_virt_realize(DeviceState *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ArmR52VirtState *s = ARMR52VIRT(dev);
+    uint8_t i;
+    int num_apus = MIN(ms->smp.cpus, ARMR52_VIRT_NUM_APU_CPUS);
+    const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
+    qemu_irq gic_spi[GIC_NUM_SPI_INTR];
+    Error *err = NULL;
+
+    memory_region_init_ram(&s->ddr_ram, NULL, "armr52virt.dram", 0x04000000,
+                           &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ddr_ram);
+
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", NUM_IRQS + 32);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 3);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
+    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", false);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "len-redist-region-count", 1);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "redist-region-count[0]", num_apus);
+
+    qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
+
+    for (i = 0; i < num_apus; i++) {
+        const char *name;
+
+        name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
+        if (strcmp(name, boot_cpu)) {
+            /*
+             * Secondary CPUs start in powered-down state.
+             */
+            object_property_set_bool(OBJECT(&s->apu_cpu[i]),
+                                     "start-powered-off", true, &error_abort);
+        } else {
+            s->boot_cpu_ptr = &s->apu_cpu[i];
+        }
+
+        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el3", s->secure,
+                                 NULL);
+        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el2", s->virt,
+                                 NULL);
+        object_property_set_int(OBJECT(&s->apu_cpu[i]), "core-count",
+                                num_apus, &error_abort);
+        if (!qdev_realize(DEVICE(&s->apu_cpu[i]), NULL, errp)) {
+            return;
+        }
+    }
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0, GIC_BASE_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1, GIC_REDIST_ADDR);
+
+    for (i = 0; i < num_apus; i++) {
+
+        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        int irq;
+        /*
+         * Mapping from the output timer irq lines from the CPU to the
+         * GIC PPI inputs we use for the virt board.
+         */
+        const int timer_irq[] = {
+            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+        };
+
+        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+            qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), irq,
+                                  qdev_get_gpio_in(DEVICE(&s->gic),
+                                                   ppibase + timer_irq[irq]));
+        }
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_IRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_FIQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 2,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_VIRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 3,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_VFIQ));
+    }
+
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (!s->boot_cpu_ptr) {
+        error_setg(errp, "Boot cpu %s not found", boot_cpu);
+        return;
+    }
+
+    for (i = 0; i < GIC_NUM_SPI_INTR; i++) {
+        gic_spi[i] = qdev_get_gpio_in(DEVICE(&s->gic), i);
+    }
+
+    for (i = 0; i < ARMR52_VIRT_NUM_UARTS; i++) {
+        qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, uart_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
+                           gic_spi[uart_intr[i]]);
+    }
+
+}
+
+static Property armr52_virt_props[] = {
+    DEFINE_PROP_STRING("boot-cpu", ArmR52VirtState, boot_cpu),
+    DEFINE_PROP_BOOL("secure", ArmR52VirtState, secure, false),
+    DEFINE_PROP_BOOL("virtualization", ArmR52VirtState, virt, false),
+};
+
+static void armr52_virt_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, armr52_virt_props);
+    dc->realize = armr52_virt_realize;
+}
+
+static const TypeInfo armr52_virt_type_info = {
+    .name = TYPE_ARMR52VIRT,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(ArmR52VirtState),
+    .instance_init = armr52_virt_init,
+    .class_init = armr52_virt_class_init,
+};
+
+static void armr52_virt_register_types(void)
+{
+    type_register_static(&armr52_virt_type_info);
+}
+
+type_init(armr52_virt_register_types)
diff --git a/include/hw/arm/r52_virt.h b/include/hw/arm/r52_virt.h
new file mode 100644
index 0000000000..0f26745535
--- /dev/null
+++ b/include/hw/arm/r52_virt.h
@@ -0,0 +1,61 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef ARMR52VIRT_H
+#define ARMR52VIRT_H
+
+#include "hw/arm/boot.h"
+#include "hw/intc/arm_gic.h"
+#include "hw/char/pl011.h"
+#include "include/exec/address-spaces.h"
+#include "hw/cpu/cluster.h"
+#include "target/arm/cpu.h"
+#include "qom/object.h"
+#include "hw/intc/arm_gicv3_common.h"
+
+#define TYPE_ARMR52VIRT "armr52virt"
+OBJECT_DECLARE_SIMPLE_TYPE(ArmR52VirtState, ARMR52VIRT)
+
+#define ARMR52_VIRT_NUM_APU_CPUS 4
+#define ARMR52_VIRT_NUM_UARTS 1
+#define ARMR52_VIRT_GIC_REGIONS 6
+
+#define ARCH_TIMER_VIRT_IRQ   11
+#define ARCH_TIMER_S_EL1_IRQ  13
+#define ARCH_TIMER_NS_EL1_IRQ 14
+#define ARCH_TIMER_NS_EL2_IRQ 10
+#define NUM_IRQS 256
+
+struct ArmR52VirtState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    CPUClusterState apu_cluster;
+    ARMCPU apu_cpu[ARMR52_VIRT_NUM_APU_CPUS];
+    GICv3State gic;
+
+    MemoryRegion ddr_ram;
+
+    PL011State uart[ARMR52_VIRT_NUM_UARTS];
+
+    char *boot_cpu;
+    ARMCPU *boot_cpu_ptr;
+
+    /* Has the ARM Security extensions?  */
+    bool secure;
+    /* Has the ARM Virtualization extensions?  */
+    bool virt;
+
+};
+
+#endif
-- 
2.25.1


