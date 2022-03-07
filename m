Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D34D0BED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:20:06 +0100 (CET)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMe5-00022J-PZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM8C-0001tl-9a
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM8A-0005oY-JA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzFjMVjkMR0anaC3SFegEYUQ/LQ+fdsLfF/TQ60MTl8=;
 b=fBer2GlikqBhatLCMrTjSEr2v4awWMmlFgiqXjE3T5j7iVfLofDwRH+vNjXb1a+1uNUrFr
 dPcnGgwxcBcUxml1jVt8ceQjstPppTivYX/DoYmOY6DKLDJ4OFgtRg4KgjlKAvqg/+mYsR
 A4kB2NFKl5o0GP2Rvly0iERLFMY67bs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-Ish68EDWPAOgUSLT80sYVQ-1; Mon, 07 Mar 2022 17:47:04 -0500
X-MC-Unique: Ish68EDWPAOgUSLT80sYVQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso9464850edh.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fzFjMVjkMR0anaC3SFegEYUQ/LQ+fdsLfF/TQ60MTl8=;
 b=DOg/PDBilKerjhr87VdqpsKFgJ7IZL9lU+nPp4yd4LRuifCuY1w7sKU4jIzZKihU2F
 P/XFgDGf8X8bcqYV9/Lp4sQVmf3YaS6x2viJSIxtRldmNHI1vDWqQDPZyoReQfF5cLm+
 NoJb3D8syZVYz8cD5iI3oM0EC1NaWKJ1txwwTPlYjEBUO0BFNdrMDbilW1tlO8/J2jZv
 /EpzlRSXes8T+ddxWpE/T5KetrIT9ksUjmChkwRhxlZg60PkHr4yufD0nATdhNWli+KE
 nilwMv/TQiVtiYwMngmEh8DhXxYdpaR9OH+s1yKTUs2LB0M+JQhnmWpQhQ+599SCeZdN
 atkQ==
X-Gm-Message-State: AOAM532chs3WAkqbV+/RQfiq/bRf0fplq6oxMHLP68ooGX5y0nChEJIF
 9r6PtAnjGFhoPoH87RZTU0TdNGnlU3cuMFf0B5Jnswxiunw7uDmbDDegkjILfnYBHfgwKJaASTh
 vLS5vUk4VdtwyDqTc8aP1M24PKnYRDwQEtpK6324VRCw383xKeNYBDlw08DBP
X-Received: by 2002:a50:fd0f:0:b0:416:e62:ccec with SMTP id
 i15-20020a50fd0f000000b004160e62ccecmr13231392eds.300.1646693223272; 
 Mon, 07 Mar 2022 14:47:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysJ+Af2EiMAYBtEOS9ze5HWTV/X/k4w6QQ4rTlYfDhPNM2F5dQugXsiCh5d2WnkKv6M1/AqQ==
X-Received: by 2002:a50:fd0f:0:b0:416:e62:ccec with SMTP id
 i15-20020a50fd0f000000b004160e62ccecmr13231366eds.300.1646693223038; 
 Mon, 07 Mar 2022 14:47:03 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm6776857edt.15.2022.03.07.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:47:02 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 45/47] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220307224357.682101-46-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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


