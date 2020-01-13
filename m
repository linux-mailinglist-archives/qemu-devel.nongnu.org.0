Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A0139AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:38:33 +0100 (CET)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6TT-0003Ze-O8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RP-0001VP-TE
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RO-0004a7-7P
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:03 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:41925 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6RN-0003T3-SB
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:02 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 70CB81A1F9E;
 Mon, 13 Jan 2020 21:34:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4D71C1A1E5E;
 Mon, 13 Jan 2020 21:34:56 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/20] linux-user: Misc patches for 5.0 
Date: Mon, 13 Jan 2020 21:34:23 +0100
Message-Id: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series is a collection of linux-user patches I recently
accumulated.

The summary of the patches is as follows:

Patch 1: Fix for some issues in termbits.h files.
Patches 2-7: Updating syscall numbers
Patch 8: A minor xtensa cleanup
Patches 9-14: Adding support for some filesystem-related ioctls
Patches 15-17: Adding support for some floppy-drive-related ioctls
Patches 18-20: Adding support for kcov-related ioctls

History of the series:

v4->v5:

  - fixed some minor issues in commit messages
  - added syscall number update for alpha

v3->v4:

  - added support for three filesystem-related ioctls
  - added syscall number update for m68k, microblaze, x86_64 and xtensa
  - fixed some issues related to unused ranges of syscall numbers for
    mips o32
  - several minor corrections

v2->v3:

  - added support for seven floppy-drive-related ioctls
  - added support for three kcov-related ioctls

v1->v2:

  - fixed a constant in xtensa's termbits.h that was missed in v1
  - redid syscall numbers for mips o32
  - minor formatting and wording changes

Aleksandar Markovic (20):
  linux-user: Fix some constants in termbits.h
  linux-user: alpha: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: m68k: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: microblaze: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: mips: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: x86_64: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: xtensa: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: xtensa: Remove unused constant TARGET_NR_syscall_count
  linux-user: Add support for FS_IOC_<GET|SET>VERSION ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>FLAGS ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>VERSION ioctls
  linux-user: Add support for FS_IOC_FS<GET|SET>XATTR ioctls
  linux-user: Add support for FITRIM ioctl
  linux-user: Add support for FIFREEZE and FITHAW ioctls
  linux-user: Add support for FD<SETEMSGTRESH|SETMAXERRS|GETMAXERRS>
    ioctls
  linux-user: Add support for FDFMT<BEG|TRK|END> ioctls
  linux-user: Add support for FDGETFDCSTAT ioctl
  configure: Detect kcov support and introduce CONFIG_KCOV
  linux-user: Add support for KCOV_<ENABLE|DISABLE> ioctls
  linux-user: Add support for KCOV_INIT_TRACE ioctl

 configure                          |  21 +++++
 linux-user/aarch64/termbits.h      |   4 +-
 linux-user/alpha/syscall_nr.h      |  35 +++++++++
 linux-user/alpha/termbits.h        |  10 +--
 linux-user/arm/termbits.h          |   4 +-
 linux-user/cris/termbits.h         |   4 +-
 linux-user/hppa/termbits.h         |   4 +-
 linux-user/i386/termbits.h         |   4 +-
 linux-user/ioctls.h                |  36 +++++++++
 linux-user/m68k/syscall_nr.h       |  50 +++++++++++-
 linux-user/m68k/termbits.h         |   4 +-
 linux-user/microblaze/syscall_nr.h |  45 +++++++++++
 linux-user/microblaze/termbits.h   |   4 +-
 linux-user/mips/cpu_loop.c         |  78 ++++++++++++++++++-
 linux-user/mips/syscall_nr.h       |  45 +++++++++++
 linux-user/mips/termbits.h         |   4 +-
 linux-user/mips64/syscall_nr.h     |  13 ++++
 linux-user/nios2/termbits.h        |   4 +-
 linux-user/openrisc/termbits.h     |   6 +-
 linux-user/ppc/termbits.h          |   4 +-
 linux-user/riscv/termbits.h        |   4 +-
 linux-user/s390x/termbits.h        |  26 ++++---
 linux-user/sh4/termbits.h          |   4 +-
 linux-user/sparc/termbits.h        |   4 +-
 linux-user/sparc64/termbits.h      |   4 +-
 linux-user/syscall.c               |   3 +
 linux-user/syscall_defs.h          |  46 ++++++++++-
 linux-user/syscall_types.h         |  24 ++++++
 linux-user/x86_64/syscall_nr.h     |  24 ++++++
 linux-user/x86_64/termbits.h       |   6 +-
 linux-user/xtensa/syscall_nr.h     |  36 ++++++++-
 linux-user/xtensa/termbits.h       | 156 +++++++++++++++++++++----------------
 32 files changed, 590 insertions(+), 126 deletions(-)

-- 
2.7.4


