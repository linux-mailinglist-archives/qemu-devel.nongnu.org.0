Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6DE7846
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 19:22:07 +0100 (CET)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP9eY-0005BZ-4s
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 14:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iP80w-00033p-Gm
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iP80u-0008UY-80
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:37:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23555
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iP80s-0008Qn-CG
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572280620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQsFUyLAwDljpdipMYVdl0GqrBsJ3XrvhlsEYkdcey4=;
 b=TFs0qeKcEwwf64lzyRH8oT32qOLCPLmHHKKSj5UEt2d3Jvqioricq+wMNjgHv+PBA2qeyi
 8PBvLewRCd1qC2xNpy8gV9RE1nEQGlL5wQ1ZmKp1Oly5rQ3ULDzuTnAwocVtY2bcDZMalH
 GF52W+0eLJ8xwFtbCwo8nL5wtvbLBSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-V_b7dxXEP4ekLOYa2E_hEg-1; Mon, 28 Oct 2019 12:36:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6897F476;
 Mon, 28 Oct 2019 16:36:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-87.brq.redhat.com [10.40.204.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2F926199;
 Mon, 28 Oct 2019 16:36:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] hw/pci-host/i440fx: Remove the last PIIX3 traces
Date: Mon, 28 Oct 2019 17:34:47 +0100
Message-Id: <20191028163447.18541-21-philmd@redhat.com>
In-Reply-To: <20191028163447.18541-1-philmd@redhat.com>
References: <20191028163447.18541-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: V_b7dxXEP4ekLOYa2E_hEg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PIIX3 is not tied to the i440FX and can even be used without it.
Move its creation to the machine code (pc_piix.c).
We have now removed the last trace of southbridge code in the i440FX
northbridge.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc_piix.c            | 8 +++++++-
 hw/pci-host/i440fx.c         | 8 --------
 include/hw/pci-host/i440fx.h | 3 +--
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ba35d5685e..2aefa3b8df 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -192,14 +192,20 @@ static void pc_init1(MachineState *machine,
     gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
=20
     if (pcmc->pci_enabled) {
+        PIIX3State *piix3;
+
         pci_bus =3D i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state, &piix3_devfn, &isa_bus, x86ms=
->gsi,
+                              &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
         pcms->bus =3D pci_bus;
+
+        piix3 =3D piix3_create(pci_bus, &isa_bus);
+        piix3->pic =3D x86ms->gsi;
+        piix3_devfn =3D piix3->dev.devfn;
     } else {
         pci_bus =3D NULL;
         i440fx_state =3D NULL;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 79ecd58a2b..f27131102d 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -27,7 +27,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/i440fx.h"
-#include "hw/southbridge/piix.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
@@ -272,8 +271,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp=
)
=20
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     PCII440FXState **pi440fx_state,
-                    int *piix3_devfn,
-                    ISABus **isa_bus, qemu_irq *pic,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -286,7 +283,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
-    PIIX3State *piix3;
     PCII440FXState *f;
     unsigned i;
     I440FXState *i440fx;
@@ -339,10 +335,6 @@ PCIBus *i440fx_init(const char *host_type, const char =
*pci_type,
                  PAM_EXPAN_SIZE);
     }
=20
-    piix3 =3D piix3_create(b, isa_bus);
-    piix3->pic =3D pic;
-    *piix3_devfn =3D piix3->dev.devfn;
-
     ram_size =3D ram_size / 8 / 1024 / 1024;
     if (ram_size > 255) {
         ram_size =3D 255;
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index e327f9bf87..f54e6466e4 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -22,8 +22,7 @@ typedef struct PCII440FXState PCII440FXState;
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
=20
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state, int *piix_devfn,
-                    ISABus **isa_bus, qemu_irq *pic,
+                    PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
--=20
2.21.0


