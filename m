Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6A4F71DB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 04:07:46 +0200 (CEST)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncHYn-00080N-4F
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 22:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWK-00052c-El
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:21873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWI-0007Ng-3S
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297109; x=1680833109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6W9Q3f9HKhqO8NzY38idQYoPrAEDcxn3lMCoVDZrHmY=;
 b=CbTCCihvSzojxy2O6jmXQqN+hgnuYd4f6ygLQVn54Vxba0SHxr/e8ylm
 dmsWUI6Do7otAlJiHO8pU4RztcET8yKJ4r9frofaUqEPMK5Wt7DCV80pA
 Q9bb74sLzwkpafd38Onjkc9D/Qp0wiTEAaaSpdAG4p4hOls3dJuQ4yyYx
 L64RcZwTEuMA0Wolug6YMwEyi7p5fZAv2PmlSRi+97el5BrfgfAScMBNO
 7SofrFbvcCcawy+IkiwxiwH9JhythS3FxD2EHPOq94NUpH0JfkdWUgfn9
 MUwF8A+Gc0i/H8jWrU7rajumAOB5RMbYCnYDzcT+1RDzuH5oL6QvPxZOD g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="196170950"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:05:06 +0800
IronPort-SDR: N4RH4Rzf99BpGsPCnuH7JYFdQRkYPt52DRWhuSy1xUHslc+TXKWY1Z64cW1ICYwit7vsAX+4sA
 SrldPlGWPS6J3doyx5sCAg2WaeMyr4m2naiUrZ//+Fl9GPURlHhXCsoLYpoZId7e5nH4ihCx/y
 umC6kEzH57G/JU5QVHY4B5VYr1D3BVb3W9eHe/mNZxDxhtkSif7vOEUFTHB2fgUL84N8vQcynN
 gelJhFJ0oBwW/uLKDhkOfYbe8ThpfiGEjI66iE21aIyA260UsYpuOLrzp4p3m9UAdaA6jTrwvd
 e6a0+JGGTvJl3vHYuinyznEV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:35:47 -0700
IronPort-SDR: FR57G39Fhzh7BC2QQIw+55vfKU4vvAMfcMojYdlSVlTwzMxJ5938kfdf0TCZa3bb4RDk6EZGxx
 yJkVx7q8k3JqeiQGS54WldB3yLDHrlM7w53xBkHGI10q70ibtq20fiH6TL84kuN2Yt7gfy1ct3
 gkV4njkjJen4R/tj8BSH7i+FZTSIUw5NJlHFSpnupjYxAZVblipye9sqlia6VOS2ZPzLRDsHBE
 PdqQfXi9HpxatfdBd7YqJTbaCvW+d5Yf3EmJgY+R4qpQDYdarai0+KP9Eux9McjUl317FBTBaE
 jik=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:05:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl8150rfz1SVpB
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:05:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297104; x=1651889105; bh=6W9Q3f9HKhqO8NzY38
 idQYoPrAEDcxn3lMCoVDZrHmY=; b=LABEiFNPH+c0UMZ+1HZt+6t0585apyLdro
 xU+W4IWH9WaSFtUbvH0Nnlu3zn/uUMGYV8d+It4mc2/BxBR2/BjjAQRYaH2ADzwZ
 4ZtMUdxXn+2ZvA++eayPvtIHBaVinatimbfCEy7l4SfmqhK7NRZL+389jZnOItW0
 nvUKNbIuNV72FRMFtGAlqEu9LGKJWdli1S3gfJzuSS8KBuzWa4D9mUlJnC+MZt2o
 XgF7911H73u88c7OLu7DS2OezCnPWESOrLFck8aM9+aNuhD4ZoL9SMuctHTjalQj
 b3UXV5lVEpprfq5GhvqCxnqneK9uM6y7e16Jj0rQJN1S+1vf1T7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JCAE0drOecEh for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:05:04 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7v1jHdz1Rvlx;
 Wed,  6 Apr 2022 19:04:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 4/6] hw/riscv: virt: Add support for generateing platform
 FDT entries
Date: Thu,  7 Apr 2022 12:04:30 +1000
Message-Id: <20220407020432.4062829-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b066725be6..eba8495e9a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -411,6 +412,12 @@ static void create_fdt_socket_aclint(RISCVVirtState =
*s,
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
         riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+
+        platform_bus_add_all_fdt_nodes(mc->fdt, name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+
         g_free(name);
     }
=20
@@ -469,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(plic_name);
=20
     g_free(plic_cells);
@@ -546,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
@@ -683,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
s,
         VIRT_IRQCHIP_NUM_SOURCES);
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(aplic_name);
=20
     g_free(aplic_cells);
--=20
2.35.1


