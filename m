Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC7E7820
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 19:08:37 +0100 (CET)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP9RT-00088G-QX
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 14:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iP80m-00031f-FJ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iP80l-0008OF-7u
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55237
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iP80l-0008Nz-3u
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572280614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8Ov6K9gjAmVTeZvfxxVP3jRwrZORnzk/ILSZphq89g=;
 b=eJUk9JlB+ETlRAtK8t96tyyXENHtFK5cPpNhjpdlTFlbBOn7r3QAHS++hq5JxzlODsFoS8
 R1VC53XmkS5UDlxdafKDGUFT/reAZ8A2y3xnXrCOOf//Z+r8ukieCoW0X5c5y3cYF0KMAd
 KSnZoutQmGMLLMDRZMqmmRmn1KJRTeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-LwoKiBkNOG-sUeGRMg0MCA-1; Mon, 28 Oct 2019 12:36:51 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF8AA107AD29;
 Mon, 28 Oct 2019 16:36:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-87.brq.redhat.com [10.40.204.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 992EB26199;
 Mon, 28 Oct 2019 16:36:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] hw/pci-host: Rename incorrectly named 'piix' as 'i440fx'
Date: Mon, 28 Oct 2019 17:34:46 +0100
Message-Id: <20191028163447.18541-20-philmd@redhat.com>
In-Reply-To: <20191028163447.18541-1-philmd@redhat.com>
References: <20191028163447.18541-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LwoKiBkNOG-sUeGRMg0MCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

We moved all the PIIX3 southbridge code out of hw/pci-host/piix.c,
it now only contains i440FX northbridge code.
Rename it to match the chipset modelled.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                      | 2 +-
 hw/i386/Kconfig                  | 2 +-
 hw/pci-host/Kconfig              | 2 +-
 hw/pci-host/Makefile.objs        | 2 +-
 hw/pci-host/{piix.c =3D> i440fx.c} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename hw/pci-host/{piix.c =3D> i440fx.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7e7bfc890..87e7fb1a65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1225,7 +1225,7 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: include/hw/i386/
 F: hw/i386/
-F: hw/pci-host/piix.c
+F: hw/pci-host/i440fx.c
 F: hw/pci-host/q35.c
 F: hw/pci-host/pam.c
 F: include/hw/pci-host/i440fx.h
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d420b35548..5a494342ea 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -60,7 +60,7 @@ config I440FX
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
-    select PCI_PIIX
+    select PCI_I440FX
     select PIIX3
     select IDE_PIIX
     select DIMM
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 397043b289..b0aa8351c4 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -28,7 +28,7 @@ config PCI_SABRE
     select PCI
     bool
=20
-config PCI_PIIX
+config PCI_I440FX
     bool
     select PCI
     select PAM
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
index a9cd3e022d..efd752b766 100644
--- a/hw/pci-host/Makefile.objs
+++ b/hw/pci-host/Makefile.objs
@@ -13,7 +13,7 @@ common-obj-$(CONFIG_VERSATILE_PCI) +=3D versatile.o
=20
 common-obj-$(CONFIG_PCI_SABRE) +=3D sabre.o
 common-obj-$(CONFIG_FULONG) +=3D bonito.o
-common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
+common-obj-$(CONFIG_PCI_I440FX) +=3D i440fx.o
 common-obj-$(CONFIG_PCI_EXPRESS_Q35) +=3D q35.o
 common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) +=3D gpex.o
 common-obj-$(CONFIG_PCI_EXPRESS_XILINX) +=3D xilinx-pcie.o
diff --git a/hw/pci-host/piix.c b/hw/pci-host/i440fx.c
similarity index 100%
rename from hw/pci-host/piix.c
rename to hw/pci-host/i440fx.c
--=20
2.21.0


