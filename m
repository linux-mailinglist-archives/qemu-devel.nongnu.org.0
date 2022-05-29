Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD7537246
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 21:03:51 +0200 (CEST)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvOCc-0007bB-LN
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 15:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvOBQ-0006vP-HF
 for qemu-devel@nongnu.org; Sun, 29 May 2022 15:02:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvOBO-0005cl-J0
 for qemu-devel@nongnu.org; Sun, 29 May 2022 15:02:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p10so12043335wrg.12
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=/OiD8JFoO0ckSoSPpaWahGlzJ5qnZtJR3Vfmsdj3QG8=;
 b=W/Z5uwixVX3Ul/1ulUAxwrDlnXPoOh9Jvu6CHrwWpNvqGDK0vI3DAQoNieapAJHGC9
 XVpEU9CUhiMdKZnRpA+tHchTYuNoG4eDZ70O4ZHRKf9eRAeMbPr6EMY8A17EVPZxU9ev
 BWu62gWX/n0xOvo+4v8iH8Qoun4GYECK3S5b8vh3K9BJV6m54zzVvXFUPD8UAg7G2R1Y
 X+CdTydIlVgJHMunlScdSpkS2LQEnxXVznzVfpmJWh4og98EOjDvs4PCViDtEavZNmZh
 FJbRz38GH3hrzDTLOmqX79fQS5NHSTKHTMfFMUR8JN5S683smHivZlqSA3oulXh6w5fI
 /fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=/OiD8JFoO0ckSoSPpaWahGlzJ5qnZtJR3Vfmsdj3QG8=;
 b=FQoPOkTI8FIVgWKr+PdyJCeYd8VikDMAB40L2z5ebERb1Sdlx7EbtGlUgurDzn9AxM
 syqRNyI+D72wjCl9oVq2bkn5OTsEl1NZnYVG6+RIwZwYuC5oKnMs/F/s//3HarWDNsxN
 p0uUkKS2ebEXYpqAbNAtOoCFCKcOIBS6WlbqI7FG/HCgjo2QkTqb3/rwdD+j4wczXYIY
 phPwkgrYqvenTW9iHQPnzOsUbA7ToSkIv0QPm2Hh88oG1L4et7atJON7JHnlksMQoUFW
 NzFSZY5+cOuHJGRL2RIrG7EhjPvr58JKhqr8vMa1REDZl47vgz5sH6FlMgDdg18nlfbW
 G3lA==
X-Gm-Message-State: AOAM533w+xDXcLjlTjt5ZI5qiUSNIrTtCKvbsjSc1xwzFY78yEtI4XOB
 4rcvbEv4b6M/A1PuASGSld4=
X-Google-Smtp-Source: ABdhPJzKGYcZ8LvRLWYWDk71BtXUs3wFe/YduBLccSGHGzT8YGaqodA38OmmOfObBsUkH5f8cvj60g==
X-Received: by 2002:adf:fb03:0:b0:20a:e253:b8c7 with SMTP id
 c3-20020adffb03000000b0020ae253b8c7mr42636009wrr.119.1653850953039; 
 Sun, 29 May 2022 12:02:33 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00154dd35d8bf95fb4.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:154d:d35d:8bf9:5fb4])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003942a244f40sm9228834wmq.25.2022.05.29.12.02.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 May 2022 12:02:32 -0700 (PDT)
Date: Sun, 29 May 2022 19:02:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_04/12=5D_hw/acpi/piix4=3A_move_P?=
 =?US-ASCII?Q?IIX4PMState_into_separate_piix4=2Eh_header?=
In-Reply-To: <20220528091934.15520-5-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-5-mark.cave-ayland@ilande.co.uk>
Message-ID: <40368C33-2392-49F3-A072-B6E21E426B05@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28=2E Mai 2022 09:19:26 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>This allows the QOM types in hw/acpi/piix4=2Ec to be used elsewhere by si=
mply including
>hw/acpi/piix4=2Eh=2E
>
>Signed-off-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>---
> hw/acpi/piix4=2Ec               | 43 +-------------------
> hw/i386/acpi-build=2Ec          |  1 +
> include/hw/acpi/piix4=2Eh       | 75 +++++++++++++++++++++++++++++++++++
> include/hw/southbridge/piix=2Eh |  2 -
> 4 files changed, 78 insertions(+), 43 deletions(-)
> create mode 100644 include/hw/acpi/piix4=2Eh
>
>diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>index 2735ff375e=2E=2E7ee65b1bff 100644
>--- a/hw/acpi/piix4=2Ec
>+++ b/hw/acpi/piix4=2Ec
>@@ -28,6 +28,8 @@
> #include "hw/pci/pci=2Eh"
> #include "hw/qdev-properties=2Eh"
> #include "hw/acpi/acpi=2Eh"
>+#include "hw/acpi/pcihp=2Eh"

No need to be included twice=2E

