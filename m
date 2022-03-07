Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493EB4CFC38
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:05:33 +0100 (CET)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBBE-0001Ha-DH
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADT-00031D-Mh
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADS-0002yz-01
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzFjMVjkMR0anaC3SFegEYUQ/LQ+fdsLfF/TQ60MTl8=;
 b=Lbg2QWA+VGT3F/RQwuCGBKmcOr9iyxOTKXgDZ7h1fwZt8P3gVH4mWsnrbg7OxvThdgdbzp
 cqbtT0ZIDnMMlrukPi8dwL0SfQ5l8Lk1ssA9YOwDGJsfLHwitS/Rac4qAjp7Ofo9zAMp3n
 xC00W/Qj4LEHPIg0PlVaGT5qA0UkS5U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-g6F-PLDIN-qHT7o3vw7gqA-1; Mon, 07 Mar 2022 05:03:37 -0500
X-MC-Unique: g6F-PLDIN-qHT7o3vw7gqA-1
Received: by mail-ej1-f71.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so6748045ejc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fzFjMVjkMR0anaC3SFegEYUQ/LQ+fdsLfF/TQ60MTl8=;
 b=Uh1+YIp/IOjBUfY06zlYYPxAkRyxispxW7YknxOQJjmxPDtcxbs+AHeSyPdJgWIaOs
 Sj5VXgnb+fEUTW6oWvoxkrLBjfJfui4BpVqeYOncT7kBI7NgkW5fVaNtxXoyxlipzwaQ
 fkAUpjqhC1BKdXEAl3tTZ0qBWGsO0sMoaXdLeYQXxMaAhmKSeH/yMKA9Uk+hOtuf+cZr
 JRrGqU/t77l6L5+9Nyw8v2OlNZHZrXwr+nfx2+VCvV8n9w7TpGomTcfx9Z54Evaahbh5
 BgZeS6na92BJctH+epQ/eA8IoIyWvos2MnA4lEeO61dVKHXMZCGuckcpHGiakbotEX7Y
 d/TQ==
X-Gm-Message-State: AOAM533iml80gzCzUxWXhZqtS19MGkIVn2sCkKMm/IZ1BIBa188Oy5N6
 NQN9og7LV0PA6MnraeuFJSwjx8wxs4NZE9hWl59H+oMkTOBeYM0vJG1hM+YXT/2t3irLR7eRpbr
 BVyaSwT+2nbS62H3NNz95E3L150RTzxBAOyFH5AuifW1caxnKLxbYfor6//gn
X-Received: by 2002:a17:906:bc9b:b0:6da:9f90:a56a with SMTP id
 lv27-20020a170906bc9b00b006da9f90a56amr8633697ejb.575.1646647415920; 
 Mon, 07 Mar 2022 02:03:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj/jLuoLpuCFTAWQ3+haD4Mq0g9r1i0iv42q4D11OctjxAJqwyi2NVJ82CRvw37Y1mNukFeA==
X-Received: by 2002:a17:906:bc9b:b0:6da:9f90:a56a with SMTP id
 lv27-20020a170906bc9b00b006da9f90a56amr8633670ejb.575.1646647415536; 
 Mon, 07 Mar 2022 02:03:35 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 z10-20020aa7cf8a000000b004160af67840sm4171791edx.66.2022.03.07.02.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:35 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 45/47] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220307100058.449628-46-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liav Albani <liavalb@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
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
Message-Id: <20220304154032.2071585-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  1 +
 include/hw/input/i8042.h    | 15 +++++++++++++++
 hw/acpi/aml-build.c         |  8 +++++++-
 hw/i386/acpi-build.c        |  8 ++++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

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
 
-- 
MST


