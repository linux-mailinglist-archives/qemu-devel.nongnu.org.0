Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD351D9AD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:56:42 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyRl-0005tx-Us
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKf-0005uO-MC
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:48086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKa-0005qG-7I
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651844955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4GBKO81piBKHQPzsmfvzfztXcoiE747H7JQsVeejHo=;
 b=VZ833AKMEhuMTWlCCiDOQegohcZCaCUoMJu9Rq/S4sqNF7bX6roh5VdVVkZqM+gRKPu+3D
 tKVMFUcpRP4sn538eENOHUalV1KP4glUnqYvztVEmyX37NpKAc31TiaDq0ArX0T7YZC0FM
 IoVhCwL9VSOE4kBIyXddQtaFdWw/LTQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-hknzeqatO_uaAk2XWqWimQ-1; Fri, 06 May 2022 09:49:14 -0400
X-MC-Unique: hknzeqatO_uaAk2XWqWimQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFA233810D37
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4D440314B
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B167421E6885; Fri,  6 May 2022 15:49:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] Clean up ill-advised or unusual header guards
Date: Fri,  6 May 2022 15:49:09 +0200
Message-Id: <20220506134911.2856099-3-armbru@redhat.com>
In-Reply-To: <20220506134911.2856099-1-armbru@redhat.com>
References: <20220506134911.2856099-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Leading underscores are ill-advised because such identifiers are
reserved.  Trailing underscores are merely ugly.  Strip both.

Our header guards commonly end in _H.  Normalize the exceptions.

Macros should be ALL_CAPS.  Normalize the exception.

Done with scripts/clean-header-guards.pl.

include/hw/xen/interface/ and tools/virtiofsd/ left alone, because
these were imported from Xen and libfuse respectively.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/copy-on-read.h                   | 6 +++---
 bsd-user/arm/target_arch.h             | 6 +++---
 bsd-user/arm/target_arch_cpu.h         | 6 +++---
 bsd-user/arm/target_arch_elf.h         | 7 ++++---
 bsd-user/arm/target_arch_reg.h         | 6 +++---
 bsd-user/arm/target_arch_signal.h      | 7 ++++---
 bsd-user/arm/target_arch_sigtramp.h    | 6 +++---
 bsd-user/arm/target_arch_sysarch.h     | 6 +++---
 bsd-user/arm/target_arch_thread.h      | 7 ++++---
 bsd-user/arm/target_arch_vmparam.h     | 7 ++++---
 bsd-user/bsd-file.h                    | 6 +++---
 bsd-user/errno_defs.h                  | 6 +++---
 bsd-user/freebsd/host-os.h             | 6 +++---
 bsd-user/freebsd/target_os_elf.h       | 7 ++++---
 bsd-user/freebsd/target_os_siginfo.h   | 7 ++++---
 bsd-user/freebsd/target_os_signal.h    | 6 +++---
 bsd-user/freebsd/target_os_stack.h     | 6 +++---
 bsd-user/freebsd/target_os_thread.h    | 6 +++---
 bsd-user/freebsd/target_os_user.h      | 6 +++---
 bsd-user/freebsd/target_os_vmparam.h   | 7 ++++---
 bsd-user/i386/target_arch.h            | 6 +++---
 bsd-user/i386/target_arch_cpu.h        | 6 +++---
 bsd-user/i386/target_arch_elf.h        | 7 ++++---
 bsd-user/i386/target_arch_reg.h        | 6 +++---
 bsd-user/i386/target_arch_sigtramp.h   | 6 +++---
 bsd-user/i386/target_arch_thread.h     | 7 ++++---
 bsd-user/i386/target_arch_vmparam.h    | 7 ++++---
 bsd-user/netbsd/host-os.h              | 6 +++---
 bsd-user/netbsd/target_os_elf.h        | 7 ++++---
 bsd-user/netbsd/target_os_siginfo.h    | 6 +++---
 bsd-user/netbsd/target_os_signal.h     | 6 +++---
 bsd-user/netbsd/target_os_stack.h      | 6 +++---
 bsd-user/netbsd/target_os_thread.h     | 6 +++---
 bsd-user/openbsd/host-os.h             | 6 +++---
 bsd-user/openbsd/target_os_elf.h       | 7 ++++---
 bsd-user/openbsd/target_os_siginfo.h   | 6 +++---
 bsd-user/openbsd/target_os_signal.h    | 6 +++---
 bsd-user/openbsd/target_os_stack.h     | 6 +++---
 bsd-user/openbsd/target_os_thread.h    | 6 +++---
 bsd-user/syscall_defs.h                | 6 +++---
 bsd-user/x86_64/target_arch.h          | 6 +++---
 bsd-user/x86_64/target_arch_cpu.h      | 6 +++---
 bsd-user/x86_64/target_arch_elf.h      | 7 ++++---
 bsd-user/x86_64/target_arch_reg.h      | 6 +++---
 bsd-user/x86_64/target_arch_signal.h   | 7 ++++---
 bsd-user/x86_64/target_arch_sigtramp.h | 6 +++---
 bsd-user/x86_64/target_arch_thread.h   | 7 ++++---
 bsd-user/x86_64/target_arch_vmparam.h  | 7 ++++---
 crypto/ivgen-plain.h                   | 6 +++---
 include/chardev/char-socket.h          | 7 ++++---
 include/hw/i2c/i2c_mux_pca954x.h       | 4 ++--
 include/hw/input/lm832x.h              | 4 ++--
 include/hw/intc/exynos4210_combiner.h  | 4 ++--
 include/hw/intc/nios2_vic.h            | 6 +++---
 include/hw/ppc/pnv_pnor.h              | 8 +++++---
 include/hw/s390x/s390-pci-clp.h        | 4 ++--
 include/hw/tricore/tc27x_soc.h         | 4 ++--
 include/hw/virtio/vhost-user-fs.h      | 6 +++---
 include/hw/virtio/vhost-user-i2c.h     | 6 +++---
 include/hw/virtio/vhost-user-rng.h     | 6 +++---
 include/hw/virtio/vhost-user-vsock.h   | 6 +++---
 include/hw/virtio/vhost-vsock-common.h | 6 +++---
 include/qemu/cpu-float.h               | 6 +++---
 include/qemu/crc-ccitt.h               | 6 +++---
 include/qemu/keyval.h                  | 7 ++++---
 include/ui/dbus-display.h              | 6 +++---
 include/ui/dbus-module.h               | 6 +++---
 target/ppc/power8-pmu.h                | 4 ++--
 target/riscv/sbi_ecall_interface.h     | 4 ++--
 tests/qtest/libqmp.h                   | 7 ++++---
 tests/qtest/migration-helpers.h        | 7 ++++---
 ui/dbus.h                              | 7 ++++---
 72 files changed, 232 insertions(+), 209 deletions(-)

