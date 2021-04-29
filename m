Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E636F30A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:45:35 +0200 (CEST)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGLe-00084d-40
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIX-0005pd-Sd
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:21 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIL-0004MW-VR
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:21 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id i8so3842384qvv.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UTAYC9YHrSEbDFSe6lxPb7py8IaF444GqOZV20U4CZQ=;
 b=oLarpQb9tox4hKeBbb9E0zbKtxrysFQap1ntRlccMKNwMYOvM93iUy7vr7dyKHVyia
 xDedQaZN0/ige5ptgOW3vxRigsjWdfQmW1v15N14GOjZZQoq220+z/ch6mms/YbFPNYO
 NhcFxcqVBNmTxqQkp5OPzmQkZx/gH1axrA2mT/On9J2EENGjS6ND12MC77rV1dLW9XEY
 o+nx9+OM3g3Y2eIUmhGdor8X8YermBmg+p5aBnL334NTnedUPXrQ0MzdIbtJdvk1ILYG
 jV9spxI/3l6o28Q2tEh1m/MFtXLFy2xkiURuXN+4LnQYF3rYu13zZ/lBCEKTF/fUbyVw
 Xfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTAYC9YHrSEbDFSe6lxPb7py8IaF444GqOZV20U4CZQ=;
 b=CgVnan4UOxo8oXjMw5SjIMoDm3qmwyBr5LUkoC7qSMt/cOg2quuJhj3RZcCPgoswxN
 a9dmlmkNzxdQLhcmJGF5ydoDjPVYKEsqFYTiy3Yb/Bwn69bGB0qvMIb4VYhKyqtfVxYL
 HCH4XLM8wbL2g5PCYjIJSgho5ZQC+V9AK+Q/P1mB9kwrpKvJzr+MiBoVwzJfmJunN7/V
 f/9MdEHpiynvNygew0YPgCNowG0A6ehngbWfN5a4A4kSqJGLTkhGjoNhKCuDW9mGlslC
 ezchl3y8ibZ5HN8MEQlZzVB2JHGosjDO2Aj7fByjBY4IedwhIZPIubh1Hig6a8tngsZG
 dUww==
X-Gm-Message-State: AOAM532788p1dr/OQLHUT1qyFKQtUftMvAGPqJap+FhViwbDt5LMnxs7
 taChx7vo1VeuXtIALX+yA1K/cw==
X-Google-Smtp-Source: ABdhPJw8VO6AIIbdDvOr3T4P9sT3cP+3wTdJ2ZBFdpJlMM7g3NWrRggpf/lgtI9s2dwRNOASQqbc6w==
X-Received: by 2002:a05:6214:178b:: with SMTP id
 ct11mr2488967qvb.37.1619739727814; 
 Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 8/8] hw/arm/virt: add ITS support in virt GIC
Date: Thu, 29 Apr 2021 19:42:01 -0400
Message-Id: <20210429234201.125565-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2b.google.com
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
index 9f01d9041b..8f581747bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -585,6 +585,12 @@ static void create_its(VirtMachineState *vms)
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
@@ -622,7 +628,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -656,6 +662,14 @@ static void create_gic(VirtMachineState *vms)
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
@@ -2759,6 +2779,9 @@ type_init(machvirt_machine_init);
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+    /* qemu ITS was introduced with 6.1 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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


