Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45497469453
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:51:51 +0100 (CET)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBb4-0008Bv-DP
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNI-0001HW-9u
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:38 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNC-0001q5-UU
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4230320B48;
 Mon,  6 Dec 2021 10:37:23 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00170d226a3-ff28-441a-bc63-b7d88367b794,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 15/15] ppc/ppc405: Update U-Boot board information for hotfoot
Date: Mon, 6 Dec 2021 11:37:12 +0100
Message-ID: <20211206103712.1866296-16-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 169b65f2-077b-4d62-89be-4e6a71dedbb0
X-Ovh-Tracer-Id: 16709199043780381548
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedugedvtdevuedvveethffgffetfeekfefggeekfeeugfevlefhveeivddvtddtheenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When support for the ESTeem 195E (PPC405EP) SBC (hotfoot) board was
added to Linux, a different layout of U-Boot board information was
introduced because the FW of these boards was an ancient U-Boot
without dual ethernet support [1].

Change the QEMU PPC405 board information to match the hotfoot board
and let the ref405ep machine boot from Linux directly. Only the CPU
frequency is required.

This is brutal force. We could possibly add a machine option or a
ref405ep machine class to update the board information accordingly.

A similar change would be required in U-Boot. The alternative is to
change Linux.

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_uc.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ec97b22bd019..649bb2b0daf5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -41,6 +41,49 @@
 #include "qapi/error.h"
 #include "trace.h"
 
+/*
+ * Linux hotfoot board information based on a production bootloader
+ * (u-boot 1.2.0.x) plus changes not upstream.
+ *
+ * https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
+ */
+struct linux_hotfoot_bd_info {
+    long unsigned int          bi_memstart;          /*     0     4 */
+    long unsigned int          bi_memsize;           /*     4     4 */
+    long unsigned int          bi_flashstart;        /*     8     4 */
+    long unsigned int          bi_flashsize;         /*    12     4 */
+    long unsigned int          bi_flashoffset;       /*    16     4 */
+    long unsigned int          bi_sramstart;         /*    20     4 */
+    long unsigned int          bi_sramsize;          /*    24     4 */
+    long unsigned int          bi_bootflags;         /*    28     4 */
+    long unsigned int          bi_ip_addr;           /*    32     4 */
+    unsigned char              bi_enetaddr[6];       /*    36     6 */
+    unsigned char              bi_enet1addr[6];      /*    42     6 */
+    short unsigned int         bi_ethspeed;          /*    48     2 */
+    long unsigned int          bi_intfreq;           /*    52     4 */
+    long unsigned int          bi_busfreq;           /*    56     4 */
+    long unsigned int          bi_baudrate;          /*    60     4 */
+    unsigned char              bi_s_version[4];      /*    64     4 */
+    unsigned char              bi_r_version[32];     /*    68    32 */
+    unsigned int               bi_procfreq;          /*   100     4 */
+    unsigned int               bi_plb_busfreq;       /*   104     4 */
+    unsigned int               bi_pci_busfreq;       /*   108     4 */
+    unsigned char              bi_pci_enetaddr[6];   /*   112     6 */
+    unsigned int               bi_pllouta_freq;      /*   120     4 */
+    int                        bi_phynum[2];         /*   124     8 */
+    int                        bi_phymode[2];        /*   132     8 */
+    unsigned int               bi_opbfreq;           /*   140     4 */
+    int                        bi_iic_fast[2];       /*   144     8 */
+};
+
+static void ppc405_fixup_bootinfo(CPUState *cs, ppc4xx_bd_info_t *bd,
+                                  ram_addr_t bdloc)
+{
+    stl_be_phys(cs->as,
+                bdloc + offsetof(struct linux_hotfoot_bd_info, bi_procfreq),
+                bd->bi_procfreq);
+}
+
 static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
                                         ram_addr_t ram_size)
 {
@@ -119,6 +162,8 @@ static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
         n += 4;
     }
 
+    ppc405_fixup_bootinfo(cs, bd, bdloc);
+
     return bdloc;
 }
 
-- 
2.31.1


