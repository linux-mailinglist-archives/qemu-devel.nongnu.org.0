Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552D4206D6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:53:14 +0200 (CEST)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXImf-0004oJ-G3
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeB-0003qW-VE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeA-0004h1-1N
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:27 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkW10-1nDUQj2B2M-00m4Ew; Mon, 04
 Oct 2021 09:44:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] Linux user for 6.2 patches
Date: Mon,  4 Oct 2021 09:43:55 +0200
Message-Id: <20211004074421.3141222-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ACEoZpXTXp69evQAtqT6UPPdCZWDURcK1NBKAkB6GeXKnKnclvy
 CVwfC3B6Hgxy7EWJBcX30XMlA1PSDiQVFLmiekKatliHweBQNwZeRIA5BGCaLREFvYPo3FW
 3SOt2EgB6LYvZPQYQDGVlCSAw+2xl9rAcIRXLoRROC8Y2DCQxFSvpHqGoYBH4nDP0MCla9A
 0FDrjJ8uu3Ay5PtTZOlBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VG3l4Cyzr8k=:FQcR4mIT8cGcXhJGEBU2Bs
 oUTsjAtCltsAYf/6pEiBqmxO8rTWM5RLNeS1VXD9nB9IL/TdU8AcU+Ku/sMLjMHwmrLcDWwle
 0GH13Enm9moApk2g9z8tNOqXpJbFlbsvh4ZlwbCZTGxRBBhq8fYZKdZPIRTdY4pMokXyQXkl+
 9GizLbzCrNX5Ytu0W/qtwNz0QhC/9QCsx5uUqea7m3Dwy8i+6awvaOyJZTR7MeZiZRziJB3Cp
 /LiWsjiE8m+EE34ZbDpFuqa7F/bZ6BN+hlFQq6ujqVdk6GPuNxNTLrIJ0f2+ZbDQrhOC1viyE
 W2DQ7MebIgwUL5EF8c4rc9QVGUkWTg53erTrxL/DnAOOnFkqSaWXZbJ8xfVdycIOZNLuGNdjI
 yBIqdtHctl865d0Bdw8IHkMVnnvsw1m/0yrxOQemwbTkjlLUYpuBB+ILiKPAbTiQaHDX7o8T/
 KrqUs02/GApGFUxq2WMAz1/SFmrcPd+rvBaM/QW/YZAagPgG7X/8OHTzHsqfh2Sk1deZ03RIZ
 ZRR6exgAl1I1V73rlnuak1FVNfSHPb13yniQbiVSVMxUBwakDnf89ODNgt4Gdgn/FnoEljnuX
 +RLppGy93OCLwJI9zTatekfnNxRtrK5cDPRBBpbU5pXN4OknaRmA5A8afkWgJA1V9DYQABXWz
 4GZTpycEL/FLRGVsOoYGMj2lFdysUY1vWA3ss/7zIcfszflhy0fRaXhh4RzQR5L4ofUgPIGii
 CtZaQKZVA8q/nb8m9nr4DRirj87Hu4mZWKYoeQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

