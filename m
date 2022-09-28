Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6D5EE6A0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:30:45 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddha-0004wK-TL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeg-0007rT-Rj
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddee-0006Lq-Sc
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:42 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mn2iP-1p3aKz3UDX-00k4Lv; Wed, 28
 Sep 2022 22:27:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/37] Linux user for 7.2 patches
Date: Wed, 28 Sep 2022 22:27:00 +0200
Message-Id: <20220928202737.793171-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jbgvgi2pO0Sr8t+wa8mcjlPd+yOnGrEM5N6jM1a5OCgzM9/flgf
 DK/gMSxLS5jr3GgdXITvZN4U3aIAXmuJ2u3Ua5byHqKy/+3bHcQRtUxp0ezA86QDCSMOuDe
 1OTyHJ/XTPZufAw/1ZAXtSvZqOpShiA8JfH9GlZIHMkqAeuVHvbaNdTBxA10u/QM1Q5rB0Q
 d1Jwt1B9Axo+aPlfW8NWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IYXSabkF7uQ=:VAO6IGh95FPfczMIRWgyPA
 gDFoCcvIiL54hzsV8O8KU3/McHXVEFJf4Hhg9xm42A7/Gx8Mvc7GxY60cvbHIGzyHOjnBtSnS
 WMLfyXBhQiSDeie948CyvzuAwfEQIFOYFd9AxVMvdShTyAy8CScVtGSOw05rE2vLMlsLC8Z7A
 jydg71tjTQMZMGwsLwv0WiPGgedunON9vwFCoGj3D5iGPdVeOQFmR3nToM0XSSYgQrgjYTcal
 QL8ebrzC88vmfQ3O/jTdYofAfToTDfBY+XTLCZvHw28RD64r4a6yEyldnvgyuqXUz/gPBtL+O
 2CbCU11dfV7nJ3+zhGAhRVs9zVZPQLEJENr2R1aw8gDZP1lCLCc9RbCT9ZNYZ3xxhMYZI1tYa
 x0Uvq+KRwnv4rSrLOzJDqY6FHviyiKmvJ94QDUV068LRWj4WjpTJma3RZttYbWuY6yko4Kvtn
 Rv5OkANBPQKmGhjpx66XiNVEOsxd+wGWXadj2rHmsnjFwH4WFR8T2e8rd6BYlJjAF1CKhQzPD
 z7Q9hgwex/XsHRMNSCkComRMdlmui10lRSMtj/p4rgNx+732XcAUrREmgwGpg1L5ZNDgQXZcW
 yDXTsoNtFEWr0tdFvP6chpdKhV8/LAthJCPYyMeuiqozA7rJTYjusf0Ans/zg/Z2Ka+1/jKfS
 pby31qDcOpVuaB3R8lnsAH4v9i/gq2IIpyaeHBx95BU0e/vfF9wB1OhXYtB2CzdQSyO/6Xwhg
 WCOfLaY9VkRv1v+e5JaFULi8C/Ywaq4sKZKyUHcxsDtwG9Cy0k1XdCpr/aQ783ijkHPOVgiZR
 NVjmIm1
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 6160d8ff81fb9fba70f5dad88d43ffd0fa44984c:

  Merge tag 'edgar/xilinx-next-2022-09-21.for-upstream' of https://github.com/edgarigl/qemu into staging (2022-09-22 13:24:28 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.2-pull-request

for you to fetch changes up to 4a877b82f7f99f7366fbb4820687d88dcf97478f:

  linux-user: Add parameters of getrandom() syscall for strace (2022-09-28 22:24:42 +0200)

----------------------------------------------------------------
linux-user pull request 20220928-v2

use 'max' instead of 'qemu32' / 'qemu64'
add  pidfd_open(), pidfd_send_signal() and pidfd_getfd()
Improve madvise(MADV_DONTNEED)
futex syscal rework
strace improvement
HP/PA fixes and improvement
Misc fixes

----------------------------------------------------------------

Daniel P. Berrangé (1):
  linux-user: use 'max' instead of 'qemu32' / 'qemu64' by default

Helge Deller (18):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace
  linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
    syscalls
  linux-user: Log failing executable in EXCP_DUMP()
  linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
  linux-user/hppa: Dump IIR on register dump
  linux-user: Fix strace of chmod() if mode == 0
  linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
  linux-user: Add strace for clock_nanosleep()
  linux-user: Show timespec on strace for futex()
  linux-user: Fix TARGET_PROT_SEM for XTENSA
  linux-user: Add proper strace format strings for
    getdents()/getdents64()
  linux-user/hppa: Add signal trampoline for hppa target
  linux-user/hppa: Drop stack guard page on hppa target
  linux-user/hppa: Increase guest stack size to 80MB for hppa target
  linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN in mprotect()
  linux-user/hppa: Fix setup_sigcontext()
  linux-user: Add parameters of getrandom() syscall for strace

