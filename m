Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A250B55D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:40:01 +0200 (CEST)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqhk-0008Eu-59
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA6-00052z-Em
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA4-0002sM-RJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so5090810wms.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dD0gXSrq4cJBnHFPk7NEn42McsBj8OdsQUpLVwThouk=;
 b=QbSVKU/4WObnW0UWA/uBBMRWjKeeJxeENJOy9OkRDkxrg8I2zZWSeks14ajMpoNWKP
 HbHEtgGjfkKNsl5PQQKeqXCzPGGtuLxXNYiBEh70b/GQwfXRFTDRylQSa8O3/wfF5VmZ
 uUK7qdYOaFoXoxCBXtyaOVKDQQE0UryRonII/eZrn6UoH3b/h0apz2eleimS0CmFhpJX
 Vq96P+Eg0MXLEZ5FqPEHCXvHCn1wLjVM4+6nxNjtrcKCqrD3YftJsnTXy+YkZk9y7KH7
 7LR1xRCgXCvf85/C3j3I2hodjPhlXCXoYibbA6e4+5aQSt5ocNY/9aDgotgVuMcT0Qh0
 lSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dD0gXSrq4cJBnHFPk7NEn42McsBj8OdsQUpLVwThouk=;
 b=bs8MKNO5n0b2ls0Lth05V2C1itLgFgabxRTIKDsjKnfxhfYRYZKiiy+rYFonMyBL16
 JSa/zP2QVLVxkrZgF32qmyTl9noAdfd0tlCEIb5ETvUq0HNcfNr9ti6CVLSdiS+KlRLP
 W/NtryN1DvEve0NTPKMpQPoaVtYDCVJUwqDg3e6yXNt7iZhkFz/cyqjOHL6pW8jzWNbs
 6DxmSVUOsXOw2a1vCmCZ6Jf2KeAS3WQ+uuaVSpjm1kyMqMAJgC6DVrOfloQtU1n2EyYT
 7bPXd4t1ZOoHXkwN5K20B0bq2TOCC5TahLiITGlSEhPZ3N7I03rFrpcpTBnqSHzHworC
 oWUw==
X-Gm-Message-State: AOAM532c23h0OYt/Mm9Z83v0K4vDzwAV3zjErjapspBfqWZmAhhrnQBG
 XFZrVSRaPGhtYWa/w5kDGldHoMhbGEIF1g==
X-Google-Smtp-Source: ABdhPJyunnCxfHrLSMsFzMCGQksjyHmd/sX2Oh4dxElntGdSurRrjPA2HzBOsBFQs85HEMzLWQeK+g==
X-Received: by 2002:a05:600c:4e12:b0:391:18da:1883 with SMTP id
 b18-20020a05600c4e1200b0039118da1883mr3443054wmq.101.1650621911529; 
 Fri, 22 Apr 2022 03:05:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/61] hw/arm/virt: Abstract out calculation of redistributor
 region capacity
Date: Fri, 22 Apr 2022 11:04:11 +0100
Message-Id: <20220422100432.2288247-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

In several places in virt.c we calculate the number of redistributors that
fit in a region of our memory map, which is the size of the region
divided by the size of a single redistributor frame. For GICv4, the
redistributor frame is a different size from that for GICv3. Abstract
out the calculation of redistributor region capacity so that we have
one place we need to change to handle GICv4 rather than several.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-41-peter.maydell@linaro.org
---
 include/hw/arm/virt.h |  9 +++++++--
 hw/arm/virt.c         | 11 ++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 7e76ee26198..360463e6bfb 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -185,11 +185,16 @@ OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
 
+/* Return number of redistributors that fit in the specified region */
+static uint32_t virt_redist_capacity(VirtMachineState *vms, int region)
+{
+    return vms->memmap[region].size / GICV3_REDIST_SIZE;
+}
+
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 {
-    uint32_t redist0_capacity =
-                vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+    uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
 
     assert(vms->gic_version == VIRT_GIC_VERSION_3);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d5f8b0c74ad..1227c64e5b1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -723,8 +723,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
 
     if (vms->gic_version == VIRT_GIC_VERSION_3) {
-        uint32_t redist0_capacity =
-                    vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
@@ -743,7 +742,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
-                    vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
+                virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
@@ -2048,10 +2047,8 @@ static void machvirt_init(MachineState *machine)
      * many redistributors we can fit into the memory map.
      */
     if (vms->gic_version == VIRT_GIC_VERSION_3) {
-        virt_max_cpus =
-            vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
-        virt_max_cpus +=
-            vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
+            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
     } else {
         virt_max_cpus = GIC_NCPU;
     }
-- 
2.25.1


