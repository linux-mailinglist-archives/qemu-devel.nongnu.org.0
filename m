Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E365DFA5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBrm-0007Ot-6y; Wed, 04 Jan 2023 17:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpv-0006Gj-IC; Wed, 04 Jan 2023 17:02:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpm-0003Gt-2n; Wed, 04 Jan 2023 17:02:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E7E6E755F86;
 Wed,  4 Jan 2023 22:59:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C58167496AB; Wed,  4 Jan 2023 22:59:42 +0100 (CET)
Message-Id: <baf0bed71eec81fac16b6495e781cc6b42cdd155.1672868854.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1672868854.git.balaton@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 7/7] mac_newworld: Document deprecation
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  4 Jan 2023 22:59:42 +0100 (CET)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 04334ba210..d4a47a6881 100644
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
+ *  VIA-CUDA or VIA-PMU99 with or without ADB or USB keyboard and mouse.
 
 
 Missing devices
-- 
2.30.6


