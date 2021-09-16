Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58640ED0A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:01:37 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzRo-0002tX-Tc
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGk-0005sf-Iz
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGi-0002Sg-8n
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829006; x=1663365006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udY9w+NeiDp/mEpbscKWZmSK8L6Dbk1lDBcl4Yj5kHk=;
 b=SprjkFiJDRcSb0rJty/OmQxtF8aJxod5Da80DuPH+/Rmzn5eA0QBdjC0
 UFQpIypLGiU4YE8LgDjvdXK5I+VAu8Ri8/QIDni8tAcY3pEAn9VZ9YxM2
 FQ0zsOlGgOqou9Bvb1c2wZIjrGaAGLjn9ov5tNgFNyHD4ITXM+plLRx3S
 OnLZ0k+GrqAGwlazA+gMCWA6IGGbSIGGR+kaRE2ytjCg141XkwzjeBa0j
 PUAaR1EUDNuyCDfKvzFqwpBuQy3A2Kf5yIr7gLiKeGHv/m7TcZuc46cCz
 60AdQDZYiEiN9hqwJ7fpmTUYgNUViOsWxmqocffU/s2T5A9Xh3aJZ0aXH w==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="180214974"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:04 +0800
IronPort-SDR: NiJ0JgiWz861qs6pkIvjqMBo95REoAe/hE+6z9pYOhSKmOOKHsbzBAgtJr9YsJxRBWLpXeYNFW
 DaQ1zlo7LErFmW4cdVdp1OdXuo8HH8/0H+euPrP+dO/tq/yBuAdsV8k5f2DhUUJyYDdohzw+yj
 9RAS0WnmReUiTRWkXC9RVihT7ebV54v9edX2iUoqPJO0WyMmC1xpeyBEpnSt+RLQEAptayN2hE
 pznx4AqA4TX40uNRBRI16IswNLn26RWBeVxOwAi6SJ3DW9eeE/w4TA8W3VHZYil231xbQHZjLO
 tPTB7BaZNL+IsJZZhpdL/zV8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:26:25 -0700
IronPort-SDR: FjoQFeBElx/i9DGyzlr/9M7iHMMJArD5W1zL1vPX4aU+bX2CQnB4aQBnOW6lBaBHzp570McKOg
 vfzvtDbAtXMcgder/oYCTTYE2aokgAtloWEI4SFwYEfBmIeQzsLCj5PpJIC3mfT1cMWq0kxwUj
 D1EPNIjvI7Tee/iaBh/eF0DwHcIpaPIAeBdWKaob1YEnvEYsb/ITtuvpfDB8jrG3HHLHlAleVZ
 nxKVxM4u5fnQSnI1Tu5fl+dS7afNAB64dgS5N+vvWWkeOa1uASl9A65KedeQqd5JtX11eL/NPT
 rLQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3120TRz1Rws0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829003; x=1634421004; bh=udY9w+NeiDp/mEpbsc
 KWZmSK8L6Dbk1lDBcl4Yj5kHk=; b=I2sJ+ymM/AKbTINc/cqlkjqMCRYf+8+6ox
 6iqnciYItYluOAmbpTIoomwTh7cun27p1bzvvJbb1C48Dc3ckMurAPwwlCgfb/52
 crhXpoyZ7cMBnn+41o8s6H0yWCe+xGv2D22UVAybKfXiiqe0jve/n/Nex+yIesnO
 M1+SIsTqFUYJV6vugSh5zmIAUsXX7OFoLNCle6fPZzWk212f9KedIRSJk235wqku
 /9AvE4k0dCCN6JPyOcO0splqXCSiMlKf1SehMcyKJPvyzPZzgN/U58+QBtmbuXOR
 VbZMgtckIAIfdzveAPYO8FeQS23gmnrZEzFLw+9iJyfKXLkhiDDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K_wkH47H79hN for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2v3nhSz1RvlV;
 Thu, 16 Sep 2021 14:49:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 10/21] hw/intc: Rename sifive_clint sources to riscv_aclint
 sources
Date: Fri, 17 Sep 2021 07:48:53 +1000
Message-Id: <20210916214904.734206-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
implementation so let's first rename the sources.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210831110603.338681-2-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/{sifive_clint.h =3D> riscv_aclint.h} |  0
 hw/intc/{sifive_clint.c =3D> riscv_aclint.c}         |  2 +-
 hw/riscv/microchip_pfsoc.c                         |  2 +-
 hw/riscv/shakti_c.c                                |  2 +-
 hw/riscv/sifive_e.c                                |  2 +-
 hw/riscv/sifive_u.c                                |  2 +-
 hw/riscv/spike.c                                   |  2 +-
 hw/riscv/virt.c                                    |  2 +-
 hw/intc/Kconfig                                    |  2 +-
 hw/intc/meson.build                                |  2 +-
 hw/riscv/Kconfig                                   | 12 ++++++------
 11 files changed, 15 insertions(+), 15 deletions(-)
 rename include/hw/intc/{sifive_clint.h =3D> riscv_aclint.h} (100%)
 rename hw/intc/{sifive_clint.c =3D> riscv_aclint.c} (99%)

diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/riscv_aclin=
t.h
similarity index 100%
rename from include/hw/intc/sifive_clint.h
rename to include/hw/intc/riscv_aclint.h
diff --git a/hw/intc/sifive_clint.c b/hw/intc/riscv_aclint.c
similarity index 99%
rename from hw/intc/sifive_clint.c
rename to hw/intc/riscv_aclint.c
index ab172d8e40..31ce990d0e 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/riscv_aclint.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
 #include "hw/qdev-properties.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
=20
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eef55f69fd..eed9e81355 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -49,7 +49,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/microchip_pfsoc.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 09d4e1433e..f9f0a45651 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -21,7 +21,7 @@
 #include "hw/riscv/shakti_c.h"
 #include "qapi/error.h"
 #include "hw/intc/sifive_plic.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 04265c5640..a73848958e 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -41,7 +41,7 @@
 #include "hw/riscv/sifive_e.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f4cde10667..aaab46c43c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -52,7 +52,7 @@
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "chardev/char.h"
 #include "net/eth.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index aae36f2cb4..690c19c12a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -35,7 +35,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/char/riscv_htif.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 47f1beb473..df33fd74c2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,7 +32,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index f4694088a4..78aed93c45 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -62,7 +62,7 @@ config RX_ICU
 config LOONGSON_LIOINTC
     bool
=20
-config SIFIVE_CLINT
+config RISCV_ACLINT
     bool
=20
 config SIFIVE_PLIC
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 4dcfea6aa8..a1d00aa48d 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@ specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('=
rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_=
kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
-specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clin=
t.c'))
+specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclin=
t.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.=
c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d56c339ef6..d2d869aaad 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -12,7 +12,7 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
     select UNIMP
@@ -26,7 +26,7 @@ config SHAKTI_C
     bool
     select UNIMP
     select SHAKTI_UART
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
=20
 config RISCV_VIRT
@@ -41,7 +41,7 @@ config RISCV_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
     select SERIAL
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
@@ -50,7 +50,7 @@ config RISCV_VIRT
 config SIFIVE_E
     bool
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
     select SIFIVE_UART
@@ -61,7 +61,7 @@ config SIFIVE_U
     bool
     select CADENCE
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -79,5 +79,5 @@ config SPIKE
     select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
--=20
2.31.1


