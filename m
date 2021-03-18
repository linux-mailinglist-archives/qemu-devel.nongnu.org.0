Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78C341072
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:43:22 +0100 (CET)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1MP-0007y0-5W
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ia-0003yF-T1; Thu, 18 Mar 2021 18:39:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1IY-0003xs-VF; Thu, 18 Mar 2021 18:39:24 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJQq-1m60dF0Axo-00jFct; Thu, 18 Mar 2021 23:39:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] m68k: add the virtio devices aliases
Date: Thu, 18 Mar 2021 23:39:04 +0100
Message-Id: <20210318223907.1344870-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318223907.1344870-1-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Rk8+rPnec7ayTybXLWOB9lZ4DG1rKA3bLfWqZnwY5zvSctmUP1g
 8GD/5I2EPsZHF//AB6qxTSYSYkrEnY9k9kuIfcqVUEes8GtIy1kayULxnn2uA6IqmAqD1nY
 F/8NEqqZZ+x0UZoxlResjASAjB9Soged8nDGVStrPMP6PrBfKH8wOb1gYlFJf4QTWUHXb/H
 bCqpIOrS043szYWZBQxrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MEfj3LRuyNI=:beAdjBklH0VLAo3tC0kARS
 2xouMs4BZFpT7da08SzsTS7Wx6Jh2g7mtPtDSeulNdhU1plWBlPHZ4bPyTZTOqjW5F00Y8rUO
 W0P0riG+c8ppmiLp7t+zNrtuQkiHGzDQP6jGk7QS/rA/nSeac6fsfZYSB9aLjgwBzkHULib/D
 jTSaB83s+wiuEz07K3Y2zABR5VJWEQQIDrVFevvSDEmq3VKuvJvt1+LbWwhUs3mJW6v7YmuSO
 lyYfNslPxTAZGKEfW8Ervj6GsydE6haLCJ0dvmOYdeRvBz7GiMkr4QRJHsF9eH1/4HH6+QP40
 mkRDnGHYMauZA3+vhME9kZRKa1eInHgLubtfAOmqgwJWeos/dF6/o4vu/g1CcGYxA8ARv1hLY
 D7WD3ctCKD9zBeHEszEG6yJxpoKE9siB5g/8Aimr/IQUtthzVsi1exAFuZQkaL50Ipp5y1vrH
 zUQ8Sdy04Q==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
define the virtio aliases.

This allows to start machines with virtio devices without
knowledge of the implementation type.

For instance, we can use "-device virtio-scsi" on
m68k, s390x or PC, and the device will be
"virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".

This already exists for s390x and -ccw interfaces, adds them
for m68k and MMIO (-device) interfaces.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/qdev-monitor.c | 46 +++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becca9..262d38b8c01e 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -42,6 +42,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
 
+#define QEMU_ARCH_NO_PCI (QEMU_ARCH_S390X | QEMU_ARCH_M68K)
+
 /*
  * Aliases were a bad idea from the start.  Let's keep them
  * from spreading further.
@@ -60,34 +62,46 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
+    { "virtio-9p-device", "virtio-9p", QEMU_ARCH_M68K },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
-    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-balloon-device", "virtio-balloon", QEMU_ARCH_M68K },
     { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
-    { "virtio-balloon-pci", "virtio-balloon",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_ALL &
+                                             ~QEMU_ARCH_NO_PCI },
+    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_M68K },
     { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
-    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
     { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
-    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-gpu-device", "virtio-gpu", QEMU_ARCH_M68K },
+    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-input-host-device", "virtio-input-host", QEMU_ARCH_M68K },
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
-    { "virtio-input-host-pci", "virtio-input-host",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_ALL &
+                                                   ~QEMU_ARCH_NO_PCI },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-keyboard-device", "virtio-keyboard", QEMU_ARCH_M68K },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
-    { "virtio-keyboard-pci", "virtio-keyboard",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_ALL &
+                                               ~QEMU_ARCH_NO_PCI },
+    { "virtio-mouse-device", "virtio-mouse", QEMU_ARCH_M68K },
     { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_S390X },
-    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-net-device", "virtio-net", QEMU_ARCH_M68K },
     { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
-    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-rng-device", "virtio-rng", QEMU_ARCH_M68K },
     { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_S390X },
-    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-scsi-device", "virtio-scsi", QEMU_ARCH_M68K },
     { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
-    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
+    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_M68K },
     { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
-    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI},
+    { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_M68K },
     { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
-    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
     { }
 };
 
-- 
2.30.2


