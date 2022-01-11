Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7848B7A9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:55:17 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NEi-000251-RQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCO-0007hN-Qw
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:52 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:34043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCM-0008DR-PS
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:52 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Ml72g-1mdW6W17RE-00lV5t; Tue, 11
 Jan 2022 20:52:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Linux user for 7.0 patches
Date: Tue, 11 Jan 2022 20:52:17 +0100
Message-Id: <20220111195247.1737641-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YApGnTMpNfqPOETog8EdRsqPGV24UVkMXYzto3w80kbMHEyFmmR
 acrhDl7wIUp+NaPapdkFjdOEw0435CudjAy6VOkPbCWG5Sn8hFrmaQO+tlvUt6YyYcOdXjE
 MqVK/SUzFFsePM36pzklimR+P21O0/D+D6r619UdhQFZU6o/FAzkEzzdwXkXQMechfoMcVE
 nPgMioK0vi+V7x5xHXepA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H4WTv6Cco8c=:bPcA4sgzBzV2IlJ0MhDTec
 xFPx/Gon5hg0SnE6nQUAEk8CLQ1m5itPN7ss63bkCxrcJr79JyiJ55ZbqJzzxzOBXatZzKOS4
 npbmIprszqj68hUhSwmT15Yq1HlRhjKPzYwSc+NLL7RjyQoMKM93Wu3kXUAcFLqNRM1+YWavl
 Myeeu9gSWbZusAEKH3YJV8FiXEJTBhu2uxShbuYniQB3rGrGlasuYzXGZa3/Xs9gxuRlVr8JO
 HUj/gGyah6/pOnkd8E2StCEWI5QMdosJBCbB+isIRh6oR0K4v8mbFFkc94ZA82VpHbBVh8h3P
 vyCNikib97x5V6Qww0bLZ9pJdudgw0OfrIK3zMqX7tv9HZlajhpL571j+MFvvRqyTmC3TEqJF
 lBGG75bGiWcO1nfam4VcUuRV42gIiTef46gwlJzZ6n53spYsfP9BgkUw/VCCwJ1BKGP3N2csO
 Qv6jYZI6MSdcnFXSlyw7WjjkcSBm7PodRH/OCzKy1I2dcA9aTgTkyhec7Z6zm3kydtNLYqGFJ
 tdEWsIWBaVGzyE/IWW6DifKSLU05L7wfRtruIXRlhfx06xGm2yhcMHS9g4BU7p7vWOQ31kqJX
 qK5/esvDSmowDZpz0NXsWkyPg0hoY26BladYXDATfk5YifdBC8AfzkkG40NvZBrYsqRgqm5Ma
 qt+qW7CdDrBnqkMkIZ7lUXCkvLCHQz1A+ZlE+dp+x6XkKxliRH01ugkBMtOzjGU416dU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 64c01c7da449bcafc614b27ecf1325bb08031c84=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' into st=
