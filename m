Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890340DDBB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:15:55 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt7C-0005KQ-Ny
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt48-0002hI-Va
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt47-00045G-3i
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:44 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MVdYY-1mJ9Gs1lZs-00RV6B; Thu, 16
 Sep 2021 17:12:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Linux user for 6.2 patches
Date: Thu, 16 Sep 2021 17:12:27 +0200
Message-Id: <20210916151237.1188301-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8tvnPdC3sDkphJyRiMcnBDmZeGe6/qiXixWqas6cHvwTb05Edgn
 yFgnLZi0QFLXLm4KeE9qdikNajBnXS1tcoMOMuUkchF63bF6tu5th2HaM8W3Rvo+Rzk9BrK
 c8rcHXvA/XrKjC58etpQtVOqKbDxOJ1f27Q3zsktDmHRadtuXN3YOMmwclnW5/HCiCgjg4e
 PnRbG9AwbKhgRwjCaSsRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjYnxkrTNyk=:2b6v9e6o9O+oxUgILT/kcy
 /P2egV1eR0pvqC67AT9V3RVwcaCgpNhCBs8ZTt2qKTGI4zH+ilB/yibDn9TiMBxH2ChprzNzJ
 sKyMrsUKt30QNts6GPOsbfETw+0uyKR0Kn9v2ptUOixWPXqmzqLg0SLnHuDs9PlTV9XbkasdY
 iWPOsjlfxL+Ih3bwq/zUcDbdKeME7cmuwXu20KlDjd7fYZwc7T+0I7xzxns6E7VxxoU8SB9yu
 +TB/Ry2sqFnd9nMVJhKJ82GE5mgDo4nkdPxCSWfENCqZ31X6ikGVsXvevY+/wpmeYdk3b6PN7
 AVVxWN+26ao758uG5+7eSRXbm3x0zk0iGv/X4/fII3CtEs1u/AfxxI0cFbDS4DijscO6ow/68
 9vpaQaxOt6S2csG7DYTyXROF0CkVDW5x0ar3MfXaKTIJa0nWKdvlpnT40Zs4tDKGhnVTC3aOt
 8/AJaa4VMjOTZrWDpPq2f3p9fh/HfuwyMQOjtVm8hp6zMrKOlPNrA+lM62AJzT68kiXlQWpl3
 zlwOUbmBhzj8qOGV1L9V96eOrYWAdWY9uW4mptcYPAyPCFRtmr1uPCMF5FZdk8txAh24tEydE
 0NrHGcEH2jDYw4nitWl7hNt0U3UJsU9q1uKpgxDq3SYELrS8pLa753IAXyKgHC2SCOYDHrD7f
 24sx1NGHEYF3708+Ofd4owlMye2mWBguxaVu9hexKFTrTalVrJ1A4o306Eqf55nCu0cg2MdXZ
 H9mGRD1AZNTRou3FeFwLAdhvs9qCvOQLyvt7lA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7d79344d4fa44e520e6e89f8fed9a27d3d554a9b=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-09-13 13:33:21 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 74e43b04b0260da09d14bc56a5d629d4753b8b27:=0D
