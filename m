Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729950B5E1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:06:08 +0200 (CEST)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhr71-0002Bt-70
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAI-0005Zs-Tb
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA6-0002sf-9U
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id k22so10331301wrd.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lqt/sr/PjNxjy/2aE/5Huf/D94yrcwPJG4y/I0I31vg=;
 b=wbQxBnFj//moBjII3HKwJ4wKRJ5ZjWfJYf5cuwSr/L6pLqXd61atVEuUoZG6NAjJTN
 2GTCukXWLC1vRmuPP5AGcqPR+CpbFSQLLlUHjN9Y5+LsT2e/zxjShdofaevBsSORWay7
 TS1W3jUKiQBGmSJK7CBVnh7+hGhT4lDiKuI0PvkPPOh+vGK/pgyLogwiQC0RdK3V9+JG
 +UG8EmA35dq6F3haJRVpF9zuZNKYDSt7MSvciblSuTW1O88SnWInyeUoN++nYF5cHkB0
 bnKcmoW9qrxUUZ8xiZ7udxT8lc5Guc1xuF48nf5fUh+A8GDKE9ukTtj8J0DuQCOTQyys
 FAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqt/sr/PjNxjy/2aE/5Huf/D94yrcwPJG4y/I0I31vg=;
 b=wT/s4r2eAxMxlWT7dl5VclWimulAYLPkk/k6JJ6Qh62UnhVQwTp/rdMqjy1+X9EqxZ
 bxcMmPkgNxDggzrcmVQP168M1mtttpdzkf3l7A0CF+fAmxZoCxqO0q58WnaT3855Bbp2
 4GbLU2ioLIfuwuIOFpp7dT17NAAc3kQMVIITbUjUoippiD2S8QjZvprWemwryoVfLQKP
 onOdEoax57kzjVOV7A6k350lXve9I7058P58QoZS29D81PZxzoqDa4YTAZPO1mP3gVvi
 0HmOdSfOL6zdLUKWpViHZOtQ7ZcW30Df8QmNJVmFlZmWHGckjR/aYGUb6RhhTuOA6ZJl
 Gckg==
X-Gm-Message-State: AOAM531O1R1Ddn5OGizNFjJsDJ1sbbZyt03lkPOudst14sGzuH9e8LEK
 p8wZXMPbgRqMMYQDTO0cUIH29BJb2XK1OA==
X-Google-Smtp-Source: ABdhPJzEIgQNJNuJmO3aQcvuH6CuhhIyBG9AK/m13y6DdY52/7UHpldOG+diQW3TSLTcZ/iNkW1tdg==
X-Received: by 2002:a05:6000:18d:b0:20a:9e33:8e64 with SMTP id
 p13-20020a056000018d00b0020a9e338e64mr3042851wrx.123.1650621912669; 
 Fri, 22 Apr 2022 03:05:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/61] hw/arm/virt: Support TCG GICv4
Date: Fri, 22 Apr 2022 11:04:12 +0100
Message-Id: <20220422100432.2288247-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Add support for the TCG GICv4 to the virt board. For the board,
the GICv4 is very similar to the GICv3, with the only difference
being the size of the redistributor frame. The changes here are thus:
 * calculating virt_redist_capacity correctly for GICv4
 * changing various places which were "if GICv3" to be "if not GICv2"
 * the commandline option handling

Note that using GICv4 reduces the maximum possible number of CPUs on
the virt board from 512 to 317, because we can now only fit half as
many redistributors into the redistributor regions we have defined.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-42-peter.maydell@linaro.org
---
 docs/system/arm/virt.rst |  5 ++-
 include/hw/arm/virt.h    | 12 +++++--
 hw/arm/virt.c            | 70 ++++++++++++++++++++++++++++++----------
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1297dff5228..5fe045cbf06 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -99,11 +99,14 @@ gic-version
     GICv2. Note that this limits the number of CPUs to 8.
   ``3``
     GICv3. This allows up to 512 CPUs.
