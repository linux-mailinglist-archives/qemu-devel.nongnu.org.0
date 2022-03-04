Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F336F4CD7CC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:30:41 +0100 (CET)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9tB-00071k-3F
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:30:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X1-0004ql-Vq
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:48 -0500
Received: from [2607:f8b0:4864:20::1033] (port=52900
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X0-0003ks-EE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id v4so7566095pjh.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MC/4yt1MXUGPRfWKzDGwR1zYGtJXYhIlfWpMgyv9Xxg=;
 b=JjaJBj4xd3tLbleMotqrdkI36pq6yExQeelqVZsGmKO8OzsOyrVk8fD5iChCwGxTPG
 WmJ3TEC6x8zdueLuPOlm7NIheRrjmMRPvuWj/JGqf7Ao2ZoH+AS4EGDAMYZ7tYh07POg
 sj20PN0S+0+Qr+uNM5mHAln6jJ+69ByvaAuZihGEKD94EIGmD/S90UaiJ17dTd0AdR4Y
 BdjCcubgz+9KRDuict30hkkHtFATIW/LTrVYYzEkP53uGalQN7jUV3mnAKGtvpurt1zI
 hx4RIeuuN+Rdqk8qbi/gXufViPy4CcBqosq7szE/NzndboBUVt+wV7g65aWce/owM6WN
 X/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MC/4yt1MXUGPRfWKzDGwR1zYGtJXYhIlfWpMgyv9Xxg=;
 b=ecnvz/Hr8YQMW5DsNFUtM+U3RYcnMRe44dr60IHeT1WpSK2TfHy6JQYmn2XOvSIZWT
 pFyE3bWfQRKewlvk9Fn7FZ9cc6oQ+BdMfPFHrWTW9fMPFV+xPXCi95zVDf2tmX04UcmH
 o+8nkTPyBslkdIqVnN2ZOfn2CKE0Kn47/qSFGrvl9QSD/R4C/k34JijhbFo0azrsFRQY
 YL7mm2E6SmWPuuxlWM10cvX2J53ye61/VutmfPU1LSZQKUmYfTiKcycIiUcpTGqTAXDM
 5AqtJAncRX1iBWqx/ALHHpLTx01TLgmiPFOHx564S9CH8gogrZKav47ClH9TPcgBm20f
 TGkw==
X-Gm-Message-State: AOAM531ulnMReYVsoAIaj9R02xIZY366sRfG4aEaB7sZZaO0VPdknqI+
 FQIM18fM4I0tNWurOrSxSuIMDPoN9MOROQ==
X-Google-Smtp-Source: ABdhPJzif6xu59xgIn8fF9YXsl7krWVVTcRRpgmKQa4snLEXryiuIxQg/O7baaq0+O6pxnA1gAM/aQ==
X-Received: by 2002:a17:902:edcd:b0:14d:c114:b86b with SMTP id
 q13-20020a170902edcd00b0014dc114b86bmr41440233plk.166.1646406464805; 
 Fri, 04 Mar 2022 07:07:44 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm8278861pjb.21.2022.03.04.07.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:07:44 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 2/4] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Fri,  4 Mar 2022 20:37:20 +0530
Message-Id: <20220304150722.2069132-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304150722.2069132-1-ani@anisinha.ca>
References: <20220304150722.2069132-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

The 8042 bit in IAPC_BOOT_ARCH was introduced from ACPI spec v2 (FADT
revision 2 and above). Therefore, in this change, we only enable this bit for
x86/q35 machine types since x86/i440fx machines use FADT ACPI table with
revision 1.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/aml-build.c         |  8 +++++++-
 hw/i386/acpi-build.c        |  8 ++++++++
 include/hw/acpi/acpi-defs.h |  1 +
 include/hw/input/i8042.h    | 15 +++++++++++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8966e16320..1773cf55f1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2152,7 +2152,13 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
     build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
     build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
+    /* IAPC_BOOT_ARCH */
+    if (f->rev == 1) {
+        build_append_int_noprefix(tbl, 0, 2);
+    } else {
+        /* since ACPI v2.0 */
+        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
+    }
     build_append_int_noprefix(tbl, 0, 1); /* Reserved */
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ebd47aa26f..4ad4d7286c 100644
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
@@ -192,6 +193,13 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
             .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
         },
     };
+
+    /*
+     * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
+     * Flags, bit offset 1 - 8042.
+     */
+    fadt.iapc_boot_arch = iapc_boot_arch_8042();
+
     *data = fadt;
 }
 
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
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 1d90432dae..b3b77bbb32 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -23,4 +23,19 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
+static inline bool i8042_present(void)
+{
+    bool amb = false;
+    return object_resolve_path_type("", TYPE_I8042, &amb) || amb;
+}
+
+/*
+ * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
+ * Flags, bit offset 1 - 8042.
+ */
+static inline u16 iapc_boot_arch_8042(void)
+{
+    return i8042_present() ? 0x1 << 1 : 0x0 ;
+}
+
 #endif /* HW_INPUT_I8042_H */
-- 
2.25.1


