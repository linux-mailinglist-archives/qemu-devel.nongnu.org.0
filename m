Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3F51419F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:57:16 +0200 (CEST)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIgt-0007os-ED
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJX-0000qE-6o
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:07 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJV-0002Vn-4Y
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206784; x=1682742784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMvhzjP33T7xIROc0EDvNgWvDh5V11g6NR3Rxqg6zMY=;
 b=i7M2FavNOyRl8ukvCLwFaevRpEbznQaOqITuD/k5u1qhYjFDLRc9WETd
 pbzRybLBE1tk1it0/VGFfXcFYGyyibXsT/eS8CquYJWlrTZ92AmBz8ogy
 DRGdp1uXcv7EcGMotLIRL7lEffb9n5FC7+z4ASRneh8OCCWhBdg3TvKTT
 BLScQ4LkTN5OpUuee+HnV0i2HHGHtvabYRXpFZuil+EPjoA91t5z1HY15
 KXTw8X74ScdGgLaBMFVXB+Roi6mfVs61gqaxra8XYXgLqjzHCawlnLQL+
 V3qTsJp7GnpfcJhaT6TJXnC184c9Qk5J8JCrkPK2+8mQvck06U6yBHJbN g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995993"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:45 +0800
IronPort-SDR: p2ec4Su9RP1xU634R26nYRPF5T6fytaW0gh7vyo+Eeifi6EUdCudOG3CXBnPW5TudLSYbtPnJW
 uEuWJibtlSFH8kKCKMxYbMb98nykgyNoymZfwGawhaKHCTYQYqxTT9H8+A4chnwZdATivUoPP0
 vsbCX2z0uZJlVkWr8Imc6EwJM0KDU4p48+v7q6cxJ6E0+kWmpCjjddxIY0hO3u1ph0Gn99snMp
 4lQeBm0BYduEu2JwvicgYzSQGW3gBJJEJpH1arv183XCoWf1MkiU+/yCWsTFNh7B4HcZBk6tdw
 UtAtcq6R6rspV8cU0THeRq3w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:53 -0700
IronPort-SDR: 0/LNmLGFxHTVnMySBC537I4hi0EGVgck9jp8lH4hBkZHvJmRTl01NxzaB7W7ckkTM9MQnjfEYI
 9I+lxJe6tLJy3nFFhPLFSAJGHPE/eqMfAQRUxD4vXfBBbV1BH4WTB0NxOvQlgUuoz1CviuUEql
 Scmom0nwg4E0bDpvxQg8IfxH7RcP/gLR5jEXmePbQdXcNjhU17NaUwk2u8QQQCahF86Y9jHz3+
 51/mglCLNV9gdN9m0NfCNXGPlvRWZQbUrV58jL9NWdpGqFCysYQfcHqMjzdLDcSPyaiYX4BGtc
 TxI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKNF3j3xz1SVny
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206764; x=1653798765; bh=oMvhzjP33T7xIROc0E
 DvNgWvDh5V11g6NR3Rxqg6zMY=; b=dvF0WfanrASsTJLb0tB8U+/B/FJ8SbW+8C
 i69cwaTIb8Sqo/zREbsVdVdK4a3bf4YiNoJNT8fuwnqtcR2lQyloy8g9I1HiL2px
 O74uilnXTu56KhtoKak5rUDIVWLjKEeW4E28an6iG45oZh1gf+XCyB1t2X53wff1
 nRpHZmGubjZqjZ/oeZL/dOJw6JPoM8SPMH9vWMv5yfsld833hvXb3pA3OxQQiLuJ
 6rVtP93edK88lmq1K9TKuZlQBw5far/2SFIevTUPSdfnwo66cqYGePcNvTq3I5kh
 Bwdc4mLO42pn1XhLwEylJtOxIFAOj+1OuNPT32apkmxX6Q5cjOyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CNBzX28R2tK5 for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:44 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKNB4RdNz1Rwrw;
 Thu, 28 Apr 2022 21:32:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 21/25] hw/core: Move the ARM sysbus-fdt to core
Date: Fri, 29 Apr 2022 14:31:15 +1000
Message-Id: <20220429043119.1478881-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220427234146.1130752-3-alistair.francis@opensource.wdc.com=
>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/{arm =3D> core}/sysbus-fdt.h | 0
 hw/arm/virt.c                         | 2 +-
 hw/arm/xlnx-versal-virt.c             | 1 -
 hw/{arm =3D> core}/sysbus-fdt.c         | 2 +-
 hw/arm/meson.build                    | 1 -
 hw/core/meson.build                   | 1 +
 6 files changed, 3 insertions(+), 4 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

diff --git a/include/hw/arm/sysbus-fdt.h b/include/hw/core/sysbus-fdt.h
similarity index 100%
rename from include/hw/arm/sysbus-fdt.h
rename to include/hw/core/sysbus-fdt.h
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5bdd98e4a1..f94278935f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,7 +56,7 @@
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/fdt.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 66a2de7e13..37fc9b919c 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -15,7 +15,6 @@
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
-#include "hw/arm/sysbus-fdt.h"
 #include "hw/arm/fdt.h"
 #include "cpu.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/sysbus-fdt.c b/hw/core/sysbus-fdt.c
similarity index 99%
rename from hw/arm/sysbus-fdt.c
rename to hw/core/sysbus-fdt.c
index 48c5fe9bf1..19d22cbe73 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -27,7 +27,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/tpm.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..122e5dd992 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,5 @@
 arm_ss =3D ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
-arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 0f884d6fd4..7a4d02b6c0 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('p=
timer.c'))
 softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c=
'))
=20
 softmmu_ss.add(files(
   'cpu-sysemu.c',
--=20
2.35.1


