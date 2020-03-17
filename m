Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C471E1888FC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:19:08 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEDzn-0004sB-Q8
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDuh-00079x-22
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDuf-0001R1-Hs
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jEDua-0000sf-RQ; Tue, 17 Mar 2020 11:13:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F09C2747E1A;
 Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 651A7747E0B; Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Message-Id: <444a5e34331bf1f7880541b8d46e0353f470f5a6.1584457537.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584457537.git.balaton@eik.bme.hu>
References: <cover.1584457537.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 4/8] hw/ide: Remove now unneded #include "hw/pci/pci.h"
 from hw/ide.h
Date: Tue, 17 Mar 2020 16:05:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After previous patches we don't need hw/pci/pci.h any more in
hw/ide.h. Some files depended on implicit inclusion by this header
which are also fixed up here.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ide/ahci_internal.h        | 1 +
 include/hw/ide.h              | 1 -
 include/hw/ide/pci.h          | 1 +
 include/hw/misc/macio/macio.h | 1 +
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 73424516da..bab0459774 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -27,6 +27,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/ide/internal.h"
 #include "hw/sysbus.h"
+#include "hw/pci/pci.h"
=20
 #define AHCI_MEM_BAR_SIZE         0x1000
 #define AHCI_MAX_PORTS            32
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 21bd8f23f1..d52c211f32 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -2,7 +2,6 @@
 #define HW_IDE_H
=20
 #include "hw/isa/isa.h"
-#include "hw/pci/pci.h"
 #include "exec/memory.h"
=20
 #define MAX_IDE_DEVS	2
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index a9f2c33e68..98ffa7dfcd 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -2,6 +2,7 @@
 #define HW_IDE_PCI_H
=20
 #include "hw/ide/internal.h"
+#include "hw/pci/pci.h"
=20
 #define BM_STATUS_DMAING 0x01
 #define BM_STATUS_ERROR  0x02
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.=
h
index 070a694eb5..87335a991c 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -27,6 +27,7 @@
 #define MACIO_H
=20
 #include "hw/char/escc.h"
+#include "hw/pci/pci.h"
 #include "hw/ide/internal.h"
 #include "hw/intc/heathrow_pic.h"
 #include "hw/misc/macio/cuda.h"
--=20
2.21.1


