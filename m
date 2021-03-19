Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA3341E24
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:29:07 +0100 (CET)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFBa-0002JF-1S
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8U-0000L0-QG; Fri, 19 Mar 2021 09:25:54 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8P-0003gs-6m; Fri, 19 Mar 2021 09:25:54 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MD9jV-1lWHgt2c2T-009AdL; Fri, 19 Mar 2021 14:25:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] qdev: define list of archs with virtio-pci or
 virtio-ccw
Date: Fri, 19 Mar 2021 14:25:32 +0100
Message-Id: <20210319132537.2046339-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319132537.2046339-1-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+A6+/tfs+3tqqwj+IyJ/NFc6Ktm+AYuoxtB09vWAtfzoCpVJFLr
 kPW5483n+z9QJaJraCEJ2Ml/zSJbowXUfjfHu8P/ZthshANrYIukX7Orp6pNngX6BS7HOan
 8bZ88HgTdv1Q87fvuw90miTo088lFxRKtzUFlPA/TfZUGi5331Za9Ji8nwZpdPD8gdAxCy+
 To/OXqbuIer0JzdVsaYdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9HugrLtpp8=:OuON+Xh0ztH3hoAn/1odGj
 bqCxMhjkIx20Ax9tmtEKyKkNhtnXWN3DFbWBnftx0wXDgd6Y9ZwYJ/QJ04kTjS8fDsGlGErC7
 Q4T1vg3tPZqzc/x/UniG8ePXGW8FBEf5wbyx/XtIL47lzzMf6d16aLiY8wtW3PIXhvKLQMacq
 euO10nvGO/SSDXGAEWc04Aav0rufQffZFbXPCufHxOUKWM+/OicSO+OFOjYzTspX7pbVi0wTq
 ++LItpZhiRwb/rpqjBqsBb8Bdim3HdMQuAPphlySSdIy9nHg4afW/3mJpzZfDTpF4HN7huMNF
 wtu9hTehN1y48lj6tW6dfZNVullPchxzlLpCAwD5geY0dGzTvMCsX1BQfTwzBOR2HxtkvPiyS
 jccZnBbSih1ygpUZUCZLpQFXRQfqDO01qyb3Rv+/j48POgQ4MdusMoVO+6HzVqqQRWJMb2VAO
 A4dbSdHZeA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

This is used to define virtio-*-pci and virtio-*-ccw aliases
rather than substracting the CCW architecture from all the others.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/sysemu/arch_init.h |  7 +++++
 softmmu/qdev-monitor.c     | 53 ++++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d49126..7217a822a14b 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -35,4 +35,11 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
 
+#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
+                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
+                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
+                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becca9..0b40c97c6e50 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,34 +60,31 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
-    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
-    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
-    { "virtio-balloon-pci", "virtio-balloon",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
-    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
-    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
-    { "virtio-input-host-pci", "virtio-input-host",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
-    { "virtio-keyboard-pci", "virtio-keyboard",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_S390X },
-    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
-    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_S390X },
-    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
-    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
-    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
-    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-net-pci", "virtio-net", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_VIRTIO_PCI},
+    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
     { }
 };
 
-- 
2.30.2


