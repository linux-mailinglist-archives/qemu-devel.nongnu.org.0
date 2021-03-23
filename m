Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904453456AC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:21:01 +0100 (CET)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYXM-0001tl-KP
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPq-0000qp-0T
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:18 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPP-0006dT-V4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:13 -0400
Received: by mail-qk1-x730.google.com with SMTP id x14so13104009qki.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=eOennnAjZl/gXsvTkXxNaPZN2Um9rfxdNAvoYx0ZQbNmML1VizMxrjN0w7CWJNVgYM
 ea5P/zzYh0igaEngwWO1uMHW4um4uqAVMMfwyKSRwoASUDPSH5xGsRTxHIm0QcqMqOSZ
 xAQXPUrGWtpS5MWf8w1T/XZmq2eu/AzS6t8h0X0YKwOILJh3+DseGFGgCFNw37x1fGbz
 g36kjiDLVCG5Mu4AQ8iRkjk93MCOl07zlrnMYud3M2JwRAQ/hskQdOQ1IveXeyYXL38k
 hqDJK3kjizWYt9vuJLcmKtD2UCdtZ83/mTA/V0/IhRH8Y863qE6QuQVR6DjLTVa+IfL8
 UMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=T81S7v4uu3s5oqL4mEugg1baNBr7phBvRIAJh2KXuwhocIKSLbdFO9k56FqrOOA5ZX
 1bg/fNpwSKxqyyQPpxpL+yqxtObc3p+8DTNE4a3PRzieHPGtgU/WRyTjW59KrCUTWMo2
 rO5t8b0oJhq9RYDm2eOP4+uEIL3hg/z438nOjU3zdgTQRWDSIAM3N2iC+1iN5Z/WQt7i
 jXUPVcxL054IemtWp5BWeCnwVhHM/aPwd7JlGGtrLPYY48FhOArRK/YgWxsIrbF9lpG8
 13PyZKpci278Bso+abyOTN2E5h2Xqe6IK+4jehI0EGmELdIYuhR+SUxav3WoW7rr7m4S
 4xmw==
X-Gm-Message-State: AOAM530gplFkfT6rEvLGvxtsjDC5/BeuLO49xJBEQTT5YVqd0EjYj8P6
 keJbgD6kcqJyM2xfJX3J8/Pa9A==
X-Google-Smtp-Source: ABdhPJzUtBWvfcsxmg8AEDrqly4wvLjxsuLGjLWOlXr0JhRrXWop/37lf+8LvoE24EteudW+q/UbUg==
X-Received: by 2002:a05:620a:20db:: with SMTP id
 f27mr3685575qka.51.1616472765872; 
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 8/8] hw/arm/virt: add ITS support in virt GIC
Date: Tue, 23 Mar 2021 00:12:38 -0400
Message-Id: <20210323041238.133835-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of virt platform GIC
initialization.This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/virt.c        | 10 ++++++++--
 target/arm/kvm_arm.h |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..77cf2db90f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
+                                     &error_fatal);
+            qdev_prop_set_bit(vms->gic, "has-lpi", true);
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
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