=0D
  linux-user: Check lock_user result for ip_mreq_source sockopts (2021-09-1=
6 17:04:21 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request linux-user 20210916=0D
=0D
Code cleanup=0D
=0D
----------------------------------------------------------------=0D
=0D
Peter Maydell (10):=0D
  linux-user: Fix coding style nits in qemu.h=0D
  linux-user: Split strace prototypes into strace.h=0D
  linux-user: Split signal-related prototypes into signal-common.h=0D
  linux-user: Split loader-related prototypes into loader.h=0D
  linux-user: Split mmap prototypes into user-mmap.h=0D
  linux-user: Split safe-syscall macro into its own header=0D
  linux-user: Split linux-user internals out of qemu.h=0D
  linux-user: Don't include gdbstub.h in qemu.h=0D
  linux-user: Drop unneeded includes from qemu.h=0D
  linux-user: Check lock_user result for ip_mreq_source sockopts=0D
=0D
 gdbstub.c                        |   2 +-=0D
 linux-user/aarch64/cpu_loop.c    |   2 +=0D
 linux-user/aarch64/signal.c      |   1 +=0D
 linux-user/alpha/cpu_loop.c      |   2 +=0D
 linux-user/alpha/signal.c        |   1 +=0D
 linux-user/arm/cpu_loop.c        |   2 +=0D
 linux-user/arm/signal.c          |   1 +=0D
 linux-user/cris/cpu_loop.c       |   2 +=0D
 linux-user/cris/signal.c         |   1 +=0D
 linux-user/elfload.c             |   3 +=0D
 linux-user/exit.c                |   2 +=0D
 linux-user/fd-trans.c            |   2 +=0D
 linux-user/flatload.c            |   3 +=0D
 linux-user/hexagon/cpu_loop.c    |   2 +=0D
 linux-user/hexagon/signal.c      |   1 +=0D
 linux-user/hppa/cpu_loop.c       |   2 +=0D
 linux-user/hppa/signal.c         |   1 +=0D
 linux-user/i386/cpu_loop.c       |   3 +=0D
 linux-user/i386/signal.c         |   1 +=0D
 linux-user/linuxload.c           |   2 +=0D
 linux-user/loader.h              |  59 +++++=0D
 linux-user/m68k/cpu_loop.c       |   2 +=0D
 linux-user/m68k/signal.c         |   1 +=0D
 linux-user/main.c                |   5 +=0D
 linux-user/microblaze/cpu_loop.c |   2 +=0D
 linux-user/microblaze/signal.c   |   1 +=0D
 linux-user/mips/cpu_loop.c       |   2 +=0D
 linux-user/mips/signal.c         |   1 +=0D
 linux-user/mmap.c                |   2 +=0D
 linux-user/nios2/cpu_loop.c      |   2 +=0D
 linux-user/nios2/signal.c        |   1 +=0D
 linux-user/openrisc/cpu_loop.c   |   2 +=0D
 linux-user/openrisc/signal.c     |   1 +=0D
 linux-user/ppc/cpu_loop.c        |   2 +=0D
 linux-user/ppc/signal.c          |   1 +=0D
 linux-user/qemu.h                | 429 ++-----------------------------=0D
 linux-user/riscv/cpu_loop.c      |   2 +=0D
 linux-user/riscv/signal.c        |   1 +=0D
 linux-user/s390x/cpu_loop.c      |   2 +=0D
 linux-user/s390x/signal.c        |   1 +=0D
 linux-user/safe-syscall.h        | 154 +++++++++++=0D
 linux-user/semihost.c            |   1 +=0D
 linux-user/sh4/cpu_loop.c        |   2 +=0D
 linux-user/sh4/signal.c          |   1 +=0D
 linux-user/signal-common.h       |  36 +++=0D
 linux-user/signal.c              |   5 +=0D
 linux-user/sparc/cpu_loop.c      |   2 +=0D
 linux-user/sparc/signal.c        |   1 +=0D
 linux-user/strace.c              |   3 +=0D
 linux-user/strace.h              |  38 +++=0D
 linux-user/syscall.c             |   9 +=0D
 linux-user/uaccess.c             |   1 +=0D
 linux-user/uname.c               |   1 +=0D
 linux-user/user-internals.h      | 186 ++++++++++++++=0D
 linux-user/user-mmap.h           |  34 +++=0D
 linux-user/vm86.c                |   1 +=0D
 linux-user/xtensa/cpu_loop.c     |   2 +=0D
 linux-user/xtensa/signal.c       |   1 +=0D
 semihosting/arm-compat-semi.c    |   2 +-=0D
 target/m68k/m68k-semi.c          |   2 +-=0D
 target/nios2/nios2-semi.c        |   2 +-=0D
 thunk.c                          |   1 +=0D
 62 files changed, 623 insertions(+), 417 deletions(-)=0D
 create mode 100644 linux-user/loader.h=0D
 create mode 100644 linux-user/safe-syscall.h=0D
 create mode 100644 linux-user/strace.h=0D
 create mode 100644 linux-user/user-internals.h=0D
 create mode 100644 linux-user/user-mmap.h=0D
=0D
-- =0D
2.31.1=0D
=0D

