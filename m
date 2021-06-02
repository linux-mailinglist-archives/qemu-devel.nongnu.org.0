Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C392239923E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:10:49 +0200 (CEST)
Received: from localhost ([::1]:38476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVKK-0000oc-Qa
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAq-0008Uh-Gy
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:01:00 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAi-0006eb-F4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:01:00 -0400
Received: by mail-qk1-x735.google.com with SMTP id 76so3226994qkn.13
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vrWwFy10Zdnfu5WX/uUYQ0OSYmANPgzkaZTtR8NbMU=;
 b=B+IwyyBe366B/Rc/89MONYd7AYRGK+fQkTEG/9Z4EOnViVeM0bkdkLXUx6Vnl2cvQW
 ho/+ZdcR1ZD8FlcthZXIjzf9gXLOWQWPBDJn/US37tTjYR/89rlbTlMSDyeqUDcMLoX3
 MtmfsJ+2QQ5dLVlCCpFE6vXD2vNuJEDXb5UagL3oUqs0s8JMzKejorTMf42EWqM970uG
 Qsn9pTIMYFsiOLAy8KKuFqB4nFDM7uo21dUV/ZDfHbuCKgF6cWx6Kv2btQdJFu/C9jmb
 X5/XUpXKtCsuw7B8ep/q/Gs70IszEOV4FLJAHIvjj1cPwyIOYWabUGOaFyARz/Ae9Bu3
 8EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2vrWwFy10Zdnfu5WX/uUYQ0OSYmANPgzkaZTtR8NbMU=;
 b=QGDLFq007Fl/igt4FJz+xJCHBliM/va7cQUCjFbrUzqwEMhtmHspz8KQjMkfQLbsYO
 4iu8mK1xEM+q/OhEtScAXFy3sX/kRvYRGZeLOuaePh0YgtW3vuySoM5TTg1zYu0Osy/z
 nmz/g4q2VgklrUv2Epm4KwCqFQCWG0aphLmoMwB3KOnglASD6CzF3mgQ7R7gnM7QPAXg
 PBuQSSynOiYZQikWWOAf/DYvlEH3sdtIpWFlNeT3zoIWiOAI4DGEPUYT2KXOM3RKZ+a4
 w2Fv+d8g7VbNUjXb6f8fc7czHJX8An2Xp0XZ9F7rbs41VZgafpJM75g2iYSbJAJpKPyP
 IUrg==
X-Gm-Message-State: AOAM53277TxqMBhjdDCHX3t1K8qBm+wBHvdcvoJUfzZZLy5M68b5aJFm
 yg5fWYJaun22wrtdqtpaf0UOYA==
X-Google-Smtp-Source: ABdhPJwPX59ZaS/z1h/IXEgOqUwpUQvTnPR5kPR5vFB0hwJbM2+KQDTIoN8hql4dRMK/xp6q3NMWcQ==
X-Received: by 2002:a05:620a:15f7:: with SMTP id
 p23mr28147906qkm.178.1622656851679; 
 Wed, 02 Jun 2021 11:00:51 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:51 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 8/8] hw/arm/virt: add ITS support in virt GIC
Date: Wed,  2 Jun 2021 14:00:42 -0400
Message-Id: <20210602180042.111347-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of virt platform GIC
initialization.This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/virt.c         | 27 +++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..f598f048da 100644
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
 
@@ -2718,6 +2732,12 @@ static void virt_instance_init(Object *obj)
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
@@ -2764,6 +2784,9 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
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


