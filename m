Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB824CD3D5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:55:24 +0100 (CET)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6Wp-0000b6-1X
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:55:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6V3-0006ul-LQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:34 -0500
Received: from [2607:f8b0:4864:20::62f] (port=38871
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6V2-0005OV-2c
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:33 -0500
Received: by mail-pl1-x62f.google.com with SMTP id t19so3969379plr.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clOeteuA8EZcrtppgT5FyAaJW8k+p99dHASEHpY1SMA=;
 b=v8nKGLs5dl07vH48jbGjmIviHEE4L8WeHpZY55kmmF187kCdwb1otM8aAGHaAki9IU
 2yZ1d5S8n+SZNPg8UuEjIh8z8wAHpoGeXZKcX1cAV8fMiEqoAlHklTzB9t5CAxMLJLXm
 lznHoR08dbCa/cZ7xmgMzCL5kK0kH0NwYrqztjf5Y1kV+g/su/4xhqLKj4JHR9u9Nlzb
 03DbGHb7xCp6N7AvHYqcCnrtr/JdnaqeM4f3rWm5933W9zRhAeKjfkRp2Ey0MVxb/K9W
 iPcnkseOBXhVCEaPBHNtHjPXTms1ecdzvpLbqX5nngduklTUAM5EZyucylr7Ziu5jRqd
 jP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clOeteuA8EZcrtppgT5FyAaJW8k+p99dHASEHpY1SMA=;
 b=pDlwRlf2Vl2RvAxMURZgWbmzeewCOgD16Dqg8CkRY6VQ6pnf+httnbIfx6CIlUCBsV
 81hpm+eaNaAYxcEYntU4KpllPIHxqTGFOtkplegPlZgv57tbqMqc5gCKLIaa1Aq+uth8
 n057zQfdyW3axyVCd4ufVUmg4CtWFPV30MiYB7t+EPF0lJhQoSe3RS/HsH+UHGBCh+8N
 XwsbYpUp1HOUhr2mL74H+IUXcnkCfV2d2e7h/3AoixH8lctlz+xzt3FS62+9TCrVh48W
 19MB5+Uye86NktpIqXT9BlVB9IG9T/TwxdKS0L+qwR9dbZjtcxjCVmurqBOX0IpypebS
 /wcg==
X-Gm-Message-State: AOAM533e1sRM6Yt1/EZV+VgPxK0ukbAf6vzg39BdLpZE/rv6+ZPJmwQI
 9uPpwrrw11sUUcn45TiShWLhvym02RsI6w==
X-Google-Smtp-Source: ABdhPJw9NMO5cfSg3oMnjhYgNPcPAjcoDuvszmmJmhEf9Scsg6xqj4OMlcrpiU021UQKWxd/e12okg==
X-Received: by 2002:a17:90a:c6:b0:1bc:c0be:4696 with SMTP id
 v6-20020a17090a00c600b001bcc0be4696mr10290247pjd.7.1646394809475; 
 Fri, 04 Mar 2022 03:53:29 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a056a00178700b004e1a15e7928sm6334878pfg.145.2022.03.04.03.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:53:29 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 2/3] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Fri,  4 Mar 2022 17:22:56 +0530
Message-Id: <20220304115257.1816983-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304115257.1816983-1-ani@anisinha.ca>
References: <20220304115257.1816983-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62f.google.com
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

This change only applies to the x86/q35 machine type, as it uses FACP
ACPI table with revision higher than 1, which should implement at least
ACPI 2.0 features within the table, hence it can also set the IA-PC boot
flags register according to the ACPI 2.0 specification.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/aml-build.c         | 8 +++++++-
 hw/i386/acpi-build.c        | 8 ++++++++
 include/hw/acpi/acpi-defs.h | 1 +
 include/hw/input/i8042.h    | 6 ++++++
 4 files changed, 22 insertions(+), 1 deletion(-)

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
index ebd47aa26f..28ca75fb50 100644
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
+    fadt.iapc_boot_arch = i8042_present() ? 0x1 << 1 : 0x0;
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
index 1d90432dae..c739f30be8 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -23,4 +23,10 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
+static inline bool i8042_present(void)
+{
+    bool amb = false;
+    return object_resolve_path_type("", TYPE_I8042, &amb) || amb;
+}
+
 #endif /* HW_INPUT_I8042_H */
-- 
2.25.1


