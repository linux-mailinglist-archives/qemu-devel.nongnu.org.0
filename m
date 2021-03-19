Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A53341E64
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:33:04 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFFP-0007t0-8H
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8V-0000MK-IB; Fri, 19 Mar 2021 09:25:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:54837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8P-0003hX-R9; Fri, 19 Mar 2021 09:25:55 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MofLl-1m3AfG2fo9-00p527; Fri, 19 Mar 2021 14:25:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] m68k: add the virtio devices aliases
Date: Fri, 19 Mar 2021 14:25:33 +0100
Message-Id: <20210319132537.2046339-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319132537.2046339-1-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OgUOTu8qY2H+iTDZSZBpxuzyifI3Hh8o+sOHBOsRX3HNH4SZeWQ
 upONh8sF3JsxXEa3FxaIK3we92TxSH5AWL6mDleKRytB6h+qlK1aluaI7cG1uEQxlb9ZYaI
 LhsIcCTbfCJgbVvHoQqHFlX9TKIpfEhVb/s8FO1IblxC0BJ08kzDhY+cWoniDExOIOe/8Fr
 5NWooLsg1eqmdRLYZldyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WAam94Wuxfg=:PMRwxtB/wfDnUtYByQtt5P
 4lBDN2+5hEW6SSdFPSTb2N2Nq0/fvttfWTWKhrJgrKXJwwFBjU7XXUdB9Vc44Sy6i3rInnI4s
 /mOZCUDFq+8uTa2BbiWrV6gktB8j19M09I/s/ASfnIeE1kEDI7S2bFKGTE0SUFTbz35rZDJT5
 PhBmIegQJy/1TgzZ1VcAv0vPtF0uD8k1gow37sW/gX+se0qxbc2zOggp8zGlA1SUO3X18hjsu
 teAFuvyAzRKxB7P1BRhxHtSgCwakA6tgTp9Jd+EwxMxuttCWE+RGHdVQF5/1p1KUAtbZsQyZv
 POycOrO3LAI7mPpqaP6vX0bRb/9EGVZRRflOJFRFs1V8e5pn7HUKauLKmvtx8asBsFuu16HrK
 oELWJL9Ay3gH4v/9XAI8EgITVWEoV/IwXUCCxrDoa6Xi7w3CcLZAf71eBs1Z0
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
define the virtio aliases.

This allows to start machines with virtio devices without
knowledge of the implementation type.

For instance, we can use "-device virtio-scsi" on
m68k, s390x or PC, and the device will be respectively
"virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".

This already exists for s390x and -ccw interfaces, add them
for m68k and MMIO (-device) interfaces.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/sysemu/arch_init.h |  1 +
 softmmu/qdev-monitor.c     | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 7217a822a14b..c6e34124e8a3 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -41,5 +41,6 @@ int xen_available(void);
                               QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
                               QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
 #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
 
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0b40c97c6e50..a9955b97a078 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,29 +60,41 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
+    { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-balloon-device", "virtio-balloon", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-device", "virtio-gpu", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-input-host-device", "virtio-input-host", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
     { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-keyboard-device", "virtio-keyboard", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-mouse-device", "virtio-mouse", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-net-device", "virtio-net", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-net-ccw", "virtio-net", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-net-pci", "virtio-net", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-rng-device", "virtio-rng", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-scsi-device", "virtio-scsi", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_VIRTIO_PCI},
+    { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
     { }
-- 
2.30.2


