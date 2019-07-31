Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A87C492
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:14:06 +0200 (CEST)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspMj-0008Tu-HJ
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hspLl-0006kf-ED
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hspLk-0001dJ-Fj
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:05 -0400
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:57031)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hspLk-0001cl-Ax
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:04 -0400
Received: from player715.ha.ovh.net (unknown [10.109.159.224])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id B3C9D6467C
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 16:13:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 323B2850B7B3;
 Wed, 31 Jul 2019 14:12:57 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 31 Jul 2019 16:12:17 +0200
Message-Id: <20190731141233.1340-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731141233.1340-1-clg@kaod.org>
References: <20190731141233.1340-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11668263688295975910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.107
Subject: [Qemu-devel] [PATCH v3 02/18] tests/boot-serial-test: add support
 for all the PowerNV machines
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

Use the machine names specifiying the CPU type, POWER8 and POWER9.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/boot-serial-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 24852d4c7d0b..a54d007298f7 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -103,7 +103,8 @@ static testdef_t tests[] =3D {
     { "ppc64", "pseries",
       "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken",
       "Open Firmware" },
-    { "ppc64", "powernv", "-cpu POWER8", "OPAL" },
+    { "ppc64", "powernv8", "", "OPAL" },
+    { "ppc64", "powernv9", "", "OPAL" },
     { "ppc64", "sam460ex", "-device e1000", "8086  100e" },
     { "i386", "isapc", "-cpu qemu32 -device sga", "SGABIOS" },
     { "i386", "pc", "-device sga", "SGABIOS" },
--=20
2.21.0


