Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6E60D218
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN31-0007DB-SD; Tue, 25 Oct 2022 12:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2w-00070J-6k; Tue, 25 Oct 2022 12:44:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2u-0002H4-3B; Tue, 25 Oct 2022 12:44:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 82FBE75A159;
 Tue, 25 Oct 2022 18:44:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6153875A135; Tue, 25 Oct 2022 18:44:54 +0200 (CEST)
Message-Id: <7832e9b6d79c5243d21f54b0679f487c32d968dd.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 19/19] mac_newworld: Document deprecation
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:54 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Also update PowerMac family docs with some more recent info.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 docs/about/deprecated.rst    |  7 +++++++
 docs/system/ppc/powermac.rst | 12 ++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669..07661af7fe 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -248,6 +248,13 @@ These old machine types are quite neglected nowadays and thus might have
 various pitfalls with regards to live migration. Use a newer machine type
 instead.
 
+``mac99`` variants other than the default qemu-system-ppc version (since 7.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``mac99`` machine emulates different hardware depending on using
+qemu-system-ppc64 or ``via`` property. To avoid confusion new machine
+types has been added for these variants which are now preferred over
+``mac99``.
 
 Backend options
 ---------------
diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
index 04334ba210..9a37e69b1b 100644
--- a/docs/system/ppc/powermac.rst
+++ b/docs/system/ppc/powermac.rst
@@ -4,8 +4,12 @@ PowerMac family boards (``g3beige``, ``mac99``)
 Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
 PowerPC system.
 
-- ``g3beige``              Heathrow based PowerMAC
-- ``mac99``                Mac99 based PowerMAC
+- ``g3beige``           Heathrow based old world Power Macintosh G3
+- ``mac99``             Core99 based generic PowerMac
+- ``powermac3_1``       Power Mac G4 AGP (Sawtooth)
+- ``powerbook3_2``      PowerBook G4 Titanium (Mercury)
+- ``powermac7_3``       Power Mac G5 (Niagara) (only in ``qemu-system-ppc64``)
+
 
 Supported devices
 -----------------
@@ -15,9 +19,9 @@ QEMU emulates the following PowerMac peripherals:
  *  UniNorth or Grackle PCI Bridge
  *  PCI VGA compatible card with VESA Bochs Extensions
  *  2 PMAC IDE interfaces with hard disk and CD-ROM support
- *  NE2000 PCI adapters
+ *  Sungem PCI network adapter
  *  Non Volatile RAM
- *  VIA-CUDA with ADB keyboard and mouse.
+ *  VIA-CUDA or VIA-PMU99 with ot without ADB or USB keyboard and mouse.
 
 
 Missing devices
-- 
2.30.4


