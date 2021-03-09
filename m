Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE3332362
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:52:49 +0100 (CET)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZyq-0000tE-EQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZsn-0004vz-1q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZse-0006aJ-Od
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDwpUtijdi9swqfEgA82Id2jjE9ugqeQK79trD91aPU=;
 b=MVxS8GL3cXQ6FVpHOriArI1UQq6jGlDfkxCQIrySqDhNIU8xbn4yY+pH1HWajB9vYmupEb
 k8z2SwDLS4TVRpeegq5RWu1ROFCDnnI/HiiwaVGYKYrgxUvPdTAx2Kr/9BzA3k1cua6gMc
 I9pwJAzxTCY46d0vSgsoEv16bGRyGOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vFqYlBwmP3m4rwzI4YHc3Q-1; Tue, 09 Mar 2021 05:46:21 -0500
X-MC-Unique: vFqYlBwmP3m4rwzI4YHc3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0650107465C;
 Tue,  9 Mar 2021 10:46:20 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D319D60C04;
 Tue,  9 Mar 2021 10:46:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] qtest: delete superfluous inclusions of qtest.h
Date: Tue,  9 Mar 2021 11:46:04 +0100
Message-Id: <20210309104617.714908-2-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

There are 23 files that include the "sysemu/qtest.h",
but they do not use any qtest functions.

Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210226081414.205946-1-kuhn.chenqun@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
index ed4ca9808e..ec7cb2f707 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -40,7 +40,6 @@
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
-#include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
 static const MemMapEntry spike_memmap[] = {
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
2.27.0


