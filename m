Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A6469414
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:44:28 +0100 (CET)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBTv-0003BQ-Hg
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNF-0001EF-QH
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:35 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:49355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNA-0001o2-RN
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 97FFC20AA2;
 Mon,  6 Dec 2021 10:37:19 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014dd935e5-f980-443f-a263-17cace8f080c,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 08/15] ppc/ppc405: Remove flash support
Date: Mon, 6 Dec 2021 11:37:05 +0100
Message-ID: <20211206103712.1866296-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 043f4938-5087-4938-bba2-8d93a295f58b
X-Ovh-Tracer-Id: 16708073146535152492
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

It is currently impossible to find a "ppc405_rom.bin" firmware file or
a full flash image for the PPC405EP evalution board. Even if it should
be technically possible to recreate such an image, it's unlikely that
anyone will do it since the board is obsolete and support in QEMU has
been broken for about 10 years.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 60dc81fa4880..a385e8f15070 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -161,7 +161,6 @@ static void ref405ep_init(MachineState *machine)
     long kernel_size, initrd_size;
     int linux_boot;
     int len;
-    DriveInfo *dinfo;
     MemoryRegion *sysmem = get_system_memory();
     DeviceState *uicdev;
 
@@ -189,19 +188,8 @@ static void ref405ep_init(MachineState *machine)
     memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
                            &error_fatal);
     memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
+
     /* allocate and load BIOS */
-#ifdef USE_FLASH_BIOS
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (dinfo) {
-        bios_size = 8 * MiB;
-        pflash_cfi02_register((uint32_t)(-bios_size),
-                              "ef405ep.bios", bios_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
-                              2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
-                              1);
-    } else
-#endif
     {
         bios = g_new(MemoryRegion, 1);
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
-- 
2.31.1