diff --git a/block/copy-on-read.h b/block/copy-on-read.h
index 7bf405dccd..1d8ad38c74 100644
--- a/block/copy-on-read.h
+++ b/block/copy-on-read.h
@@ -22,11 +22,11 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BLOCK_COPY_ON_READ
-#define BLOCK_COPY_ON_READ
+#ifndef BLOCK_COPY_ON_READ_H
+#define BLOCK_COPY_ON_READ_H
 
 #include "block/block_int.h"
 
 void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs);
 
-#endif /* BLOCK_COPY_ON_READ */
+#endif /* BLOCK_COPY_ON_READ_H */
diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
index 93cfaea098..561934bbd2 100644
--- a/bsd-user/arm/target_arch.h
+++ b/bsd-user/arm/target_arch.h
@@ -17,12 +17,12 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_H_
-#define _TARGET_ARCH_H_
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
 
 #include "qemu.h"
 
 void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
 target_ulong target_cpu_get_tls(CPUARMState *env);
 
-#endif /* !_TARGET_ARCH_H_ */
+#endif /* TARGET_ARCH_H */
diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index afb7814a8d..517d008764 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_CPU_H_
-#define _TARGET_ARCH_CPU_H_
+#ifndef TARGET_ARCH_CPU_H
+#define TARGET_ARCH_CPU_H
 
 #include "target_arch.h"
 #include "signal-common.h"
@@ -210,4 +210,4 @@ static inline void target_cpu_reset(CPUArchState *env)
 {
 }
 
-#endif /* !_TARGET_ARCH_CPU_H */
+#endif /* TARGET_ARCH_CPU_H */
diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 4a0215d02e..935bce347f 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_ELF_H_
-#define _TARGET_ARCH_ELF_H_
+
+#ifndef TARGET_ARCH_ELF_H
+#define TARGET_ARCH_ELF_H
 
 #define ELF_START_MMAP 0x80000000
 #define ELF_ET_DYN_LOAD_ADDR    0x500000
@@ -125,4 +126,4 @@ static uint32_t get_elf_hwcap2(void)
 #undef GET_FEATURE
 #undef GET_FEATURE_ID
 
-#endif /* _TARGET_ARCH_ELF_H_ */
+#endif /* TARGET_ARCH_ELF_H */
diff --git a/bsd-user/arm/target_arch_reg.h b/bsd-user/arm/target_arch_reg.h
index ef5ed5154f..070fa24da1 100644
--- a/bsd-user/arm/target_arch_reg.h
+++ b/bsd-user/arm/target_arch_reg.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_REG_H_
-#define _TARGET_ARCH_REG_H_
+#ifndef TARGET_ARCH_REG_H
+#define TARGET_ARCH_REG_H
 
 /* See sys/arm/include/reg.h */
 typedef struct target_reg {
@@ -57,4 +57,4 @@ static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
 
 #undef tswapreg
 
-#endif /* !_TARGET_ARCH_REG_H_ */
+#endif /* TARGET_ARCH_REG_H */
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index f1844dbf22..02b2b33e07 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_SIGNAL_H_
-#define _TARGET_ARCH_SIGNAL_H_
+
+#ifndef TARGET_ARCH_SIGNAL_H
+#define TARGET_ARCH_SIGNAL_H
 
 #include "cpu.h"
 
@@ -85,4 +86,4 @@ struct target_sigframe {
     target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
 };
 
-#endif /* !_TARGET_ARCH_SIGNAL_H_ */
+#endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
index 5d434a9e7e..06198045ed 100644
--- a/bsd-user/arm/target_arch_sigtramp.h
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_SIGTRAMP_H_
-#define _TARGET_ARCH_SIGTRAMP_H_
+#ifndef TARGET_ARCH_SIGTRAMP_H
+#define TARGET_ARCH_SIGTRAMP_H
 
 /* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
 static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
@@ -46,4 +46,4 @@ static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
 
     return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
 }
-#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
+#endif /* TARGET_ARCH_SIGTRAMP_H */
diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
index 8cc6bff207..5cb7864197 100644
--- a/bsd-user/arm/target_arch_sysarch.h
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_SYSARCH_H_
-#define _TARGET_ARCH_SYSARCH_H_
+#ifndef TARGET_ARCH_SYSARCH_H
+#define TARGET_ARCH_SYSARCH_H
 
 #include "target_syscall.h"
 #include "target_arch.h"
@@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
     }
 }
 
-#endif /*!_TARGET_ARCH_SYSARCH_H_ */
+#endif /* TARGET_ARCH_SYSARCH_H */
diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
index fcafca2408..fd257f313d 100644
--- a/bsd-user/arm/target_arch_thread.h
+++ b/bsd-user/arm/target_arch_thread.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_THREAD_H_
-#define _TARGET_ARCH_THREAD_H_
+
+#ifndef TARGET_ARCH_THREAD_H
+#define TARGET_ARCH_THREAD_H
 
 /* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
 static inline void target_thread_set_upcall(CPUARMState *env, abi_ulong entry,
@@ -77,4 +78,4 @@ static inline void target_thread_init(struct target_pt_regs *regs,
      */
 }
 
-#endif /* !_TARGET_ARCH_THREAD_H_ */
+#endif /* TARGET_ARCH_THREAD_H */
diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
index 4bbc04ddf5..3fb69aff51 100644
--- a/bsd-user/arm/target_arch_vmparam.h
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_VMPARAM_H_
-#define _TARGET_ARCH_VMPARAM_H_
+
+#ifndef TARGET_ARCH_VMPARAM_H
+#define TARGET_ARCH_VMPARAM_H
 
 #include "cpu.h"
 
@@ -45,4 +46,4 @@ static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
     state->regs[1] = retval2;
 }
 
-#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
+#endif /* TARGET_ARCH_VMPARAM_H */
diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index f0c3f347ec..a6bff3b8c2 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_FILE_H_
-#define BSD_FILE_H_
+#ifndef BSD_FILE_H
+#define BSD_FILE_H
 
 #include "qemu/path.h"
 
@@ -27,4 +27,4 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
         int copy);
 
