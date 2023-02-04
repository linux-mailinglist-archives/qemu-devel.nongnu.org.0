Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9768AB1E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5o-00059o-U0; Sat, 04 Feb 2023 11:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5l-00054p-6i
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5i-0006uC-0K
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:39 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MOzjW-1oz8k216Dc-00PL9t; Sat, 04
 Feb 2023 17:08:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/22] Linux user for 8.0 patches
Date: Sat,  4 Feb 2023 17:08:08 +0100
Message-Id: <20230204160830.193093-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NqgA/+LglT0mVRzkUeIbeZ55D+RjFs1R04w2eopdiAdzOhWlF6m
 mB3JkAcfbAZdoOAo06nkWaJRZ+g4mTZNbhdwLeJUslukxv78OczbpngtCREuLbgIzs34Now
 z+DAMQZi4Xiu2c6UMV5524hUtK8czFFfzeVgwx4pD2XkxVKlduQFNiwXgafybDL+RiO+H1p
 67jKq1NuXWW1q/2a6tKew==
UI-OutboundReport: notjunk:1;M01:P0:umdSOJcwMQU=;vhT+ca4BlF1szlcDjBZx/6V7wqX
 A8ItMXK6HBIGLjJAuKd+w09tfkiWcrEB0zJFlC+GgFr2D+Phe3a0m2CUevxRzadA1IsNjUZgi
 5up+jcqFci/PrtI0Lm7TwsXtDD0lnK0HF+uDbIqu8sD3sDMRund7o0OzvzhH3tftzzl7L6XUR
 iPDEq9hOOb11i5EHH0jHGYWukJ1ec/q87PRGM9yA3g2Fa7mkiROctzU+FHHJZRsac20xi3gAH
 OwzLTHZtjiFhUTF7CAZu/gVIoqB1jiFt5BhDQODBC8PYr45Fr36EOynvKsXqJFsIOXIcQ7rDP
 uuGVRrYkHA3se6/mBvWuzeW6d8rvH1F30hltgJPR7jLspBEAUaTvU8GD6KgNve+Ywx57J3142
 ZCtekAgEZVVHBtlrlf+nEuH4tvAxy29xbJ6lglleeACWl1nBtc3vkDjb3UsTRT44b2U+SNqnN
 J8PXFqLczQ5nzyX6mcMOG2yvLsxngSi/Ddcs/XmyPVRqHIuAISPy66d0HxQD3M1NlKX5MYu42
 ZivSTcS6QANOC+2fsuhEFLnzPPu9kdTrh4ddLrH/NPSQpEwpmUg+MpBJsrvHqF9cS+GdUROJz
 VplYGXUfgCw4VgOWWX6FLRqHpLI0l+8dJJnHRSWtd+Ne2oysI+gFaXRzM9HtMz+iC9WDt1nC9
 snC4njniDJgnJ/jVaX44PGfb5FeoKM3pHPprNm7H2A==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-8.0-pull-request

for you to fetch changes up to 3f0744f98b07c6fd2ce9d5840726d0915b2ae7c1:

  linux-user: Allow sendmsg() without IOV (2023-02-03 22:55:12 +0100)

----------------------------------------------------------------
linux-user branch pull request 20230204

Implement execveat()
un-parent OBJECT(cpu) when closing thread
Revert fix for glibc >= 2.36 sys/mount.h
Fix/update strace
move target_flat.h to target subdirs
Fix SO_ERROR return code of getsockopt()
Fix /proc/cpuinfo output for hppa
Add emulation for MADV_WIPEONFORK and MADV_KEEPONFORK in madvise()
Implement SOL_ALG encryption support
linux-user: Allow sendmsg() without IOV

----------------------------------------------------------------

Daniel P. Berrangé (2):
  Revert "linux-user: add more compat ioctl definitions"
  Revert "linux-user: fix compat with glibc >= 2.36 sys/mount.h"

Drew DeVault (4):
  linux-user/strace: Extract print_execve_argv() from print_execve()
  linux-user/strace: Add output for execveat() syscall
  linux-user/syscall: Extract do_execve() from do_syscall1()
  linux-user/syscall: Implement execveat()

Helge Deller (11):
  linux-user: Add missing MAP_HUGETLB and MAP_STACK flags in strace
  linux-user: Add strace output for clock_getres_time64() and
    futex_time64()
  linux-user: Improve strace output of getgroups() and setgroups()
  linux-user: Fix SO_ERROR return code of getsockopt()
  linux-user: Fix /proc/cpuinfo output for hppa
  linux-user: Improve strace output of personality() and sysinfo()
  linux-user: Add emulation for MADV_WIPEONFORK and MADV_KEEPONFORK in
    madvise()
  linux-user: Show 4th argument of rt_sigprocmask() in strace
  linux-user: Enhance strace output for various syscalls
  linux-user: Implement SOL_ALG encryption support
  linux-user: Allow sendmsg() without IOV

Letu Ren (1):
  linux-user: add more netlink protocol constants

Mike Frysinger (2):
  linux-user: fix strace build w/out munlockall
  linux-user: move target_flat.h to target subdirs

Philippe Mathieu-Daudé (1):
  linux-user/strace: Constify struct flags

Richard Henderson (1):
  linux-user: un-parent OBJECT(cpu) when closing thread

 linux-user/aarch64/target_flat.h       |   1 +
 linux-user/arm/target_flat.h           |   1 +
 linux-user/{ => generic}/target_flat.h |   0
 linux-user/m68k/target_flat.h          |   1 +
 linux-user/microblaze/target_flat.h    |   1 +
 linux-user/mmap.c                      |  56 +++--
 linux-user/sh4/target_flat.h           |   1 +
 linux-user/strace.c                    | 189 ++++++++++-----
 linux-user/strace.list                 |  64 ++---
 linux-user/syscall.c                   | 312 +++++++++++++------------
 meson.build                            |   2 -
 11 files changed, 378 insertions(+), 250 deletions(-)
 create mode 100644 linux-user/aarch64/target_flat.h
 create mode 100644 linux-user/arm/target_flat.h
 rename linux-user/{ => generic}/target_flat.h (100%)
 create mode 100644 linux-user/m68k/target_flat.h
 create mode 100644 linux-user/microblaze/target_flat.h
 create mode 100644 linux-user/sh4/target_flat.h

-- 
2.39.1


