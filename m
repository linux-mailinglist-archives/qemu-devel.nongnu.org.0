Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4A6DC065
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:43:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWFi-0004VN-Ck; Sun, 09 Apr 2023 10:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWFg-0004R5-Pn
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:44 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWFe-0000pD-Vx
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1a52eca0bedso995005ad.2
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TV10GUJgvLw+0NT1d+ZJRTnL7NF0J6NHPX1SRHZb+IQ=;
 b=WDTtUp9DNJFzFpUoprt2fralYGLp4j0iVINN5P3jRpAvXPwmKBaWvEO7yhJKcsGGeU
 hoE3gYqKkGS4hDVAnDDQlBMUHRA3Wo7R+PaDTZcTZeOxItK47IKPwyU2OcU2fVJApmQP
 2Gd3X4UYnO5nETEQly+vph2WYkVn2xS/PArYkEcKJ0rS6soN7AyQA3/nQlritDBAZMHS
 NsV/pWe9/1GZLwrDi9dQhAONSXmtbAzIkz8UX92fx+njJn0sqZUOZgcER5nLy8YLv84u
 pcyzb/hfVKAI2wSRcahiOtJlip6daNICVsxCbBe7a1gp0thHn5xQe7H58aE3P9mCySjg
 957g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TV10GUJgvLw+0NT1d+ZJRTnL7NF0J6NHPX1SRHZb+IQ=;
 b=B4lfaIkSOEq9F6hSkAHTY46enolLxOj7yvP5skA3HkoXUMSSvHM4to4ZaH71Hu5zzM
 kur4VPNgzsUaAyVdR/qvRnYANYad7opH9zPtrv36G1ds/HX8CEu78sQnxT0K55qKOUY6
 Pet5F7Z3O9AQmBp/nKrZ7hK5OSRzV0LVrx38y/1z4Y6+UiIPBY5XFM/xkRvieFQqoFGi
 SY+Cc7spzBbJgrv1wuZ78qVzu9hGM+VSo+rWNau/UwnYcBpqKw17RKaelcr/3wPGAl7e
 RmOCEsR075OjupJl/1eyTWRxfMQDH29h4SdmI3Ker1KqE+7t61Ar3BZyTQSZOYqC6LNK
 YLnw==
X-Gm-Message-State: AAQBX9cTFqCsQdAkv++z0Q+8Atz71y/6AXpcV80nzS/CeSSpi6xLzClr
 0TT/SGN4NXofaWxGw4BuG45cgcWax3mqfQ==
X-Google-Smtp-Source: AKy350a4f4EPeTG+Z2uYXoYsdo+MkSMj03NWzynRN2bMvLxpnUUnEdE5oezAA5TB3zruCxp4CkXCig==
X-Received: by 2002:a62:5282:0:b0:5cd:d766:8a2b with SMTP id
 g124-20020a625282000000b005cdd7668a2bmr7933592pfb.6.1681051361284; 
 Sun, 09 Apr 2023 07:42:41 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020aa790c5000000b0062e00158bf3sm6369804pfk.175.2023.04.09.07.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 07:42:40 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v3 5/5] amd_iommu: report x2APIC support to the operating
 system
Date: Sun,  9 Apr 2023 21:41:56 +0700
Message-Id: <20230409144156.8313-5-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409144156.8313-1-minhquangbui99@gmail.com>
References: <20230409144156.8313-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit adds XTSup configuration to let user choose to whether enable
this feature or not. When XTSup is enabled, additional bytes in IRTE with
enabled guest virtual VAPIC are used to support 32-bit destination id.