-#endif /* !BSD_FILE_H_ */
+#endif /* BSD_FILE_H */
diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 73cfa24b7f..f3e8ac3488 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -34,8 +34,8 @@
  *      @(#)errno.h     8.5 (Berkeley) 1/21/94
  */
 
-#ifndef _ERRNO_DEFS_H_
-#define _ERRNO_DEFS_H_
+#ifndef ERRNO_DEFS_H
+#define ERRNO_DEFS_H
 
 #define TARGET_EPERM            1               /* Operation not permitted */
 #define TARGET_ENOENT           2               /* No such file or directory */
@@ -157,4 +157,4 @@
 _Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
                "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
 
-#endif /* !  _ERRNO_DEFS_H_ */
+#endif /* ERRNO_DEFS_H */
diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
index dfb8344b7b..40cae72ec9 100644
--- a/bsd-user/freebsd/host-os.h
+++ b/bsd-user/freebsd/host-os.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _HOST_OS_H_
-#define _HOST_OS_H_
+#ifndef HOST_OS_H
+#define HOST_OS_H
 
 #define HOST_DEFAULT_BSD_TYPE target_freebsd
 
-#endif /*!_HOST_OS_H_ */
+#endif /* HOST_OS_H */
diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index e5ac8e8e50..9df17d56d8 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_OS_ELF_H_
-#define _TARGET_OS_ELF_H_
+
+#ifndef TARGET_OS_ELF_H
+#define TARGET_OS_ELF_H
 
 #include "target_arch_elf.h"
 #include "elf.h"
@@ -134,4 +135,4 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         return sp;
 }
 
-#endif /* _TARGET_OS_ELF_H_ */
+#endif /* TARGET_OS_ELF_H */
diff --git a/bsd-user/freebsd/target_os_siginfo.h b/bsd-user/freebsd/target_os_siginfo.h
index d50a3034a8..4573738752 100644
--- a/bsd-user/freebsd/target_os_siginfo.h
+++ b/bsd-user/freebsd/target_os_siginfo.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_OS_SIGINFO_H_
-#define _TARGET_OS_SIGINFO_H_
+
+#ifndef TARGET_OS_SIGINFO_H
+#define TARGET_OS_SIGINFO_H
 
 #define TARGET_NSIG         128
 #define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
@@ -155,4 +156,4 @@ struct target_sigevent {
 #define TARGET_FPE_FLTINV   (7) /* Invalid floating point operation. */
 #define TARGET_FPE_FLTSUB   (8) /* Subscript out of range. */
 
-#endif /* !_TARGET_OS_SIGINFO_H_ */
+#endif /* TARGET_OS_SIGINFO_H */
diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 43700d08f7..5030abb52b 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,5 +1,5 @@
-#ifndef _TARGET_OS_SIGNAL_H_
-#define _TARGET_OS_SIGNAL_H_
+#ifndef TARGET_OS_SIGNAL_H
+#define TARGET_OS_SIGNAL_H
 
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
@@ -78,4 +78,4 @@ abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,
 #define TARGET_SS_ONSTACK 0x0001  /* take signals on alternate stack */
 #define TARGET_SS_DISABLE 0x0004  /* disable taking signals on alternate stack*/
 
-#endif /* !_TARGET_OS_SIGNAL_H_ */
+#endif /* TARGET_OS_SIGNAL_H */
diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
index 1bb1a2bf56..0590133291 100644
--- a/bsd-user/freebsd/target_os_stack.h
+++ b/bsd-user/freebsd/target_os_stack.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_STACK_H_
-#define _TARGET_OS_STACK_H_
+#ifndef TARGET_OS_STACK_H
+#define TARGET_OS_STACK_H
 
 #include <sys/param.h>
 #include "target_arch_sigtramp.h"
@@ -178,4 +178,4 @@ static inline int setup_initial_stack(struct bsd_binprm *bprm,
     return 0;
  }
 
-#endif /* !_TARGET_OS_STACK_H_ */
+#endif /* TARGET_OS_STACK_H */
diff --git a/bsd-user/freebsd/target_os_thread.h b/bsd-user/freebsd/target_os_thread.h
index 77433acdff..1b32cebd26 100644
--- a/bsd-user/freebsd/target_os_thread.h
+++ b/bsd-user/freebsd/target_os_thread.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_THREAD_H_
-#define _TARGET_OS_THREAD_H_
+#ifndef TARGET_OS_THREAD_H
+#define TARGET_OS_THREAD_H
 
 #include "target_arch_thread.h"
 
-#endif /* !_TARGET_OS_THREAD_H_ */
+#endif /* TARGET_OS_THREAD_H */
diff --git a/bsd-user/freebsd/target_os_user.h b/bsd-user/freebsd/target_os_user.h
index 19892c5071..f036a32343 100644
--- a/bsd-user/freebsd/target_os_user.h
+++ b/bsd-user/freebsd/target_os_user.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_USER_H_
-#define _TARGET_OS_USER_H_
+#ifndef TARGET_OS_USER_H
+#define TARGET_OS_USER_H
 
 /*
  * from sys/priority.h
@@ -326,4 +326,4 @@ struct target_kinfo_vmentry {
     char  kve_path[PATH_MAX];  /* Path to VM obj, if any. */
 };
 
-#endif /* ! _TARGET_OS_USER_H_ */
+#endif /* TARGET_OS_USER_H */
diff --git a/bsd-user/freebsd/target_os_vmparam.h b/bsd-user/freebsd/target_os_vmparam.h
index 990300c619..8457dd3913 100644
--- a/bsd-user/freebsd/target_os_vmparam.h
+++ b/bsd-user/freebsd/target_os_vmparam.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_OS_VMPARAM_H_
-#define _TARGET_OS_VMPARAM_H_
+
+#ifndef TARGET_OS_VMPARAM_H
+#define TARGET_OS_VMPARAM_H
 
 #include "target_arch_vmparam.h"
 
@@ -35,4 +36,4 @@ extern abi_ulong target_stksiz;
 #define TARGET_PS_STRINGS  ((target_stkbas + target_stksiz) - \
                             sizeof(struct target_ps_strings))
 
-#endif /* !TARGET_OS_VMPARAM_H_ */
+#endif /* TARGET_OS_VMPARAM_H */
diff --git a/bsd-user/i386/target_arch.h b/bsd-user/i386/target_arch.h
index 73e9a028fe..9595e60f09 100644
--- a/bsd-user/i386/target_arch.h
+++ b/bsd-user/i386/target_arch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_H_
-#define _TARGET_ARCH_H_
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
 
 /* target_arch_cpu.c */
 void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
@@ -28,4 +28,4 @@ void bsd_i386_set_idt_base(uint64_t base);
 
 #define target_cpu_set_tls(env, newtls)
 
-#endif /* ! _TARGET_ARCH_H_ */
+#endif /* TARGET_ARCH_H */
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 9da22202d4..d792dc720f 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -16,8 +16,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_CPU_H_
-#define _TARGET_ARCH_CPU_H_
+#ifndef TARGET_ARCH_CPU_H
+#define TARGET_ARCH_CPU_H
 
 #include "target_arch.h"
 #include "signal-common.h"
@@ -195,4 +195,4 @@ static inline void target_cpu_reset(CPUArchState *env)
     cpu_reset(env_cpu(env));
 }
 
