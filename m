Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48E46CDB3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 13:55:31 +0200 (CEST)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho50U-0005jz-HL
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58638)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1ho4zq-00042L-3U
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ho4zn-0001W7-VE
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:49 -0400
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:37576)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ho4zn-0001Tx-PW
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:47 -0400
Received: from player778.ha.ovh.net (unknown [10.109.143.208])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 9729F13B799
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:54:45 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id E42BE801F262;
 Thu, 18 Jul 2019 11:54:39 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:54:05 +0200
Message-Id: <20190718115420.19919-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718115420.19919-1-clg@kaod.org>
References: <20190718115420.19919-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6774821216336710630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.230
Subject: [Qemu-devel] [PATCH v2 02/17] ppc/pnv: add more dummy XSCOM
 addresses for the P9 CAPP
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_xscom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index 2b81c75f5654..3efa9c8fa13f 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -107,6 +107,16 @@ static uint64_t xscom_read_default(PnvChip *chip, ui=
nt32_t pcba)
     case 0x201302a:     /* CAPP stuff */
     case 0x2013801:     /* CAPP stuff */
     case 0x2013802:     /* CAPP stuff */
+
+        /* P9 CAPP regs */
+    case 0x2010841:
+    case 0x2010842:
+    case 0x201082a:
+    case 0x2010828:
+    case 0x4010841:
+    case 0x4010842:
+    case 0x401082a:
+    case 0x4010828:
         return 0;
     default:
         return -1;
@@ -139,6 +149,16 @@ static bool xscom_write_default(PnvChip *chip, uint3=
2_t pcba, uint64_t val)
     case 0x2013801:     /* CAPP stuff */
     case 0x2013802:     /* CAPP stuff */
=20
+        /* P9 CAPP regs */
+    case 0x2010841:
+    case 0x2010842:
+    case 0x201082a:
+    case 0x2010828:
+    case 0x4010841:
+    case 0x4010842:
+    case 0x401082a:
+    case 0x4010828:
+
         /* P8 PRD registers */
     case PRD_P8_IPOLL_REG_MASK:
     case PRD_P8_IPOLL_REG_STATUS:
--=20
2.21.0


