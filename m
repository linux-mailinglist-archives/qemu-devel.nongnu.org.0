Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7418510B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:24:44 +0100 (CET)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCrnP-00018Y-T9
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlw-0007gi-3N
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlu-0000Hs-Pu
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57637)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrlr-0008Tt-L6; Fri, 13 Mar 2020 17:23:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CFE84747E17;
 Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 80F0D747E15; Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Message-Id: <34bdee6ddddd7943b9a68547f46c76f30b9a7e75.1584134074.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584134074.git.balaton@eik.bme.hu>
References: <cover.1584134074.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 5/8] hw/ide/pci.c: Coding style update to fix checkpatch errors
Date: Fri, 13 Mar 2020 22:14:34 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spaces are required around a + operator and if statements should have
braces even for single line. Also make it simpler by reversing the
condition instead of breaking the loop.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 4fc76c5225..e0c84392e2 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -485,9 +485,9 @@ void pci_ide_create_devs(PCIDevice *dev, DriveInfo **hd_table)
     int i;
 
     for (i = 0; i < 4; i++) {
-        if (hd_table[i] == NULL)
-            continue;
-        ide_create_drive(d->bus+bus[i], unit[i], hd_table[i]);
+        if (hd_table[i]) {
+            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
+        }
     }
 }
 
-- 
2.21.1


