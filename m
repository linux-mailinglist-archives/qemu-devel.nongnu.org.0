Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F88C51D9A3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:53:05 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyOG-0000zI-Dn
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKe-0005uM-9H
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:50286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKa-0005q5-0r
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651844954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgbulnofFG+r06b8er8hctBjICVRP8HF9H3L5DHS4v4=;
 b=i1S7gQt3ofz3xxqDcYdNHZokYOPEwzBjJh0X5vL/hMcHhJRBOtQlrkfFHn8BND+i0PA47/
 4d3Zsv/kuKhvgOXlBg0QICI+luJrHTHlbUQIJQK/YCiIpm5sNyWw8Dbw5V6QSQrahJKDA1
 U4DSNlLwmTjvlpErnLRxqi8Vb/t1Nl8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-bkdsVfmtO0CfHeH4GklxtQ-1; Fri, 06 May 2022 09:49:13 -0400
X-MC-Unique: bkdsVfmtO0CfHeH4GklxtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66B64185A79C
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E185FC28119
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE9F321E6882; Fri,  6 May 2022 15:49:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] Clean up header guards that don't match their file name
Date: Fri,  6 May 2022 15:49:08 +0200
Message-Id: <20220506134911.2856099-2-armbru@redhat.com>
In-Reply-To: <20220506134911.2856099-1-armbru@redhat.com>
References: <20220506134911.2856099-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Header guard symbols should match their file name to make guard
collisions less likely.

Cleaned up with scripts/clean-header-guards.pl, followed by some
renaming of new guard symbols picked by the script to better ones.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 accel/tcg/tcg-accel-ops-icount.h            | 6 +++---
 accel/tcg/tcg-accel-ops-mttcg.h             | 6 +++---
 accel/tcg/tcg-accel-ops-rr.h                | 6 +++---
 accel/tcg/tcg-accel-ops.h                   | 6 +++---
 block/coroutines.h                          | 6 +++---
 bsd-user/arm/target_syscall.h               | 6 +++---
 bsd-user/i386/target.h                      | 7 +++----
 bsd-user/i386/target_arch_sysarch.h         | 6 +++---
 bsd-user/x86_64/target_arch_sysarch.h       | 6 +++---
 ebpf/rss.bpf.skeleton.h                     | 7 ++++---
 hw/i386/e820_memory_layout.h                | 4 ++--
 hw/net/can/ctu_can_fd_frame.h               | 4 ++--
 hw/net/can/ctu_can_fd_regs.h                | 4 ++--
 hw/nvme/nvme.h                              | 6 +++---
 hw/usb/hcd-dwc2.h                           | 4 ++--
 include/block/block-hmp-cmds.h              | 4 ++--
 include/crypto/tls-cipher-suites.h          | 6 +++---
 include/hw/acpi/generic_event_device.h      | 4 ++--
 include/hw/i2c/arm_sbcon_i2c.h              | 7 ++++---
 include/hw/misc/bcm2835_cprman.h            | 4 ++--
 include/hw/misc/bcm2835_cprman_internals.h  | 4 ++--
 include/hw/misc/stm32f4xx_exti.h            | 4 ++--
 include/hw/misc/stm32f4xx_syscfg.h          | 4 ++--
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 6 +++---
 include/hw/net/mv88w8618_eth.h              | 5 +++--
 include/hw/nubus/mac-nubus-bridge.h         | 4 ++--
 include/hw/pci-host/remote.h                | 4 ++--
 include/hw/riscv/boot_opensbi.h             | 5 +++--
 include/hw/riscv/shakti_c.h                 | 4 ++--
 include/hw/rtc/sun4v-rtc.h                  | 4 ++--
 include/hw/rtc/xlnx-zynqmp-rtc.h            | 4 ++--
 include/hw/rx/rx62n.h                       | 4 ++--
 include/hw/sensor/emc141x_regs.h            | 4 ++--
 include/hw/ssi/xlnx-versal-ospi.h           | 6 +++---
 include/hw/timer/bcm2835_systmr.h           | 4 ++--
 include/hw/tricore/tricore_testdevice.h     | 5 ++---
 include/hw/usb/dwc2-regs.h                  | 6 +++---
 include/hw/usb/hcd-musb.h                   | 4 ++--
 include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
 include/hw/watchdog/wdt_imx2.h              | 6 +++---
 include/qemu/help-texts.h                   | 4 ++--
 include/qemu/qemu-plugin.h                  | 7 ++++---
 include/sysemu/block-backend-global-state.h | 6 +++---
 plugins/plugin.h                            | 6 +++---
 target/arm/translate-a32.h                  | 4 ++--
 target/arm/vec_internal.h                   | 6 +++---
 target/avr/cpu-qom.h                        | 6 +++---
 target/hexagon/hex_arch_types.h             | 4 ++--
 target/hexagon/hex_regs.h                   | 4 ++--
 target/i386/hax/hax-accel-ops.h             | 6 +++---
 target/i386/nvmm/nvmm-accel-ops.h           | 6 +++---
 target/i386/sev.h                           | 4 ++--
 target/i386/whpx/whpx-accel-ops.h           | 6 +++---
 target/i386/whpx/whpx-internal.h            | 6 +++---
 target/xtensa/core-de233_fpu/core-isa.h     | 7 +++----
 target/xtensa/core-dsp3400/core-isa.h       | 8 +++-----
 tests/qtest/fuzz/fuzz.h                     | 5 ++---
 tools/virtiofsd/passthrough_seccomp.h       | 7 +++----
 59 files changed, 152 insertions(+), 154 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.h b/accel/tcg/tcg-accel-ops-icount.h
