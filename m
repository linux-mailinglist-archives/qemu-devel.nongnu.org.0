Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C6187DD6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:10:03 +0100 (CET)
Received: from localhost ([::1]:55578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9Ag-0001sc-9f
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE95b-0000mP-Fr
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE95a-0001pz-8l
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:04:47 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58461 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE95Z-0001Fl-SK; Tue, 17 Mar 2020 06:04:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTKv67Xyz9sSL; Tue, 17 Mar 2020 21:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439475;
 bh=7wZ3mloQ1D8Wy0r2A2GHMcqEh/j6Iul/yYJo14bNXbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IUJU4yFMtCr21Q9CRZ6qJEeHLAyGD8spXcxsUQK2hb63M0cjHaa+xhfjUgRncGq/W
 +cMYf0z/gSRqNYNYkrz//2o2ARJ236/AnOFuIREzp5Tkue4U4280X9fAq14lphNa9Y
 0INYrJDWR0E9N4kws3Qj7E/85jRjemo0mdXAwb/0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/45] hw/ppc/pnv: Fix typo in comment
Date: Tue, 17 Mar 2020 21:03:43 +1100
Message-Id: <20200317100423.622643-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200228123303.14540-1-philmd@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index f150deca34..b5ffa48dac 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -829,7 +829,7 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
     bool hostboot_mode =3D !!pnv->fw_load_addr;
=20
     /* let isa_bus_new() create its own bridge on SysBus otherwise
-     * devices speficied on the command line won't find the bus and
+     * devices specified on the command line won't find the bus and
      * will fail to create.
      */
     isa_bus =3D isa_bus_new(NULL, &lpc->isa_mem, &lpc->isa_io, &local_er=
r);
--=20
2.24.1


