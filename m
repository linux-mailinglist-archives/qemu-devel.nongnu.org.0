Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7D2B6EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:40:58 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6qX-0007yn-60
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf6lL-0003Q2-Sc; Tue, 17 Nov 2020 14:35:35 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50572
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf6lI-0006iD-PP; Tue, 17 Nov 2020 14:35:35 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 796BEDB2587;
 Tue, 17 Nov 2020 20:35:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id UzZSkkzj4TIz; Tue, 17 Nov 2020 20:34:54 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 1C4B4DB2583;
 Tue, 17 Nov 2020 20:34:54 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 0E1C5460019; Tue, 17 Nov 2020 20:34:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-5.2] docs: Fix some typos (found by codespell)
Date: Tue, 17 Nov 2020 20:34:48 +0100
Message-Id: <20201117193448.393472-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 14:07:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, libvir-list@redhat.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix also a similar typo in a code comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/can.txt                  | 8 ++++----
 docs/interop/vhost-user.rst   | 2 +-
 docs/replay.txt               | 2 +-
 docs/specs/ppc-spapr-numa.rst | 2 +-
 docs/system/deprecated.rst    | 4 ++--
 docs/tools/virtiofsd.rst      | 2 +-
 hw/vfio/igd.c                 | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/can.txt b/docs/can.txt
index 5838f6620c..0d310237df 100644
--- a/docs/can.txt
+++ b/docs/can.txt
@@ -19,7 +19,7 @@ interface to implement because such device can be easily connected
 to systems with different CPU architectures (x86, PowerPC, Arm, etc.).
 
 In 2020, CTU CAN FD controller model has been added as part
-of the bachelor theses of Jan Charvat. This controller is complete
+of the bachelor thesis of Jan Charvat. This controller is complete
 open-source/design/hardware solution. The core designer
 of the project is Ondrej Ille, the financial support has been
 provided by CTU, and more companies including Volkswagen subsidiaries.
@@ -31,7 +31,7 @@ testing lead to goal change to provide environment which provides complete
 emulated environment for testing and RTEMS GSoC slot has been donated
 to work on CAN hardware emulation on QEMU.
 
-Examples how to use CAN emulation for SJA1000 based borads
+Examples how to use CAN emulation for SJA1000 based boards
 ==========================================================
 
 When QEMU with CAN PCI support is compiled then one of the next
@@ -106,8 +106,8 @@ This open-source core provides CAN FD support. CAN FD drames are
 delivered even to the host systems when SocketCAN interface is found
 CAN FD capable.
 
-The PCIe borad emulation is provided for now (the device identifier is
-ctucan_pci). The defauld build defines two CTU CAN FD cores
+The PCIe board emulation is provided for now (the device identifier is
+ctucan_pci). The default build defines two CTU CAN FD cores
 on the board.
 
 Example how to connect the canbus0-bus (virtual wire) to the host
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 988f154144..72b2e8c7ba 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -513,7 +513,7 @@ descriptor table (split virtqueue) or descriptor ring (packed
 virtqueue). However, it can't work when we process descriptors
 out-of-order because some entries which store the information of
 inflight descriptors in available ring (split virtqueue) or descriptor
-ring (packed virtqueue) might be overrided by new entries. To solve
+ring (packed virtqueue) might be overridden by new entries. To solve
 this problem, slave need to allocate an extra buffer to store this
 information of inflight descriptors and share it with master for
 persistent. ``VHOST_USER_GET_INFLIGHT_FD`` and
diff --git a/docs/replay.txt b/docs/replay.txt
index 87a64ae068..5b008ca491 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -328,7 +328,7 @@ between the snapshots. Each of the passes include the following steps:
  1. loading the snapshot
  2. replaying to examine the breakpoints
  3. if breakpoint or watchpoint was met
-    - loading the snaphot again
+    - loading the snapshot again
     - replaying to the required breakpoint
  4. else
     - proceeding to the p.1 with the earlier snapshot
diff --git a/docs/specs/ppc-spapr-numa.rst b/docs/specs/ppc-spapr-numa.rst
index 5fca2bdd8e..ffa687dc89 100644
--- a/docs/specs/ppc-spapr-numa.rst
+++ b/docs/specs/ppc-spapr-numa.rst
@@ -198,7 +198,7 @@ This is how it is being done:
 * user distance 121 and beyond will be interpreted as 160
 * user distance 10 stays 10
 
-The reasoning behind this aproximation is to avoid any round up to the local
+The reasoning behind this approximation is to avoid any round up to the local
 distance (10), keeping it exclusive to the 4th NUMA level (which is still
 exclusive to the node_id). All other ranges were chosen under the developer
 discretion of what would be (somewhat) sensible considering the user input.
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 32a0e620db..63e9db1463 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -465,7 +465,7 @@ default configuration.
 
 The CPU model runnability guarantee won't apply anymore to
 existing CPU models.  Management software that needs runnability
-guarantees must resolve the CPU model aliases using te
+guarantees must resolve the CPU model aliases using the
 ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
 command.
 
@@ -637,7 +637,7 @@ Splitting RAM by default between NUMA nodes had the same issues as ``mem``
 parameter with the difference that the role of the user plays QEMU using
 implicit generic or board specific splitting rule.
 Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
-it's supported by used machine type) to define mapping explictly instead.
+it's supported by used machine type) to define mapping explicitly instead.
 Users of existing VMs, wishing to preserve the same RAM distribution, should
 configure it explicitly using ``-numa node,memdev`` options. Current RAM
 distribution can be retrieved using HMP command ``info numa`` and if separate
diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 34a9e40146..866b7db3ee 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -174,7 +174,7 @@ Using ':' as the separator a rule is of the form:
 - 'bad' - If a client tries to use a name matching 'key' it's
   denied using EPERM; when the server passes an attribute
   name matching 'prepend' it's hidden.  In many ways it's use is very like
-  'ok' as either an explict terminator or for special handling of certain
+  'ok' as either an explicit terminator or for special handling of certain
   patterns.
 
 **key** is a string tested as a prefix on an attribute name originating
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 64e332746b..470205f487 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -535,7 +535,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     }
 
     /*
-     * Assume we have no GMS memory, but allow it to be overrided by device
+     * Assume we have no GMS memory, but allow it to be overridden by device
      * option (experimental).  The spec doesn't actually allow zero GMS when
      * when IVD (IGD VGA Disable) is clear, but the claim is that it's unused,
      * so let's not waste VM memory for it.
-- 
2.29.2


