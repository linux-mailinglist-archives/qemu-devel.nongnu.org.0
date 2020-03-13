Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D518511B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:27:05 +0100 (CET)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCrpg-00058k-77
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlx-0007jG-HU
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlv-0000Kd-V7
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57667)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrls-00009c-Py; Fri, 13 Mar 2020 17:23:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1E989747E04;
 Fri, 13 Mar 2020 22:23:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 89B66747E0F; Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Message-Id: <f0c416bb421f7d652559e1fbb82dc5d1259eeaac.1584134074.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584134074.git.balaton@eik.bme.hu>
References: <cover.1584134074.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 7/8] hw/ide: Move MAX_IDE_DEVS define to hw/ide/internal.h
Date: Fri, 13 Mar 2020 22:14:34 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can move it next to the MAX_IDE_BUS define now that less files use
it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 include/hw/ide.h          | 2 --
 include/hw/ide/internal.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/ide.h b/include/hw/ide.h
index d52c211f32..c5ce5da4f4 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -4,8 +4,6 @@
 #include "hw/isa/isa.h"
 #include "exec/memory.h"
 
-#define MAX_IDE_DEVS	2
-
 /* ide-isa.c */
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 1a49d35959..fd3cae4acf 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -28,6 +28,7 @@ typedef struct IDEDMAOps IDEDMAOps;
 #define IDE_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
 
 #define MAX_IDE_BUS 2
+#define MAX_IDE_DEVS 2
 
 /* Bits of HD_STATUS */
 #define ERR_STAT		0x01
-- 
2.21.1


