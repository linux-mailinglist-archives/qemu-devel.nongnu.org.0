Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417321223F0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:40:18 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5aj-00043f-2M
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4k9-0002MF-G1
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:45:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4k6-00082T-1H
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:45:55 -0500
Received: from ozlabs.org ([203.11.71.1]:43161)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4k3-0007WJ-Vn; Mon, 16 Dec 2019 23:45:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWg6KvRz9sTR; Tue, 17 Dec 2019 15:43:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557823;
 bh=9x8gEiCBBz8Y4SRiMXedwXwlBbOLRMLDFUsvTWQEkMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jpWxkqBq15DNtCnkWfwg2+7fI1OJXQmdZQNdEeGAmP9HFY0LL0CM/EcgAcozcWIs9
 dTvAgKvdcb0zlc7IuO33jLotBritGZS9LKzlZmrGi5G86uSBFC4E56ZYIWn0X3BOR5
 gwPLtzjMNXsCJatA9KGQDU9torOcqH8G+mbukknE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 63/88] ppc/psi: cleanup definitions
Date: Tue, 17 Dec 2019 15:42:57 +1100
Message-Id: <20191217044322.351838-64-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191205184454.10722-4-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_psi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 7e725aaf2b..e6c266ac4a 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -608,9 +608,12 @@ static const TypeInfo pnv_psi_power8_info =3D {
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
2.23.0