Additionally, this commit changes to use IVHD type 0x11 in ACPI table for
feature report to operating system. This is because Linux does not use
XTSup in IOMMU Feature Reporting field of IVHD type 0x10 but only use XTSup
bit in EFR Register Image of IVHD 0x11 to indicate x2APIC support (see
init_iommu_one in linux/drivers/iommu/amd/init.c)

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/i386/acpi-build.c | 28 ++++++++++++++--------------
 hw/i386/amd_iommu.c  | 21 +++++++++++++++++++--
 hw/i386/amd_iommu.h  | 16 +++++++++++-----
 3 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ec857a117e..72d6bb2892 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2339,7 +2339,7 @@ static void
 build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                 const char *oem_table_id)
 {
-    int ivhd_table_len = 24;
+    int ivhd_table_len = 40;
     AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
     GArray *ivhd_blob = g_array_new(false, true, 1);
     AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
@@ -2349,18 +2349,19 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* IVinfo - IO virtualization information common to all
      * IOMMU units in a system
      */
-    build_append_int_noprefix(table_data, 40UL << 8/* PASize */, 4);
+    build_append_int_noprefix(table_data,
+                             (1UL << 0) | /* EFRSup */
+                             (40UL << 8), /* PASize */
+                             4);
     /* reserved */
     build_append_int_noprefix(table_data, 0, 8);
 
-    /* IVHD definition - type 10h */
-    build_append_int_noprefix(table_data, 0x10, 1);
+    /* IVHD definition - type 11h */
+    build_append_int_noprefix(table_data, 0x11, 1);
     /* virtualization flags */
     build_append_int_noprefix(table_data,
                              (1UL << 0) | /* HtTunEn      */
-                             (1UL << 4) | /* iotblSup     */
-                             (1UL << 6) | /* PrefSup      */
-                             (1UL << 7),  /* PPRSup       */
+                             (1UL << 4),  /* iotblSup     */
                              1);
 
     /*
@@ -2404,13 +2405,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     build_append_int_noprefix(table_data, 0, 2);
     /* IOMMU info */
     build_append_int_noprefix(table_data, 0, 2);
-    /* IOMMU Feature Reporting */
-    build_append_int_noprefix(table_data,
-                             (48UL << 30) | /* HATS   */
-                             (48UL << 28) | /* GATS   */
-                             (1UL << 2)   | /* GTSup  */
-                             (1UL << 6),    /* GASup  */
-                             4);
+    /* IOMMU Attributes */
+    build_append_int_noprefix(table_data, 0, 4);
+    /* EFR Register Image */
+    build_append_int_noprefix(table_data, s->efr_reg, 8);
+    /* EFR Register Image 2 */
+    build_append_int_noprefix(table_data, 0, 8);
 
     /* IVHD entries as found above */
     g_array_append_vals(table_data, ivhd_blob->data, ivhd_blob->len);
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index bcd016f5c5..5dfa93d945 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -31,6 +31,7 @@
 #include "hw/i386/apic_internal.h"
 #include "trace.h"
 #include "hw/i386/apic-msidef.h"
+#include "hw/qdev-properties.h"
 
 /* used AMD-Vi MMIO registers */
 const char *amdvi_mmio_low[] = {
@@ -1155,7 +1156,12 @@ static int amdvi_int_remap_ga(AMDVIState *iommu,
     irq->vector = irte.hi.fields.vector;
     irq->dest_mode = irte.lo.fields_remap.dm;
     irq->redir_hint = irte.lo.fields_remap.rq_eoi;
-    irq->dest = irte.lo.fields_remap.destination;
+    if (!iommu->xtsup) {
+        irq->dest = irte.lo.fields_remap.destination & 0xff;
+    } else {
+        irq->dest = irte.lo.fields_remap.destination |
+                    (irte.hi.fields.destination_hi << 24);
+    }
 
     return 0;
 }
@@ -1503,10 +1509,15 @@ static void amdvi_init(AMDVIState *s)
     s->enabled = false;
     s->ats_enabled = false;
     s->cmdbuf_enabled = false;
+    s->efr_reg = AMDVI_DEFAULT_EXT_FEATURES;
+
+    if (s->xtsup) {
+        s->efr_reg |= AMDVI_FEATURE_XT;
+    }
 
     /* reset MMIO */
     memset(s->mmior, 0, AMDVI_MMIO_SIZE);
-    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
+    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, s->efr_reg,
             0xffffffffffffffef, 0);
     amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
 
@@ -1586,6 +1597,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     amdvi_init(s);
 }
 
+static Property amdvi_properties[] = {
+    DEFINE_PROP_BOOL("xtsup", AMDVIState, xtsup, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static const VMStateDescription vmstate_amdvi_sysbus = {
     .name = "amd-iommu",
     .unmigratable = 1
@@ -1612,6 +1628,7 @@ static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = true;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
+    device_class_set_props(dc, amdvi_properties);
 }
 
 static const TypeInfo amdvi_sysbus = {
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 79d38a3e41..96df7b0400 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -154,6 +154,7 @@
 
 #define AMDVI_FEATURE_PREFETCH            (1ULL << 0) /* page prefetch       */
 #define AMDVI_FEATURE_PPR                 (1ULL << 1) /* PPR Support         */
+#define AMDVI_FEATURE_XT                  (1ULL << 2) /* x2APIC Support      */
 #define AMDVI_FEATURE_GT                  (1ULL << 4) /* Guest Translation   */
 #define AMDVI_FEATURE_IA                  (1ULL << 6) /* inval all support   */
 #define AMDVI_FEATURE_GA                  (1ULL << 7) /* guest VAPIC support */
@@ -173,8 +174,9 @@
 #define AMDVI_IOTLB_MAX_SIZE 1024
 #define AMDVI_DEVID_SHIFT    36
 
-/* extended feature support */
-#define AMDVI_EXT_FEATURES (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
+/* default extended feature */
+#define AMDVI_DEFAULT_EXT_FEATURES \
+        (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
         AMDVI_FEATURE_IA | AMDVI_FEATURE_GT | AMDVI_FEATURE_HE | \
         AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA)
 
@@ -278,8 +280,8 @@ union irte_ga_lo {
                 dm:1,
                 /* ------ */
                 guest_mode:1,
-                destination:8,
-                rsvd_1:48;
+                destination:24,
+                rsvd_1:32;
   } fields_remap;
 };
 
@@ -287,7 +289,8 @@ union irte_ga_hi {
   uint64_t val;
   struct {
       uint64_t  vector:8,
-                rsvd_2:56;
+                rsvd_2:48,
+                destination_hi:8;
   } fields;
 };
 
@@ -367,6 +370,9 @@ struct AMDVIState {
 
     /* Interrupt remapping */
     bool ga_enabled;
+    bool xtsup;
+
+    uint64_t efr_reg;            /* extended feature register */
 };
 
 #endif
-- 
2.25.1


