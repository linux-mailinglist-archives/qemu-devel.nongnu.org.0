Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073896117E1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:46:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSq-0002bT-AN; Fri, 28 Oct 2022 12:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSO-0006FY-Uh; Fri, 28 Oct 2022 12:43:48 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSN-0000tc-5X; Fri, 28 Oct 2022 12:43:44 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 cb2-20020a056830618200b00661b6e5dcd8so3272688otb.8; 
 Fri, 28 Oct 2022 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evlax0p3TcYJJqvjtjF1ip1im+iTgPSrlTOpG4sIak4=;
 b=DdFQ2Cpj+TR2CTt/B1uBoiRWlX3DR2lj57QWY3cot/Bv/+Doz+KilU5BXXg1FXx6cI
 21E3vjD2/9fiqZacYL8tVkTEuDdtEL/2xi04zXclXBFCt6iLyFgtsHlyC23ER981ZUhN
 mBwyv1OO8AhaoOVi1oZnh35ZE0qJM0lLsXCyhNtLUugiWNait4zmLom4ynwEoihWIdtc
 chR5lcSJQTAYVIlOBSq1wrMJBHKBxxe//cLigJMmROA9A8XOWn2z2AVSGzMcNyKqcECo
 EoG09/P799Vq7xuwMUrTbZUPdQWcHd9mTuSULIKDqwy9WxND1uRC+WZe95IZVArb8wS2
 9WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evlax0p3TcYJJqvjtjF1ip1im+iTgPSrlTOpG4sIak4=;
 b=Ixku0MbYNVT2m3OriUvkDTVIRZ4nWOVRIKIkX/UAYPjViLW1UqBbCcpTpXLNzj+6M/
 Yq/vQNDYIE69SM/KF7h9PiBftI36fGiUeVb44mkWLI9PwtqidFQPuGlT8dgKG921WSIh
 CEf3xRrdMahe2QrP2fiSkRnqG/sWZjgfILV82t+WHt8/lCpY62n/mPVNu5S3Dn1ENSvp
 VGrIIE2IecMgWeFg/oOkpx//QbzFaDd2AvA0vYLH813sOzhmpx9617l6R6854+VzBEod
 w4sDsMsRMB/IGnwuou9ibtGZqWhj2m3IUZT7AEm0l4kG2aKdIsd9IJ3/vOrPw+24ukha
 5FuQ==
X-Gm-Message-State: ACrzQf3yYojLIyILZZL1ElJfivShWMAaKAUUbf5bLayIY7s2JQohk+0f
 NFT4WhAwudwmOtgw927IeW1EKkIwvVLk5A==
X-Google-Smtp-Source: AMsMyM75BLmZT0eLkrby7HxCQ7lVBCgaMEvRz39tEOVuVsot2Vel2pIXcP3TPwnMoqKFNZym7EHtSw==
X-Received: by 2002:a05:6830:148a:b0:661:94cb:32b1 with SMTP id
 s10-20020a056830148a00b0066194cb32b1mr125078otq.174.1666975420986; 
 Fri, 28 Oct 2022 09:43:40 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 50/62] ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
Date: Fri, 28 Oct 2022 13:39:39 -0300
Message-Id: <20221028163951.810456-51-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

This function is only used by the ppc4xx memory controller models so
it can be made static.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <b1504a82157a586aa284e8ee3b427b9a07b24169.1666194485.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_devs.c    | 62 -----------------------------------------
 hw/ppc/ppc4xx_sdram.c   | 61 ++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 20 ++++++-------
 3 files changed, 69 insertions(+), 74 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f737dbb3d6..c1d111465d 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -23,73 +23,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "cpu.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
