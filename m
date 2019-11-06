Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA4F1860
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 15:22:55 +0100 (CET)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSMD0-0005yG-N3
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 09:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iSMC1-0004t1-Sl
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iSMBw-0006US-E9
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:21:53 -0500
Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]:42292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iSMBw-0006Nw-8v
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:21:48 -0500
Received: from player159.ha.ovh.net (unknown [10.109.160.39])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BCC7C1998D7
 for <qemu-devel@nongnu.org>; Wed,  6 Nov 2019 15:21:38 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 46A0DBB9A564;
 Wed,  6 Nov 2019 14:21:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] ppc/pnv: Add a "/qemu" device tree node
Date: Wed,  6 Nov 2019 15:21:29 +0100
Message-Id: <20191106142129.4908-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15488160596396968934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.127.22
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It helps skiboot identifying that is running on a QEMU platform. The
compatible string will define the POWERPC processor version.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 627c08e5b985..4c3d5184126a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -479,6 +479,9 @@ static void *pnv_dt_create(MachineState *machine)
     fdt =3D g_malloc0(FDT_MAX_SIZE);
     _FDT((fdt_create_empty_tree(fdt, FDT_MAX_SIZE)));
=20
+    /* /qemu node */
+    _FDT((fdt_add_subnode(fdt, 0, "qemu")));
+
     /* Root node */
     _FDT((fdt_setprop_cell(fdt, 0, "#address-cells", 0x2)));
     _FDT((fdt_setprop_cell(fdt, 0, "#size-cells", 0x2)));
--=20
2.21.0