-#endif /* ! _TARGET_ARCH_CPU_H_ */
+#endif /* TARGET_ARCH_CPU_H */
diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
index eb760e07fa..cbcd1f08e2 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_ELF_H_
-#define _TARGET_ARCH_ELF_H_
+
+#ifndef TARGET_ARCH_ELF_H
+#define TARGET_ARCH_ELF_H
 
 #define ELF_START_MMAP 0x80000000
 #define ELF_ET_DYN_LOAD_ADDR    0x01001000
@@ -32,4 +33,4 @@
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#endif /* _TARGET_ARCH_ELF_H_ */
+#endif /* TARGET_ARCH_ELF_H */
diff --git a/bsd-user/i386/target_arch_reg.h b/bsd-user/i386/target_arch_reg.h
index 1fce1daf01..8123109697 100644
--- a/bsd-user/i386/target_arch_reg.h
+++ b/bsd-user/i386/target_arch_reg.h
@@ -18,8 +18,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_REG_H_
-#define _TARGET_ARCH_REG_H_
+#ifndef TARGET_ARCH_REG_H
+#define TARGET_ARCH_REG_H
 
 /* See sys/i386/include/reg.h */
 typedef struct target_reg {
@@ -79,4 +79,4 @@ static inline void target_copy_regs(target_reg_t *regs, const CPUX86State *env)
     regs->r_gs = env->segs[R_GS].selector & 0xffff;
 }
 
-#endif /* !_TARGET_ARCH_REG_H_ */
+#endif /* TARGET_ARCH_REG_H */
diff --git a/bsd-user/i386/target_arch_sigtramp.h b/bsd-user/i386/target_arch_sigtramp.h
index cb4e89b0b0..ef94cc864f 100644
--- a/bsd-user/i386/target_arch_sigtramp.h
+++ b/bsd-user/i386/target_arch_sigtramp.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_SIGTRAMP_H_
-#define _TARGET_ARCH_SIGTRAMP_H_
+#ifndef TARGET_ARCH_SIGTRAMP_H
+#define TARGET_ARCH_SIGTRAMP_H
 
 static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
         unsigned sys_sigreturn)
@@ -26,4 +26,4 @@ static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
 
     return 0;
 }
-#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
+#endif /* TARGET_ARCH_SIGTRAMP_H */
diff --git a/bsd-user/i386/target_arch_thread.h b/bsd-user/i386/target_arch_thread.h
index e65e476f75..cee2148d94 100644
--- a/bsd-user/i386/target_arch_thread.h
+++ b/bsd-user/i386/target_arch_thread.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_THREAD_H_
-#define _TARGET_ARCH_THREAD_H_
+
+#ifndef TARGET_ARCH_THREAD_H
+#define TARGET_ARCH_THREAD_H
 
 /* Compare to vm_machdep.c cpu_set_upcall_kse() */
 static inline void target_thread_set_upcall(CPUX86State *regs, abi_ulong entry,
@@ -44,4 +45,4 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     regs->edx = 0;
 }
 
-#endif /* !_TARGET_ARCH_THREAD_H_ */
+#endif /* TARGET_ARCH_THREAD_H */
diff --git a/bsd-user/i386/target_arch_vmparam.h b/bsd-user/i386/target_arch_vmparam.h
index bb7718265b..79db420e59 100644
--- a/bsd-user/i386/target_arch_vmparam.h
+++ b/bsd-user/i386/target_arch_vmparam.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_VMPARAM_H_
-#define _TARGET_ARCH_VMPARAM_H_
+
+#ifndef TARGET_ARCH_VMPARAM_H
+#define TARGET_ARCH_VMPARAM_H
 
 #include "cpu.h"
 
@@ -43,4 +44,4 @@ static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
     state->regs[R_EDX] = retval2;
 }
 
-#endif /* !_TARGET_ARCH_VMPARAM_H_ */
+#endif /* TARGET_ARCH_VMPARAM_H */
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
index c0be51a7ef..7c14b1ea78 100644
--- a/bsd-user/netbsd/host-os.h
+++ b/bsd-user/netbsd/host-os.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _HOST_OS_H_
-#define _HOST_OS_H_
+#ifndef HOST_OS_H
+#define HOST_OS_H
 
 #define HOST_DEFAULT_BSD_TYPE target_netbsd
 
-#endif /*!_HOST_OS_H_ */
+#endif /* HOST_OS_H */
diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
index 21b475f458..2f3cb20871 100644
--- a/bsd-user/netbsd/target_os_elf.h
+++ b/bsd-user/netbsd/target_os_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_OS_ELF_H_
-#define _TARGET_OS_ELF_H_
+
+#ifndef TARGET_OS_ELF_H
+#define TARGET_OS_ELF_H
 
 #include "target_arch_elf.h"
 #include "elf.h"
@@ -143,4 +144,4 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         return sp;
 }
 
-#endif /* _TARGET_OS_ELF_H_ */
+#endif /* TARGET_OS_ELF_H */
diff --git a/bsd-user/netbsd/target_os_siginfo.h b/bsd-user/netbsd/target_os_siginfo.h
index 667c19cc7c..eb57e0a309 100644
--- a/bsd-user/netbsd/target_os_siginfo.h
+++ b/bsd-user/netbsd/target_os_siginfo.h
@@ -1,5 +1,5 @@
-#ifndef _TARGET_OS_SIGINFO_H_
-#define _TARGET_OS_SIGINFO_H_
+#ifndef TARGET_OS_SIGINFO_H
+#define TARGET_OS_SIGINFO_H
 
 #define TARGET_NSIG     32  /* counting 0; could be 33 (mask is 1-32) */
 #define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
@@ -79,4 +79,4 @@ typedef union target_siginfo {
 #define TARGET_TRAP_TRACE   2
 
 
-#endif /* ! _TARGET_OS_SIGINFO_H_ */
+#endif /* TARGET_OS_SIGINFO_H */
diff --git a/bsd-user/netbsd/target_os_signal.h b/bsd-user/netbsd/target_os_signal.h
index a373922f7e..4ee4f768e0 100644
--- a/bsd-user/netbsd/target_os_signal.h
+++ b/bsd-user/netbsd/target_os_signal.h
@@ -1,5 +1,5 @@
-#ifndef _TARGET_OS_SIGNAL_H_
-#define _TARGET_OS_SIGNAL_H_
+#ifndef TARGET_OS_SIGNAL_H
+#define TARGET_OS_SIGNAL_H
 
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
@@ -66,4 +66,4 @@
 #define TARGET_SS_ONSTACK 0x0001 /* take signals on alternate stack */
 #define TARGET_SS_DISABLE 0x0004 /* disable taking signals on alternate stack */
 
-#endif /* !_TARGET_OS_SIGNAL_H_ */
+#endif /* TARGET_OS_SIGNAL_H */
diff --git a/bsd-user/netbsd/target_os_stack.h b/bsd-user/netbsd/target_os_stack.h
index 503279c1a9..8349e9149b 100644
--- a/bsd-user/netbsd/target_os_stack.h
+++ b/bsd-user/netbsd/target_os_stack.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_STACK_H_
-#define _TARGET_OS_STACK_H_
+#ifndef TARGET_OS_STACK_H
+#define TARGET_OS_STACK_H
 
 #include "target_arch_sigtramp.h"
 
@@ -53,4 +53,4 @@ static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
     return 0;
 }
 
