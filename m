Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C7624A57
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otCuk-0007pk-Gt; Thu, 10 Nov 2022 14:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1otCui-0007mm-7H; Thu, 10 Nov 2022 14:08:36 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1otCuf-0008HJ-IQ; Thu, 10 Nov 2022 14:08:35 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 652E9DA043F;
 Thu, 10 Nov 2022 20:08:29 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 3F3B9462074; Thu, 10 Nov 2022 20:08:29 +0100 (CET)
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
Date: Thu, 10 Nov 2022 20:08:25 +0100
Message-Id: <20221110190825.879620-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Those typos are in files which are used to generate the QEMU manual.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.

Stefan

 docs/devel/acpi-bits.rst       | 2 +-
 docs/system/devices/can.rst    | 2 +-
 hw/scsi/esp.c                  | 6 +++---
 include/exec/memory.h          | 6 +++---
 qapi/virtio.json               | 4 ++--
 qemu-options.hx                | 6 +++---
 tests/qtest/libqos/qgraph.h    | 2 +-
 tests/qtest/libqos/virtio-9p.c | 2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index c9564d871a..5e22be8ef6 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
 
    (a) They are python2.7 based scripts and not python 3 scripts.
    (b) They are run from within the bios bits VM and is not subjected to QEMU
-       build/test python script maintainance and dependency resolutions.
+       build/test python script maintenance and dependency resolutions.
    (c) They need not be loaded by avocado framework when running tests.
 
 
diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
index fe37af8223..24b0d4cf41 100644
--- a/docs/system/devices/can.rst
+++ b/docs/system/devices/can.rst
@@ -169,7 +169,7 @@ and with bitrate switch::
 
   cangen can0 -b
 
-The test can be run viceversa, generate messages in the guest system and capture them
+The test can be run vice-versa, generate messages in the guest system and capture them
 in the host one and much more combinations.
 
 Links to other resources
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index e5b281e836..e52188d022 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -515,7 +515,7 @@ static void do_dma_pdma_cb(ESPState *s)
         } else {
             /*
              * Extra message out bytes received: update cmdfifo_cdb_offset
-             * and then switch to commmand phase
+             * and then switch to command phase
              */
             s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
@@ -627,7 +627,7 @@ static void esp_do_dma(ESPState *s)
         } else {
             /*
              * Extra message out bytes received: update cmdfifo_cdb_offset
-             * and then switch to commmand phase
+             * and then switch to command phase
              */
             s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
@@ -738,7 +738,7 @@ static void esp_do_nodma(ESPState *s)
         } else {
             /*
              * Extra message out bytes received: update cmdfifo_cdb_offset
-             * and then switch to commmand phase
+             * and then switch to command phase
              */
             s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 80fa75baa1..91f8a2395a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -561,7 +561,7 @@ typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
  * A #RamDiscardManager coordinates which parts of specific RAM #MemoryRegion
  * regions are currently populated to be used/accessed by the VM, notifying
  * after parts were discarded (freeing up memory) and before parts will be
- * populated (consuming memory), to be used/acessed by the VM.
+ * populated (consuming memory), to be used/accessed by the VM.
  *
  * A #RamDiscardManager can only be set for a RAM #MemoryRegion while the
  * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
@@ -585,7 +585,7 @@ typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
  * Listeners are called in multiples of the minimum granularity (unless it
  * would exceed the registered range) and changes are aligned to the minimum
  * granularity within the #MemoryRegion. Listeners have to prepare for memory
- * becomming discarded in a different granularity than it was populated and the
+ * becoming discarded in a different granularity than it was populated and the
  * other way around.
  */
 struct RamDiscardManagerClass {
@@ -1247,7 +1247,7 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
                                             Error **errp);
 
 /**
- * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
+ * memory_region_init_resizeable_ram:  Initialize memory region with resizable
  *                                     RAM.  Accesses into the region will
  *                                     modify memory directly.  Only an initial
  *                                     portion of this RAM is actually used.
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 872c7e3623..019d2d1987 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -321,7 +321,7 @@
 #          },
 #          "backend-features": {
 #              "dev-features": [
-#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported",
 #                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
 #                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
 #                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
@@ -394,7 +394,7 @@
 #          },
 #          "host-features": {
 #              "dev-features": [
-#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported",
 #                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
 #                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
 #                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
diff --git a/qemu-options.hx b/qemu-options.hx
index 8b8a4a5d01..7f99d15b23 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -139,7 +139,7 @@ SRST
         interleave requirements before enabling the memory devices.
 
         ``targets.X=target`` provides the mapping to CXL host bridges
-        which may be identified by the id provied in the -device entry.
+        which may be identified by the id provided in the -device entry.
         Multiple entries are needed to specify all the targets when
         the fixed memory window represents interleaved memory. X is the
         target index from 0.
@@ -362,7 +362,7 @@ SRST
   \ 
 ``-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]``
   \ 
-``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=tpye[,latency=lat][,bandwidth=bw]``
+``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=type[,latency=lat][,bandwidth=bw]``
   \ 
 ``-numa hmat-cache,node-id=node,size=size,level=level[,associativity=str][,policy=str][,line=size]``
     Define a NUMA node and assign RAM and VCPUs to it. Set the NUMA
@@ -1785,7 +1785,7 @@ SRST
     directory on host is made directly accessible by guest as a pass-through
     file system by using the 9P network protocol for communication between
     host and guests, if desired even accessible, shared by several guests
-    simultaniously.
+    simultaneously.
 
     Note that ``-virtfs`` is actually just a convenience shortcut for its
     generalized form ``-fsdev -device virtio-9p-pci``.
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 5c0046e989..287022a67c 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -381,7 +381,7 @@ QOSGraphObject *qos_driver_new(QOSGraphNode *node, QOSGraphObject *parent,
  * mind: only tests with a path down from the actual test case node (leaf) up
  * to the graph's root node are actually executed by the qtest framework. And
  * the qtest framework uses QMP to automatically check which QEMU drivers are
- * actually currently available, and accordingly qos marks certain pathes as
+ * actually currently available, and accordingly qos marks certain paths as
  * 'unavailable' in such cases (e.g. when QEMU was compiled without support for
  * a certain feature).
  */
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index ae9b0a20e2..7f21028256 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -31,7 +31,7 @@
 static QGuestAllocator *alloc;
 static char *local_test_path;
 
-/* Concatenates the passed 2 pathes. Returned result must be freed. */
+/* Concatenates the passed 2 paths. Returned result must be freed. */
 static char *concat_path(const char* a, const char* b)
 {
     return g_build_filename(a, b, NULL);
-- 
2.30.2