-/*
- * Split RAM between SDRAM banks.
- *
- * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
- * and must be 0-terminated.
- *
- * The 4xx SDRAM controller supports a small number of banks, and each bank
- * must be one of a small set of sizes. The number of banks and the supported
- * sizes varies by SoC.
- */
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[])
-{
-    ram_addr_t size_left = memory_region_size(ram);
-    ram_addr_t base = 0;
-    ram_addr_t bank_size;
-    int i;
-    int j;
-
-    for (i = 0; i < nr_banks; i++) {
-        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
-            bank_size = sdram_bank_sizes[j];
-            if (bank_size <= size_left) {
-                char name[32];
-
-                ram_banks[i].base = base;
-                ram_banks[i].size = bank_size;
-                base += bank_size;
-                size_left -= bank_size;
-                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
-                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
-                                         ram_banks[i].base, ram_banks[i].size);
-                break;
-            }
-        }
-        if (!size_left) {
-            /* No need to use the remaining banks. */
-            break;
-        }
-    }
-
-    if (size_left) {
-        ram_addr_t used_size = memory_region_size(ram) - size_left;
-        GString *s = g_string_new(NULL);
-
-        for (i = 0; sdram_bank_sizes[i]; i++) {
-            g_string_append_printf(s, "%" PRIi64 "%s",
-                                   sdram_bank_sizes[i] / MiB,
-                                   sdram_bank_sizes[i + 1] ? ", " : "");
-        }
-        error_report("at most %d bank%s of %s MiB each supported",
-                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
-        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
-            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
-
-        g_string_free(s, true);
-        exit(EXIT_FAILURE);
-    }
-}
-
 /*****************************************************************************/
 /* MAL */
 
diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index d88363bc3d..62ef7d8f0d 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -43,6 +43,67 @@
 /*****************************************************************************/
 /* Shared functions */
 
+/*
+ * Split RAM between SDRAM banks.
+ *
+ * sdram_bank_sizes[] must be in descending order, that is sizes[i] > sizes[i+1]
+ * and must be 0-terminated.
+ *
+ * The 4xx SDRAM controller supports a small number of banks, and each bank
+ * must be one of a small set of sizes. The number of banks and the supported
+ * sizes varies by SoC.
+ */
+static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
+                               Ppc4xxSdramBank ram_banks[],
+                               const ram_addr_t sdram_bank_sizes[])
+{
+    ram_addr_t size_left = memory_region_size(ram);
+    ram_addr_t base = 0;
+    ram_addr_t bank_size;
+    int i;
+    int j;
+
+    for (i = 0; i < nr_banks; i++) {
+        for (j = 0; sdram_bank_sizes[j] != 0; j++) {
+            bank_size = sdram_bank_sizes[j];
+            if (bank_size <= size_left) {
+                char name[32];
+
+                ram_banks[i].base = base;
+                ram_banks[i].size = bank_size;
+                base += bank_size;
+                size_left -= bank_size;
+                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
+                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
+                                         ram_banks[i].base, ram_banks[i].size);
+                break;
+            }
+        }
+        if (!size_left) {
+            /* No need to use the remaining banks. */
+            break;
+        }
+    }
+
+    if (size_left) {
+        ram_addr_t used_size = memory_region_size(ram) - size_left;
+        GString *s = g_string_new(NULL);
+
+        for (i = 0; sdram_bank_sizes[i]; i++) {
+            g_string_append_printf(s, "%" PRIi64 "%s",
+                                   sdram_bank_sizes[i] / MiB,
+                                   sdram_bank_sizes[i + 1] ? ", " : "");
+        }
+        error_report("at most %d bank%s of %s MiB each supported",
+                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
+        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
+            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
+
+        g_string_free(s, true);
+        exit(EXIT_FAILURE);
+    }
+}
+
 static void sdram_bank_map(Ppc4xxSdramBank *bank)
 {
     memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 10c6dd535f..f8c86e09ec 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,18 +29,6 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-typedef struct {
-    MemoryRegion ram;
-    MemoryRegion container; /* used for clipping */
-    hwaddr base;
-    hwaddr size;
-    uint32_t bcr;
-} Ppc4xxSdramBank;
-
-void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
-                        Ppc4xxSdramBank ram_banks[],
-                        const ram_addr_t sdram_bank_sizes[]);
-
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
 /*
@@ -111,6 +99,14 @@ struct Ppc4xxEbcState {
 };
 
 /* SDRAM DDR controller */
+typedef struct {
+    MemoryRegion ram;
+    MemoryRegion container; /* used for clipping */
+    hwaddr base;
+    hwaddr size;
+    uint32_t bcr;
+} Ppc4xxSdramBank;
+
 #define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
 #define SDR0_DDR0_DDRM_DDR1       0x20000000
 #define SDR0_DDR0_DDRM_DDR2       0x40000000
-- 
2.37.3


