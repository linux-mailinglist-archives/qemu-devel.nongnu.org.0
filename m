Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F12D9280
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:14:24 +0100 (CET)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogBj-0001W9-Dj
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwa-0005Qc-Bk; Sun, 13 Dec 2020 23:58:44 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:33115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwY-0004tU-AC; Sun, 13 Dec 2020 23:58:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs6WJ7z9sWc; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=MhMWjltdTFWaFvd7Ij8N125v2qm04KbtJWvbQQxX79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bPXNGos7ROmxuBcUnvpAytj0yUPeFkoHYgTmSOzXJyqpD9notar9WRgtHEpZVCsm0
 pSC85TWzc12UJxkSA5bhAlSYii92QZfwvRVW4ua2lnzUP95APfE+KQ5tvth+os88f5
 Wfm1i7rV0mHVD5KJWb4z0IQrOh7G2EbuMLYLfujU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/30] MAINTAINERS: Add Greg Kurz as co-maintainer for ppc
Date: Mon, 14 Dec 2020 15:58:00 +1100
Message-Id: <20201214045807.41003-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg has agreed to be co-maintainer of the ppc target and machines.
This should avoid repeats of the problem we had in qemu-5.2 where a
last minute fix was needed while I was on holiday.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Greg Kurz <groug@kaod.org>
---
 MAINTAINERS | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48a4e8a8b..4663c143c3 100644
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
 
@@ -1184,18 +1186,21 @@ PowerPC Machines
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
@@ -1209,6 +1214,7 @@ F: pc-bios/u-boot.e500
 
 mpc8544ds
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mpc8544ds.c
@@ -1217,6 +1223,7 @@ F: hw/ppc/mpc8544_guts.c
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_newworld.c
@@ -1236,6 +1243,7 @@ F: pc-bios/qemu_vga.ndrv
 Old World (g3beige)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_oldworld.c
@@ -1249,6 +1257,8 @@ F: pc-bios/qemu_vga.ndrv
 
 PReP
 M: Hervé Poussineau <hpoussin@reactos.org>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/prep.c
@@ -1265,6 +1275,7 @@ F: tests/acceptance/ppc_prep_40p.py
 
 sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/spapr*
@@ -1282,6 +1293,7 @@ F: tests/qtest/libqos/rtas*
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
 M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/pnv*
@@ -1301,6 +1313,8 @@ F: hw/ppc/virtex_ml507.c
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/sam460ex.c
@@ -2088,8 +2102,9 @@ F: tests/qtest/fw_cfg-test.c
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
2.29.2


