Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771604C79E8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:20:03 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmV0-0007gn-H6
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmTC-0005LI-8B
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:10 -0500
Received: from [2a00:1450:4864:20::32a] (port=40927
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmTA-0000h4-Mz
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c18-20020a7bc852000000b003806ce86c6dso101470wml.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NUzv+IHDhVLFgcx8AE4guxfAr0aZwYyF9eC1iTnuQ0U=;
 b=YMTn06AnFYjwevZr8HBSb+k2RNym3jAU2Hh1rVWx7uWep3fQbJqSvZ+dw2oUdjeI7y
 zLoCEo2C664q5gfhUFdjuZ9BCoJA58ic3thBBCusz5a0MdoYa5SfX+1p+zKcCkCF5ac2
 QoDXO/4ZVrhHlKeAhso60G1aYo7OIgawEsN5FSBBIN94eKaPwiK7NX+EqA8f6jQ75Tus
 1LeGmDmV7I+fppB1/ceuY/Q4VWYZz65kDOnWWYloWiZplFczIqMfWDYLkW/9/mezi3Bn
 5n6HMp3KEFVc/qcLKZt0PCEMKqZKUNe5QEr+BNTJtoV2z2L/R/5A6Hhpvf3a2Igsue8U
 d8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NUzv+IHDhVLFgcx8AE4guxfAr0aZwYyF9eC1iTnuQ0U=;
 b=WEU2Mjyf2QZW0ZBA3EdlN15JYMR9kexgZ6JqOCd6WkdJebcZsZcwhkQALsgMpg09I/
 gkzAczomqFTGErYDqh85Idtaw/2ookD4cepJJKHsqjNw+mu+OV/HKugMhjtzPgFTM2z0
 Q3dBra7XsPKr+n9HUtTmopK1p97z0iBXrPjNZWTkXrx8m3mNnU+wtiu+wwz+BHb13qpB
 KWRlgQ5Tax5f9Tm2bk2+tgtiC8+tpt3uHWlnsA3cOAKhMDmNXSnJM8eVnKfg/MpgFKtO
 pwojKFNpidyHbGGue3j0ELRJk63j5dbOZQH2lQF/1PV0yIiol3l7ESF2qyHxbsVN+1C3
 KbvA==
X-Gm-Message-State: AOAM532xcZCU5bphWH4LZmO2xqJUDynhvDjxrdw8nm0ThK8QVwPjeCtM
 P2kdo6lVyU1iQMNpdzzVWr5D2CpRCVo+Ew==
X-Google-Smtp-Source: ABdhPJwwJruSO6L1w8s4HuB4BGZBBZhngBIK0XnUJdZazvqUmmpfYjx9BswBh4NiaHoudYgpXt5erg==
X-Received: by 2002:a05:600c:35d1:b0:37c:d45c:af57 with SMTP id
 r17-20020a05600c35d100b0037cd45caf57mr14650739wmq.149.1646079487181; 
 Mon, 28 Feb 2022 12:18:07 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c418200b00380e4fa28b8sm355259wmh.23.2022.02.28.12.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 12:18:06 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Mon, 28 Feb 2022 22:17:32 +0200
Message-Id: <20220228201733.714580-3-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228201733.714580-1-liavalb@gmail.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 Liav Albani <liavalb@gmail.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

This change only applies to the x86/q35 machine type, as it uses FACP
ACPI table with revision higher than 1, which should implement at least
ACPI 2.0 features within the table, hence it can also set the IA-PC boot
flags register according to the ACPI 2.0 specification.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/acpi/aml-build.c         | 11 ++++++++++-
 hw/i386/acpi-build.c        |  9 +++++++++
 hw/i386/acpi-microvm.c      |  9 +++++++++
 include/hw/acpi/acpi-defs.h |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8966e16320..2085905b83 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
     build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
     build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
+    /* IAPC_BOOT_ARCH */
+    /*
+     * This register is not defined in ACPI spec version 1.0, where the FACP
+     * revision == 1 also applies. Therefore, just ignore setting this register.
+     */
+    if (f->rev == 1) {
+        build_append_int_noprefix(tbl, 0, 2);
+    } else {
+        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
+    }
     build_append_int_noprefix(tbl, 0, 1); /* Reserved */
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ebd47aa26f..c72c7bb9bb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -38,6 +38,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
+#include "hw/input/i8042.h"
 #include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
@@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
             .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
         },
     };
+    /*
+     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
+     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
+     * (the earliest acpi revision that supports this).
+     */
+    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
+                            0x0002 : 0x0000;
+
     *data = fadt;
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..4bc72b1672 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -31,6 +31,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
 #include "hw/acpi/erst.h"
+#include "hw/input/i8042.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
         .reset_val = ACPI_GED_RESET_VALUE,
     };
 
+    /*
+     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
+     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
+     * (the earliest acpi revision that supports this).
+     */
+    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
+                            0x0002 : 0x0000;
+
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
     bios_linker_loader_alloc(tables->linker,
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c97e8633ad..2b42e4192b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
     uint16_t plvl2_lat;        /* P_LVL2_LAT */
     uint16_t plvl3_lat;        /* P_LVL3_LAT */
     uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
+    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
     uint8_t minor_ver;         /* FADT Minor Version */
 
     /*
-- 
2.35.1


