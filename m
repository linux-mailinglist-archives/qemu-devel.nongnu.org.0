Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769E325F7F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:54:27 +0100 (CET)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYtF-0000SJ-Lk
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1lFYIH-0004XP-QU; Fri, 26 Feb 2021 03:16:14 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1lFYID-0001N1-SC; Fri, 26 Feb 2021 03:16:13 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dn2W40sKzz7qbw;
 Fri, 26 Feb 2021 16:14:24 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Feb 2021
 16:15:50 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2] qtest: delete superfluous inclusions of qtest.h
Date: Fri, 26 Feb 2021 16:14:14 +0800
Message-ID: <20210226081414.205946-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, ganqixin@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are 23 files that include the "sysemu/qtest.h",
but they do not use any qtest functions.

Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

---
v1->v2: Change the subject base on Markus's suggestion.
Cc: Markus Armbruster <armbru@redhat.com>
---
 accel/tcg/cpu-exec.c            | 1 -
 blockdev.c                      | 1 -
 hw/9pfs/9p.c                    | 1 -
 hw/arm/armv7m.c                 | 1 -
 hw/arm/mainstone.c              | 1 -
 hw/arm/xlnx-zcu102.c            | 1 -
 hw/arm/z2.c                     | 1 -
 hw/i386/pc.c                    | 1 -
 hw/misc/ivshmem.c               | 1 -
 hw/ppc/ppc440_bamboo.c          | 1 -
 hw/ppc/prep.c                   | 1 -
 hw/ppc/sam460ex.c               | 1 -
 hw/ppc/spapr_caps.c             | 1 -
 hw/ppc/spapr_pci_vfio.c         | 1 -
 hw/ppc/spapr_vio.c              | 1 -
 hw/ppc/virtex_ml507.c           | 1 -
 hw/riscv/spike.c                | 1 -
 hw/rx/rx62n.c                   | 1 -
 net/net.c                       | 1 -
 softmmu/cpu-timers.c            | 1 -
 target/ppc/translate_init.c.inc | 1 -
 util/main-loop.c                | 1 -
 util/qemu-timer.c               | 1 -
 23 files changed, 23 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd..4db74fc71f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -28,7 +28,6 @@
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
 #include "qemu/compiler.h"
-#include "sysemu/qtest.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
 #include "exec/tb-hash.h"
diff --git a/blockdev.c b/blockdev.c
index cd438e60e3..7463dd5b09 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -57,7 +57,6 @@
 #include "block/block_int.h"
 #include "block/trace.h"
 #include "sysemu/arch_init.h"
-#include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/replay.h"
 #include "qemu/cutils.h"
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 5a6e2c9d3d..134806db52 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -25,7 +25,6 @@
 #include "coth.h"
 #include "trace.h"
 #include "migration/blocker.h"
-#include "sysemu/qtest.h"
 #include "qemu/xxhash.h"
 #include <math.h>
 #include <linux/limits.h>
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8224d4ade9..6dd10d8470 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -16,7 +16,6 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "elf.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 6bc643651b..8454b65458 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -22,7 +22,6 @@
 #include "hw/block/flash.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
-#include "sysemu/qtest.h"
 #include "cpu.h"
 
 /* Device addresses */
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index c9713638c5..a9db25eb99 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -22,7 +22,6 @@
 #include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "qom/object.h"
 #include "net/can_emu.h"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 308c4da956..5099bd8380 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -24,7 +24,6 @@
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "exec/address-spaces.h"
-#include "sysemu/qtest.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..410db9ef96 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -58,7 +58,6 @@
 #include "sysemu/numa.h"
 #include "sysemu/kvm.h"
 #include "sysemu/xen.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 603e992a7f..a1fa4878be 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -35,7 +35,6 @@
 #include "qom/object_interfaces.h"
 #include "chardev/char-fe.h"
 #include "sysemu/hostmem.h"
-#include "sysemu/qtest.h"
 #include "qapi/visitor.h"
 
 #include "hw/misc/ivshmem.h"
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b156bcb999..b7539aa721 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -30,7 +30,6 @@
 #include "hw/ppc/ppc.h"
 #include "ppc405.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
 #include "hw/intc/ppc-uic.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7e72f6e4a9..f1b1efdcef 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -45,7 +45,6 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index e459b43065..0c6baf77e8 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -30,7 +30,6 @@
 #include "ppc405.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9341e9782a..9ea7ddd1e9 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -33,7 +33,6 @@
 #include "cpu-models.h"
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
-#include "sysemu/qtest.h"
 #include "sysemu/tcg.h"
 
 #include "hw/ppc/spapr.h"
diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index ecb34aaade..e0547b1740 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -25,7 +25,6 @@
 #include "hw/pci/msix.h"
 #include "hw/vfio/vfio.h"
 #include "qemu/error-report.h"
-#include "sysemu/qtest.h"
 
 bool spapr_phb_eeh_available(SpaprPhbState *sphb)
 {
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 3cc9421526..ef06e0362c 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -31,7 +31,6 @@
 #include "sysemu/device_tree.h"
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
-#include "sysemu/qtest.h"
 
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index b26ff17767..cb421570da 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -31,7 +31,6 @@
 #include "hw/char/serial.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
 #include "sysemu/device_tree.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 56986ecfe0..2c419b294e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -40,7 +40,6 @@
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
-#include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
 static const struct MemmapEntry {
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 17ec73fc7b..9c34ce14de 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -29,7 +29,6 @@
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/net/net.c b/net/net.c
index fb7b7dcc25..6002ba50db 100644
--- a/net/net.c
+++ b/net/net.c
@@ -50,7 +50,6 @@
 #include "qapi/error.h"
 #include "qapi/opts-visitor.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 1eb7c675c1..cd38595245 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -30,7 +30,6 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpus.h"
-#include "sysemu/qtest.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "qemu/seqlock.h"
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e7324e85cd..108ff2be2b 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -37,7 +37,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/ppc/ppc.h"
 #include "mmu-book3s-v3.h"
-#include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
diff --git a/util/main-loop.c b/util/main-loop.c
index 6bfc7c46f5..5188ff6540 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/timer.h"
-#include "sysemu/qtest.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 81c28af517..f36c75e594 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -29,7 +29,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpus.h"
-#include "sysemu/qtest.h"
 
 #ifdef CONFIG_POSIX
 #include <pthread.h>
-- 
2.23.0


