Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CF3426C8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:26:14 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLhF-0006Ev-8E
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLew-0004Yk-KA; Fri, 19 Mar 2021 16:23:50 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLes-0001Mu-J0; Fri, 19 Mar 2021 16:23:50 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MXXhv-1lBdwK41yJ-00Z0L2; Fri, 19 Mar 2021 21:23:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] qdev: define list of archs with virtio-pci or
 virtio-ccw
Date: Fri, 19 Mar 2021 21:23:30 +0100
Message-Id: <20210319202335.2397060-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319202335.2397060-1-laurent@vivier.eu>
References: <20210319202335.2397060-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:76yBD/AL0SG3dAQw1RSeXD2OjcJw4elfo+pyNdPRwsQ7f49DExy
 ZpiDSj0vUNJGQL4QOCzbMVZN52EvYloDFwyz5ZIuIkFJpGuGTxSSAlwVWmqslj5Y8cRUrZz
 xtVBXppXh7PXUPbyAwgV9zhZptZP0GGMqSijsjkStIMdBlyKXsflhgRP1u6U2WW73jFWJWp
 94HT1orfFgxAzJvK6Ph/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mEpDGrKjz9A=:HNr4K+XM12nFix55VeWwRP
 pYTpVKNKqMblw50wXckSYdTRQ13S9oQ8++yhuEgNeypR9rf3vXCE8kPThlLRCMx4AfghVvKZN
 MSM2WuuLAF0US1AO1ocmToV63ijZLDsIEHl7jzhm+PSRR6xbBQDvuPWFmFtnWTKAGf9me5j/L
 GpeJtRlc7K9wTXsqWX49vgLcqG7cGG5EEEhEpfNuqh/EHKjpafi4p5nvuWm59bZgDUrGV0ID0
 Z4iy4mf4dzgkItp//tcKy0Ui0d0IOJS/KIU8PdB+DBL0ZRvKdc+GrVtoew7jN3OHPMCxtSsBR
 JjfZJ3vm2XJIMgarKymDyzbwjkfHhlIdQxzRbiXoD1v1v6vBB4XCGf1FZY3Ge5GM7QeK3Iijb
 HwxHg+Ya1dLaLun3jtCllfg1WKJ3cFfvHJ8/ORwSvbsIGAg3v/4NutDKoEEKoX0ZYeaDjUtnJ
 m3wCg4ppmg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/sysemu/arch_init.h |  8 ++++++
 softmmu/qdev-monitor.c     | 53 ++++++++++++++++++--------------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d49126..0c9070651664 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -35,4 +35,12 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
 
+/* default virtio transport per architecture */
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


