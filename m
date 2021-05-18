Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524B387141
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:33:14 +0200 (CEST)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisLx-00015P-8N
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKO-0006dl-Ve
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:37 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKM-0006oB-Vy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:36 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MAPBF-1lbUjP1gMt-00BpJa; Tue, 18
 May 2021 07:31:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/59] Linux user for 6.1 patches
Date: Tue, 18 May 2021 07:30:32 +0200
Message-Id: <20210518053131.87212-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5m+LceHlb3k+BZn7l3JfUZfr15DyyNgIaiPtfQrhIFLIyAmr5kw
 4i8nzF/KoIjjvPCWgesW/awnjm4Nj17+jR95xEAdEutmOlpQbENzGJrV4L2z1sWd6am0iVq
 7tEJl3vEtWFLbXvHFIHWxjwRgCSgtqhu9pT6IgLCFrhPjRAQ157u+NAqnZ5CSfQv5SWE4uX
 wcdo40fOLegWctvUya/hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:11i9ESpGsX8=:XepSBVmiMxlBV85veHSS8y
 4e3xKy4HlSLMcUymegj9/wab33uiIf2/3SDj+3PBIOUtMEemD7tGhYxD2O6ecql6829J9nCPk
 YRBgA0a+a8uMrnEj9QTMX/38XVc8bSPafq1L9NDxtactGNwS3Bt/Svb0T8bcvPn2O18OEImaL
 QKUklKJq/A7PUJhD0WEVS/5mgxLsuDTKOZkEhKnplpxh0FZ6hRQRreH2JDvSf6LOj28VkHT+0
 cdwqyjD7jB732TSnZozwMtRz0CKSvhEtO6eFNUhhTqUSqn3m+5yfFAMtFYVG9JsE0lAGwqzi+
 vn0WlGKoDvR946/3lkzj+EbybxvK25AiC3/5jVP8roraGbgt6pG+w0m/g20mzDIjCAOpZX6vp
 jIIeO/Olvnn6OQVUv6EhKHTYdE08aEchj4ggzRwx66Olw8xsM9+15A5u+EjyoUlYmdofvhJjw
 CsTezHJlFfE3zT5souwVL0rhF32m2sFDMyZzU+bg+73ToRzTTNW2AFb2CSN8kYVkayOg/E2+3
 P3L9g0IuBv0IRCzDTnPf1I=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79=
:=0D
=0D
  Merge remote-tracking branch 'remotes/marcandre/tags/rtd-pull-request' in=
