Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC788E5E77
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:30 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOQTJ-0006lk-98
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 14:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOQP8-0000H0-1A
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOQP6-0007NW-Rv
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30556
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOQP6-0007NK-Oi
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+bPrM8zE9f2ZPzvcaB3nRFmrtGkwHQwxvCglyVobxE=;
 b=Whx/9GXXT+55XQIIXDRpcTbHNWnueqOktr7BtZ+ckKIbBeTlXj32XHvGC+WtloDAoRamdM
 Sc8R5RmCZa/DMrMUjgQTaBojHq1xWULfhetCkAjkXUWrxn1vx57XbBf76cHG/IfXQpW8kA
 uhAZs9RXgS6imKm4A8wCqBF/xkclmr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-6OBl9SKQPDCw2CHjDSEwdQ-1; Sat, 26 Oct 2019 14:03:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712441800DFD;
 Sat, 26 Oct 2019 18:03:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9920C60F82;
 Sat, 26 Oct 2019 18:02:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/20] piix4: Rename PIIX4 object to piix4-isa
Date: Sat, 26 Oct 2019 20:01:28 +0200
Message-Id: <20191026180143.7369-6-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 6OBl9SKQPDCw2CHjDSEwdQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Other piix4 parts are already named piix4-ide and piix4-usb-uhci.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-15-hpoussin@reactos.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>
[PMD: rebased]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c       | 1 -
 hw/mips/mips_malta.c | 2 +-
 include/hw/isa/isa.h | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7cf72e3118..fa387919b5 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,6 @@ typedef struct PIIX4State {
     uint8_t rcr;
 } PIIX4State;
=20
-#define TYPE_PIIX4_PCI_DEVICE "PIIX4"
 #define PIIX4_PCI_DEVICE(obj) \
     OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
=20
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 6d9b230322..5086024821 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1414,7 +1414,7 @@ void mips_malta_init(MachineState *machine)
     ide_drive_get(hd, ARRAY_SIZE(hd));
=20
     pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
-                                          true, "PIIX4");
+                                          true, TYPE_PIIX4_PCI_DEVICE);
     dev =3D DEVICE(pci);
     isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     piix4_devfn =3D pci->devfn;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 018ada4f6f..79f703fd6c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -147,4 +147,6 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
=20
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 #endif
--=20
2.21.0