-#endif /* !_TARGET_OS_STACK_H_ */
+#endif /* TARGET_OS_STACK_H */
diff --git a/bsd-user/netbsd/target_os_thread.h b/bsd-user/netbsd/target_os_thread.h
index 904dd1bf78..8ccfa16e4b 100644
--- a/bsd-user/netbsd/target_os_thread.h
+++ b/bsd-user/netbsd/target_os_thread.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_THREAD_H_
-#define _TARGET_OS_THREAD_H_
+#ifndef TARGET_OS_THREAD_H
+#define TARGET_OS_THREAD_H
 
 #include "target_arch_thread.h"
 
-#endif /* !_TARGET_OS_THREAD_H_ */
+#endif /* TARGET_OS_THREAD_H */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
index eb8fdf1567..b9222335d4 100644
--- a/bsd-user/openbsd/host-os.h
+++ b/bsd-user/openbsd/host-os.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _HOST_OS_H_
-#define _HOST_OS_H_
+#ifndef HOST_OS_H
+#define HOST_OS_H
 
 #define HOST_DEFAULT_BSD_TYPE target_openbsd
 
-#endif /*!_HOST_OS_H_ */
+#endif /* HOST_OS_H */
diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
index a5cfcd3aff..6dca9c5a85 100644
--- a/bsd-user/openbsd/target_os_elf.h
+++ b/bsd-user/openbsd/target_os_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_OS_ELF_H_
-#define _TARGET_OS_ELF_H_
+
+#ifndef TARGET_OS_ELF_H
+#define TARGET_OS_ELF_H
 
 #include "target_arch_elf.h"
 #include "elf.h"
@@ -143,4 +144,4 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         return sp;
 }
 
-#endif /* _TARGET_OS_ELF_H_ */
+#endif /* TARGET_OS_ELF_H */
diff --git a/bsd-user/openbsd/target_os_siginfo.h b/bsd-user/openbsd/target_os_siginfo.h
index baf646a5ab..732009a820 100644
--- a/bsd-user/openbsd/target_os_siginfo.h
+++ b/bsd-user/openbsd/target_os_siginfo.h
@@ -1,5 +1,5 @@
-#ifndef _TARGET_OS_SIGINFO_H_
-#define _TARGET_OS_SIGINFO_H_
+#ifndef TARGET_OS_SIGINFO_H
+#define TARGET_OS_SIGINFO_H
 
 #define TARGET_NSIG     32   /* counting 0; could be 33 (mask is 1-32) */
 #define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
@@ -79,4 +79,4 @@ typedef union target_siginfo {
 #define TARGET_TRAP_TRACE   2
 
 
-#endif /* ! _TARGET_OS_SIGINFO_H_ */
+#endif /* TARGET_OS_SIGINFO_H */
diff --git a/bsd-user/openbsd/target_os_signal.h b/bsd-user/openbsd/target_os_signal.h
index a373922f7e..4ee4f768e0 100644
--- a/bsd-user/openbsd/target_os_signal.h
+++ b/bsd-user/openbsd/target_os_signal.h
@@ -1,5 +1,5 @@
-#ifndef _TARGET_OS_SIGNAL_H_
-#define _TARGET_OS_SIGNAL_H_
+#ifndef TARGET_OS_SIGNAL_H
+#define TARGET_OS_SIGNAL_H
 
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
@@ -66,4 +66,4 @@
 #define TARGET_SS_ONSTACK 0x0001 /* take signals on alternate stack */
 #define TARGET_SS_DISABLE 0x0004 /* disable taking signals on alternate stack */
 
-#endif /* !_TARGET_OS_SIGNAL_H_ */
+#endif /* TARGET_OS_SIGNAL_H */
diff --git a/bsd-user/openbsd/target_os_stack.h b/bsd-user/openbsd/target_os_stack.h
index 4b37955d3b..264a658608 100644
--- a/bsd-user/openbsd/target_os_stack.h
+++ b/bsd-user/openbsd/target_os_stack.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_STACK_H_
-#define _TARGET_OS_STACK_H_
+#ifndef TARGET_OS_STACK_H
+#define TARGET_OS_STACK_H
 
 #include "target_arch_sigtramp.h"
 
@@ -53,4 +53,4 @@ static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
     return 0;
 }
 
-#endif /* !_TARGET_OS_STACK_H_ */
+#endif /* TARGET_OS_STACK_H */
diff --git a/bsd-user/openbsd/target_os_thread.h b/bsd-user/openbsd/target_os_thread.h
index 01ed0d9fc8..c3adc6712f 100644
--- a/bsd-user/openbsd/target_os_thread.h
+++ b/bsd-user/openbsd/target_os_thread.h
@@ -17,9 +17,9 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_OS_THREAD_H_
-#define _TARGET_OS_THREAD_H_
+#ifndef TARGET_OS_THREAD_H
+#define TARGET_OS_THREAD_H
 
 #include "target_arch_thread.h"
 
-#endif /* !_TARGET_OS_THREAD_H_ */
+#endif /* TARGET_OS_THREAD_H */
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index c3bf14f38f..f5797b28e3 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _SYSCALL_DEFS_H_
-#define _SYSCALL_DEFS_H_
+#ifndef SYSCALL_DEFS_H
+#define SYSCALL_DEFS_H
 
 #include <sys/syscall.h>
 #include <sys/resource.h>
@@ -226,4 +226,4 @@ type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
     return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5, arg6); \
 }
 
-#endif /* ! _SYSCALL_DEFS_H_ */
+#endif /* SYSCALL_DEFS_H */
diff --git a/bsd-user/x86_64/target_arch.h b/bsd-user/x86_64/target_arch.h
index e558e1b956..09bd974889 100644
--- a/bsd-user/x86_64/target_arch.h
+++ b/bsd-user/x86_64/target_arch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_H_
-#define _TARGET_ARCH_H_
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
 
 /* target_arch_cpu.c */
 void bsd_x86_64_write_dt(void *ptr, unsigned long addr, unsigned long limit,
@@ -28,4 +28,4 @@ void bsd_x86_64_set_idt_base(uint64_t base);
 
 #define target_cpu_set_tls(env, newtls)
 
-#endif /* !_TARGET_ARCH_H_ */
+#endif /* TARGET_ARCH_H */
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5be2f02416..4094d61da1 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -16,8 +16,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_CPU_H_
-#define _TARGET_ARCH_CPU_H_
+#ifndef TARGET_ARCH_CPU_H
+#define TARGET_ARCH_CPU_H
 
 #include "target_arch.h"
 #include "signal-common.h"
@@ -174,4 +174,4 @@ static inline void target_cpu_reset(CPUArchState *env)
     cpu_reset(env_cpu(env));
 }
 
