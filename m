Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1D48633A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:54:01 +0100 (CET)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QPA-0004V8-VW
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDW-0007eI-4r
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:58 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004iB-QG
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFbeI-1nAQQ83rAM-00H58m; Thu, 06
 Jan 2022 11:41:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] Linux user for 7.0 patches
Date: Thu,  6 Jan 2022 11:41:10 +0100
Message-Id: <20220106104137.732883-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d9FnEqGg7owaBDM9t2vaKwBGC/MD/52wD5/9+UUNrS+izYKcy+r
 l1QH7l9ZmOtWAlVZ5NVYBsE8lco9/jAbqGu2PfkSJY4U95oCW+bws4wQkPTFAC8Kd7E95sH
 tjaoYchNVxv3Vz/oF+DEZ+BvKsmCNTpVtYioRuW0T5N3pM4jr5aoSsKCFa1/Dl3zSataz72
 aaHtYCSs744pTX2/JDCnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ulnXHM0w+9c=:Tnh9LQ88qJhsx8YuY4KeF9
 9wrmLsibeAsMiARBpk2yYUcoUipXmOKpCryZKYAdeAv2oHceypvE461EWmpjdpp/khcobEF+o
 koKzy6JbB6mE3MwLTbsg78Iz9AtPL9JOUD/a1w1ORgphSnhG/FCZvejL9HcKxu917VpWdsYOz
 nNdUjazT35OO2IFHluySBwLXAv4hpz/0Oc8/1h5vn8OKasvJ42heKoyfpT7nHHROaFALINwxa
 J4d5qVXdIw6SJk+4xBQceRpIrxBngsIgwW2keYaMEKHHFBDPi21foTKowsiKT/8DNlKhSOrRo
 1baJ+rn2TsWAz1RW9PF3aMIGiyuQ5CCMR+TSZjIXi/AHaNeDn9C9Hk1A/qID9wx84CK/XEJg9
 C7uD/XyHGnt9tIEHrDEW16v3nSWeg2e5oAHc/S/Z/dyH4qR5uU3zMb3vx/OzfC3RKzcr/u0CL
 kpEEcjcBlRumvcw/f7s+hwRuJi8XcVyiX3u+olh3ZwE73VRh8fTZMz7xRTz/I1CvOEP9Kh/GV
 U4YJALA65XWUBYWUe6oRkgqMX0YveopjDfO5q0X+i5wvxbrDenmVnylV1IO/7lvJsrtzUgxF2
 7NksyU5Ke+0kXT3sSJYyu5K3DLlzkCqX4lvm7m187P2w4D9uoDc+on9/YTyPqTGv/6BwI++eF
 3fgxk2fRfJ7mDxwww2ZfPW+FzGWeNmumSbqKJfY9wa5kV+/tvL/pFZewsRZwz9t4r8PM=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fb084237a3b78b20fd9d888dffd673b6656ea3be=
