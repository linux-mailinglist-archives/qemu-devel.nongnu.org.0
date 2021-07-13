Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDB3C71E3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:09:23 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J6A-0005Z2-30
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifj-0008W0-9D
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:03 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifd-00063n-MZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:02 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MUGNZ-1ldHcn0MKp-00RHgo; Tue, 13
 Jul 2021 15:41:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Linux user for 6.1 patches
Date: Tue, 13 Jul 2021 15:41:40 +0200
Message-Id: <20210713134152.288423-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YQ/oVlBqnEVOmnCoIgGVPqGfNXnmA9KALEGuGf7+vSn7ZTm8ToJ
 hpMFP+wk8gPHp+BISuWD7WHzexIoirrB2/E/BYhCKZM81pXmMQZgO7dBG/zyHE2BmYx3b4/
 lLp98JndoN65+5qmRCTvfR496MI4CfDqPl1N/i7fT2lF3koD1jNXVy7oXUFLUqcoZO6RIrB
 X8S69rCwAsICQviW1uVuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0PDulTv+6eo=:MMOv/yKWaFr47V97d9d4sU
 kghm1AFVewjD7YXiCPkbu1tPRY3gxHDQIsDEHXff67GfO9tkUwLCELCtRdCH8+2sgIM5UIPtR
 xqrOhT3F6xk3/oHxAi1mCynOZ+RWrIv4ymnRRexC4xbUD0AadRDMJEyNyxDK1n3zZjtvy3e4o
 ZW17F0IvIh2CHPv2zQx+AOZ4g+6sIhIBzYEKRdtvVUVm7D8gpmLZd2kCNGaMlI16UEiuUEka8
 sFyP9x00D+V8og5oCLw4xY4JfUV3iYrTPljFMcpkZMOfkskCvyUSSqDNmKskz90X+0PWGXZzl
 kHdAhZPKummNF2lHeGDAhgp2VOVJoikyqAxqw03FbWXDrbUTYO5F5LnYgRGvQq+PP22O3gJWs
 tvEYJ/5mhHCnXxJ06HRulmZ60ExntmQ4iFsAt6DgUumj48VAY+UZCg8S+coDMju7PLom1YnrL
 g94PmRZW2fM11Pwo/NCc72U91Rnb/3E5TEb1H/XVBqdWCfHKbaEu+8u08E05w/HtpqeLTEpiO
 3IhuiEhqY0q9iXeeZl2i+ELB4z+fQpYeZMGxg/oHbBLuNA8z/ZE2cScsc+BSNWts2cmlENgyI
 Z4sJ0PfVTv7OqCIW86DBPL1PigO1ylfSlWSdSoFvqXCOwSwNtCXQ56J46pQvLG6TSs/+ADFE9
 n7FDSe43OBuys0lXZ9ZK7bDsrRzAfbSfF7D/gIdsfsswptoOIJrnD1eNXycHyOCbIqVcGbssJ
 8dVENTnXwQeKw628V01Q4YYEJ0+jejoWdAsQAcr2oegpv4NAbLOfTYRka6nLOMtmSjobQj//1
 /XtWXLiBTsm1/vp6aWPDCx1DaFcTMhRzmlZ38c4jkAzmtbyJ02v0wW7w/YXdr5e8IeqfCcI
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' =
into staging (2021-07-12 11:02:39 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request=0D
=0D
for you to fetch changes up to 2fa4ad3f9000c385f71237984fdd1eefe2a91900:=0D
=0D
  linux-user: update syscall.tbl to Linux v5.13 (2021-07-13 13:59:59 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
Linux-user pull request 20210713=0D
=0D
Update headers to linux v5.13=0D
cleanup errno target headers=0D
Fix race condition on fd translation table=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (3):=0D
  linux-user: update syscall_nr.h to Linux v5.13=0D
  linux-user, mips: update syscall-args-o32.c.inc to Linux v5.13=0D
  linux-user: update syscall.tbl to Linux v5.13=0D
=0D
Owen Anderson (1):=0D
  fd-trans: Fix race condition on reallocation of the translation table.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)=0D
  linux-user/sparc: Rename target_errno.h -> target_errno_defs.h=0D
  linux-user: Extract target errno to 'target_errno_defs.h'=0D
  linux-user/alpha: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/hppa: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/mips: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user: Simplify host <-> target errno conversion using macros=0D
  linux-user/syscall: Remove ERRNO_TABLE_SIZE check=0D
=0D
 linux-user/aarch64/syscall_nr.h               |   8 +-=0D
 linux-user/aarch64/target_errno_defs.h        |   7 +=0D
 linux-user/alpha/syscall.tbl                  |   7 +=0D
 linux-user/alpha/target_errno_defs.h          | 204 ++++++++++++++++=0D
 linux-user/alpha/target_syscall.h             | 194 ---------------=0D
 linux-user/arm/syscall.tbl                    |   7 +=0D
 linux-user/arm/target_errno_defs.h            |   7 +=0D
 linux-user/cris/target_errno_defs.h           |   7 +=0D
 linux-user/errnos.c.inc                       | 140 +++++++++++=0D
 linux-user/fd-trans.c                         |   1 +=0D
 linux-user/fd-trans.h                         |  55 ++++-=0D
 .../target_errno_defs.h}                      |   4 +-=0D
 linux-user/hexagon/syscall_nr.h               |  12 +-=0D
 linux-user/hexagon/target_errno_defs.h        |   7 +=0D
 linux-user/hppa/syscall.tbl                   |  31 ++-=0D
 linux-user/hppa/target_errno_defs.h           | 220 +++++++++++++++++=0D
 linux-user/hppa/target_syscall.h              | 210 -----------------=0D
 linux-user/i386/syscall_32.tbl                |  21 +-=0D
 linux-user/i386/target_errno_defs.h           |   7 +=0D
 linux-user/m68k/syscall.tbl                   |   7 +=0D
 linux-user/m68k/target_errno_defs.h           |   7 +=0D
 linux-user/main.c                             |   3 +=0D
 linux-user/microblaze/syscall.tbl             |   7 +=0D
 linux-user/microblaze/target_errno_defs.h     |   7 +=0D
 linux-user/mips/syscall-args-o32.c.inc        |   5 +-=0D
 linux-user/mips/syscall_o32.tbl               |  19 +-=0D
 linux-user/mips/target_errno_defs.h           | 221 ++++++++++++++++++=0D
 linux-user/mips/target_syscall.h              | 211 -----------------=0D
 linux-user/mips64/syscall_n32.tbl             |  19 +-=0D
 linux-user/mips64/syscall_n64.tbl             |   7 +=0D
 linux-user/mips64/target_errno_defs.h         |  10 +=0D
 linux-user/mips64/target_syscall.h            | 211 -----------------=0D
 linux-user/nios2/syscall_nr.h                 |   8 +-=0D
 linux-user/nios2/target_errno_defs.h          |   7 +=0D
 linux-user/openrisc/syscall_nr.h              |   8 +-=0D
 linux-user/openrisc/target_errno_defs.h       |   7 +=0D
 linux-user/ppc/syscall.tbl                    |  39 ++--=0D
 linux-user/ppc/target_errno_defs.h            |   7 +=0D
 linux-user/riscv/syscall32_nr.h               |   8 +-=0D
 linux-user/riscv/syscall64_nr.h               |   8 +-=0D
 linux-user/riscv/target_errno_defs.h          |   7 +=0D
 linux-user/s390x/syscall.tbl                  |  19 +-=0D
 linux-user/s390x/target_errno_defs.h          |   7 +=0D
 linux-user/safe-syscall.S                     |   2 +-=0D
 linux-user/sh4/syscall.tbl                    |   7 +=0D
 linux-user/sh4/target_errno_defs.h            |   7 +=0D
 linux-user/sparc/syscall.tbl                  |  19 +-=0D
 .../{target_errno.h =3D> target_errno_defs.h}   |  11 +-=0D
 linux-user/sparc/target_syscall.h             |   2 -=0D
 linux-user/syscall.c                          | 164 ++-----------=0D
 linux-user/syscall_defs.h                     |   2 +-=0D
 linux-user/x86_64/syscall_64.tbl              |  27 ++-=0D
 linux-user/x86_64/target_errno_defs.h         |   7 +=0D
 linux-user/xtensa/syscall.tbl                 |   7 +=0D
 linux-user/xtensa/target_errno_defs.h         |   7 +=0D
 scripts/update-mips-syscall-args.sh           |  13 +-=0D
 56 files changed, 1205 insertions(+), 1078 deletions(-)=0D
 create mode 100644 linux-user/aarch64/target_errno_defs.h=0D
 create mode 100644 linux-user/alpha/target_errno_defs.h=0D
 create mode 100644 linux-user/arm/target_errno_defs.h=0D
 create mode 100644 linux-user/cris/target_errno_defs.h=0D
 create mode 100644 linux-user/errnos.c.inc=0D
 rename linux-user/{errno_defs.h =3D> generic/target_errno_defs.h} (99%)=0D
 create mode 100644 linux-user/hexagon/target_errno_defs.h=0D
 create mode 100644 linux-user/hppa/target_errno_defs.h=0D
 create mode 100644 linux-user/i386/target_errno_defs.h=0D
 create mode 100644 linux-user/m68k/target_errno_defs.h=0D
 create mode 100644 linux-user/microblaze/target_errno_defs.h=0D
 create mode 100644 linux-user/mips/target_errno_defs.h=0D
 create mode 100644 linux-user/mips64/target_errno_defs.h=0D
 create mode 100644 linux-user/nios2/target_errno_defs.h=0D
 create mode 100644 linux-user/openrisc/target_errno_defs.h=0D
 create mode 100644 linux-user/ppc/target_errno_defs.h=0D
 create mode 100644 linux-user/riscv/target_errno_defs.h=0D
 create mode 100644 linux-user/s390x/target_errno_defs.h=0D
 create mode 100644 linux-user/sh4/target_errno_defs.h=0D
 rename linux-user/sparc/{target_errno.h =3D> target_errno_defs.h} (97%)=0D
 create mode 100644 linux-user/x86_64/target_errno_defs.h=0D
 create mode 100644 linux-user/xtensa/target_errno_defs.h=0D
=0D
-- =0D
2.31.1=0D
=0D

