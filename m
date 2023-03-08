Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC386B0948
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtqu-0001cC-QC; Wed, 08 Mar 2023 08:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqs-0001b6-9c
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:06 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqp-000639-DC
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:06 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWSJJ-1q3R5y0J4t-00XtHT; Wed, 08
 Mar 2023 14:29:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/28] Linux user for 8.0 patches
Date: Wed,  8 Mar 2023 14:28:29 +0100
Message-Id: <20230308132857.161793-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:10xt9WhlQwZeWqncuWSUuGc5MS5PfGSQbRCWO8fOYuHz2jyqSV3
 00EwYXGaixWk8fRdFsJscbtCMMvtK8HdadXUdrhFc3kYSnCkACk+2RdXjth54q42ybHj1XG
 GxDdeUUcDsfKMtkwh1ny7/XFE7p+bMZqaM/FVizfmX6Y8/VCAkIuSNAV2+9gI766H+ckSgW
 tAm8zH8WvQ1tS+9kA9uFg==
UI-OutboundReport: notjunk:1;M01:P0:0og9ihzCf9A=;UZNEjlc0nGGUOBvQhnQn5Jgjdmb
 S0qq+emeTLqarzfRw6Fgon6/qpB9fQDgUeP0/D5vwH97MVU+owYL6YeIrCgievoCsnuXuiyIG
 95GiFasy09b7LZqWhA9U9k401cjP8ycyX4w/GzfJ4KL8JysCd0EIGI6ZVp5IxZpyAolo95nAb
 UEY5kahtOI6sJxqUL+vswpIkcFVa3cklb2h3qjLftcEFP30eG9OWKb5564U6JAA0m1NlAecnB
 ZgiinsJ8HejqvjdQWhxy1kE674ZW/ZkTv3vSpimgMGjhLEO8Kdc8Nx6BV434kF+DCgdky82Kk
 JZKlz6C4rCZtHfKk5Utya39dDhJX2kAhNM++4fEmWHcjHQUlkJ+D9Bwu66h/+OOUp/BekwOYl
 qncOgwJuIwhfJ/X9v0OflINNwufTLAIGNANZNQaw3OHXgAgFi3ny6NKvxHRxCeQpgbe3URKwe
 3K9qJRXnhgFxdwCpr4yv44nuHf504qI3nxYxiQPaddvRYU+jJrlEQX6URTwkuclPAhEvlQo1r
 HNfF/s1WP1lm5RdVbaoSFpV4uFcWJEY9zZZP0Usp8Twtyus3uD3J0R3OH9TPiemo3tliPOI0H
 NQwbgGKWVWTtdru+fVyLqGBbBI55pxtHaA4d61UzqTPs8hc3fP440qEmJZ9/g2X4M6mF/xv1g
 bezNa0USK7h7if77Pf+l5Jwkkgp3G6+DdJnDbPFYiw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:

  Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-8.0-pull-request

for you to fetch changes up to 6d0df648e2671ddb354eb3c545780b64472770f4:

  linux-user: fix bug about incorrect base addresss of gdt on i386 and x86_64 (2023-03-07 19:43:28 +0100)

----------------------------------------------------------------
Pull request linux-user 20230308

Fix gdt on i386/x86_64
Handle traps on sparc
Add translation for argument of msync
Emulate CLONE_PIDFD flag in clone
handle netlink flag NLA_F_NESTED
fix sockaddr_in6 endianness
Fix brk() to release pages
fill out task state in /proc/self/stat
add support for xtensa FDPIC
Fix unaligned memory access in prlimit64 syscall
add target to host netlink conversions
fix timerfd read endianness conversion
Fix access to /proc/self/exe
Add strace for prlimit64() syscall

----------------------------------------------------------------

Andreas Schwab (1):
  linux-user: fill out task state in /proc/self/stat

Helge Deller (6):
  linux-user: Fix access to /proc/self/exe
  linux-user: Fix brk() to release pages
  linux-user: Provide print_raw_param64() for 64-bit values
  linux-user: Add strace for prlimit64() syscall
  linux-user: Add translation for argument of msync()
  linux-user: Emulate CLONE_PIDFD flag in clone()

Ilya Leoshkevich (1):
  linux-user: Fix unaligned memory access in prlimit64 syscall

Mathis Marion (4):
  linux-user: fix timerfd read endianness conversion
  linux-user: add target to host netlink conversions
  linux-user: fix sockaddr_in6 endianness
  linux-user: handle netlink flag NLA_F_NESTED

Max Filippov (1):
  linux-user: add support for xtensa FDPIC

Richard Henderson (14):
  linux-user/sparc: Tidy syscall trap
  linux-user/sparc: Tidy syscall error return
  linux-user/sparc: Use TT_TRAP for flush windows
  linux-user/sparc: Tidy window spill/fill traps
  linux-user/sparc: Fix sparc64_{get, set}_context traps
  linux-user/sparc: Handle software breakpoint trap
  linux-user/sparc: Handle division by zero traps
  linux-user/sparc: Handle getcc, setcc, getpsr traps
  linux-user/sparc: Handle priviledged opcode trap
  linux-user/sparc: Handle privilidged action trap
  linux-user/sparc: Handle coprocessor disabled trap
  linux-user/sparc: Handle unimplemented flush trap
  linux-user/sparc: Handle floating-point exceptions
  linux-user/sparc: Handle tag overflow traps

fanwj@mail.ustc.edu.cn (1):
  linux-user: fix bug about incorrect base addresss of gdt on i386 and
    x86_64

 include/elf.h                        |   1 +
 linux-user/alpha/target_mman.h       |   4 +
 linux-user/elfload.c                 |  16 ++-
 linux-user/fd-trans.c                |  74 ++++++++++-
 linux-user/fd-trans.h                |   1 +
 linux-user/generic/target_mman.h     |  13 ++
 linux-user/generic/target_resource.h |   4 +-
 linux-user/hppa/target_mman.h        |   4 +
 linux-user/i386/cpu_loop.c           |   9 ++
 linux-user/main.c                    |  14 +++
 linux-user/sparc/cpu_loop.c          | 182 +++++++++++++++++++++------
 linux-user/sparc/signal.c            |  36 +++---
 linux-user/sparc/target_signal.h     |   2 +-
 linux-user/strace.c                  | 109 +++++++++++++++-
 linux-user/strace.list               |   5 +-
 linux-user/syscall.c                 | 166 ++++++++++++++----------
 linux-user/syscall_defs.h            |   5 +
 target/sparc/cpu.h                   |   3 +-
 18 files changed, 508 insertions(+), 140 deletions(-)

-- 
2.39.2


