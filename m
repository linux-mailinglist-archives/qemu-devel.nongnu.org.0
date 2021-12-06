Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3599469433
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:49:09 +0100 (CET)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBYS-0003f6-QO
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNG-0001Eg-UN
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:35 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:46469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNC-0001q2-VD
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 228C320B4C;
 Mon,  6 Dec 2021 10:37:23 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00195625a74-6cd8-4ae7-88d9-84e40151eb56,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 14/15] ppc/ppc405: Add update of bi_procfreq field
Date: Mon, 6 Dec 2021 11:37:11 +0100
Message-ID: <20211206103712.1866296-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41d1fdeb-096e-44d4-bcd3-4b0502cb3f12
X-Ovh-Tracer-Id: 16708917571276409708
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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

Adapt the fields offset in the board information for Linux. Since
Linux relies on the CPU frequency value, I wonder how it ever worked.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_uc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 2a1e2d71b08b..ec97b22bd019 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -102,12 +102,13 @@ static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
     for (i = 0; i < 32; i++) {
         stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
     }
-    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_plb_busfreq);
-    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_pci_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
+    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
     for (i = 0; i < 6; i++) {
-        stb_phys(cs->as, bdloc + 0x64 + i, bd->bi_pci_enetaddr[i]);
+        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
     }
-    n = 0x6A;
+    n = 0x70; /* includes 2 bytes hole */
     for (i = 0; i < 6; i++) {
         stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
     }
-- 
2.31.1


