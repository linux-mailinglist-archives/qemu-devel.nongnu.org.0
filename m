Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1E3E1EC2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:32:59 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlv7-0004DA-Ri
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsT-0007wd-SB
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:13 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsP-0005uq-Pq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:13 -0400
Received: by mail-qv1-xf35.google.com with SMTP id 3so3842443qvd.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vRtkRSWJCX6tGhWs/vBYUaAykj6RF3z+5UwVziTK5vE=;
 b=dGFeWteIqlYhPbi2Oa64GjfZupGxMJbO34Dc5cYIbdVqDJg2CTtDfFVodE1kTcIrrS
 pbhwrgDm6yJerdZ+A1i5ARN6r5FuCpa3/RYssoS8WumKlko0NlclPvtrBYLqwkXB18Qg
 XYvuEN5MEZGoRjg3deR76QYj2KIMfN8KvYOxYoQsSy3HjKAuUsyrEYMDiYcUZ74H006E
 v3obbaCkS5wLH+t67tft3StNX5bY+HvQo4h581AEnQ8sSn4cycX4CUGk3gXOHVAC/D1y
 k6dTYLPxk5+i8Q3kHic2NxOKOF4asroJpo9amVmxIkBBXXvOisPDE/YQRS/+3ocmL1XQ
 AAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRtkRSWJCX6tGhWs/vBYUaAykj6RF3z+5UwVziTK5vE=;
 b=a1qS1QBTWlc/+JHllO97MPWZCX55C6cigtw26F/ep4teK761pvo9H6TTGKAg+arELW
 cLcrjh5kKNm4XhLJPoxsIBbBxh5O0IVwKs3YVvifgafJwj5XlRIR/h9h+PdW71BxYfNy
 4YZqwFq6KyHXpwj4fRnnh71hBXy/T89ntGlFr0pWWQloQ2MsYdONM7+H/Zrc34TpC5Fp
 Y9HZNUJNyGbg3aYzZko5RP0wYFp8JuaTZ0hx+G/myufmOk6FuOJxjyDQx0jKhT1ryuvB
 bJ5LRgKb1Y9A7heiQ5yDx+ODppATgMVU/n3H6nM3bSMSOyfO/ZsG+rPJF6G/vpHXnwWu
 Kf8g==
X-Gm-Message-State: AOAM5329uxB+xP+lSjCgpTr43o249XNuVivKrTNc4IzmFywAo/SAajqe
 H06QdvClJV62k3jPvBjLwu8TqA==
X-Google-Smtp-Source: ABdhPJymsBv6Ivrq72VwSEzM9R9XIRA7fVHZen5GogGFFpCr7r2JHW/qJCaQwsF9DcHQtXf6DS1AkA==
X-Received: by 2002:a0c:e6cc:: with SMTP id l12mr8019920qvn.48.1628202608706; 
 Thu, 05 Aug 2021 15:30:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id d28sm3655195qkj.25.2021.08.05.15.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:30:08 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v7 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Thu,  5 Aug 2021 18:29:59 -0400
Message-Id: <20210805223002.144855-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805223002.144855-1-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 79 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c1629df603..feadae2f33 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -34,7 +34,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -58,12 +58,26 @@
 #define ARCH_TIMER_NS_EL1_IRQ  14
 #define ARCH_TIMER_NS_EL2_IRQ  10
 
+/*
+ * Enumeration of the possible values of sbsa-ref version
+ * property. These are arbitrary QEMU-internal values.
+ * values are :-
+ * DEFAULT = without ITS memory map
+ * SBSA_GIC_ITS = with ITS memory map between distributor & redistributor
+ *                regions. This is the current version supported.
+ */
+typedef enum SbsaRefVersion {
+    SBSA_DEFAULT,
+    SBSA_ITS,
+} SbsaRefVersion;
+
 enum {
     SBSA_FLASH,
     SBSA_MEM,
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -91,6 +105,7 @@ struct SBSAMachineState {
     void *fdt;
     int fdt_size;
     int psci_conduit;
+    SbsaRefVersion version;
     DeviceState *gic;
     PFlashCFI01 *flash[2];
 };
@@ -105,8 +120,11 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_SECURE_MEM] =         { 0x20000000, 0x20000000 },
     /* Space reserved for CPU peripheral devices */
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
+    /* GIC components reserved space Start */
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
-    [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x40070000, 0x00020000 },
+    [SBSA_GIC_REDIST] =         { 0x400B0000, 0x04000000 },
+    /* GIC components reserved space End */
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -377,7 +395,20 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
 
-static void create_gic(SBSAMachineState *sms)
+static void create_its(SBSAMachineState *sms)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_ARM_GICV3_ITS);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
+                             &error_abort);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
+}
+
+static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
 {
     unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
     SysBusDevice *gicbusdev;
@@ -404,6 +435,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -450,6 +485,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -755,7 +791,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
@@ -825,10 +861,39 @@ sbsa_ref_get_default_cpu_node_id(const MachineState *ms, int idx)
     return idx % ms->numa_state->num_nodes;
 }
 
+static char *sbsa_get_version(Object *obj, Error **errp)
+{
+    SBSAMachineState *sms = SBSA_MACHINE(obj);
+
+    switch (sms->version) {
+    case SBSA_DEFAULT:
+        return g_strdup("default");
+    case SBSA_ITS:
+        return g_strdup("sbsaits");
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void sbsa_set_version(Object *obj, const char *value, Error **errp)
+{
+    SBSAMachineState *sms = SBSA_MACHINE(obj);
+
+    if (!strcmp(value, "sbsaits")) {
+        sms->version = SBSA_ITS;
+    } else if (!strcmp(value, "default")) {
+        sms->version = SBSA_DEFAULT;
+    } else {
+        error_setg(errp, "Invalid version value");
+        error_append_hint(errp, "Valid values are default, sbsaits.\n");
+    }
+}
+
 static void sbsa_ref_instance_init(Object *obj)
 {
     SBSAMachineState *sms = SBSA_MACHINE(obj);
 
+    sms->version = SBSA_ITS;
     sbsa_flash_create(sms);
 }
 
@@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+
+    object_class_property_add_str(oc, "version", sbsa_get_version,
+                                  sbsa_set_version);
+    object_class_property_set_description(oc, "version",
+                                          "Set the Version type. "
+                                          "Valid values are default & sbsaits");
 }
 
 static const TypeInfo sbsa_ref_info = {
-- 
2.27.0


