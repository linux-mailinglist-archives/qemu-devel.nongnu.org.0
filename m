Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88846941D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:46:33 +0100 (CET)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBVw-0007gO-Go
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNF-0001ER-Rt
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:35 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:43365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNA-0001o0-KN
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F189420738;
 Mon,  6 Dec 2021 10:37:18 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00143f7f68a-cf25-4c9f-a3b9-b8ca97cfbc30,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 07/15] ppc/ppc405: Add some address space definitions
Date: Mon, 6 Dec 2021 11:37:04 +0100
Message-ID: <20211206103712.1866296-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3557607f-fb72-42d6-9f35-331d39e353b0
X-Ovh-Tracer-Id: 16707791669302954860
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        |  7 +++++++
 hw/ppc/ppc405_boards.c | 16 +++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ad5f4026b5db..ea48c3626908 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -27,6 +27,13 @@
 
 #include "hw/ppc/ppc4xx.h"
 
+#define PPC405EP_SDRAM_BASE 0x00000000
+#define PPC405EP_NVRAM_BASE 0xF0000000
+#define PPC405EP_FPGA_BASE  0xF0300000
+#define PPC405EP_SRAM_BASE  0xFFF00000
+#define PPC405EP_SRAM_SIZE  (512 * KiB)
+#define PPC405EP_FLASH_BASE 0xFFF80000
+
 /* Bootinfo as set-up by u-boot */
 typedef struct ppc4xx_bd_info_t ppc4xx_bd_info_t;
 struct ppc4xx_bd_info_t {
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index fcdb6d4cf8a0..60dc81fa4880 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -154,7 +154,6 @@ static void ref405ep_init(MachineState *machine)
     ram_addr_t bdloc;
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    target_ulong sram_size;
     long bios_size;
     //int phy_addr = 0;
     //static int phy_addr = 1;
@@ -187,10 +186,9 @@ static void ref405ep_init(MachineState *machine)
     env = &cpu->env;
 
     /* allocate SRAM */
-    sram_size = 512 * KiB;
-    memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
+    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, 0xFFF00000, sram);
+    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
     /* allocate and load BIOS */
 #ifdef USE_FLASH_BIOS
     dinfo = drive_get(IF_PFLASH, 0, 0);
@@ -230,24 +228,24 @@ static void ref405ep_init(MachineState *machine)
         }
     }
     /* Register FPGA */
-    ref405ep_fpga_init(sysmem, 0xF0300000);
+    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
     /* Register NVRAM */
     dev = qdev_new("sysbus-m48t08");
     qdev_prop_set_int32(dev, "base-year", 1968);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, 0xF0000000);
+    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
     /* Load kernel */
     linux_boot = (kernel_filename != NULL);
     if (linux_boot) {
         memset(&bd, 0, sizeof(bd));
-        bd.bi_memstart = 0x00000000;
+        bd.bi_memstart = PPC405EP_SDRAM_BASE;
         bd.bi_memsize = machine->ram_size;
         bd.bi_flashstart = -bios_size;
         bd.bi_flashsize = -bios_size;
         bd.bi_flashoffset = 0;
-        bd.bi_sramstart = 0xFFF00000;
-        bd.bi_sramsize = sram_size;
+        bd.bi_sramstart = PPC405EP_SRAM_BASE;
+        bd.bi_sramsize = PPC405EP_SRAM_SIZE;
         bd.bi_bootflags = 0;
         bd.bi_intfreq = 133333333;
         bd.bi_busfreq = 33333333;
-- 
2.31.1


