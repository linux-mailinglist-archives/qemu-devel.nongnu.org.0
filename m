Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E0469409
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:40:44 +0100 (CET)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBQI-0005FJ-Ok
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:40:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBND-0001DE-T8
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:33 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:51413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBN9-0001nZ-BW
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3564CD012031;
 Mon,  6 Dec 2021 11:37:18 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a4db8c60-2690-480b-b6f8-c9d27995717b,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 06/15] ppc/ppc405: Change ppc405ep_init() return value
Date: Mon, 6 Dec 2021 11:37:03 +0100
Message-ID: <20211206103712.1866296-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd5a3096-5aad-4403-8504-253ee59eb155
X-Ovh-Tracer-Id: 16707791669684374380
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I will be useful to rework the boot from Linux.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        | 2 +-
 hw/ppc/ppc405_boards.c | 6 +++++-
 hw/ppc/ppc405_uc.c     | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4cb77aca5690..ad5f4026b5db 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -61,7 +61,7 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd);
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
 
-CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
+PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 2ac38c86a643..fcdb6d4cf8a0 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -145,6 +145,7 @@ static void ref405ep_init(MachineState *machine)
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
     ppc4xx_bd_info_t bd;
+    PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
@@ -180,8 +181,11 @@ static void ref405ep_init(MachineState *machine)
     memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
     ram_bases[1] = 0x00000000;
     ram_sizes[1] = 0x00000000;
-    env = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
+
+    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
+    env = &cpu->env;
+
     /* allocate SRAM */
     sram_size = 512 * KiB;
     memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 6806d6be31d5..4ad81695e80a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1391,7 +1391,7 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 #endif
 }
 
-CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
+PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
@@ -1490,5 +1490,5 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
     /* CPU control */
     ppc405ep_cpc_init(env, clk_setup, sysclk);
 
-    return env;
+    return cpu;
 }
-- 
2.31.1


