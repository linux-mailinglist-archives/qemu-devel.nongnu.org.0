Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C35E8CAB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:41:59 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4Tm-0006rR-KM
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GR-0008TE-OL; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GQ-0001EO-5T; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3F67875A166;
 Sat, 24 Sep 2022 14:28:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 21E2775A15D; Sat, 24 Sep 2022 14:28:07 +0200 (CEST)
Message-Id: <19db326bea989c03e08f2853f789315bbe806fe9.1664021647.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 17/25] ppc440_uc.c: Remove unneeded parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 14:28:07 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unneeded parenthesis around case labels.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 0a41274d63..24623ebe0c 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -499,34 +499,34 @@ static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
     uint32_t bcr;
 
     switch (ram_size) {
-    case (8 * MiB):
+    case 8 * MiB:
         bcr = 0xffc0;
         break;
-    case (16 * MiB):
+    case 16 * MiB:
         bcr = 0xff80;
         break;
-    case (32 * MiB):
+    case 32 * MiB:
         bcr = 0xff00;
         break;
-    case (64 * MiB):
+    case 64 * MiB:
         bcr = 0xfe00;
         break;
-    case (128 * MiB):
+    case 128 * MiB:
         bcr = 0xfc00;
         break;
-    case (256 * MiB):
+    case 256 * MiB:
         bcr = 0xf800;
         break;
-    case (512 * MiB):
+    case 512 * MiB:
         bcr = 0xf000;
         break;
-    case (1 * GiB):
+    case 1 * GiB:
         bcr = 0xe000;
         break;
-    case (2 * GiB):
+    case 2 * GiB:
         bcr = 0xc000;
         break;
-    case (4 * GiB):
+    case 4 * GiB:
         bcr = 0x8000;
         break;
     default:
-- 
2.30.4


