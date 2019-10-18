Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F19DC6C3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:02:42 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLSq1-0001Vq-1D
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iLSfI-00073x-ME
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iLSfG-00075m-Gl
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:51:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51400)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iLSfG-00075T-8t
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:51:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F55F3073880;
 Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F5560BF1;
 Fri, 18 Oct 2019 13:51:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/20] hw/pci-host: Rename incorrectly named 'piix' as
 'i440fx'
Date: Fri, 18 Oct 2019 15:47:53 +0200
Message-Id: <20191018134754.16362-20-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 18 Oct 2019 13:51:33 +0000 (UTC)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

We moved all the PIIX3 southbridge code out of hw/pci-host/piix.c,
it now only contains i440FX northbridge code.
Rename it to match the chipset modelled.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                      | 2 +-
 hw/i386/Kconfig                  | 2 +-
 hw/pci-host/Kconfig              | 2 +-
 hw/pci-host/Makefile.objs        | 2 +-
 hw/pci-host/{piix.c =3D> i440fx.c} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename hw/pci-host/{piix.c =3D> i440fx.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4845f47d93..1bc9959b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1225,7 +1225,7 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: include/hw/i386/
 F: hw/i386/
-F: hw/pci-host/piix.c
+F: hw/pci-host/i440fx.c
 F: hw/pci-host/q35.c
 F: hw/pci-host/pam.c
 F: include/hw/pci-host/i440fx.h
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 589d75e26a..cfe94aede7 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -60,7 +60,7 @@ config I440FX
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
-    select PCI_PIIX
+    select PCI_I440FX
     select PIIX3
     select IDE_PIIX
     select DIMM
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 397043b289..b0aa8351c4 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -28,7 +28,7 @@ config PCI_SABRE
     select PCI
     bool
=20
-config PCI_PIIX
+config PCI_I440FX
     bool
     select PCI
     select PAM
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
index a9cd3e022d..efd752b766 100644
--- a/hw/pci-host/Makefile.objs
+++ b/hw/pci-host/Makefile.objs
@@ -13,7 +13,7 @@ common-obj-$(CONFIG_VERSATILE_PCI) +=3D versatile.o
=20
 common-obj-$(CONFIG_PCI_SABRE) +=3D sabre.o
 common-obj-$(CONFIG_FULONG) +=3D bonito.o
-common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
+common-obj-$(CONFIG_PCI_I440FX) +=3D i440fx.o
 common-obj-$(CONFIG_PCI_EXPRESS_Q35) +=3D q35.o
 common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) +=3D gpex.o
 common-obj-$(CONFIG_PCI_EXPRESS_XILINX) +=3D xilinx-pcie.o
diff --git a/hw/pci-host/piix.c b/hw/pci-host/i440fx.c
similarity index 100%
rename from hw/pci-host/piix.c
rename to hw/pci-host/i440fx.c
--=20
2.21.0


