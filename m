Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96A114758
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 19:54:04 +0100 (CET)
Received: from localhost ([::1]:59732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icwGJ-0002Ow-1X
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 13:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1icw88-0005y9-Ct
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1icw86-00012C-IL
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:35 -0500
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:44119)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1icw86-0000xH-1I
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 13:45:34 -0500
Received: from player158.ha.ovh.net (unknown [10.108.1.232])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4FDDC2166A2
 for <qemu-devel@nongnu.org>; Thu,  5 Dec 2019 19:45:32 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id A8585CDB153F;
 Thu,  5 Dec 2019 18:45:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/5] ppc/psi: cleanup definitions
Date: Thu,  5 Dec 2019 19:44:52 +0100
Message-Id: <20191205184454.10722-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205184454.10722-1-clg@kaod.org>
References: <20191205184454.10722-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5785999623497157606
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.57.129
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
 hw/ppc/pnv_psi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index a360515a86f8..f15aaa5c9cc0 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -609,9 +609,12 @@ static const TypeInfo pnv_psi_power8_info =3D {
 #define   PSIHB9_IRQ_METHOD             PPC_BIT(0)
 #define   PSIHB9_IRQ_RESET              PPC_BIT(1)
 #define PSIHB9_ESB_CI_BASE              0x60
-#define   PSIHB9_ESB_CI_VALID           1
+#define   PSIHB9_ESB_CI_64K             PPC_BIT(1)
+#define   PSIHB9_ESB_CI_ADDR_MASK       PPC_BITMASK(8, 47)
+#define   PSIHB9_ESB_CI_VALID           PPC_BIT(63)
 #define PSIHB9_ESB_NOTIF_ADDR           0x68
-#define   PSIHB9_ESB_NOTIF_VALID        1
+#define   PSIHB9_ESB_NOTIF_ADDR_MASK    PPC_BITMASK(8, 60)
+#define   PSIHB9_ESB_NOTIF_VALID        PPC_BIT(63)
 #define PSIHB9_IVT_OFFSET               0x70
 #define   PSIHB9_IVT_OFF_SHIFT          32
=20
--=20
2.21.0


