Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0BD7BCF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:37:22 +0200 (CEST)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKPp2-0000zG-MM
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPh6-0001QC-Us
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPh5-0004sQ-3e
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPh4-0004rO-Tr
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2FDA18C8320;
 Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FCEF19C58;
 Tue, 15 Oct 2019 16:28:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/32] piix4: rename some variables in realize function
Date: Tue, 15 Oct 2019 18:26:41 +0200
Message-Id: <20191015162705.28087-9-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

PIIX4 structure is now 's'
PCI device is now 'pci_dev'
DeviceState is now 'dev'

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-6-hpoussin@reactos.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 3294056cd5..4202243e41 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -88,16 +88,17 @@ static const VMStateDescription vmstate_piix4 =3D {
     }
 };
=20
-static void piix4_realize(PCIDevice *dev, Error **errp)
+static void piix4_realize(PCIDevice *pci_dev, Error **errp)
 {
-    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
+    DeviceState *dev =3D DEVICE(pci_dev);
+    PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);
=20
-    if (!isa_bus_new(DEVICE(d), pci_address_space(dev),
-                     pci_address_space_io(dev), errp)) {
+    if (!isa_bus_new(dev, pci_address_space(pci_dev),
+                     pci_address_space_io(pci_dev), errp)) {
         return;
     }
-    piix4_dev =3D &d->dev;
-    qemu_register_reset(piix4_reset, d);
+    piix4_dev =3D pci_dev;
+    qemu_register_reset(piix4_reset, s);
 }
=20
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
--=20
2.21.0


