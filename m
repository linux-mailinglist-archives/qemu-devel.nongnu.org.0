Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65B14013
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 16:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNHqc-0006aT-P6
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 10:10:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeC-0004LX-Jy
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeB-0004qI-F1
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe8-0004nr-RG; Sun, 05 May 2019 09:57:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 294C7308338E;
	Sun,  5 May 2019 13:57:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D46360C18;
	Sun,  5 May 2019 13:57:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:01 +0200
Message-Id: <20190505135714.11277-16-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 05 May 2019 13:57:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/28] hw/arm: Express dependencies of the virt
 machine with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dependencies have been determined by looking at hw/arm/virt.c

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  1 -
 default-configs/arm-softmmu.mak     | 11 +----------
 hw/arm/Kconfig                      | 19 +++++++++++++++++++
 hw/arm/Makefile.objs                |  3 ++-
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 4ea9add003..313490fb38 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -9,4 +9,3 @@ CONFIG_DPCD=3Dy
 CONFIG_XLNX_ZYNQMP=3Dy
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
-CONFIG_ARM_SMMUV3=3Dy
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2580584281..f440a2b1cd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
 # CONFIG_PCI_DEVICES=3Dn
 # CONFIG_TEST_DEVICES=3Dn
=20
+CONFIG_ARM_VIRT=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
@@ -32,8 +33,6 @@ CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
-CONFIG_PLATFORM_BUS=3Dy
-CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
@@ -68,9 +67,6 @@ CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
 CONFIG_ARMSSE_MHU=3Dy
=20
-CONFIG_PCI_EXPRESS=3Dy
-CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
@@ -86,10 +82,5 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_ACPI=3Dy
-CONFIG_ARM_VIRT=3Dy
-CONFIG_SMBIOS=3Dy
-CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
-CONFIG_FW_CFG_DMA=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 95ac0b540e..2b63adb667 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,6 +1,24 @@
 config ARM_VIRT
     bool
+    imply PCI_DEVICES
+    imply TEST_DEVICES
+    imply VFIO_AMD_XGBE
     imply VFIO_PLATFORM
+    imply VFIO_XGMAC
+    select A15MPCORE
+    select ACPI
+    select ARM_SMMUV3
+    select GPIO_KEY
+    select FW_CFG_DMA
+    select PCI_EXPRESS
+    select PCI_EXPRESS_GENERIC_BRIDGE
+    select PFLASH_CFI01
+    select PL011 # UART
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PLATFORM_BUS
+    select SMBIOS
+    select VIRTIO_MMIO
=20
 config CHEETAH
     bool
@@ -299,6 +317,7 @@ config A9MPCORE
=20
 config A15MPCORE
     bool
+    select ARM_GIC
=20
 config ARM11MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 729e711b87..4f591ca487 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y +=3D boot.o sysbus-fdt.o
+obj-y +=3D boot.o
+obj-$(CONFIG_PLATFORM_BUS) +=3D sysbus-fdt.o
 obj-$(CONFIG_ARM_VIRT) +=3D virt.o
 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
 obj-$(CONFIG_DIGIC) +=3D digic_boards.o
--=20
2.21.0


