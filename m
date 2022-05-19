Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35E52DC1F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:58:33 +0200 (CEST)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkPx-0002uf-2E
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0006GT-R1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5B-0000rg-FY
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id ay35so1682651wmb.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ink3EUlj+IHswYWmgaoNyzz0JMC0TNUpAOCb6yjPLLQ=;
 b=WlPHi3kVQ41I992EmCQcFIeRQsO4NAU+MXxa01kEQfKEtI8Aoyy4rJx7Cb5Z0leVms
 7G7RziaeMigO+Jaies//FgmkDdFa0Iu40R6hdurBMXc3QNYwPwmAkVlO5SaNz5+ILRqW
 st1Iyk306ynlkVbhlc2Nv9WgRS0FrH9UEddFFnb4LoOot52Cl3cRmn6oolxP10kf25QV
 q+NTX/irTMhq/HDOxuPMiZLSLJTPvrr4XCX9vPWza29WCvh067DRXv34PLCJjNSN1ELC
 m+gxUlLn8w/82ePIuHI9bNnb6ykiS+rsaYN1EtM+74gGI9PH5SKBnWdT7BuavV6FM1Ms
 VPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ink3EUlj+IHswYWmgaoNyzz0JMC0TNUpAOCb6yjPLLQ=;
 b=LEAMOP6WQ0pd2B45RbgRZRCwiI9o/7Z4/61UE9AHjl3N+16se8A48dH1ZF+ruR7ElS
 +lv92tjaYuWfRJqjUyvYjWcCaKIKNKp7zvLzRyENsIVJYm6uBrhvQElB8AAFIgQPMu+H
 nZKrhjppQ0F9o+OiXpcymwYSX/YZ7Aa1p17rfZJ4+1uxay0TTyW01WqVBWMuuptBrFzh
 U9pvWMFlTRlgPBVi3UrLLBGBYZtiAlkpz8SRe0Lg8poRQhLRhZe6rf9X0cnx7ykrxsFd
 h8nj1X9Wl84bi1hGD6nzNyiO0syLhvgu8V1+Pe4FbMuczV6GnpNBaYDL7BVjEH/Xs0SV
 aTuw==
X-Gm-Message-State: AOAM533cYwQUT6D+DaiV00rIPvm8W+O+1iWSm7aA08FSr3XBq2bCAebN
 +90k6pCueobaMhOlFbQ+1Mf9If2t3i1JVg==
X-Google-Smtp-Source: ABdhPJxce6hfkQlJbNNrd9EK2rzZdu/CU+FvbdoR/XcooWO5VNmII98S1lZT750CierZEGjH3vsreQ==
X-Received: by 2002:a05:600c:2210:b0:393:ffb8:2985 with SMTP id
 z16-20020a05600c221000b00393ffb82985mr5273441wml.167.1652981823062; 
 Thu, 19 May 2022 10:37:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/22] hw/intc/arm_gicv3: Use correct number of priority bits
 for the CPU
Date: Thu, 19 May 2022 18:36:40 +0100
Message-Id: <20220519173651.399295-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Make the GICv3 set its number of bits of physical priority from the
implementation-specific value provided in the CPU state struct, in
the same way we already do for virtual priority bits.  Because this
would be a migration compatibility break, we provide a property
force-8-bit-prio which is enabled for 7.0 and earlier versioned board
models to retain the legacy "always use 8 bits" behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-6-peter.maydell@linaro.org
Message-id: 20220506162129.2896966-5-peter.maydell@linaro.org
---
 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/cpu.h                   |  1 +
 hw/core/machine.c                  |  4 +++-
 hw/intc/arm_gicv3_common.c         |  5 +++++
 hw/intc/arm_gicv3_cpuif.c          | 15 +++++++++++----
 target/arm/cpu64.c                 |  6 ++++++
 6 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 46677ec345c..ab5182a28a2 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -248,6 +248,7 @@ struct GICv3State {
     uint32_t revision;
     bool lpi_enable;
     bool security_extn;
+    bool force_8bit_prio;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a99b430e54e..a42464eb57a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1002,6 +1002,7 @@ struct ArchCPU {
     int gic_num_lrs; /* number of list registers */
     int gic_vpribits; /* number of virtual priority bits */
     int gic_vprebits; /* number of virtual preemption bits */
+    int gic_pribits; /* number of physical priority bits */
 
     /* Whether the cfgend input is high (i.e. this CPU should reset into
      * big-endian mode).  This setting isn't used directly: instead it modifies
diff --git a/hw/core/machine.c b/hw/core/machine.c
index b03d9192baf..bb0dc8f6a93 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,7 +41,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_0[] = {};
+GlobalProperty hw_compat_7_0[] = {
+    { "arm-gicv3-common", "force-8-bit-prio", "on" },
+};
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
 GlobalProperty hw_compat_6_2[] = {
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 5634c6fc788..351843db4aa 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -563,6 +563,11 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    /*
+     * Compatibility property: force 8 bits of physical priority, even
+     * if the CPU being emulated should have fewer.
+     */
+    DEFINE_PROP_BOOL("force-8-bit-prio", GICv3State, force_8bit_prio, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 69a15f7a444..66e06b787c7 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2798,6 +2798,7 @@ void gicv3_init_cpuif(GICv3State *s)
          *  cpu->gic_num_lrs
          *  cpu->gic_vpribits
          *  cpu->gic_vprebits
+         *  cpu->gic_pribits
          */
 
         /* Note that we can't just use the GICv3CPUState as an opaque pointer
@@ -2810,11 +2811,17 @@ void gicv3_init_cpuif(GICv3State *s)
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
         /*
-         * For the moment, retain the existing behaviour of 8 priority bits;
-         * in a following commit we will take this from the CPU state,
-         * as we do for the virtual priority bits.
+         * The CPU implementation specifies the number of supported
+         * bits of physical priority. For backwards compatibility
+         * of migration, we have a compat property that forces use
+         * of 8 priority bits regardless of what the CPU really has.
          */
-        cs->pribits = 8;
+        if (s->force_8bit_prio) {
+            cs->pribits = 8;
+        } else {
+            cs->pribits = cpu->gic_pribits ?: 5;
+        }
+
         /*
          * The GICv3 has separate ID register fields for virtual priority
          * and preemption bit values, but only a single ID register field
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 804a54922cb..7628f4fa39d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -87,6 +87,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -140,6 +141,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -191,6 +193,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -252,6 +255,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
     cpu->isar.mvfr0 = 0x10110222;
@@ -317,6 +321,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
     cpu->isar.mvfr0 = 0x10110222;
@@ -1008,6 +1013,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* Suppport of A64FX's vector length are 128,256 and 512bit only */
     aarch64_add_sve_properties(obj);
-- 
2.25.1