>+#include "hw/acpi/piix4=2Eh"
> #include "sysemu/runstate=2Eh"
> #include "sysemu/sysemu=2Eh"
> #include "sysemu/xen=2Eh"
>@@ -56,47 +58,6 @@ struct pci_status {
>     uint32_t down;
> };
>=20
>-struct PIIX4PMState {
>-    /*< private >*/
>-    PCIDevice parent_obj;
>-    /*< public >*/
>-
>-    MemoryRegion io;
>-    uint32_t io_base;
>-
>-    MemoryRegion io_gpe;
>-    ACPIREGS ar;
>-
>-    APMState apm;
>-
>-    PMSMBus smb;
>-    uint32_t smb_io_base;
>-
>-    qemu_irq irq;
>-    qemu_irq smi_irq;
>-    bool smm_enabled;
>-    bool smm_compat;
>-    Notifier machine_ready;
>-    Notifier powerdown_notifier;
>-
>-    AcpiPciHpState acpi_pci_hotplug;
>-    bool use_acpi_hotplug_bridge;
>-    bool use_acpi_root_pci_hotplug;
>-    bool not_migrate_acpi_index;
>-
>-    uint8_t disable_s3;
>-    uint8_t disable_s4;
>-    uint8_t s4_val;
>-
>-    bool cpu_hotplug_legacy;
>-    AcpiCpuHotplug gpe_cpu;
>-    CPUHotplugState cpuhp_state;
>-
>-    MemHotplugState acpi_memory_hotplug;
>-};
>-
>-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
>-
> static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>                                            PCIBus *bus, PIIX4PMState *s)=
;
>=20
>diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>index c125939ed6=2E=2E89ac326d7f 100644
>--- a/hw/i386/acpi-build=2Ec
>+++ b/hw/i386/acpi-build=2Ec
>@@ -46,6 +46,7 @@
> #include "hw/acpi/tpm=2Eh"
> #include "hw/acpi/vmgenid=2Eh"
> #include "hw/acpi/erst=2Eh"
>+#include "hw/acpi/piix4=2Eh"
> #include "sysemu/tpm_backend=2Eh"
> #include "hw/rtc/mc146818rtc_regs=2Eh"
> #include "migration/vmstate=2Eh"
>diff --git a/include/hw/acpi/piix4=2Eh b/include/hw/acpi/piix4=2Eh
>new file mode 100644
>index 0000000000=2E=2E32686a75c5
>--- /dev/null
>+++ b/include/hw/acpi/piix4=2Eh
>@@ -0,0 +1,75 @@
>+/*
>+ * ACPI implementation
>+ *
>+ * Copyright (c) 2006 Fabrice Bellard
>+ *
>+ * This library is free software; you can redistribute it and/or
>+ * modify it under the terms of the GNU Lesser General Public
>+ * License version 2=2E1 as published by the Free Software Foundation=2E
>+ *
>+ * This library is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the GNU
>+ * Lesser General Public License for more details=2E
>+ *
>+ * You should have received a copy of the GNU Lesser General Public
>+ * License along with this library; if not, see <http://www=2Egnu=2Eorg/=
licenses/>
>+ *
>+ * Contributions after 2012-01-13 are licensed under the terms of the
>+ * GNU GPL, version 2 or (at your option) any later version=2E
>+ */
>+
>+#ifndef HW_ACPI_PIIX4_H
>+#define HW_ACPI_PIIX4_H
>+
>+#include "hw/pci/pci=2Eh"
>+#include "hw/acpi/acpi=2Eh"
>+#include "hw/acpi/cpu_hotplug=2Eh"
>+#include "hw/acpi/memory_hotplug=2Eh"
>+#include "hw/acpi/pcihp=2Eh"
>+#include "hw/i2c/pm_smbus=2Eh"
>+#include "hw/isa/apm=2Eh"

These headers don't need to be included in the =2Ec file any more=2E

>+
>+#define TYPE_PIIX4_PM "PIIX4_PM"
>+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
>+
>+struct PIIX4PMState {
>+    /*< private >*/
>+    PCIDevice parent_obj;
>+    /*< public >*/
>+
>+    MemoryRegion io;
>+    uint32_t io_base;
>+
>+    MemoryRegion io_gpe;
>+    ACPIREGS ar;
>+
>+    APMState apm;
>+
>+    PMSMBus smb;
>+    uint32_t smb_io_base;
>+
>+    qemu_irq irq;
>+    qemu_irq smi_irq;
>+    bool smm_enabled;
>+    bool smm_compat;
>+    Notifier machine_ready;
>+    Notifier powerdown_notifier;
>+
>+    AcpiPciHpState acpi_pci_hotplug;
>+    bool use_acpi_hotplug_bridge;
>+    bool use_acpi_root_pci_hotplug;
>+    bool not_migrate_acpi_index;
>+
>+    uint8_t disable_s3;
>+    uint8_t disable_s4;
>+    uint8_t s4_val;
>+
>+    bool cpu_hotplug_legacy;
>+    AcpiCpuHotplug gpe_cpu;
>+    CPUHotplugState cpuhp_state;
>+
>+    MemHotplugState acpi_memory_hotplug;
>+};
>+
>+#endif
>diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/pii=
x=2Eh
>index f63f83e5c6=2E=2Ec5b842b45d 100644
>--- a/include/hw/southbridge/piix=2Eh
>+++ b/include/hw/southbridge/piix=2Eh
>@@ -15,8 +15,6 @@
> #include "hw/pci/pci=2Eh"
> #include "qom/object=2Eh"
>=20
>-#define TYPE_PIIX4_PM "PIIX4_PM"
>-
> I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>                       qemu_irq sci_irq, qemu_irq smi_irq,
>                       int smm_enabled, DeviceState **piix4_pm);