Ilya Leoshkevich (6):
  linux-user: Provide MADV_* definitions
  linux-user: Fix madvise(MADV_DONTNEED) on alpha
  linux-user: Implement stracing madvise()
  linux-user: Passthrough MADV_DONTNEED for certain file mappings
  tests/tcg/linux-test: Add linux-madvise test
  linux-user/s390x: Save/restore fpc when handling a signal

Jameson Nash (1):
  linux-user: fix readlinkat handling with magic exe symlink

Jiaxun Yang (2):
  linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
  linux-user: Set ELF_BASE_PLATFORM for MIPS

Peter Maydell (1):
  linux-user: Don't assume 0 is not a valid host timer_t value

Richard Henderson (7):
  linux-user: Combine do_futex and do_futex_time64
  linux-user: Sink call to do_safe_futex
  linux-user: Implement FUTEX_WAKE_BITSET
  linux-user: Convert signal number for FUTEX_FD
  linux-user: Implement PI futexes
  linux-user: Update print_futex_op
  linux-user: Lock log around strace

fanwenjie (1):
  linux-user: fix bug about missing signum convert of sigqueue

 accel/tcg/translate-all.c                 |   2 +-
 include/exec/cpu-all.h                    |   6 +
 linux-user/aarch64/target_mman.h          |   1 +
 linux-user/alpha/target_mman.h            |   8 +
 linux-user/arm/target_mman.h              |   1 +
 linux-user/cpu_loop-common.h              |   2 +
 linux-user/cris/target_mman.h             |   1 +
 linux-user/elfload.c                      |  73 ++++-
 linux-user/generic/target_mman.h          |  92 +++++++
 linux-user/hexagon/target_mman.h          |   1 +
 linux-user/hppa/cpu_loop.c                |   6 +-
 linux-user/hppa/signal.c                  |  57 ++--
 linux-user/hppa/target_mman.h             |  15 +
 linux-user/hppa/target_signal.h           |  14 +-
 linux-user/hppa/target_syscall.h          |   2 +
 linux-user/i386/target_elf.h              |   2 +-
 linux-user/i386/target_mman.h             |   1 +
 linux-user/loongarch64/target_mman.h      |   1 +
 linux-user/m68k/target_mman.h             |   1 +
 linux-user/main.c                         |   9 +-
 linux-user/microblaze/target_mman.h       |   1 +
 linux-user/mips/target_mman.h             |   1 +
 linux-user/mips64/target_mman.h           |   1 +
 linux-user/mmap.c                         |  36 ++-
 linux-user/nios2/target_mman.h            |   1 +
 linux-user/openrisc/target_mman.h         |   1 +
 linux-user/ppc/target_mman.h              |   1 +
 linux-user/riscv/target_mman.h            |   1 +
 linux-user/s390x/signal.c                 |   2 +
 linux-user/s390x/target_mman.h            |   1 +
 linux-user/sh4/target_mman.h              |   1 +
 linux-user/signal-common.h                |  46 ++++
 linux-user/signal.c                       |  37 +--
 linux-user/sparc/target_mman.h            |   1 +
 linux-user/strace.c                       | 318 ++++++++++++++++------
 linux-user/strace.list                    |  24 +-
 linux-user/syscall.c                      | 206 ++++++++------
 linux-user/syscall_defs.h                 |   5 +-
 linux-user/x86_64/target_elf.h            |   2 +-
 linux-user/x86_64/target_mman.h           |   1 +
 linux-user/xtensa/target_mman.h           |   1 +
 target/hppa/helper.c                      |   6 +-
 tests/tcg/multiarch/linux/linux-madvise.c |  70 +++++
 43 files changed, 797 insertions(+), 262 deletions(-)
 create mode 100644 linux-user/aarch64/target_mman.h
 create mode 100644 linux-user/alpha/target_mman.h
 create mode 100644 linux-user/arm/target_mman.h
 create mode 100644 linux-user/cris/target_mman.h
 create mode 100644 linux-user/generic/target_mman.h
 create mode 100644 linux-user/hexagon/target_mman.h
 create mode 100644 linux-user/hppa/target_mman.h
 create mode 100644 linux-user/i386/target_mman.h
 create mode 100644 linux-user/loongarch64/target_mman.h
 create mode 100644 linux-user/m68k/target_mman.h
 create mode 100644 linux-user/microblaze/target_mman.h
 create mode 100644 linux-user/mips/target_mman.h
 create mode 100644 linux-user/mips64/target_mman.h
 create mode 100644 linux-user/nios2/target_mman.h
 create mode 100644 linux-user/openrisc/target_mman.h
 create mode 100644 linux-user/ppc/target_mman.h
 create mode 100644 linux-user/riscv/target_mman.h
 create mode 100644 linux-user/s390x/target_mman.h
 create mode 100644 linux-user/sh4/target_mman.h
 create mode 100644 linux-user/sparc/target_mman.h
 create mode 100644 linux-user/x86_64/target_mman.h
 create mode 100644 linux-user/xtensa/target_mman.h
 create mode 100644 tests/tcg/multiarch/linux/linux-madvise.c

-- 
2.37.3


