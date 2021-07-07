Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240E3BE0D4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:22:40 +0200 (CEST)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xCx-0006NY-9b
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x9I-0000hn-D3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:52 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8r-0001Op-Da
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:52 -0400
Received: by mail-qv1-xf29.google.com with SMTP id w5so340101qvu.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQc7hngRcXAxMgbGTFQRDdYH/dKN+DPW0PpKb5MWZc4=;
 b=IbBB8Ofy0l/ZBWAjwXV0TYbXyq4Pcin6ZJ8vV6eacEFdE9aBn24LuPUTyGo+7XLH5P
 PzsAXHptHGd9HL5pikvio1zrFA8gBFxBCiDPybYX1NISvAxUw4uAe93cm7e/FmJ+KZzc
 vg229X29VWNQPeG9fz3wo3cNeZtK5znAkZ43UEpAgCNXimHASlA2xYJHrI79Vun/YEuq
 JKMwDguYolaBJDQYLCDJF2VwYtdkRvOh2u+tVjgkKDg1GpMc6ePXvafbvl3gi+BDQG8U
 LqBt6Fvp1uq5WiLkBdwYNS1j3COYSnYnFGF/yQmRowifzvzmBhenw12rxB8hlSQh1UI6
 HGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQc7hngRcXAxMgbGTFQRDdYH/dKN+DPW0PpKb5MWZc4=;
 b=ZMBCDZn3AbuJBbxFflJtOIa2gkX6i7rTWyDbgGYaycnFgiPEMf4cuZtf9qcVtk5A4W
 5N1PYlyELfAscL6yaZiuVZTPyDMoNuYa7jUOr9cq0DTm4rbxaeoTPpmU85Xmz0nWDuds
 lX1s4qGvJE8t7yS35iOdG3vEwvEpLYZ/zroLjg+JvA2mUA617cbVG+hQ7096pL3jPEJj
 LmsdGqErsWs1LdZTe2Ej/6KJ+uvE65PTxlFaAAMPWBzQFGEaV7Jeu7iGdkJQVHeNyQp2
 G/i/OnOYIKTQdfXsXMdmEgIkzo2Abp4lkKmD+XwiU/3WESaJtjjRCXgBWxCjN+G9N36C
 Vsdw==
X-Gm-Message-State: AOAM531n1RXbvDcLB69R21cxYxKvaXvSVmCqwcKNWaErBqsnfJQgQbQs
 ewwHHhGznmY5LN81VGXlYmmZ6g==
X-Google-Smtp-Source: ABdhPJz5KnJNR7Xey2Xh7PhOc5ZQgUPkuzJKTpjrl/OK/nQwjNCpawk142+nkwRSOCKEW1I3fMYe7Q==
X-Received: by 2002:a05:6214:2a4a:: with SMTP id
 jf10mr21601143qvb.13.1625624303509; 
 Tue, 06 Jul 2021 19:18:23 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:23 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 09/10] hw/arm/virt: add ITS support in virt GIC
Date: Tue,  6 Jul 2021 22:18:14 -0400
Message-Id: <20210707021815.45938-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Included creation of ITS as part of virt platform GIC
initialization. This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 28 ++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..1d8c44685c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -583,6 +583,12 @@ static void create_its(VirtMachineState *vms)
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
+    if (!strcmp(itsclass, "arm-gicv3-its")) {
+        if (!vms->tcg_its) {
+            itsclass = NULL;
+        }
+    }
+
     if (!itsclass) {
         /* Do nothing if not supported */
         return;
@@ -620,7 +626,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -654,6 +660,14 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            if (vms->tcg_its) {
+                object_property_set_link(OBJECT(vms->gic), "sysmem",
+                                         OBJECT(mem), &error_fatal);
+                qdev_prop_set_bit(vms->gic, "has-lpi", true);
+            }
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2053,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2720,6 +2734,12 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
+
+        if (vmc->no_tcg_its) {
+            vms->tcg_its = false;
+        } else {
+            vms->tcg_its = true;
+        }
     }
 
     /* Default disallows iommu instantiation */
@@ -2766,8 +2786,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_1_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    /* qemu ITS was introduced with 6.1 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE(6, 0)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..f873ab9068 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,6 +120,7 @@ struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
     bool no_its;
+    bool no_tcg_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
@@ -141,6 +142,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..0613454975 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
     } else {
-        /* Software emulation is not implemented yet */
-        return NULL;
+        /* Software emulation based model */
+        return "arm-gicv3-its";
     }
 }
 
-- 
2.27.0