-#endif /* ! _TARGET_ARCH_CPU_H_ */
+#endif /* TARGET_ARCH_CPU_H */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
index c2f8553962..b244711888 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_ELF_H_
-#define _TARGET_ARCH_ELF_H_
+
+#ifndef TARGET_ARCH_ELF_H
+#define TARGET_ARCH_ELF_H
 
 #define ELF_START_MMAP 0x2aaaaab000ULL
 #define ELF_ET_DYN_LOAD_ADDR    0x01021000
@@ -32,4 +33,4 @@
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#endif /* _TARGET_ARCH_ELF_H_ */
+#endif /* TARGET_ARCH_ELF_H */
diff --git a/bsd-user/x86_64/target_arch_reg.h b/bsd-user/x86_64/target_arch_reg.h
index 00e9624517..7a766de918 100644
--- a/bsd-user/x86_64/target_arch_reg.h
+++ b/bsd-user/x86_64/target_arch_reg.h
@@ -18,8 +18,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_REG_H_
-#define _TARGET_ARCH_REG_H_
+#ifndef TARGET_ARCH_REG_H
+#define TARGET_ARCH_REG_H
 
 /* See sys/amd64/include/reg.h */
 typedef struct target_reg {
@@ -89,4 +89,4 @@ static inline void target_copy_regs(target_reg_t *regs, const CPUX86State *env)
     regs->r_ss = env->segs[R_SS].selector & 0xffff;
 }
 
-#endif /* !_TARGET_ARCH_REG_H_ */
+#endif /* TARGET_ARCH_REG_H */
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index b4a0ebf2bd..ca24bf1e7f 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -15,8 +15,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_SIGNAL_H_
-#define _TARGET_ARCH_SIGNAL_H_
+
+#ifndef TARGET_ARCH_SIGNAL_H
+#define TARGET_ARCH_SIGNAL_H
 
 #include "cpu.h"
 
@@ -96,4 +97,4 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-#endif /* !TARGET_ARCH_SIGNAL_H_ */
+#endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/x86_64/target_arch_sigtramp.h b/bsd-user/x86_64/target_arch_sigtramp.h
index 29d4a8b55f..01da614098 100644
--- a/bsd-user/x86_64/target_arch_sigtramp.h
+++ b/bsd-user/x86_64/target_arch_sigtramp.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _TARGET_ARCH_SIGTRAMP_H_
-#define _TARGET_ARCH_SIGTRAMP_H_
+#ifndef TARGET_ARCH_SIGTRAMP_H
+#define TARGET_ARCH_SIGTRAMP_H
 
 static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
         unsigned sys_sigreturn)
@@ -26,4 +26,4 @@ static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
 
     return 0;
 }
-#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
+#endif /* TARGET_ARCH_SIGTRAMP_H */
diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
index b745d7ffeb..52c28906d6 100644
--- a/bsd-user/x86_64/target_arch_thread.h
+++ b/bsd-user/x86_64/target_arch_thread.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_THREAD_H_
-#define _TARGET_ARCH_THREAD_H_
+
+#ifndef TARGET_ARCH_THREAD_H
+#define TARGET_ARCH_THREAD_H
 
 /* Compare to vm_machdep.c cpu_set_upcall_kse() */
 static inline void target_thread_set_upcall(CPUX86State *regs, abi_ulong entry,
@@ -35,4 +36,4 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     regs->rdi = infop->start_stack;
 }
 
-#endif /* !_TARGET_ARCH_THREAD_H_ */
+#endif /* TARGET_ARCH_THREAD_H */
diff --git a/bsd-user/x86_64/target_arch_vmparam.h b/bsd-user/x86_64/target_arch_vmparam.h
index 81a915f2e5..6797623a6b 100644
--- a/bsd-user/x86_64/target_arch_vmparam.h
+++ b/bsd-user/x86_64/target_arch_vmparam.h
@@ -16,8 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _TARGET_ARCH_VMPARAM_H_
-#define _TARGET_ARCH_VMPARAM_H_
+
+#ifndef TARGET_ARCH_VMPARAM_H
+#define TARGET_ARCH_VMPARAM_H
 
 #include "cpu.h"
 
@@ -43,4 +44,4 @@ static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
     state->regs[R_EDX] = retval2;
 }
 
-#endif /* !_TARGET_ARCH_VMPARAM_H_ */
+#endif /* TARGET_ARCH_VMPARAM_H */
diff --git a/crypto/ivgen-plain.h b/crypto/ivgen-plain.h
index 43db898809..ebae6acd04 100644
--- a/crypto/ivgen-plain.h
+++ b/crypto/ivgen-plain.h
@@ -17,11 +17,11 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef QCRYPTO_IVGEN_PLAIN_H__
-#define QCRYPTO_IVGEN_PLAIN_H__
+#ifndef QCRYPTO_IVGEN_PLAIN_H
+#define QCRYPTO_IVGEN_PLAIN_H
 
 #include "ivgenpriv.h"
 
 extern struct QCryptoIVGenDriver qcrypto_ivgen_plain;
 
-#endif /* QCRYPTO_IVGEN_PLAIN_H__ */
+#endif /* QCRYPTO_IVGEN_PLAIN_H */
diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
index 6b6e2ceba1..0708ca6fa9 100644
--- a/include/chardev/char-socket.h
+++ b/include/chardev/char-socket.h
@@ -21,8 +21,9 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#ifndef CHAR_SOCKET_H_
-#define CHAR_SOCKET_H_
+
+#ifndef CHAR_SOCKET_H
+#define CHAR_SOCKET_H
 
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
@@ -83,4 +84,4 @@ typedef struct SocketChardev SocketChardev;
 DECLARE_INSTANCE_CHECKER(SocketChardev, SOCKET_CHARDEV,
                          TYPE_CHARDEV_SOCKET)
 
-#endif /* CHAR_SOCKET_H_ */
+#endif /* CHAR_SOCKET_H */
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 8aaf9bbc39..3dd25ec983 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -1,5 +1,5 @@
-#ifndef QEMU_I2C_MUX_PCA954X
-#define QEMU_I2C_MUX_PCA954X
+#ifndef QEMU_I2C_MUX_PCA954X_H
+#define QEMU_I2C_MUX_PCA954X_H
 
 #include "hw/i2c/i2c.h"
 
diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
index 2a58ccf891..e0e5d5ef20 100644
--- a/include/hw/input/lm832x.h
+++ b/include/hw/input/lm832x.h
@@ -18,8 +18,8 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_INPUT_LM832X
-#define HW_INPUT_LM832X
+#ifndef HW_INPUT_LM832X_H
+#define HW_INPUT_LM832X_H
 
 #define TYPE_LM8323 "lm8323"
 
