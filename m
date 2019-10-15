Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099FD7C82
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:56:30 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKQ7Y-0001yo-KC
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPkj-00057H-V7
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPki-0007MK-IM
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:32:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPki-0007M7-AA
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:32:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 681543018ED0;
 Tue, 15 Oct 2019 16:32:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D253319C69;
 Tue, 15 Oct 2019 16:32:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/32] hw/pci-host/piix: Move i440FX declarations to
 hw/pci-host/i440fx.h
Date: Tue, 15 Oct 2019 18:27:01 +0200
Message-Id: <20191015162705.28087-29-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 15 Oct 2019 16:32:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The hw/pci-host/piix.c contains a mix of PIIX3 and i440FX chipsets
functions. To be able to split it, we need to export some
declarations first.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                  |  1 +
 hw/acpi/pcihp.c              |  2 +-
 hw/i386/pc_piix.c            |  1 +
 hw/pci-host/piix.c           |  1 +
 include/hw/i386/pc.h         | 22 ---------------------
 include/hw/pci-host/i440fx.h | 37 ++++++++++++++++++++++++++++++++++++
 stubs/pci-host-piix.c        |  3 ++-
 7 files changed, 43 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/pci-host/i440fx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 556f58bd8c..adf059a164 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1228,6 +1228,7 @@ F: hw/i386/
 F: hw/pci-host/piix.c
 F: hw/pci-host/q35.c
 F: hw/pci-host/pam.c
+F: include/hw/pci-host/i440fx.h
 F: include/hw/pci-host/q35.h
 F: include/hw/pci-host/pam.h
 F: hw/isa/lpc_ich9.c
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 82d295b6e8..8413348a33 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -27,7 +27,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/pcihp.h"
=20
-#include "hw/i386/pc.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/acpi/acpi.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5b35ff04c7..8ac4bf12ca 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -29,6 +29,7 @@
 #include "hw/loader.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/southbridge/piix.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index a450fc726e..0b5da5bc94 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/southbridge/piix.h"
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1c20b96571..cead2828de 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -248,28 +248,6 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
 /* hpet.c */
 extern int no_hpet;
=20
-/* piix_pci.c */
-struct PCII440FXState;
-typedef struct PCII440FXState PCII440FXState;
-
-#define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
-#define TYPE_I440FX_PCI_DEVICE "i440FX"
-
-#define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
-
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state, int *piix_devfn,
-                    ISABus **isa_bus, qemu_irq *pic,
-                    MemoryRegion *address_space_mem,
-                    MemoryRegion *address_space_io,
-                    ram_addr_t ram_size,
-                    ram_addr_t below_4g_mem_size,
-                    ram_addr_t above_4g_mem_size,
-                    MemoryRegion *pci_memory,
-                    MemoryRegion *ram_memory);
-
-PCIBus *find_i440fx(void);
-
 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_mem=
ory);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
new file mode 100644
index 0000000000..e327f9bf87
--- /dev/null
+++ b/include/hw/pci-host/i440fx.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU i440FX North Bridge Emulation
+ *
+ * Copyright (c) 2006 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_PCI_I440FX_H
+#define HW_PCI_I440FX_H
+
+#include "hw/hw.h"
+#include "hw/pci/pci_bus.h"
+
+typedef struct PCII440FXState PCII440FXState;
+
+#define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
+#define TYPE_I440FX_PCI_DEVICE "i440FX"
+
+#define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
+
+PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+                    PCII440FXState **pi440fx_state, int *piix_devfn,
+                    ISABus **isa_bus, qemu_irq *pic,
+                    MemoryRegion *address_space_mem,
+                    MemoryRegion *address_space_io,
+                    ram_addr_t ram_size,
+                    ram_addr_t below_4g_mem_size,
+                    ram_addr_t above_4g_mem_size,
+                    MemoryRegion *pci_memory,
+                    MemoryRegion *ram_memory);
+
+PCIBus *find_i440fx(void);
+
+#endif
diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
index 6ed81b1f21..93975adbfe 100644
--- a/stubs/pci-host-piix.c
+++ b/stubs/pci-host-piix.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
+#include "hw/pci-host/i440fx.h"
+
 PCIBus *find_i440fx(void)
 {
     return NULL;
--=20
2.21.0