:=0D
=0D
  common-user: Really fix i386 calls to safe_syscall_set_errno_tail (2022-0=
1-04 21:14:23 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-r=
equest=0D
=0D
for you to fetch changes up to f0effdbc2a5b43422bc4c9c22641ef9dafa0c7ae:=0D
=0D
  linux-user: netlink: update IFLA_BRPORT entries (2022-01-06 11:40:53 +010=
0)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20220106=0D
=0D
update netlink entries=0D
nios2 fixes=0D
/proc/self/maps fixes=0D
set/getscheduler update=0D
prctl cleanup and fixes=0D
target_signal.h cleanup=0D
and some trivial fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Ahmed Abouzied (1):=0D
  linux-user/syscall.c: malloc to g_try_malloc=0D
=0D
Andrey Kazmin (1):=0D
  linux-user/syscall.c: fix missed flag for shared memory in=0D
    open_self_maps=0D
=0D
Laurent Vivier (3):=0D
  linux-user: netlink: update IFLA entries=0D
  linux-user: netlink: Add IFLA_VFINFO_LIST=0D
  linux-user: netlink: update IFLA_BRPORT entries=0D
=0D
Martin Wilck (1):=0D
  qemu-binfmt-conf.sh: fix -F option=0D
=0D
Matthias Schiffer (1):=0D
  linux-user/signal: Map exit signals in SIGCHLD siginfo_t=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  linux-user/hexagon: Use generic target_stat64 structure=0D
  linux-user: Mark cpu_loop() with noreturn attribute=0D
=0D
Richard Henderson (13):=0D
  linux-user: Split out do_prctl and subroutines=0D
  linux-user: Disable more prctl subcodes=0D
  linux-user: Add code for PR_GET/SET_UNALIGN=0D
  target/alpha: Implement prctl_unalign_sigbus=0D
  target/hppa: Implement prctl_unalign_sigbus=0D
  target/sh4: Implement prctl_unalign_sigbus=0D
  linux-user/nios2: Properly emulate EXCP_TRAP=0D
  linux-user/nios2: Fixes for signal frame setup=0D
  linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE=0D
  linux-user/nios2: Map a real kuser page=0D
  linux-user/nios2: Fix EA vs PC confusion=0D
  linux-user/nios2: Fix sigmask in setup_rt_frame=0D
  linux-user/nios2: Use set_sigmask in do_rt_sigreturn=0D
=0D
Song Gao (3):=0D
  linux-user: Move target_signal.h generic definitions to=0D
    generic/signal.h=0D
  linux-user: target_syscall.h remove definition TARGET_MINSIGSTKSZ=0D
  linux-user: Remove TARGET_SIGSTKSZ=0D
=0D
Tonis Tiigi (2):=0D
  linux-user: add sched_getattr support=0D
  linux-user: call set/getscheduler set/getparam directly=0D
=0D
 cpu.c                                     |  20 +-=0D
 include/hw/core/cpu.h                     |   3 +=0D
 linux-user/aarch64/target_prctl.h         | 160 ++++++=0D
 linux-user/aarch64/target_signal.h        |  18 -=0D
 linux-user/aarch64/target_syscall.h       |  24 -=0D
 linux-user/alpha/target_prctl.h           |   1 +=0D
 linux-user/alpha/target_signal.h          |   1 -=0D
 linux-user/alpha/target_syscall.h         |   1 -=0D
 linux-user/arm/target_prctl.h             |   1 +=0D
 linux-user/arm/target_signal.h            |  18 -=0D
 linux-user/arm/target_syscall.h           |   1 -=0D
 linux-user/cris/target_prctl.h            |   1 +=0D
 linux-user/cris/target_signal.h           |  18 -=0D
 linux-user/cris/target_syscall.h          |   1 -=0D
 linux-user/elfload.c                      |  66 ++-=0D
 linux-user/fd-trans.c                     | 184 ++++++=0D
 linux-user/generic/signal.h               |  15 +=0D
 linux-user/generic/target_prctl_unalign.h |  27 +=0D
 linux-user/hexagon/target_prctl.h         |   1 +=0D
 linux-user/hexagon/target_signal.h        |  11 -=0D
 linux-user/hppa/target_prctl.h            |   1 +=0D
 linux-user/hppa/target_signal.h           |   1 -=0D
 linux-user/hppa/target_syscall.h          |   1 -=0D
 linux-user/i386/target_prctl.h            |   1 +=0D
 linux-user/i386/target_signal.h           |  18 -=0D
 linux-user/i386/target_syscall.h          |   1 -=0D
 linux-user/m68k/target_prctl.h            |   1 +=0D
 linux-user/m68k/target_signal.h           |  18 -=0D
 linux-user/m68k/target_syscall.h          |   1 -=0D
 linux-user/microblaze/target_prctl.h      |   1 +=0D
 linux-user/microblaze/target_signal.h     |  18 -=0D
 linux-user/microblaze/target_syscall.h    |   1 -=0D
 linux-user/mips/target_prctl.h            |  88 +++=0D
 linux-user/mips/target_signal.h           |   1 -=0D
 linux-user/mips/target_syscall.h          |   7 -=0D
 linux-user/mips64/target_prctl.h          |   1 +=0D
 linux-user/mips64/target_signal.h         |   1 -=0D
 linux-user/mips64/target_syscall.h        |   7 -=0D
 linux-user/nios2/cpu_loop.c               |  93 +--=0D
 linux-user/nios2/signal.c                 |  58 +-=0D
 linux-user/nios2/target_prctl.h           |   1 +=0D
 linux-user/nios2/target_signal.h          |  16 -=0D
 linux-user/nios2/target_syscall.h         |   1 -=0D
 linux-user/openrisc/target_prctl.h        |   1 +=0D
 linux-user/openrisc/target_signal.h       |  23 -=0D
 linux-user/openrisc/target_syscall.h      |   1 -=0D
 linux-user/ppc/target_prctl.h             |   1 +=0D
 linux-user/ppc/target_signal.h            |  18 -=0D
 linux-user/ppc/target_syscall.h           |   1 -=0D
 linux-user/riscv/target_prctl.h           |   1 +=0D
 linux-user/riscv/target_signal.h          |  12 -=0D
 linux-user/riscv/target_syscall.h         |   1 -=0D
 linux-user/s390x/target_prctl.h           |   1 +=0D
 linux-user/s390x/target_signal.h          |  15 -=0D
 linux-user/s390x/target_syscall.h         |   1 -=0D
 linux-user/sh4/target_prctl.h             |   1 +=0D
 linux-user/sh4/target_signal.h            |  18 -=0D
 linux-user/sh4/target_syscall.h           |   1 -=0D
 linux-user/signal.c                       |   9 +-=0D
 linux-user/sparc/target_prctl.h           |   1 +=0D
 linux-user/sparc/target_signal.h          |   1 -=0D
 linux-user/sparc/target_syscall.h         |   1 -=0D
 linux-user/syscall.c                      | 657 ++++++++++++----------=0D
 linux-user/syscall_defs.h                 |  46 +-=0D
 linux-user/user-internals.h               |   2 +-=0D
 linux-user/x86_64/target_prctl.h          |   1 +=0D
 linux-user/x86_64/target_signal.h         |  18 -=0D
 linux-user/x86_64/target_syscall.h        |   1 -=0D
 linux-user/xtensa/target_prctl.h          |   1 +=0D
 linux-user/xtensa/target_signal.h         |  17 -=0D
 scripts/qemu-binfmt-conf.sh               |   4 +-=0D
 target/alpha/cpu.h                        |   5 +=0D
 target/alpha/translate.c                  |  31 +-=0D
 target/hppa/cpu.h                         |   5 +-=0D
 target/hppa/translate.c                   |  19 +-=0D
 target/nios2/cpu.h                        |   2 +-=0D
 target/nios2/translate.c                  |  26 +-=0D
 target/sh4/cpu.h                          |   4 +=0D
 target/sh4/translate.c                    |  50 +-=0D
 79 files changed, 1130 insertions(+), 776 deletions(-)=0D
 create mode 100644 linux-user/aarch64/target_prctl.h=0D
 create mode 100644 linux-user/alpha/target_prctl.h=0D
 create mode 100644 linux-user/arm/target_prctl.h=0D
 create mode 100644 linux-user/cris/target_prctl.h=0D
 create mode 100644 linux-user/generic/target_prctl_unalign.h=0D
 create mode 100644 linux-user/hexagon/target_prctl.h=0D
 create mode 100644 linux-user/hppa/target_prctl.h=0D
 create mode 100644 linux-user/i386/target_prctl.h=0D
 create mode 100644 linux-user/m68k/target_prctl.h=0D
 create mode 100644 linux-user/microblaze/target_prctl.h=0D
 create mode 100644 linux-user/mips/target_prctl.h=0D
 create mode 100644 linux-user/mips64/target_prctl.h=0D
 create mode 100644 linux-user/nios2/target_prctl.h=0D
 create mode 100644 linux-user/openrisc/target_prctl.h=0D
 create mode 100644 linux-user/ppc/target_prctl.h=0D
 create mode 100644 linux-user/riscv/target_prctl.h=0D
 create mode 100644 linux-user/s390x/target_prctl.h=0D
 create mode 100644 linux-user/sh4/target_prctl.h=0D
 create mode 100644 linux-user/sparc/target_prctl.h=0D
 create mode 100644 linux-user/x86_64/target_prctl.h=0D
 create mode 100644 linux-user/xtensa/target_prctl.h=0D
=0D
-- =0D
2.33.1=0D
=0D

