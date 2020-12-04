Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB112CE423
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 01:13:08 +0100 (CET)
Received: from localhost ([::1]:52872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkyiX-0003BM-SM
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 19:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkyhL-0002jt-4U; Thu, 03 Dec 2020 19:11:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42047 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkyhG-0002fN-IU; Thu, 03 Dec 2020 19:11:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnCmW2SFpz9sT5; Fri,  4 Dec 2020 11:11:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607040683;
 bh=5PVj7aTBp/UQbACl9n8leWtBs2wo9gaSe2yHYOYkkBc=;
 h=From:To:Cc:Subject:Date:From;
 b=DKzs+jlYyhQhdzS5v0CRxKAurxw2DcbzC4hwxqDeosEezxtNxj8g7pHCfLmGwFqfS
 ec5u0tKyyinQYGnTKAezBJgvGEvWN0J6/BQuRePct+CS5c5j+jMpwLcUsE+WVfZxaA
 sb2dcgE/zn2VxwvvXD/mktTzaiwQs+/2u0WZkCU4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org,
	qemu-ppc@nongnu.org
Subject: [for-6.0] MAINTAINERS: Add Greg Kurz as co-maintainer for ppc
Date: Fri,  4 Dec 2020 11:11:13 +1100
Message-Id: <20201204001113.271220-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, lvivier@redhat.com, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg has agreed to be co-maintainer of the ppc target and machines.
This should avoid repeats of the problem we had in qemu-5.2 where a
last minute fix was needed while I was on holiday.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

I've also applied this change to my ppc-for-6.0 branch.

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41..bb7e3b3203 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -272,6 +272,7 @@ F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: target/ppc/
@@ -394,6 +395,7 @@ F: target/mips/kvm.c
 
 PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 S: Maintained
 F: target/ppc/kvm.c
 
@@ -1183,18 +1185,21 @@ PowerPC Machines
 ----------------
 405
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc405_boards.c
 
 Bamboo
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc440_bamboo.c
 
 e500
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/e500*
@@ -1208,6 +1213,7 @@ F: pc-bios/u-boot.e500
 
 mpc8544ds
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mpc8544ds.c
@@ -1216,6 +1222,7 @@ F: hw/ppc/mpc8544_guts.c
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_newworld.c
@@ -1235,6 +1242,7 @@ F: pc-bios/qemu_vga.ndrv
 Old World (g3beige)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_oldworld.c
@@ -1248,6 +1256,8 @@ F: pc-bios/qemu_vga.ndrv
 
 PReP
 M: Hervé Poussineau <hpoussin@reactos.org>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/prep.c
@@ -1264,6 +1274,7 @@ F: tests/acceptance/ppc_prep_40p.py
 
 sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/spapr*
@@ -1281,6 +1292,7 @@ F: tests/qtest/libqos/rtas*
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/pnv*
@@ -1300,6 +1312,8 @@ F: hw/ppc/virtex_ml507.c
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/sam460ex.c
@@ -2078,8 +2092,9 @@ F: tests/qtest/fw_cfg-test.c
 T: git https://github.com/philmd/qemu.git fw_cfg-next
 
 XIVE
-M: David Gibson <david@gibson.dropbear.id.au>
 M: Cédric Le Goater <clg@kaod.org>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/*xive*
-- 
2.28.0