index d884aa2aaa..1b6fd9c607 100644
--- a/accel/tcg/tcg-accel-ops-icount.h
+++ b/accel/tcg/tcg-accel-ops-icount.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef TCG_CPUS_ICOUNT_H
-#define TCG_CPUS_ICOUNT_H
+#ifndef TCG_ACCEL_OPS_ICOUNT_H
+#define TCG_ACCEL_OPS_ICOUNT_H
 
 void icount_handle_deadline(void);
 void icount_prepare_for_run(CPUState *cpu);
@@ -16,4 +16,4 @@ void icount_process_data(CPUState *cpu);
 
 void icount_handle_interrupt(CPUState *cpu, int mask);
 
-#endif /* TCG_CPUS_ICOUNT_H */
+#endif /* TCG_ACCEL_OPS_ICOUNT_H */
diff --git a/accel/tcg/tcg-accel-ops-mttcg.h b/accel/tcg/tcg-accel-ops-mttcg.h
index 9fdc5a2ab5..8ffa7a9a9f 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.h
+++ b/accel/tcg/tcg-accel-ops-mttcg.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef TCG_CPUS_MTTCG_H
-#define TCG_CPUS_MTTCG_H
+#ifndef TCG_ACCEL_OPS_MTTCG_H
+#define TCG_ACCEL_OPS_MTTCG_H
 
 /* kick MTTCG vCPU thread */
 void mttcg_kick_vcpu_thread(CPUState *cpu);
@@ -16,4 +16,4 @@ void mttcg_kick_vcpu_thread(CPUState *cpu);
 /* start an mttcg vCPU thread */
 void mttcg_start_vcpu_thread(CPUState *cpu);
 
-#endif /* TCG_CPUS_MTTCG_H */
+#endif /* TCG_ACCEL_OPS_MTTCG_H */
diff --git a/accel/tcg/tcg-accel-ops-rr.h b/accel/tcg/tcg-accel-ops-rr.h
index 54f6ae6e86..2a76a29612 100644
--- a/accel/tcg/tcg-accel-ops-rr.h
+++ b/accel/tcg/tcg-accel-ops-rr.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef TCG_CPUS_RR_H
-#define TCG_CPUS_RR_H
+#ifndef TCG_ACCEL_OPS_RR_H
+#define TCG_ACCEL_OPS_RR_H
 
 #define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
 
@@ -18,4 +18,4 @@ void rr_kick_vcpu_thread(CPUState *unused);
 /* start the round robin vcpu thread */
 void rr_start_vcpu_thread(CPUState *cpu);
 
-#endif /* TCG_CPUS_RR_H */
+#endif /* TCG_ACCEL_OPS_RR_H */
diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
index 6a5fcef889..f9bc6330e2 100644
--- a/accel/tcg/tcg-accel-ops.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -9,8 +9,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef TCG_CPUS_H
-#define TCG_CPUS_H
+#ifndef TCG_ACCEL_OPS_H
+#define TCG_ACCEL_OPS_H
 
 #include "sysemu/cpus.h"
 
@@ -19,4 +19,4 @@ int tcg_cpus_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel);
 
-#endif /* TCG_CPUS_H */
+#endif /* TCG_ACCEL_OPS_H */
diff --git a/block/coroutines.h b/block/coroutines.h
index 8ea70d45f9..830ecaa733 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef BLOCK_COROUTINES_INT_H
-#define BLOCK_COROUTINES_INT_H
+#ifndef BLOCK_COROUTINES_H
+#define BLOCK_COROUTINES_H
 
 #include "block/block_int.h"
 