aging (2022-01-11 11:39:31 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-r=
equest=0D
=0D
for you to fetch changes up to 4f4e5567f856d9b841494b3b5216a37d2952ee54:=0D
=0D
  linux-user: Implement capability prctls (2022-01-11 18:40:44 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20220111=0D
siginfo_t cleanup=0D
more prtctl() update=0D
target_struct.h cleanup=0D
=0D
----------------------------------------------------------------=0D
=0D
Richard Henderson (30):=0D
  linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap=0D
  linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND=0D
  linux-user/alpha: Use force_sig_fault=0D
  linux-user/cris: Use force_sig_fault=0D
  linux-user/hppa: Use force_sig_fault=0D
  linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,=0D
    OVERFLOW=0D
  linux-user: Remove TARGET_NSIGFPE=0D
  linux-user/hppa: Set FPE_CONDTRAP for COND=0D
  linux-user/i386: Split out maybe_handle_vm86_trap=0D
  linux-user/i386: Use force_sig, force_sig_fault=0D
  linux-user/m68k: Use force_sig_fault=0D
  linux-user/microblaze: Use force_sig_fault=0D
  linux-user/microblaze: Fix SIGFPE si_codes=0D
  linux-user/mips: Improve do_break=0D
  linux-user/mips: Use force_sig_fault=0D
  target/mips: Extract break code into env->error_code=0D
  target/mips: Extract trap code into env->error_code=0D
  linux-user/openrisc: Use force_sig_fault=0D
  linux-user/ppc: Use force_sig_fault=0D
  linux-user/riscv: Use force_sig_fault=0D
  linux-user/s390x: Use force_sig_fault=0D
  linux-user/sh4: Use force_sig_fault=0D
  linux-user/sparc: Use force_sig_fault=0D
  linux-user/xtensa: Use force_sig_fault=0D
  linux-user/arm: Move target_oabi_flock64 out of target_structs.h=0D
  linux-user: Move target_struct.h generic definitions to generic/=0D
  linux-user: Do not special-case NULL for PR_GET_PDEATHSIG=0D
  linux-user: Map signal number in PR_GET_PDEATHSIG=0D
  linux-user: Implement PR_SET_PDEATHSIG=0D
  linux-user: Implement capability prctls=0D
=0D
 linux-user/aarch64/target_structs.h       |  59 +-------=0D
 linux-user/alpha/cpu_loop.c               |  61 +++-----=0D
 linux-user/arm/target_structs.h           |  60 +-------=0D
 linux-user/cris/cpu_loop.c                |  12 +-=0D
 linux-user/cris/target_structs.h          |  59 +-------=0D
 linux-user/generic/target_structs.h       |  58 ++++++++=0D
 linux-user/hexagon/target_structs.h       |  55 +------=0D
 linux-user/hppa/cpu_loop.c                |  26 ++--=0D
 linux-user/i386/cpu_loop.c                |  78 +++++-----=0D
 linux-user/i386/target_structs.h          |  59 +-------=0D
 linux-user/m68k/cpu_loop.c                |  24 +---=0D
 linux-user/m68k/target_structs.h          |  59 +-------=0D
 linux-user/microblaze/cpu_loop.c          |  71 +++++----=0D
 linux-user/microblaze/target_structs.h    |  59 +-------=0D
 linux-user/mips/cpu_loop.c                | 166 +++++-----------------=0D
 linux-user/nios2/target_structs.h         |  59 +-------=0D
 linux-user/openrisc/cpu_loop.c            |  18 +--=0D
 linux-user/openrisc/target_structs.h      |  59 +-------=0D
 linux-user/ppc/cpu_loop.c                 | 136 ++++--------------=0D
 linux-user/riscv/cpu_loop.c               |  31 +---=0D
 linux-user/riscv/target_structs.h         |  47 +-----=0D
 linux-user/s390x/cpu_loop.c               |   7 +-=0D
 linux-user/sh4/cpu_loop.c                 |   6 +-=0D
 linux-user/sh4/target_structs.h           |  59 +-------=0D
 linux-user/sparc/cpu_loop.c               |  14 +-=0D
 linux-user/syscall.c                      |  19 ++-=0D
 linux-user/syscall_defs.h                 |   3 +-=0D
 linux-user/x86_64/target_structs.h        |  36 +----=0D
 linux-user/xtensa/cpu_loop.c              |  26 ++--=0D
 target/mips/tcg/micromips_translate.c.inc |  10 +-=0D
 target/mips/tcg/mips16e_translate.c.inc   |   2 +-=0D
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-=0D
 target/mips/tcg/translate.c               |  36 ++++-=0D
 target/mips/tcg/translate.h               |   1 +=0D
 34 files changed, 318 insertions(+), 1161 deletions(-)=0D
 create mode 100644 linux-user/generic/target_structs.h=0D
=0D
-- =0D
2.33.1=0D
=0D