+  ``4``
+    GICv4. Requires ``virtualization`` to be ``on``; allows up to 317 CPUs.
   ``host``
     Use the same GIC version the host provides, when using KVM
   ``max``
     Use the best GIC version possible (same as host when using KVM;
-    currently same as ``3``` for TCG, but this may change in future)
+    with TCG this is currently ``3`` if ``virtualization`` is ``off`` and
+    ``4`` if ``virtualization`` is ``on``, but this may change in future)
 
 its
   Set ``on``/``off`` to enable/disable ITS instantiation. The default is ``on``
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 360463e6bfb..15feabac63d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -113,6 +113,7 @@ typedef enum VirtGICType {
     VIRT_GIC_VERSION_HOST,
     VIRT_GIC_VERSION_2,
     VIRT_GIC_VERSION_3,
+    VIRT_GIC_VERSION_4,
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
@@ -188,7 +189,14 @@ bool virt_is_acpi_enabled(VirtMachineState *vms);
 /* Return number of redistributors that fit in the specified region */
 static uint32_t virt_redist_capacity(VirtMachineState *vms, int region)
 {
-    return vms->memmap[region].size / GICV3_REDIST_SIZE;
+    uint32_t redist_size;
+
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+        redist_size = GICV3_REDIST_SIZE;
+    } else {
+        redist_size = GICV4_REDIST_SIZE;
+    }
+    return vms->memmap[region].size / redist_size;
 }
 
 /* Return the number of used redistributor regions  */
@@ -196,7 +204,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 {
     uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
 
-    assert(vms->gic_version == VIRT_GIC_VERSION_3);
+    assert(vms->gic_version != VIRT_GIC_VERSION_2);
 
     return (MACHINE(vms)->smp.cpus > redist0_capacity &&
             vms->highmem_redists) ? 2 : 1;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1227c64e5b1..5bdd98e4a1f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -522,7 +522,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 0x2);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 0x2);
     qemu_fdt_setprop(ms->fdt, nodename, "ranges", NULL, 0);
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         int nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
         qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
@@ -708,6 +708,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     case VIRT_GIC_VERSION_3:
         revision = 3;
         break;
+    case VIRT_GIC_VERSION_4:
+        revision = 4;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -722,7 +725,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
     }
 
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
 
@@ -756,7 +759,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
         if (nb_redist_regions == 2) {
             sysbus_mmio_map(gicbusdev, 2,
@@ -794,7 +797,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                    ppibase + timer_irq[irq]));
         }
 
-        if (vms->gic_version == VIRT_GIC_VERSION_3) {
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             ppibase + ARCH_GIC_MAINT_IRQ);
             qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
@@ -820,7 +823,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     fdt_add_gic_node(vms);
 
-    if (vms->gic_version == VIRT_GIC_VERSION_3 && vms->its) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
         create_its(vms);
     } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
         create_v2m(vms);
@@ -1672,10 +1675,10 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
          * purposes are to make TCG consistent (with 64-bit KVM hosts)
          * and to improve SGI efficiency.
          */
-        if (vms->gic_version == VIRT_GIC_VERSION_3) {
-            clustersz = GICV3_TARGETLIST_BITS;
-        } else {
+        if (vms->gic_version == VIRT_GIC_VERSION_2) {
             clustersz = GIC_TARGETLIST_BITS;
+        } else {
+            clustersz = GICV3_TARGETLIST_BITS;
         }
     }
     return arm_cpu_mp_affinity(idx, clustersz);
@@ -1808,6 +1811,10 @@ static void finalize_gic_version(VirtMachineState *vms)
                 error_report(
                     "gic-version=3 is not supported with kernel-irqchip=off");
                 exit(1);
+            case VIRT_GIC_VERSION_4:
+                error_report(
+                    "gic-version=4 is not supported with kernel-irqchip=off");
+                exit(1);
             }
         }
 
@@ -1845,6 +1852,9 @@ static void finalize_gic_version(VirtMachineState *vms)
         case VIRT_GIC_VERSION_2:
         case VIRT_GIC_VERSION_3:
             break;
+        case VIRT_GIC_VERSION_4:
+            error_report("gic-version=4 is not supported with KVM");
+            exit(1);
         }
 
         /* Check chosen version is effectively supported by the host */
@@ -1868,7 +1878,12 @@ static void finalize_gic_version(VirtMachineState *vms)
     case VIRT_GIC_VERSION_MAX:
         if (module_object_class_by_name("arm-gicv3")) {
             /* CONFIG_ARM_GICV3_TCG was set */
-            vms->gic_version = VIRT_GIC_VERSION_3;
+            if (vms->virt) {
+                /* GICv4 only makes sense if CPU has EL2 */
+                vms->gic_version = VIRT_GIC_VERSION_4;
+            } else {
+                vms->gic_version = VIRT_GIC_VERSION_3;
+            }
         } else {
             vms->gic_version = VIRT_GIC_VERSION_2;
         }
@@ -1876,6 +1891,12 @@ static void finalize_gic_version(VirtMachineState *vms)
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
         exit(1);
+    case VIRT_GIC_VERSION_4:
+        if (!vms->virt) {
+            error_report("gic-version=4 requires virtualization enabled");
+            exit(1);
+        }
+        break;
     case VIRT_GIC_VERSION_2:
     case VIRT_GIC_VERSION_3:
         break;
@@ -2043,14 +2064,16 @@ static void machvirt_init(MachineState *machine)
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }
 
-    /* The maximum number of CPUs depends on the GIC version, or on how
-     * many redistributors we can fit into the memory map.
+    /*
+     * The maximum number of CPUs depends on the GIC version, or on how
+     * many redistributors we can fit into the memory map (which in turn
+     * depends on whether this is a GICv3 or v4).
      */
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        virt_max_cpus = GIC_NCPU;
+    } else {
         virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
             virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
-    } else {
-        virt_max_cpus = GIC_NCPU;
     }
 
     if (max_cpus > virt_max_cpus) {
@@ -2438,8 +2461,19 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
-    const char *val = vms->gic_version == VIRT_GIC_VERSION_3 ? "3" : "2";
+    const char *val;
 
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_4:
+        val = "4";
+        break;
+    case VIRT_GIC_VERSION_3:
+        val = "3";
+        break;
+    default:
+        val = "2";
+        break;
+    }
     return g_strdup(val);
 }
 
@@ -2447,7 +2481,9 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    if (!strcmp(value, "3")) {
+    if (!strcmp(value, "4")) {
+        vms->gic_version = VIRT_GIC_VERSION_4;
+    } else if (!strcmp(value, "3")) {
         vms->gic_version = VIRT_GIC_VERSION_3;
     } else if (!strcmp(value, "2")) {
         vms->gic_version = VIRT_GIC_VERSION_2;
@@ -2905,7 +2941,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
                                           "Set GIC version. "
-                                          "Valid values are 2, 3, host and max");
+                                          "Valid values are 2, 3, 4, host and max");
 
     object_class_property_add_str(oc, "iommu", virt_get_iommu, virt_set_iommu);
     object_class_property_set_description(oc, "iommu",
-- 
2.25.1