diff --git a/include/hw/intc/exynos4210_combiner.h b/include/hw/intc/exynos4210_combiner.h
index 429844fed4..bd207a7e6e 100644
--- a/include/hw/intc/exynos4210_combiner.h
+++ b/include/hw/intc/exynos4210_combiner.h
@@ -20,8 +20,8 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_INTC_EXYNOS4210_COMBINER
-#define HW_INTC_EXYNOS4210_COMBINER
+#ifndef HW_INTC_EXYNOS4210_COMBINER_H
+#define HW_INTC_EXYNOS4210_COMBINER_H
 
 #include "hw/sysbus.h"
 
diff --git a/include/hw/intc/nios2_vic.h b/include/hw/intc/nios2_vic.h
index af1517a967..ac507b9d74 100644
--- a/include/hw/intc/nios2_vic.h
+++ b/include/hw/intc/nios2_vic.h
@@ -32,8 +32,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef HW_INTC_NIOS2_VIC
-#define HW_INTC_NIOS2_VIC
+#ifndef HW_INTC_NIOS2_VIC_H
+#define HW_INTC_NIOS2_VIC_H
 
 #define TYPE_NIOS2_VIC "nios2-vic"
 OBJECT_DECLARE_SIMPLE_TYPE(Nios2VIC, NIOS2_VIC)
@@ -61,4 +61,4 @@ struct Nios2VIC {
     uint32_t vec_tbl_addr;
 };
 
-#endif /* HW_INTC_NIOS2_VIC */
+#endif /* HW_INTC_NIOS2_VIC_H */
diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
index 99f9a3adfb..bab2f79844 100644
--- a/include/hw/ppc/pnv_pnor.h
+++ b/include/hw/ppc/pnv_pnor.h
@@ -6,8 +6,10 @@
  * This code is licensed under the GPL version 2 or later. See the
  * COPYING file in the top-level directory.
  */
-#ifndef _PPC_PNV_PNOR_H
-#define _PPC_PNV_PNOR_H
+
+#ifndef PPC_PNV_PNOR_H
+#define PPC_PNV_PNOR_H
+
 #include "qom/object.h"
 
 /*
@@ -28,4 +30,4 @@ struct PnvPnor {
     MemoryRegion   mmio;
 };
 
-#endif /* _PPC_PNV_PNOR_H */
+#endif /* PPC_PNV_PNOR_H */
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index cc8c8662b8..03b7f9ba5f 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -9,8 +9,8 @@
  * directory.
  */
 
-#ifndef HW_S390_PCI_CLP
-#define HW_S390_PCI_CLP
+#ifndef HW_S390_PCI_CLP_H
+#define HW_S390_PCI_CLP_H
 
 /* CLP common request & response block size */
 #define CLP_BLK_SIZE 4096
diff --git a/include/hw/tricore/tc27x_soc.h b/include/hw/tricore/tc27x_soc.h
index 6a7e5b54f5..dd3a7485c8 100644
--- a/include/hw/tricore/tc27x_soc.h
+++ b/include/hw/tricore/tc27x_soc.h
@@ -18,8 +18,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef TC27X_SoC_H
-#define TC27X_SoC_H
+#ifndef TC27X_SOC_H
+#define TC27X_SOC_H
 
 #include "hw/sysbus.h"
 #include "target/tricore/cpu.h"
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 0d62834c25..94c3aaa84e 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -11,8 +11,8 @@
  * top-level directory.
  */
 
-#ifndef _QEMU_VHOST_USER_FS_H
-#define _QEMU_VHOST_USER_FS_H
+#ifndef QEMU_VHOST_USER_FS_H
+#define QEMU_VHOST_USER_FS_H
 
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
@@ -44,4 +44,4 @@ struct VHostUserFS {
     /*< public >*/
 };
 
-#endif /* _QEMU_VHOST_USER_FS_H */
+#endif /* QEMU_VHOST_USER_FS_H */
diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
index d8372f3b43..0f7acd40e3 100644
--- a/include/hw/virtio/vhost-user-i2c.h
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _QEMU_VHOST_USER_I2C_H
-#define _QEMU_VHOST_USER_I2C_H
+#ifndef QEMU_VHOST_USER_I2C_H
+#define QEMU_VHOST_USER_I2C_H
 
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
@@ -28,4 +28,4 @@ struct VHostUserI2C {
 /* Virtio Feature bits */
 #define VIRTIO_I2C_F_ZERO_LENGTH_REQUEST		0
 
-#endif /* _QEMU_VHOST_USER_I2C_H */
+#endif /* QEMU_VHOST_USER_I2C_H */
diff --git a/include/hw/virtio/vhost-user-rng.h b/include/hw/virtio/vhost-user-rng.h
index 071539996d..ddd9f01eea 100644
--- a/include/hw/virtio/vhost-user-rng.h
+++ b/include/hw/virtio/vhost-user-rng.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _QEMU_VHOST_USER_RNG_H
-#define _QEMU_VHOST_USER_RNG_H
+#ifndef QEMU_VHOST_USER_RNG_H
+#define QEMU_VHOST_USER_RNG_H
 
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
@@ -30,4 +30,4 @@ struct VHostUserRNG {
     /*< public >*/
 };
 
-#endif /* _QEMU_VHOST_USER_RNG_H */
+#endif /* QEMU_VHOST_USER_RNG_H */
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
index 4cfd558245..67aa46c952 100644
--- a/include/hw/virtio/vhost-user-vsock.h
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -8,8 +8,8 @@
  * top-level directory.
  */
 
-#ifndef _QEMU_VHOST_USER_VSOCK_H
-#define _QEMU_VHOST_USER_VSOCK_H
+#ifndef QEMU_VHOST_USER_VSOCK_H
+#define QEMU_VHOST_USER_VSOCK_H
 
 #include "hw/virtio/vhost-vsock-common.h"
 #include "hw/virtio/vhost-user.h"
@@ -33,4 +33,4 @@ struct VHostUserVSock {
     /*< public >*/
 };
 
-#endif /* _QEMU_VHOST_USER_VSOCK_H */
+#endif /* QEMU_VHOST_USER_VSOCK_H */
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b4da..456a9c2365 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -8,8 +8,8 @@
  * top-level directory.
  */
 
-#ifndef _QEMU_VHOST_VSOCK_COMMON_H
-#define _QEMU_VHOST_VSOCK_COMMON_H
+#ifndef QEMU_VHOST_VSOCK_COMMON_H
+#define QEMU_VHOST_VSOCK_COMMON_H
 
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
@@ -49,4 +49,4 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
 
-#endif /* _QEMU_VHOST_VSOCK_COMMON_H */
+#endif /* QEMU_VHOST_VSOCK_COMMON_H */
diff --git a/include/qemu/cpu-float.h b/include/qemu/cpu-float.h
index 911099499f..a26b9faf68 100644
--- a/include/qemu/cpu-float.h
+++ b/include/qemu/cpu-float.h
@@ -1,5 +1,5 @@
-#ifndef QEMU_CPU_FLOAT_H_
-#define QEMU_CPU_FLOAT_H_
+#ifndef QEMU_CPU_FLOAT_H
+#define QEMU_CPU_FLOAT_H
 
 #include "fpu/softfloat-types.h"
 
@@ -61,4 +61,4 @@ typedef union {
 #endif
 } CPU_QuadU;
 
-#endif /* QEMU_CPU_FLOAT_H_ */
+#endif /* QEMU_CPU_FLOAT_H */
diff --git a/include/qemu/crc-ccitt.h b/include/qemu/crc-ccitt.h
index 06ee55b159..d6eb49146d 100644
--- a/include/qemu/crc-ccitt.h
+++ b/include/qemu/crc-ccitt.h
@@ -11,8 +11,8 @@
  * SPDX-License-Identifier: GPL-2.0
  */
 
-#ifndef _CRC_CCITT_H
-#define _CRC_CCITT_H
+#ifndef CRC_CCITT_H
+#define CRC_CCITT_H
 
 extern uint16_t const crc_ccitt_table[256];
 extern uint16_t const crc_ccitt_false_table[256];
@@ -30,4 +30,4 @@ static inline uint16_t crc_ccitt_false_byte(uint16_t crc, const uint8_t c)
     return (crc << 8) ^ crc_ccitt_false_table[(crc >> 8) ^ c];
 }
 
