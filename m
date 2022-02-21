Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640F54BEA5C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:28:36 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEMN-0003W4-GU
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9b-0003VW-GZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:23 -0500
Received: from [2a00:1450:4864:20::436] (port=38768
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9Z-0001eS-VN
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:23 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so28794686wrb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/McU+O8wGOej6ngpTyjfRmYL1is5tFLApI7iXTkHog=;
 b=WvOvI0IttkZ+tMC1Ex3gEENDbtfPlc38x/rN/P+2VO0awQebVVGV6ose3YaNLJ6gue
 FjDUTSXSbIMhTvUyuQZX3NfoBiJH+YSUQluEuP9R4gbPJsKz0GEVSo9kIUqLDUvSD8kt
 hDbUds8FTFQ8smYtY/D9tN0xieLNBRPVLnvk0fHT5U7H2AyZi0nnFDGbr4TTFtY3/pZi
 EuXXq/4UVge+G7DsNqxlv9jsKmK58IH83attOgOIgYmvn+fGPTwNB96uCzxvsDksFVjC
 LIPsJtrbtWdX6vkcVlPrvs5bvwDXL3mIqvNlCzAKqBXCM8ymOK/KGazbxdcaJx5Z7h2N
 NVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/McU+O8wGOej6ngpTyjfRmYL1is5tFLApI7iXTkHog=;
 b=PO9XtOkGlAItgxAolQFJr6vRflOa4fdbEmkfe5wmsSvOWZAjpU4b6dXPRKAqllWCCH
 WuhNqxuUsdU5i7H2xp2ou+DFitCauPKUg6FAn6mE7wK1cJJZ3/zAbPnGi5d9Dqrur3Fy
 ydzDjKAymbD0xvN0SI5TFTHdGw0a7hlgHxVhL+xyLYYkiOkS/VPBl7/2YD0kA1uSrnB2
 ZcjjpvuCmxWmBIMed8r0o+Xc/QfKjgu5kjcojZlgBIgQ4xN/UaJWPKqz7SL11KtnMNaO
 zGtYUzQg2ht6hPSyqMW/pVq6AnFma0cqSoswC4cOZJFTnr0tN9SSKGI//I0ZuOuu3cY5
 ds6A==
X-Gm-Message-State: AOAM533CViLX1UrNotODurpWyCw2Hl4KpBJg+tXRLlMaR3lmbqd90kN6
 QWgXM+uYKjXR2bUcOko0zw/LPjCpjADDjA==
X-Google-Smtp-Source: ABdhPJxpkuXL3tKbX82vDuHFsuLoK9741RO9yHc5l1FbU9k8TFXWUROd/IW/c9Sf4yVJcVkRocFI9g==
X-Received: by 2002:a5d:64e3:0:b0:1e4:a380:bb6f with SMTP id
 g3-20020a5d64e3000000b001e4a380bb6fmr17410836wri.463.1645470920564; 
 Mon, 21 Feb 2022 11:15:20 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id b7sm40563258wrp.23.2022.02.21.11.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:15:20 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Mon, 21 Feb 2022 21:13:23 +0200
Message-Id: <20220221191323.617323-3-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221191323.617323-1-liavalb@gmail.com>
References: <20220221191323.617323-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x436.google.com
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
 hw/i386/acpi-build.c        | 5 +++++
 hw/i386/acpi-microvm.c      | 5 +++++
 include/hw/acpi/acpi-defs.h | 1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

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
index ebd47aa26f..5dc625b8d8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -192,6 +192,11 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
             .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
         },
     };
+    if (isa_check_device_existence("i8042")) {
+        /* Indicates if i8042 is present or not */
+        fadt.iapc_boot_arch = (1 << 1);
+    }
+        
     *data = fadt;
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..756c69b3b0 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
         .reset_val = ACPI_GED_RESET_VALUE,
     };
 
+    if (isa_check_device_existence("i8042")) {
+        /* Indicates if i8042 is present or not */
+        pmfadt.iapc_boot_arch = (1 << 1);
+    }
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