The following changes since commit bb4aa8f59e18412cff0d69f14aee7abba153161a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
930' into staging (2021-09-30 21:16:54 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to efee71c8ca181d4f5b2211736b38a74a2a223375:=0D
=0D
  tests/tcg/multiarch: Re-enable signals test for most guests (2021-10-01 1=
2:03:48 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request linux-user 20211004=0D
=0D
Move signal trampolines to new page=0D
=0D
----------------------------------------------------------------=0D
=0D
Richard Henderson (26):=0D
  linux-user: Add infrastructure for a signal trampoline page=0D
  linux-user/aarch64: Implement setup_sigtramp=0D
  linux-user/arm: Drop v1 signal frames=0D
  linux-user/arm: Drop "_v2" from symbols in signal.c=0D
  linux-user/arm: Implement setup_sigtramp=0D
  linux-user/alpha: Implement setup_sigtramp=0D
  linux-user/cris: Implement setup_sigtramp=0D
  linux-user/hexagon: Implement setup_sigtramp=0D
  linux-user/hppa: Document non-use of setup_sigtramp=0D
  linux-user/i386: Implement setup_sigtramp=0D
  linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set=0D
  linux-user/m68k: Implement setup_sigtramp=0D
  linux-user/microblaze: Implement setup_sigtramp=0D
  linux-user/mips: Tidy install_sigtramp=0D
  linux-user/mips: Implement setup_sigtramp=0D
  linux-user/nios2: Document non-use of setup_sigtramp=0D
  linux-user/openrisc: Implement setup_sigtramp=0D
  linux-user/ppc: Simplify encode_trampoline=0D
  linux-user/ppc: Implement setup_sigtramp=0D
  linux-user/riscv: Implement setup_sigtramp=0D
  linux-user/s390x: Implement setup_sigtramp=0D
  linux-user/sh4: Implement setup_sigtramp=0D
  linux-user/sparc: Implement setup_sigtramp=0D
  linux-user/xtensa: Implement setup_sigtramp=0D
  linux-user: Remove default for TARGET_ARCH_HAS_SIGTRAMP_PAGE=0D
  tests/tcg/multiarch: Re-enable signals test for most guests=0D
=0D
 linux-user/aarch64/signal.c           |  34 +-=0D
 linux-user/aarch64/target_signal.h    |   2 +=0D
 linux-user/alpha/signal.c             |  34 +-=0D
 linux-user/alpha/target_signal.h      |   1 +=0D
 linux-user/arm/signal.c               | 472 ++++++++------------------=0D
 linux-user/arm/target_signal.h        |   2 +=0D
 linux-user/cris/signal.c              |  29 +-=0D
 linux-user/cris/target_signal.h       |   2 +=0D
 linux-user/elfload.c                  |  14 +=0D
 linux-user/hexagon/signal.c           |  19 +-=0D
 linux-user/hexagon/target_signal.h    |   2 +=0D
 linux-user/hppa/target_signal.h       |  14 +=0D
 linux-user/i386/signal.c              |  65 ++--=0D
 linux-user/i386/target_signal.h       |   2 +=0D
 linux-user/m68k/signal.c              |  47 ++-=0D
 linux-user/m68k/target_signal.h       |   2 +=0D
 linux-user/microblaze/signal.c        |  24 +-=0D
 linux-user/microblaze/target_signal.h |   2 +=0D
 linux-user/mips/signal.c              |  39 ++-=0D
 linux-user/mips/target_signal.h       |   1 +=0D
 linux-user/mips64/target_signal.h     |   2 +=0D
 linux-user/nios2/target_signal.h      |   3 +=0D
 linux-user/openrisc/signal.c          |  22 +-=0D
 linux-user/openrisc/target_signal.h   |   2 +=0D
 linux-user/ppc/signal.c               |  40 +--=0D
 linux-user/ppc/target_signal.h        |   2 +=0D
 linux-user/riscv/signal.c             |  22 +-=0D
 linux-user/riscv/target_signal.h      |   2 +=0D
 linux-user/s390x/signal.c             |  24 +-=0D
 linux-user/s390x/target_signal.h      |   2 +=0D
 linux-user/sh4/signal.c               |  40 ++-=0D
 linux-user/sh4/target_signal.h        |   2 +=0D
 linux-user/signal-common.h            |   6 +=0D
 linux-user/signal.c                   |   3 +=0D
 linux-user/sparc/signal.c             |  40 ++-=0D
 linux-user/sparc/target_signal.h      |   4 +=0D
 linux-user/x86_64/target_signal.h     |   3 +=0D
 linux-user/xtensa/signal.c            |  56 +--=0D
 linux-user/xtensa/target_signal.h     |   2 +=0D
 tests/tcg/hppa/Makefile.target        |   7 +=0D
 tests/tcg/i386/Makefile.target        |   3 -=0D
 tests/tcg/multiarch/Makefile.target   |   8 -=0D
 tests/tcg/sh4/Makefile.target         |   7 +=0D
 43 files changed, 559 insertions(+), 550 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