-#endif /* _CRC_CCITT_H */
+#endif /* CRC_CCITT_H */
diff --git a/include/qemu/keyval.h b/include/qemu/keyval.h
index 2d263286d7..1187b68303 100644
--- a/include/qemu/keyval.h
+++ b/include/qemu/keyval.h
@@ -2,8 +2,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#ifndef KEYVAL_H_
-#define KEYVAL_H_
+
+#ifndef KEYVAL_H
+#define KEYVAL_H
 
 QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
                          bool *p_help, Error **errp);
@@ -11,4 +12,4 @@ QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 void keyval_merge(QDict *old, const QDict *new, Error **errp);
 
-#endif /* KEYVAL_H_ */
+#endif /* KEYVAL_H */
diff --git a/include/ui/dbus-display.h b/include/ui/dbus-display.h
index 88f153c237..7c9ec1a069 100644
--- a/include/ui/dbus-display.h
+++ b/include/ui/dbus-display.h
@@ -1,5 +1,5 @@
-#ifndef DBUS_DISPLAY_H_
-#define DBUS_DISPLAY_H_
+#ifndef DBUS_DISPLAY_H
+#define DBUS_DISPLAY_H
 
 #include "qapi/error.h"
 #include "ui/dbus-module.h"
@@ -14,4 +14,4 @@ static inline bool qemu_using_dbus_display(Error **errp)
     return true;
 }
 
-#endif /* DBUS_DISPLAY_H_ */
+#endif /* DBUS_DISPLAY_H */
diff --git a/include/ui/dbus-module.h b/include/ui/dbus-module.h
index ace4a17a5c..5442ee0bb6 100644
--- a/include/ui/dbus-module.h
+++ b/include/ui/dbus-module.h
@@ -1,5 +1,5 @@
-#ifndef DBUS_MODULE_H_
-#define DBUS_MODULE_H_
+#ifndef DBUS_MODULE_H
+#define DBUS_MODULE_H
 
 struct QemuDBusDisplayOps {
     bool (*add_client)(int csock, Error **errp);
@@ -8,4 +8,4 @@ struct QemuDBusDisplayOps {
 extern int using_dbus_display;
 extern struct QemuDBusDisplayOps qemu_dbus_display;
 
-#endif /* DBUS_MODULE_H_*/
+#endif /* DBUS_MODULE_H */
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 256d90f523..9692dd765e 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -10,8 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef POWER8_PMU
-#define POWER8_PMU
+#ifndef POWER8_PMU_H
+#define POWER8_PMU_H
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 void cpu_ppc_pmu_init(CPUPPCState *env);
diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
index fb1a3fa8f2..77574ed4cb 100644
--- a/target/riscv/sbi_ecall_interface.h
+++ b/target/riscv/sbi_ecall_interface.h
@@ -7,8 +7,8 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#ifndef __SBI_ECALL_INTERFACE_H__
-#define __SBI_ECALL_INTERFACE_H__
+#ifndef SBI_ECALL_INTERFACE_H
+#define SBI_ECALL_INTERFACE_H
 
 /* clang-format off */
 
diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
index 94aa97328a..5cb7eeaa18 100644
--- a/tests/qtest/libqmp.h
+++ b/tests/qtest/libqmp.h
@@ -14,8 +14,9 @@
  * See the COPYING file in the top-level directory.
  *
  */
-#ifndef LIBQMP_H_
-#define LIBQMP_H_
+
+#ifndef LIBQMP_H
+#define LIBQMP_H
 
 #include "qapi/qmp/qdict.h"
 
@@ -47,4 +48,4 @@ bool qmp_rsp_is_err(QDict *rsp);
  */
 void qmp_expect_error_and_unref(QDict *rsp, const char *class);
 
-#endif /* LIBQMP_H_ */
+#endif /* LIBQMP_H */
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index c7872e8442..2731399aaa 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -9,8 +9,9 @@
  * See the COPYING file in the top-level directory.
  *
  */
-#ifndef MIGRATION_HELPERS_H_
-#define MIGRATION_HELPERS_H_
+
+#ifndef MIGRATION_HELPERS_H
+#define MIGRATION_HELPERS_H
 
 #include "libqtest.h"
 
@@ -34,4 +35,4 @@ void wait_for_migration_complete(QTestState *who);
 
 void wait_for_migration_fail(QTestState *from, bool allow_active);
 
-#endif /* MIGRATION_HELPERS_H_ */
+#endif /* MIGRATION_HELPERS_H */
diff --git a/ui/dbus.h b/ui/dbus.h
index 5f5c1f759c..c001c11f70 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -21,8 +21,9 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#ifndef UI_DBUS_H_
-#define UI_DBUS_H_
+
+#ifndef UI_DBUS_H
+#define UI_DBUS_H
 
 #include "chardev/char-socket.h"
 #include "qemu/dbus.h"
@@ -144,4 +145,4 @@ void dbus_chardev_init(DBusDisplay *dpy);
 
 void dbus_clipboard_init(DBusDisplay *dpy);
 
-#endif /* UI_DBUS_H_ */
+#endif /* UI_DBUS_H */
-- 
2.35.1