to staging (2021-05-14 17:20:08 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request=0D
=0D
for you to fetch changes up to 4a1e8931eca05077afd0b7ed092ab0f10c5b457e:=0D
=0D
  linux-user/elfload: add s390x core dumping support (2021-05-18 07:10:46 +=
0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210517=0D
=0D
- alpha sigaction fixes/cleanups=0D
- s390x sigaction fixes/cleanup=0D
- sparc sigaction fixes/cleanup=0D
- s390x core dumping support=0D
- core dump fix (app name)=0D
- arm  fpa11 fix and cleanup=0D
- strace fixes (unshare(), llseek())=0D
- fix copy_file_range()=0D
- use GDateTime=0D
- Remove dead code=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  linux-user: use GDateTime for formatting timestamp for core file=0D
=0D
Giuseppe Musacchio (2):=0D
  linux-user: Add copy_file_range to strace.list=0D
  linux-user: Fix erroneous conversion in copy_file_range=0D
=0D
Ilya Leoshkevich (2):=0D
  linux-user/elfload: fix filling psinfo->pr_psargs=0D
  linux-user/elfload: add s390x core dumping support=0D
=0D
Kito Cheng (1):=0D
  linux-user: Add strace support for printing arguments of llseek=0D
=0D
Matus Kysel (1):=0D
  linux-user: strace now handles unshare syscall args correctly=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  linux-user: Remove dead code=0D
=0D
Richard Henderson (51):=0D
  linux-user/arm: Split out emulate_arm_fpa11=0D
  linux-user/arm: Do not emulate fpa11 in thumb mode=0D
  linux-user/arm: Do not fill in si_code for fpa11 exceptions=0D
  linux-user/arm: Simplify accumulating and raising fpa11 exceptions=0D
  linux-user: Split out target_restore_altstack=0D
  linux-user: Use target_restore_altstack in all sigreturn=0D
  linux-user: Pass CPUArchState to do_sigaltstack=0D
  linux-user: Pass CPUArchState to target_restore_altstack=0D
  linux-user/sparc: Include TARGET_STACK_BIAS in get_sp_from_cpustate=0D
  linux-user/sparc: Clean up init_thread=0D
  linux-user/sparc: Merge sparc64 target_syscall.h=0D
  linux-user/sparc: Merge sparc64 target_elf.h=0D
  linux-user/sparc: Merge sparc64 target_structs.h=0D
  linux-user/sparc: Merge sparc64 termbits.h=0D
  linux-user/sparc: Merge sparc64/ into sparc/=0D
  linux-user/sparc: Remove target_sigcontext as unused=0D
  linux-user/sparc: Remove target_rt_signal_frame as unused=0D
  linux-user/sparc: Fix the stackframe structure=0D
  linux-user/sparc: Use target_pt_regs=0D
  linux-user/sparc: Split out save_reg_win=0D
  linux-user/sparc: Clean up get_sigframe=0D
  linux-user/sparc: Save and restore fpu in signal frame=0D
  linux-user/sparc: Add rwin_save to signal frame=0D
  linux-user/sparc: Clean up setup_frame=0D
  linux-user/sparc: Minor corrections to do_sigreturn=0D
  linux-user/sparc: Add 64-bit support to fpu save/restore=0D
  linux-user/sparc: Implement sparc32 rt signals=0D
  linux-user/sparc: Implement sparc64 rt signals=0D
  tests/tcg/sparc64: Re-enable linux-test=0D
  linux-user/s390x: Fix sigframe types=0D
  linux-user/s390x: Use uint16_t for signal retcode=0D
  linux-user/s390x: Remove PSW_ADDR_AMODE=0D
  linux-user/s390x: Remove restore_sigregs return value=0D
  linux-user/s390x: Fix trace in restore_regs=0D
  linux-user/s390x: Fix sigcontext sregs value=0D
  linux-user/s390x: Use tswap_sigset in setup_rt_frame=0D
  linux-user/s390x: Tidy save_sigregs=0D
  linux-user/s390x: Clean up single-use gotos in signal.c=0D
  linux-user/s390x: Set psw.mask properly for the signal handler=0D
  linux-user/s390x: Add stub sigframe argument for last_break=0D
  linux-user/s390x: Fix frame_addr corruption in setup_frame=0D
  linux-user/s390x: Add build asserts for sigset sizes=0D
  linux-user/s390x: Clean up signal.c=0D
  linux-user/s390x: Handle vector regs in signal stack=0D
  linux-user/alpha: Fix rt sigframe return=0D
  linux-user/alpha: Rename the sigaction restorer field=0D
  linux-user: Pass ka_restorer to do_sigaction=0D
  linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in do_syscall=0D
  linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER=0D
  linux-user/alpha: Share code for TARGET_NR_sigaction=0D
  linux-user: Tidy TARGET_NR_rt_sigaction=0D
=0D
 .../targets/sparc64-linux-user.mak            |   1 +=0D
 linux-user/aarch64/signal.c                   |   6 +-=0D
 linux-user/alpha/signal.c                     |  16 +-=0D
 linux-user/alpha/target_signal.h              |   1 +=0D
 linux-user/arm/cpu_loop.c                     | 125 ++--=0D
 linux-user/arm/signal.c                       |   9 +-=0D
 linux-user/elfload.c                          | 107 ++--=0D
 linux-user/hexagon/signal.c                   |   6 +-=0D
 linux-user/hppa/signal.c                      |   8 +-=0D
 linux-user/i386/signal.c                      |   5 +-=0D
 linux-user/m68k/signal.c                      |   5 +-=0D
 linux-user/main.c                             |   5 -=0D
 linux-user/meson.build                        |   1 -=0D
 linux-user/microblaze/signal.c                |   6 +-=0D
 linux-user/mips/signal.c                      |   6 +-=0D
 linux-user/nios2/signal.c                     |   8 +-=0D
 linux-user/openrisc/signal.c                  |   5 +-=0D
 linux-user/ppc/signal.c                       |   4 +-=0D
 linux-user/qemu.h                             |   3 +-=0D
 linux-user/riscv/signal.c                     |   6 +-=0D
 linux-user/s390x/signal.c                     | 258 +++++----=0D
 linux-user/sh4/signal.c                       |   7 +-=0D
 linux-user/signal-common.h                    |   1 +=0D
 linux-user/signal.c                           | 125 ++--=0D
 linux-user/sparc/signal.c                     | 535 ++++++++++++------=0D
 linux-user/sparc/target_cpu.h                 |   9 +-=0D
 linux-user/sparc/target_signal.h              |   2 +=0D
 linux-user/sparc/target_structs.h             |  34 +-=0D
 linux-user/sparc/target_syscall.h             |  42 +-=0D
 linux-user/sparc64/cpu_loop.c                 |  20 -=0D
 linux-user/sparc64/meson.build                |   5 -=0D
 linux-user/sparc64/signal.c                   |  19 -=0D
 linux-user/sparc64/sockbits.h                 |   1 -=0D
 linux-user/sparc64/syscall.tbl                | 487 ----------------=0D
 linux-user/sparc64/syscallhdr.sh              |  32 --=0D
 linux-user/sparc64/target_cpu.h               |   1 -=0D
 linux-user/sparc64/target_elf.h               |  14 -=0D
 linux-user/sparc64/target_fcntl.h             |   1 -=0D
 linux-user/sparc64/target_signal.h            |   1 -=0D
 linux-user/sparc64/target_structs.h           |  58 --=0D
 linux-user/sparc64/target_syscall.h           |  35 --=0D
 linux-user/sparc64/termbits.h                 | 291 ----------=0D
 linux-user/strace.c                           |  21 +-=0D
 linux-user/strace.list                        |   8 +-=0D
 linux-user/syscall.c                          | 113 +---=0D
 linux-user/syscall_defs.h                     |  29 +-=0D
 linux-user/xtensa/signal.c                    |   6 +-=0D
 tests/tcg/sparc64/Makefile.target             |   7 +-=0D
 48 files changed, 842 insertions(+), 1653 deletions(-)=0D
 delete mode 100644 linux-user/sparc64/cpu_loop.c=0D
 delete mode 100644 linux-user/sparc64/meson.build=0D
 delete mode 100644 linux-user/sparc64/signal.c=0D
 delete mode 100644 linux-user/sparc64/sockbits.h=0D
 delete mode 100644 linux-user/sparc64/syscall.tbl=0D
 delete mode 100644 linux-user/sparc64/syscallhdr.sh=0D
 delete mode 100644 linux-user/sparc64/target_cpu.h=0D
 delete mode 100644 linux-user/sparc64/target_elf.h=0D
 delete mode 100644 linux-user/sparc64/target_fcntl.h=0D
 delete mode 100644 linux-user/sparc64/target_signal.h=0D
 delete mode 100644 linux-user/sparc64/target_structs.h=0D
 delete mode 100644 linux-user/sparc64/target_syscall.h=0D
 delete mode 100644 linux-user/sparc64/termbits.h=0D
=0D
-- =0D
2.31.1=0D
=0D

