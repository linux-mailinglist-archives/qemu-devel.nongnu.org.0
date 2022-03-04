Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C9F4CD843
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:48:44 +0100 (CET)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAAd-0001vy-If
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA34-0003yJ-J1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:40:55 -0500
Received: from [2607:f8b0:4864:20::532] (port=43553
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA32-00084z-9U
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:40:54 -0500
Received: by mail-pg1-x532.google.com with SMTP id 27so7808195pgk.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGIFQsTVcpSNbU2XIIqMTeq9b/UUx7DW84vJyVg1osg=;
 b=GFsNk28baYWp8zPisvEqUn39ITl7pzlAAFRncdg0OfHvwdj29Lt3Ait75kIyVgF1Bc
 /abl2rtn4lQT4O1feLfBO7Jtrx5IfopZjshvdFENG43AgPf3CayeU+O80/LFAmdiW0Vk
 87BvQxQf0atbdV2NlcBVwuUj2cHmgP7SV1SyP4RON8hJLk13/qKKfp1AwPNTF0BAiOGi
 BxgRQwIFQY7AauCY1E2sA9qnnwgEVFoUnvNv8M5KSHTZa45f2qbaBYYydCs7hEe6V2lT
 Uoo/I7lYv6za/fjNR4Rb6ZFI00jDeKzsuGEVw6IubnYAd6xG3N1VxGU0Wum5R6qJhurx
 a4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGIFQsTVcpSNbU2XIIqMTeq9b/UUx7DW84vJyVg1osg=;
 b=dlQhBoGVF2lgdwWIq3KPo2Vd5DlK983jlvm17MnTGcIkQRskFkPJf1YkNwiXM8V4jw
 GJAfXodrhj3jz/9UzeRodyASDU5pI7+tJekrI8UKIt2je50p8NQbn9qiM2PULeUB+I3M
 SHz7wT0eVkj/rD9NFnEBg2B2fvvw5pK522qTVBc/va0g9wNtg3uIZP4EWLUYmD6qjK5u
 3Xz9xqoPpPaCqBcBwbgANoF1S8SRFGP97xDaZFd+br4QFi7HFgWYJTcweRFYJeIpgN32
 vXeVdTy/d2cQM/tJRIZsPYaNpqBpabSESeZMoATVKLx+UhJYc6r2PV9aBb/uFMLy+79Z
 cGKg==
X-Gm-Message-State: AOAM530iD9m/lmzxEouuQ18jzQzPOlC8/7b1lt5x8uAwNN3Wl/yF+pBz
 RjfPlQVu2Pkayd7iFSCjRCc9Y5WloiAFBg==
X-Google-Smtp-Source: ABdhPJxVSS/giDZ/k9dIO8xscYqIUv/UdSLz0h/13Qkt4G0LVcIw833ZnGqQllKelvFDUPiy8HzAKQ==
X-Received: by 2002:aa7:8432:0:b0:4f6:6dcd:4f19 with SMTP id
 q18-20020aa78432000000b004f66dcd4f19mr8907124pfn.53.1646408450308; 
 Fri, 04 Mar 2022 07:40:50 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 ck20-20020a17090afe1400b001bd0494a4e7sm5448366pjb.16.2022.03.04.07.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:40:49 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 2/4] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Fri,  4 Mar 2022 21:10:30 +0530
Message-Id: <20220304154032.2071585-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304154032.2071585-1-ani@anisinha.ca>
References: <20220304154032.2071585-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
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
index 1d90432dae..e070f546e4 100644
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
+static inline uint16_t iapc_boot_arch_8042(void)
+{
+    return i8042_present() ? 0x1 << 1 : 0x0 ;
+}
+
 #endif /* HW_INPUT_I8042_H */
-- 
2.25.1


