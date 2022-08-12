Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DA590D19
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 09:59:23 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMPZi-0000iY-LE
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 03:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oMPXe-0007Nz-F1; Fri, 12 Aug 2022 03:57:14 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:44296
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oMPXb-0008RK-QM; Fri, 12 Aug 2022 03:57:13 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id C9260DA046A;
 Fri, 12 Aug 2022 09:57:07 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 2459046001C; Fri, 12 Aug 2022 09:57:07 +0200 (CEST)
To: qemu-devel@nongnu.org,
	Hongren Zheng <i@zenithal.me>
Cc: libvir-list@redhat.com, "Canokeys . org" <contact@canokeys.org>,
 qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for-7.1?] Fix some typos in documentation (most of them found
 by codespell)
Date: Fri, 12 Aug 2022 09:56:42 +0200
Message-Id: <20220812075642.1200578-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/about/deprecated.rst       |  2 +-
 docs/specs/acpi_erst.rst        |  4 ++--
 docs/system/devices/canokey.rst |  8 ++++----
 docs/system/devices/cxl.rst     | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7ee26626d5..91b03115ee 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -297,7 +297,7 @@ by using ``-machine graphics=off``.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 In QEMU versions 6.1, 6.2 and 7.0, the ``nvme-ns`` generates an EUI-64
-identifer that is not globally unique. If an EUI-64 identifer is required, the
+identifier that is not globally unique. If an EUI-64 identifier is required, the
 user must set it explicitly using the ``nvme-ns`` device parameter ``eui64``.
 
 ``-device nvme,use-intel-id=on|off`` (since 7.1)
diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
index a8a9d22d25..2339b60ad7 100644
--- a/docs/specs/acpi_erst.rst
+++ b/docs/specs/acpi_erst.rst
@@ -108,7 +108,7 @@ Slot 0 contains a backend storage header that identifies the contents
 as ERST and also facilitates efficient access to the records.
 Depending upon the size of the backend storage, additional slots will
 be designated to be a part of the slot 0 header. For example, at 8KiB,
-the slot 0 header can accomodate 1021 records. Thus a storage size
+the slot 0 header can accommodate 1021 records. Thus a storage size
 of 8MiB (8KiB * 1024) requires an additional slot for use by the
 header. In this scenario, slot 0 and slot 1 form the backend storage
 header, and records can be stored starting at slot 2.
@@ -196,5 +196,5 @@ References
 [2] "Unified Extensible Firmware Interface Specification",
     version 2.1, October 2008.
 
-[3] "Windows Hardware Error Architecture", specfically
+[3] "Windows Hardware Error Architecture", specifically
     "Error Record Persistence Mechanism".
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index c2c58ae3e7..cfa6186e48 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -28,9 +28,9 @@ With the same software configuration as a hardware key,
 the guest OS can use all the functionalities of a secure key as if
 there was actually an hardware key plugged in.
 
-CanoKey QEMU provides much convenience for debuging:
+CanoKey QEMU provides much convenience for debugging:
 
-* libcanokey-qemu supports debuging output thus developers can
+* libcanokey-qemu supports debugging output thus developers can
   inspect what happens inside a secure key
 * CanoKey QEMU supports trace event thus event
 * QEMU USB stack supports pcap thus USB packet between the guest
@@ -102,8 +102,8 @@ and find CanoKey QEMU there:
 
 You may setup the key as guided in [6]_. The console for the key is at [7]_.
 
-Debuging
-========
+Debugging
+=========
 
 CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
 the latter of which resides in QEMU. The former provides core functionality
diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index 36031325cc..f25783a4ec 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -83,7 +83,7 @@ CXL Fixed Memory Windows (CFMW)
 A CFMW consists of a particular range of Host Physical Address space
 which is routed to particular CXL Host Bridges.  At time of generic
 software initialization it will have a particularly interleaving
-configuration and associated Quality of Serice Throtling Group (QTG).
+configuration and associated Quality of Service Throttling Group (QTG).
 This information is available to system software, when making
 decisions about how to configure interleave across available CXL
 memory devices.  It is provide as CFMW Structures (CFMWS) in
@@ -98,7 +98,7 @@ specification defined register interface called CXL Host Bridge
 Component Registers (CHBCR). The location of this CHBCR MMIO
 space is described to system software via a CXL Host Bridge
 Structure (CHBS) in the CEDT ACPI table.  The actual interfaces
-are identical to those used for other parts of the CXL heirarchy
+are identical to those used for other parts of the CXL hierarchy
 as CXL Component Registers in PCI BARs.
 
 Interfaces provided include:
@@ -143,7 +143,7 @@ CXL Memory Devices - Type 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 CXL type 3 devices use a PCI class code and are intended to be supported
 by a generic operating system driver. They have HDM decoders
-though in these EP devices, the decoder is reponsible not for
+though in these EP devices, the decoder is responsible not for
 routing but for translation of the incoming host physical address (HPA)
 into a Device Physical Address (DPA).
 
@@ -209,7 +209,7 @@ Notes:
     ranges of the system physical address map.  Each CFMW has
     particular interleave setup across the CXL Host Bridges (HB)
     CFMW0 provides uninterleaved access to HB0, CFW2 provides
-    uninterleaved acess to HB1. CFW1 provides interleaved memory access
+    uninterleaved access to HB1. CFW1 provides interleaved memory access
     across HB0 and HB1.
 
 (2) **Two CXL Host Bridges**. Each of these has 2 CXL Root Ports and
@@ -282,7 +282,7 @@ Example topology involving a switch::
             ---------------------------------------------------
            |    Switch 0  USP as PCI 0d:00.0                   |
            |    USP has HDM decoder which direct traffic to    |
-           |    appropiate downstream port                     |
+           |    appropriate downstream port                    |
            |    Switch BUS appears as 0e                       |
            |x__________________________________________________|
             |                  |               |              |
@@ -366,7 +366,7 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
 Kernel Configuration Options
 ----------------------------
 
-In Linux 5.18 the followings options are necessary to make use of
+In Linux 5.18 the following options are necessary to make use of
 OS management of CXL memory devices as described here.
 
 * CONFIG_CXL_BUS
-- 
2.30.2


