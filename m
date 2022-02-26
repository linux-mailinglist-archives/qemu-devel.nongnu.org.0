Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F64C543D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 07:35:53 +0100 (CET)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNqgK-00084I-C3
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 01:35:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbx-0002BJ-39
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:21 -0500
Received: from [2a00:1450:4864:20::32c] (port=56083
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbv-0006Ue-6O
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:20 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i19so2797994wmq.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 22:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhBScJ7oS02GIZgMJmKU7cpeN/cjdltc2pNchdXhFDY=;
 b=PbpagctmIuZ00FfZta87Ej20YurKVOK2KAfXP87kEUHhVpr2gV6NoOO2ond6KgLGQe
 fSuGG0c7g24arcjqKq56Mvlljre4XCzy0FTm1Lzf7lAWDzOfTXjVSi7tMyVKl23V1B/L
 EPyWbT/5g5XyTNm4RH6TMkdwAS5xc0mNlNmNg2GfmaK1gjCyG9t2A8z3q7WnZOTlWL38
 yRjmOI48U3E23bHJjV+1ZvhqNKSmtPtyXay1lDlQqUakAFEwMTziPZB8Byq39/9+L+ui
 BLEMXksTOVW6EcUHbrNgBfocDFgMoexr9dsx4q1yQd2E64tkN1Yxv8i7WtMf1IH51EFL
 xw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhBScJ7oS02GIZgMJmKU7cpeN/cjdltc2pNchdXhFDY=;
 b=zHeZdm2/pUmXYetDgDAu/mtuvTsn7OqPBjlLquDjKBkLGxvX1X1fpPHGhz0rHi7NFk
 tDXMReS/CNYLX6OxKXTR9QsGtQJ+O233OuiVtkSrqbXTtRAYB06J/Hjn82KMPi9V6Pl4
 a3w3KYLLky/maQY2nTIra1y/DOhwBZ1dIywj0whoXYr9FN+B87bQJJBjxg3oiPcFjIFI
 p8AINWJ9q0J9NoWdXFkf067Kvz6qi4vedCCO6pxtNYWAS0zUVeZ4U8nFQkNJsSZtaxbd
 RdTtMD4vy6dYW9Q2S7wG+PRTOZWbOV+xHmiL8t+tAr1mJxE3+4uJWPGr/W8VqARFI8/W
 XEeQ==
X-Gm-Message-State: AOAM53273qS6xQKn2IMZIz5Oa8vhuTCnwi0Vuvx+jaqT/YAKNPklXF7A
 +dD2AWR21BKQuKja2EnAoKZkhljCgFw=
X-Google-Smtp-Source: ABdhPJxa7p7+JSR73rj+fHAD2RxpzKpk85UomKytjjIQ1/RWvJi5zlH8ZnA9gKnnnPBy+7hgk+QZEQ==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr5627766wmj.38.1645857072880; 
 Fri, 25 Feb 2022 22:31:12 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adfcd87000000b001e8a4f58a8csm3933407wrj.66.2022.02.25.22.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 22:31:12 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Sat, 26 Feb 2022 08:30:18 +0200
Message-Id: <20220226063019.1112654-4-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226063019.1112654-1-liavalb@gmail.com>
References: <20220226063019.1112654-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/acpi/aml-build.c         | 7 ++++++-
 hw/i386/acpi-build.c        | 8 ++++++++
 hw/i386/acpi-microvm.c      | 9 +++++++++
 include/hw/acpi/acpi-defs.h | 1 +
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8966e16320..ef5f4cad87 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
     build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
     build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
+    /* IAPC_BOOT_ARCH */
+    if (f->rev == 1) {
+        build_append_int_noprefix(tbl, 0, 2);
+    } else {
+        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
+    }
     build_append_int_noprefix(tbl, 0, 1); /* Reserved */
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ebd47aa26f..65dbc1ec36 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
             .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
         },
     };
+    /*
+     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
+     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
+     * (the earliest acpi revision that supports this).
+     */
+
+    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002 : 0x0000;
+
     *data = fadt;
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..e5f89164be 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -189,6 +189,15 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
         .reset_val = ACPI_GED_RESET_VALUE,
     };
 
+    /*
+     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
+     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
+     * (the earliest acpi revision that supports this).
+     */
+
+    pmfadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002
+                            : 0x0000;
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


