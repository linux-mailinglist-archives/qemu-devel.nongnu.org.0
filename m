Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C53426CD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:26:38 +0100 (CET)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLhd-00075v-O2
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf7-0004v6-5S; Fri, 19 Mar 2021 16:24:01 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:59285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf2-0001SH-Kl; Fri, 19 Mar 2021 16:24:00 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjjSt-1m7zHi0VoJ-00lBbg; Fri, 19 Mar 2021 21:23:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] m68k: add the virtio devices aliases
Date: Fri, 19 Mar 2021 21:23:31 +0100
Message-Id: <20210319202335.2397060-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319202335.2397060-1-laurent@vivier.eu>
References: <20210319202335.2397060-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E95/utwZKt79kFVUK3iWKU/InUEmj3zwqWv/HPdZcM91TBv+lSS
 /jL8GMxOnuLG+G9tq7ZTxRBJUv3KPgj9YRCVaMcsP4HSCz8IcKevYf3m68CfDSDM0IzJvCK
 t95tMBwok2gg8NspotMNkDJv8spNaJ8aOnX7/OPvanO02zSaG5QEG4LN5rYVoV5eWz3WyBV
 feccnezAVd8yoxTUhM2KQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OTjdt/FpSX8=:86UmfJZMNiCdEyEhLZkc21
 RFW2J9CjLrwAJXybTnoVyHoSzp7UemtXkv7rXdsTnFo3KyRICOb8LQUjD2RU9IJ4lIS1tHLYB
 aOp0hZwJX1Ndyf1BRaST8U1EkcLyRZNiMNJ9Bl1RExoKijU7Gy9XJVg1bfxh+WmqQ0PYkinTA
 nJDQP4DhnIj8bjmBV727/AtqfD9UuzcHk/XiwGNhHcMT16o7ocH25pA8GVm0Oa67A2z+OwuDE
 MyeBjRLuMeIw5NIfwULPDhK6Gr5R7WSPBvhkEX7gqmiqKPZxzOtPbH1nQaHhzb+e8UnlLUhBw
 /5NMXY1fN+SMg+eQU4yWaDUi7IyoYSsz+2mNRdJ+rLASDt+M36dhQ1Zm9D3FFu0vqel51Owtk
 OFpZKhgtHZhw+L+J35bNbLxYfPFdNXz1G1MoTYVxzP09agFAU8/V0p8KOHCCRF53YvZoE8yBb
 Gg4lL/q72w==
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/sysemu/arch_init.h |  1 +
 softmmu/qdev-monitor.c     | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 0c9070651664..16da27969627 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -42,5 +42,6 @@ int xen_available(void);
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