@@ -129,4 +129,4 @@ blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 
-#endif /* BLOCK_COROUTINES_INT_H */
+#endif /* BLOCK_COROUTINES_H */
diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
index a5f2bb4e01..5804a53541 100644
--- a/bsd-user/arm/target_syscall.h
+++ b/bsd-user/arm/target_syscall.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_SYSCALL_H_
-#define _TARGET_ARCH_SYSCALL_H_
+#ifndef ARM_TARGET_SYSCALL_H
+#define ARM_TARGET_SYSCALL_H
 
 struct target_pt_regs {
     abi_long uregs[17];
@@ -52,4 +52,4 @@ struct target_pt_regs {
 #define TARGET_HW_MACHINE       "arm"
 #define TARGET_HW_MACHINE_ARCH  "armv7"
 
-#endif /* !_TARGET_ARCH_SYSCALL_H_ */
+#endif /* ARM_TARGET_SYSCALL_H */
diff --git a/bsd-user/i386/target.h b/bsd-user/i386/target.h
index 9b9df047a3..ddd3b8ec08 100644
--- a/bsd-user/i386/target.h
+++ b/bsd-user/i386/target.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef TARGET_ARCH_H
-#define TARGET_ARCH_H
+#ifndef TARGET_H
+#define TARGET_H
 
 /*
  * i386 doesn't 'lump' the registers for 64-bit args.
@@ -17,5 +17,4 @@ static inline bool regpairs_aligned(void *cpu_env)
     return false;
 }
 
-#endif /* ! TARGET_ARCH_H */
-
+#endif /* TARGET_H */
diff --git a/bsd-user/i386/target_arch_sysarch.h b/bsd-user/i386/target_arch_sysarch.h
index e9ab98ec32..db8fee6380 100644
--- a/bsd-user/i386/target_arch_sysarch.h
+++ b/bsd-user/i386/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef TARGET_ARCH_SYSARCH_H
+#define TARGET_ARCH_SYSARCH_H
 
 #include "target_syscall.h"
 
@@ -74,4 +74,4 @@ static inline void do_freebsd_arch_print_sysarch(
         TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
 }
 
-#endif /* !BSD_USER_ARCH_SYSARCH_H_ */
+#endif /* TARGET_ARCH_SYSARCH_H */
diff --git a/bsd-user/x86_64/target_arch_sysarch.h b/bsd-user/x86_64/target_arch_sysarch.h
index 5c36fc0752..152cb8bcb8 100644
--- a/bsd-user/x86_64/target_arch_sysarch.h
+++ b/bsd-user/x86_64/target_arch_sysarch.h
@@ -16,8 +16,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef TARGET_ARCH_SYSARCH_H
+#define TARGET_ARCH_SYSARCH_H
 
 #include "target_syscall.h"
 
@@ -73,4 +73,4 @@ static inline void do_freebsd_arch_print_sysarch(
         TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
 }
 
-#endif /*! BSD_USER_ARCH_SYSARCH_H_ */
+#endif /* TARGET_ARCH_SYSARCH_H */
diff --git a/ebpf/rss.bpf.skeleton.h b/ebpf/rss.bpf.skeleton.h
index 126683eb87..4bca5d223a 100644
--- a/ebpf/rss.bpf.skeleton.h
+++ b/ebpf/rss.bpf.skeleton.h
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
 
 /* THIS FILE IS AUTOGENERATED! */
-#ifndef __RSS_BPF_SKEL_H__
-#define __RSS_BPF_SKEL_H__
+
+#ifndef EBPF_RSS_BPF_SKELETON_H
+#define EBPF_RSS_BPF_SKELETON_H
 
 #include <stdlib.h>
 #include <bpf/libbpf.h>
@@ -428,4 +429,4 @@ err:
 	return -1;
 }
 
-#endif /* __RSS_BPF_SKEL_H__ */
+#endif /* EBPF_RSS_BPF_SKELETON_H */
diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 2a0ceb8b9c..04f93780f9 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: MIT
  */
 
-#ifndef HW_I386_E820_H
-#define HW_I386_E820_H
+#ifndef HW_I386_E820_MEMORY_LAYOUT_H
+#define HW_I386_E820_MEMORY_LAYOUT_H
 
 /* e820 types */
 #define E820_RAM        1
diff --git a/hw/net/can/ctu_can_fd_frame.h b/hw/net/can/ctu_can_fd_frame.h
index 04d956c84e..459c4a0ada 100644
--- a/hw/net/can/ctu_can_fd_frame.h
+++ b/hw/net/can/ctu_can_fd_frame.h
@@ -29,8 +29,8 @@
 
 /* This file is autogenerated, DO NOT EDIT! */
 
-#ifndef __CTU_CAN_FD_CAN_FD_FRAME_FORMAT__
-#define __CTU_CAN_FD_CAN_FD_FRAME_FORMAT__
+#ifndef HW_CAN_CTU_CAN_FD_FRAME_H
+#define HW_CAN_CTU_CAN_FD_FRAME_H
 
 /* CAN_Frame_format memory map */
 enum ctu_can_fd_can_frame_format {
diff --git a/hw/net/can/ctu_can_fd_regs.h b/hw/net/can/ctu_can_fd_regs.h
index 450f4b9fb3..57859b87bc 100644
--- a/hw/net/can/ctu_can_fd_regs.h
+++ b/hw/net/can/ctu_can_fd_regs.h
@@ -29,8 +29,8 @@
 
 /* This file is autogenerated, DO NOT EDIT! */
 
-#ifndef __CTU_CAN_FD_CAN_FD_REGISTER_MAP__
-#define __CTU_CAN_FD_CAN_FD_REGISTER_MAP__
+#ifndef HW_CAN_CTU_CAN_FD_REGS_H
+#define HW_CAN_CTU_CAN_FD_REGS_H
 
 /* CAN_Registers memory map */
 enum ctu_can_fd_can_registers {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f79..6773819325 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -15,8 +15,8 @@
  * This code is licensed under the GNU GPL v2 or later.
  */
 
-#ifndef HW_NVME_INTERNAL_H
-#define HW_NVME_INTERNAL_H
+#ifndef HW_NVME_NVME_H
+#define HW_NVME_NVME_H
 
 #include "qemu/uuid.h"
 #include "hw/pci/pci.h"
@@ -519,4 +519,4 @@ void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd);
 
-#endif /* HW_NVME_INTERNAL_H */
+#endif /* HW_NVME_NVME_H */
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 6998b04706..9c3d88ea14 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -16,8 +16,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef HW_USB_DWC2_H
-#define HW_USB_DWC2_H
+#ifndef HW_USB_HCD_DWC2_H
+#define HW_USB_HCD_DWC2_H
 
 #include "qemu/timer.h"
 #include "hw/irq.h"
diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.h
index 3412e108ca..50ce0247c3 100644
--- a/include/block/block-hmp-cmds.h
+++ b/include/block/block-hmp-cmds.h
@@ -12,8 +12,8 @@
  * the COPYING file in the top-level directory.
  */
 
-#ifndef BLOCK_HMP_COMMANDS_H
-#define BLOCK_HMP_COMMANDS_H
+#ifndef BLOCK_BLOCK_HMP_CMDS_H
+#define BLOCK_BLOCK_HMP_CMDS_H
 
 void hmp_drive_add(Monitor *mon, const QDict *qdict);
 
diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
index 7eb1b76122..3bd2003f32 100644
--- a/include/crypto/tls-cipher-suites.h
+++ b/include/crypto/tls-cipher-suites.h
@@ -8,8 +8,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef QCRYPTO_TLSCIPHERSUITES_H
-#define QCRYPTO_TLSCIPHERSUITES_H
+#ifndef QCRYPTO_TLS_CIPHER_SUITES_H
+#define QCRYPTO_TLS_CIPHER_SUITES_H
 
 #include "qom/object.h"
 #include "crypto/tlscreds.h"
@@ -31,4 +31,4 @@ DECLARE_INSTANCE_CHECKER(QCryptoTLSCipherSuites, QCRYPTO_TLS_CIPHER_SUITES,
 GByteArray *qcrypto_tls_cipher_suites_get_data(QCryptoTLSCipherSuites *obj,
                                                Error **errp);
 
-#endif /* QCRYPTO_TLSCIPHERSUITES_H */
+#endif /* QCRYPTO_TLS_CIPHER_SUITES_H */
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d49217c445..d831bbd889 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -56,8 +56,8 @@
  *
  */
 
-#ifndef HW_ACPI_GED_H
-#define HW_ACPI_GED_H
+#ifndef HW_ACPI_GENERIC_EVENT_DEVICE_H
+#define HW_ACPI_GENERIC_EVENT_DEVICE_H
 
 #include "hw/sysbus.h"
 #include "hw/acpi/memory_hotplug.h"
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index ad96781e7a..f54d1e5413 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -9,8 +9,9 @@
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
-#ifndef HW_I2C_ARM_SBCON_H
-#define HW_I2C_ARM_SBCON_H
+
+#ifndef HW_I2C_ARM_SBCON_I2C_H
+#define HW_I2C_ARM_SBCON_I2C_H
 
 #include "hw/sysbus.h"
 #include "hw/i2c/bitbang_i2c.h"
@@ -34,4 +35,4 @@ struct ArmSbconI2CState {
     int in;
 };
 
-#endif /* HW_I2C_ARM_SBCON_H */
+#endif /* HW_I2C_ARM_SBCON_I2C_H */
diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 3df4ceedd2..0d38036728 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef HW_MISC_CPRMAN_H
-#define HW_MISC_CPRMAN_H
+#ifndef HW_MISC_BCM2835_CPRMAN_H
+#define HW_MISC_BCM2835_CPRMAN_H
 
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
index 339759b307..7617aff96f 100644
--- a/include/hw/misc/bcm2835_cprman_internals.h
+++ b/include/hw/misc/bcm2835_cprman_internals.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef HW_MISC_CPRMAN_INTERNALS_H
-#define HW_MISC_CPRMAN_INTERNALS_H
+#ifndef HW_MISC_BCM2835_CPRMAN_INTERNALS_H
+#define HW_MISC_BCM2835_CPRMAN_INTERNALS_H
 
 #include "hw/registerfields.h"
 #include "hw/misc/bcm2835_cprman.h"
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index ea6b0097b0..fc11c595fa 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef HW_STM_EXTI_H
-#define HW_STM_EXTI_H
+#ifndef HW_STM32F4XX_EXTI_H
+#define HW_STM32F4XX_EXTI_H
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index 6f8ca49228..9fce67f4b4 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef HW_STM_SYSCFG_H
-#define HW_STM_SYSCFG_H
+#ifndef HW_STM32F4XX_SYSCFG_H
+#define HW_STM32F4XX_SYSCFG_H
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
diff --git a/include/hw/misc/xlnx-versal-pmc-iou-slcr.h b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
index ab4e4b4f18..2170420f01 100644
--- a/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
+++ b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
@@ -51,8 +51,8 @@
  *   1: OSPI direct access mode.
  */
 
-#ifndef XILINX_VERSAL_PMC_IOU_SLCR_H
-#define XILINX_VERSAL_PMC_IOU_SLCR_H
+#ifndef XLNX_VERSAL_PMC_IOU_SLCR_H
+#define XLNX_VERSAL_PMC_IOU_SLCR_H
 
 #include "hw/register.h"
 
@@ -75,4 +75,4 @@ struct XlnxVersalPmcIouSlcr {
     RegisterInfo regs_info[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
 };
 
-#endif /* XILINX_VERSAL_PMC_IOU_SLCR_H */
+#endif /* XLNX_VERSAL_PMC_IOU_SLCR_H */
diff --git a/include/hw/net/mv88w8618_eth.h b/include/hw/net/mv88w8618_eth.h
index 8f4c746092..41074940ec 100644
--- a/include/hw/net/mv88w8618_eth.h
+++ b/include/hw/net/mv88w8618_eth.h
@@ -4,8 +4,9 @@
  *
  * Copyright (c) 2008-2021 QEMU contributors
  */
-#ifndef HW_NET_MV88W8618_H
-#define HW_NET_MV88W8618_H
+
+#ifndef HW_NET_MV88W8618_ETH_H
+#define HW_NET_MV88W8618_ETH_H
 
 #define TYPE_MV88W8618_ETH "mv88w8618_eth"
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 70ab50ab2d..be4dd83530 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef HW_NUBUS_MAC_H
-#define HW_NUBUS_MAC_H
+#ifndef HW_NUBUS_MAC_NUBUS_BRIDGE_H
+#define HW_NUBUS_MAC_NUBUS_BRIDGE_H
 
 #include "hw/nubus/nubus.h"
 #include "qom/object.h"
diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
index 3dcf6aa51d..690a01f0fe 100644
--- a/include/hw/pci-host/remote.h
+++ b/include/hw/pci-host/remote.h
@@ -8,8 +8,8 @@
  *
  */
 
-#ifndef REMOTE_PCIHOST_H
-#define REMOTE_PCIHOST_H
+#ifndef PCI_HOST_REMOTE_H
+#define PCI_HOST_REMOTE_H
 
 #include "exec/memory.h"
 #include "hw/pci/pcie_host.h"
diff --git a/include/hw/riscv/boot_opensbi.h b/include/hw/riscv/boot_opensbi.h
index 0d5ddd6c3d..c19cad4818 100644
--- a/include/hw/riscv/boot_opensbi.h
+++ b/include/hw/riscv/boot_opensbi.h
@@ -4,8 +4,9 @@
  *
  * Based on include/sbi/{fw_dynamic.h,sbi_scratch.h} from the OpenSBI project.
  */
-#ifndef OPENSBI_H
-#define OPENSBI_H
+
+#ifndef RISCV_BOOT_OPENSBI_H
+#define RISCV_BOOT_OPENSBI_H
 
 /** Expected value of info magic ('OSBI' ascii string in hex) */
 #define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 50a2b79086..daf0aae13f 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -16,8 +16,8 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_SHAKTI_H
-#define HW_SHAKTI_H
+#ifndef HW_SHAKTI_C_H
+#define HW_SHAKTI_C_H
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
diff --git a/include/hw/rtc/sun4v-rtc.h b/include/hw/rtc/sun4v-rtc.h
index fd868f6ed2..fc54dfcba4 100644
--- a/include/hw/rtc/sun4v-rtc.h
+++ b/include/hw/rtc/sun4v-rtc.h
@@ -9,8 +9,8 @@
  * version.
  */
 
-#ifndef HW_RTC_SUN4V
-#define HW_RTC_SUN4V
+#ifndef HW_RTC_SUN4V_RTC_H
+#define HW_RTC_SUN4V_RTC_H
 
 #include "exec/hwaddr.h"
 
diff --git a/include/hw/rtc/xlnx-zynqmp-rtc.h b/include/hw/rtc/xlnx-zynqmp-rtc.h
index 5f1ad0a946..f0c6a2d78a 100644
--- a/include/hw/rtc/xlnx-zynqmp-rtc.h
+++ b/include/hw/rtc/xlnx-zynqmp-rtc.h
@@ -24,8 +24,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef HW_RTC_XLNX_ZYNQMP_H
-#define HW_RTC_XLNX_ZYNQMP_H
+#ifndef HW_RTC_XLNX_ZYNQMP_RTC_H
+#define HW_RTC_XLNX_ZYNQMP_RTC_H
 
 #include "hw/register.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 3ed80dba0d..73ceeb58e5 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -21,8 +21,8 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_RX_RX62N_MCU_H
-#define HW_RX_RX62N_MCU_H
+#ifndef HW_RX_RX62N_H
+#define HW_RX_RX62N_H
 
 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
diff --git a/include/hw/sensor/emc141x_regs.h b/include/hw/sensor/emc141x_regs.h
index 0560fb7c5c..e509a43d55 100644
--- a/include/hw/sensor/emc141x_regs.h
+++ b/include/hw/sensor/emc141x_regs.h
@@ -9,8 +9,8 @@
  * later. See the COPYING file in the top-level directory.
  */
 
-#ifndef TMP105_REGS_H
-#define TMP105_REGS_H
+#ifndef EMC141X_REGS_H
+#define EMC141X_REGS_H
 
 #define EMC1413_DEVICE_ID                0x21
 #define EMC1414_DEVICE_ID                0x25
diff --git a/include/hw/ssi/xlnx-versal-ospi.h b/include/hw/ssi/xlnx-versal-ospi.h
index 14d1263497..5d131d351d 100644
--- a/include/hw/ssi/xlnx-versal-ospi.h
+++ b/include/hw/ssi/xlnx-versal-ospi.h
@@ -49,8 +49,8 @@
  * + Property "indac-write-disabled": Disable indirect access writes.
  */
 
-#ifndef XILINX_VERSAL_OSPI_H
-#define XILINX_VERSAL_OSPI_H
+#ifndef XLNX_VERSAL_OSPI_H
+#define XLNX_VERSAL_OSPI_H
 
 #include "hw/register.h"
 #include "hw/ssi/ssi.h"
@@ -108,4 +108,4 @@ struct XlnxVersalOspi {
     uint8_t stig_membank[512];
 };
 
-#endif /* XILINX_VERSAL_OSPI_H */
+#endif /* XLNX_VERSAL_OSPI_H */
diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index bd3097d746..a8f605beeb 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef BCM2835_SYSTIMER_H
-#define BCM2835_SYSTIMER_H
+#ifndef BCM2835_SYSTMR_H
+#define BCM2835_SYSTMR_H
 
 #include "hw/sysbus.h"
 #include "hw/irq.h"
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 2c56c51bcb..1e2b8942ac 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -15,9 +15,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-
-#ifndef HW_TRICORE_TESTDEV_H
-#define HW_TRICORE_TESTDEV_H
+#ifndef HW_TRICORE_TESTDEVICE_H
+#define HW_TRICORE_TESTDEVICE_H
 
 #include "hw/sysbus.h"
 #include "hw/hw.h"
diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
index a7eb531485..4015c1d691 100644
--- a/include/hw/usb/dwc2-regs.h
+++ b/include/hw/usb/dwc2-regs.h
@@ -39,8 +39,8 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#ifndef DWC2_HW_H
-#define DWC2_HW_H
+#ifndef DWC2_REGS_H
+#define DWC2_REGS_H
 
 #define HSOTG_REG(x)	(x)
 
@@ -896,4 +896,4 @@ struct dwc2_dma_desc {
 #define MAX_DMA_DESC_NUM_GENERIC	64
 #define MAX_DMA_DESC_NUM_HS_ISOC	256
 
-#endif /* __DWC2_HW_H__ */
+#endif /* DWC2_REGS_H */
diff --git a/include/hw/usb/hcd-musb.h b/include/hw/usb/hcd-musb.h
index c874b9f292..f30a26f7f4 100644
--- a/include/hw/usb/hcd-musb.h
+++ b/include/hw/usb/hcd-musb.h
@@ -10,8 +10,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef HW_USB_MUSB_H
-#define HW_USB_MUSB_H
+#ifndef HW_USB_HCD_MUSB_H
+#define HW_USB_HCD_MUSB_H
 
 enum musb_irq_source_e {
     musb_irq_suspend = 0,
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
index 999e423951..5b730abd84 100644
--- a/include/hw/usb/xlnx-usb-subsystem.h
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef XLNX_VERSAL_USB_SUBSYSTEM_H
-#define XLNX_VERSAL_USB_SUBSYSTEM_H
+#ifndef XLNX_USB_SUBSYSTEM_H
+#define XLNX_USB_SUBSYSTEM_H
 
 #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
 #include "hw/usb/hcd-dwc3.h"
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index b76dce0419..633bf3013a 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -23,8 +23,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef XLNX_USB2_REGS_H
-#define XLNX_USB2_REGS_H
+#ifndef XLNX_VERSAL_USB2_CTRL_REGS_H
+#define XLNX_VERSAL_USB2_CTRL_REGS_H
 
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index 023d83f48f..600a552d2e 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -9,8 +9,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef IMX2_WDT_H
-#define IMX2_WDT_H
+#ifndef WDT_IMX2_H
+#define WDT_IMX2_H
 
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
@@ -88,4 +88,4 @@ struct IMX2WdtState {
     bool wcr_wdt_locked;        /* affects WDT (never cleared) */
 };
 
-#endif /* IMX2_WDT_H */
+#endif /* WDT_IMX2_H */
diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
index ba32cc8b1f..4f265fed8d 100644
--- a/include/qemu/help-texts.h
+++ b/include/qemu/help-texts.h
@@ -1,5 +1,5 @@
-#ifndef QEMU_COMMON_H
-#define QEMU_COMMON_H
+#ifndef QEMU_HELP_TEXTS_H
+#define QEMU_HELP_TEXTS_H
 
 /* Copyright string for -version arguments, About dialogs, etc */
 #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 535ddbf0ae..d0e9d03adf 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -7,8 +7,9 @@
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
-#ifndef QEMU_PLUGIN_API_H
-#define QEMU_PLUGIN_API_H
+
+#ifndef QEMU_QEMU_PLUGIN_H
+#define QEMU_QEMU_PLUGIN_H
 
 #include <inttypes.h>
 #include <stdbool.h>
@@ -624,4 +625,4 @@ uint64_t qemu_plugin_end_code(void);
  */
 uint64_t qemu_plugin_entry_code(void);
 
-#endif /* QEMU_PLUGIN_API_H */
+#endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 2e93a74679..415f0c91d7 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -10,8 +10,8 @@
  * or later.  See the COPYING.LIB file in the top-level directory.
  */
 
-#ifndef BLOCK_BACKEND_GS_H
-#define BLOCK_BACKEND_GS_H
+#ifndef BLOCK_BACKEND_GLOBAL_STATE_H
+#define BLOCK_BACKEND_GLOBAL_STATE_H
 
 #include "block-backend-common.h"
 
@@ -113,4 +113,4 @@ const BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
-#endif /* BLOCK_BACKEND_GS_H */
+#endif /* BLOCK_BACKEND_GLOBAL_STATE_H */
diff --git a/plugins/plugin.h b/plugins/plugin.h
index b13677d0dc..5eb2fdbc85 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -9,8 +9,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef PLUGIN_INTERNAL_H
-#define PLUGIN_INTERNAL_H
+#ifndef PLUGIN_H
+#define PLUGIN_H
 
 #include <gmodule.h>
 #include "qemu/qht.h"
@@ -97,4 +97,4 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
 void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
 
-#endif /* _PLUGIN_INTERNAL_H_ */
+#endif /* PLUGIN_H */
diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 09010ad2da..78a84c1414 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef TARGET_ARM_TRANSLATE_A64_H
-#define TARGET_ARM_TRANSLATE_A64_H
+#ifndef TARGET_ARM_TRANSLATE_A32_H
+#define TARGET_ARM_TRANSLATE_A32_H
 
 /* Prototypes for autogenerated disassembler functions */
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index fb43a2380e..1d63402042 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef TARGET_ARM_VEC_INTERNALS_H
-#define TARGET_ARM_VEC_INTERNALS_H
+#ifndef TARGET_ARM_VEC_INTERNAL_H
+#define TARGET_ARM_VEC_INTERNAL_H
 
 /*
  * Note that vector data is stored in host-endian 64-bit chunks,
@@ -217,4 +217,4 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
-#endif /* TARGET_ARM_VEC_INTERNALS_H */
+#endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 32a1c762e6..b5c3507d6d 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -18,8 +18,8 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
-#ifndef QEMU_AVR_QOM_H
-#define QEMU_AVR_QOM_H
+#ifndef TARGET_AVR_CPU_QOM_H
+#define TARGET_AVR_CPU_QOM_H
 
 #include "hw/core/cpu.h"
 #include "qom/object.h"
@@ -44,4 +44,4 @@ struct AVRCPUClass {
 };
 
 
-#endif /* !defined (QEMU_AVR_CPU_QOM_H) */
+#endif /* TARGET_AVR_CPU_QOM_H */
diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
index 78ad607f53..885f68f760 100644
--- a/target/hexagon/hex_arch_types.h
+++ b/target/hexagon/hex_arch_types.h
@@ -15,8 +15,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HEXAGON_ARCH_TYPES_H
-#define HEXAGON_ARCH_TYPES_H
+#ifndef HEXAGON_HEX_ARCH_TYPES_H
+#define HEXAGON_HEX_ARCH_TYPES_H
 
 #include "qemu/osdep.h"
 #include "mmvec/mmvec.h"
diff --git a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h
index e1b3149b07..a63c2c0fd5 100644
--- a/target/hexagon/hex_regs.h
+++ b/target/hexagon/hex_regs.h
@@ -15,8 +15,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HEXAGON_REGS_H
-#define HEXAGON_REGS_H
+#ifndef HEXAGON_HEX_REGS_H
+#define HEXAGON_HEX_REGS_H
 
 enum {
     HEX_REG_R00              = 0,
diff --git a/target/i386/hax/hax-accel-ops.h b/target/i386/hax/hax-accel-ops.h
index c7698519cd..9e357e7b40 100644
--- a/target/i386/hax/hax-accel-ops.h
+++ b/target/i386/hax/hax-accel-ops.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef HAX_CPUS_H
-#define HAX_CPUS_H
+#ifndef TARGET_I386_HAX_ACCEL_OPS_H
+#define TARGET_I386_HAX_ACCEL_OPS_H
 
 #include "sysemu/cpus.h"
 
@@ -28,4 +28,4 @@ int hax_vcpu_destroy(CPUState *cpu);
 void hax_raise_event(CPUState *cpu);
 void hax_reset_vcpu_state(void *opaque);
 
-#endif /* HAX_CPUS_H */
+#endif /* TARGET_I386_HAX_ACCEL_OPS_H */
diff --git a/target/i386/nvmm/nvmm-accel-ops.h b/target/i386/nvmm/nvmm-accel-ops.h
index 43e24adcaf..7c5461bd75 100644
--- a/target/i386/nvmm/nvmm-accel-ops.h
+++ b/target/i386/nvmm/nvmm-accel-ops.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef NVMM_CPUS_H
-#define NVMM_CPUS_H
+#ifndef TARGET_I386_NVMM_ACCEL_OPS_H
+#define TARGET_I386_NVMM_ACCEL_OPS_H
 
 #include "sysemu/cpus.h"
 
@@ -21,4 +21,4 @@ void nvmm_cpu_synchronize_post_reset(CPUState *cpu);
 void nvmm_cpu_synchronize_post_init(CPUState *cpu);
 void nvmm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 
-#endif /* NVMM_CPUS_H */
+#endif /* TARGET_I386_NVMM_ACCEL_OPS_H */
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 83e82aa42c..7b1528248a 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef QEMU_SEV_I386_H
-#define QEMU_SEV_I386_H
+#ifndef I386_SEV_H
+#define I386_SEV_H
 
 #ifndef CONFIG_USER_ONLY
 #include CONFIG_DEVICES /* CONFIG_SEV */
diff --git a/target/i386/whpx/whpx-accel-ops.h b/target/i386/whpx/whpx-accel-ops.h
index b5102dd1ee..7a1bb1ab57 100644
--- a/target/i386/whpx/whpx-accel-ops.h
+++ b/target/i386/whpx/whpx-accel-ops.h
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef WHPX_CPUS_H
-#define WHPX_CPUS_H
+#ifndef TARGET_I386_WHPX_ACCEL_OPS_H
+#define TARGET_I386_WHPX_ACCEL_OPS_H
 
 #include "sysemu/cpus.h"
 
@@ -30,4 +30,4 @@ void whpx_cpu_synchronize_pre_resume(bool step_pending);
 /* full state set, modified during initialization or on vmload */
 #define WHPX_SET_FULL_STATE      3
 
-#endif /* WHPX_CPUS_H */
+#endif /* TARGET_I386_WHPX_ACCEL_OPS_H */
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index 2416ec7922..e40bcf9e6b 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -1,5 +1,5 @@
-#ifndef WHP_INTERNAL_H
-#define WHP_INTERNAL_H
+#ifndef TARGET_I386_WHPX_INTERNAL_H
+#define TARGET_I386_WHPX_INTERNAL_H
 
 #include <windows.h>
 #include <WinHvPlatform.h>
@@ -113,4 +113,4 @@ typedef enum WHPFunctionList {
     WINHV_PLATFORM_FNS_SUPPLEMENTAL
 } WHPFunctionList;
 
-#endif /* WHP_INTERNAL_H */
+#endif /* TARGET_I386_WHPX_INTERNAL_H */
diff --git a/target/xtensa/core-de233_fpu/core-isa.h b/target/xtensa/core-de233_fpu/core-isa.h
index f125619e8d..40543b2c5e 100644
--- a/target/xtensa/core-de233_fpu/core-isa.h
+++ b/target/xtensa/core-de233_fpu/core-isa.h
@@ -28,8 +28,8 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-#ifndef XTENSA_CORE_CONFIGURATION_H_
-#define XTENSA_CORE_CONFIGURATION_H_
+#ifndef XTENSA_CORE_DE233_FPU_CORE_ISA_H
+#define XTENSA_CORE_DE233_FPU_CORE_ISA_H
 
 //depot/dev/Homewood/Xtensa/SWConfig/hal/core-common.h.tph#24 - edit change 444323 (text+ko)
 
@@ -723,5 +723,4 @@
 #endif /* !XTENSA_HAL_NON_PRIVILEGED_ONLY */
 
 
-#endif /* XTENSA_CORE_CONFIGURATION_H_ */
-
+#endif /* XTENSA_CORE_DE233_FPU_CORE_ISA_H */
diff --git a/target/xtensa/core-dsp3400/core-isa.h b/target/xtensa/core-dsp3400/core-isa.h
index 336b2467c6..1499ef2914 100644
--- a/target/xtensa/core-dsp3400/core-isa.h
+++ b/target/xtensa/core-dsp3400/core-isa.h
@@ -28,9 +28,8 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-#ifndef _XTENSA_CORE_CONFIGURATION_H
-#define _XTENSA_CORE_CONFIGURATION_H
-
+#ifndef XTENSA_CORE_DSP3400_CORE_ISA_H
+#define XTENSA_CORE_DSP3400_CORE_ISA_H
 
 /****************************************************************************
 	    Parameters Useful for Any Code, USER or PRIVILEGED
@@ -448,5 +447,4 @@
 #endif /* !XTENSA_HAL_NON_PRIVILEGED_ONLY */
 
 
-#endif /* _XTENSA_CORE_CONFIGURATION_H */
-
+#endif /* XTENSA_CORE_DSP3400_CORE_ISA_H */
diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
index c5f0b7227a..327c1c5a55 100644
--- a/tests/qtest/fuzz/fuzz.h
+++ b/tests/qtest/fuzz/fuzz.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef FUZZER_H_
-#define FUZZER_H_
+#ifndef QTEST_FUZZ_H
+#define QTEST_FUZZ_H
 
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -122,4 +122,3 @@ int LLVMFuzzerTestOneInput(const unsigned char *Data, size_t Size);
 int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp);
 
 #endif
-
diff --git a/tools/virtiofsd/passthrough_seccomp.h b/tools/virtiofsd/passthrough_seccomp.h
index a3ab073f08..12674fc050 100644
--- a/tools/virtiofsd/passthrough_seccomp.h
+++ b/tools/virtiofsd/passthrough_seccomp.h
@@ -6,10 +6,9 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef VIRTIOFSD_SECCOMP_H
-#define VIRTIOFSD_SECCOMP_H
-
+#ifndef VIRTIOFSD_PASSTHROUGH_SECCOMP_H
+#define VIRTIOFSD_PASSTHROUGH_SECCOMP_H
 
 void setup_seccomp(bool enable_syslog);
 
-#endif /* VIRTIOFSD_SECCOMP_H */
+#endif /* VIRTIOFSD_PASSTHROUGH_SECCOMP_H */
-- 
2.35.1


