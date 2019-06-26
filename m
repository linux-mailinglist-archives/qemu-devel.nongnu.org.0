Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C7567E7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 13:51:07 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg6S9-00032I-O9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 07:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg6NF-0001K7-50
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 07:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg6NE-0005s6-4u
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 07:46:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:60655 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hg6ND-0005oH-Tz
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 07:46:00 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A8D351A468E;
 Wed, 26 Jun 2019 13:45:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 87D981A4608;
 Wed, 26 Jun 2019 13:45:56 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 13:45:37 +0200
Message-Id: <1561549550-3501-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561549550-3501-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561549550-3501-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 04/17] hw/mips/gt64xxx_pci: Fix 'spaces' coding
 style issues
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Since we'll move this code around, fix its style first:

  ERROR: space prohibited between function name and open parenthesis
  ERROR: line over 90 characters

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190624222844.26584-5-f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index cfd4979..0b9fb02 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -384,8 +384,8 @@ static const VMStateDescription vmstate_gt64120 =3D {
     }
 };
=20
-static void gt64120_writel (void *opaque, hwaddr addr,
-                            uint64_t val, unsigned size)
+static void gt64120_writel(void *opaque, hwaddr addr,
+                           uint64_t val, unsigned size)
 {
     GT64120State *s =3D opaque;
     PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
@@ -671,8 +671,8 @@ static void gt64120_writel (void *opaque, hwaddr addr=
,
     }
 }
=20
-static uint64_t gt64120_readl (void *opaque,
-                               hwaddr addr, unsigned size)
+static uint64_t gt64120_readl(void *opaque,
+                              hwaddr addr, unsigned size)
 {
     GT64120State *s =3D opaque;
     PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
@@ -1193,7 +1193,8 @@ PCIBus *gt64120_register(qemu_irq *pic)
                                      get_system_io(),
                                      PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
     qdev_init_nofail(dev);
-    memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d, "is=
d-mem", 0x1000);
+    memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d,
+                          "isd-mem", 0x1000);
=20
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
     return phb->bus;
--=20
2.7.4


