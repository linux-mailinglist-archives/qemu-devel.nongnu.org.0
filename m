Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5D187DAE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:03:04 +0100 (CET)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE93v-0006IV-PS
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jE8yy-0008M0-BW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jE8yw-0006gU-Qb
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:57:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31379)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jE8ys-0006HH-9e; Tue, 17 Mar 2020 05:57:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D94DD747E0F;
 Tue, 17 Mar 2020 10:57:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4783D747E14; Tue, 17 Mar 2020 10:57:44 +0100 (CET)
Message-Id: <6f8adcc583db25b530d110cc1f01dbb86968f5a0.1584437958.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584437957.git.balaton@eik.bme.hu>
References: <cover.1584437957.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 7/7] hw/ide: Remove unneeded inclusion of hw/ide.h
Date: Tue, 17 Mar 2020 10:39:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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

After previous clean ups we can drop direct inclusion of hw/ide.h from
several places.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/hppa/hppa_sys.h      | 1 -
 hw/hppa/machine.c       | 1 -
 hw/i386/pc_piix.c       | 1 -
 hw/isa/piix4.c          | 1 -
 hw/mips/mips_fulong2e.c | 1 -
 hw/ppc/mac_newworld.c   | 1 -
 hw/ppc/mac_oldworld.c   | 1 -
 hw/ppc/prep.c           | 1 -
 8 files changed, 8 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 4d08501464..0b18271cc9 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -5,7 +5,6 @@
=20
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/ide.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
=20
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 9175f4b790..00dd9f58d6 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -13,7 +13,6 @@
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/ide.h"
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hw/net/lasi_82596.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9216596ec6..e6756216f9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -38,7 +38,6 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
 #include "net/net.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 13fa1660c3..136a763e3f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -34,7 +34,6 @@
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 0f312b5a35..5040afd581 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -36,7 +36,6 @@
 #include "audio/audio.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "elf.h"
 #include "hw/isa/vt82c686.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index b8189bf7a4..13164ee9d7 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -62,7 +62,6 @@
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
 #include "hw/ppc/openpic.h"
-#include "hw/ide.h"
 #include "hw/loader.h"
 #include "hw/fw-path-provider.h"
 #include "elf.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 440c406eb4..2d419d82fa 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -41,7 +41,6 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
-#include "hw/ide.h"
 #include "hw/loader.h"
 #include "hw/fw-path-provider.h"
 #include "elf.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 111cc80867..44be9d25a2 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -37,7 +37,6 @@
 #include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
--=20
2.21.1


