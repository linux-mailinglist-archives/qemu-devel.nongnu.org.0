Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4F6B53E6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvj-0008Bg-2O; Fri, 10 Mar 2023 17:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakve-00089m-M8
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:34 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvc-0002yU-IU
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:34 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M2wbS-1pZeSq45PA-003OJb; Fri, 10
 Mar 2023 23:09:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/28] Linux user for 8.0 patches
Date: Fri, 10 Mar 2023 23:08:59 +0100
Message-Id: <20230310220927.326606-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8fftPF+BT/QnBRJmQR2K2ldh5k/QIj0VZUX1L1YKnHUJTFLQyQi
 kgEDzj7eNS8PacpYJZ0Wkeqa0ppiDIOHBG/8NlXTt3V6IzEDELW4KohpmLQpzGkKv9Zx9ik
 R0KRcfjZUY1DD8lXOgg2LzRjq3Plb3pKobVeV7MJYCCUwoUgAaQHTTivSuXmjraNh9Bv0G4
 F1XBLPSalhkoF5A8QMDhA==
UI-OutboundReport: notjunk:1;M01:P0:7Gvh7V9v6qI=;/7jBNBWzcrKvzezyaJSYYi1ugJj
 gvSwkccI/GJbTxq0zwrl0ByahyhlsS1DfdHTZ+4Xu+WAYOII0riigvvw3skJrBC0X6Hkh3C6l
 M+f4DPY08TaM3C/jc5KCIj2P9VIlmABgPj5Xk+SknbtzJAWU4L3Gl2vgbVHeRw+KY4Z1A2Gif
 oAkgtBVOh4Qpy0nYeNk7uHpXif6AGztAhCFsFdBPH7g5W0gUh6F55Cv/lKdpPJGdMt7sVYIB9
 mr25tquHbb0Z2qymVkjN1yWVTI1TDxdjXWXtrIVWh+W4hKSFQHhcpIqHIi6LR40pZyZSbFWZx
 7GpZk0vlHJWVn9Th/d3AC766l9UBQIUPAOYJKk6Srhd5d3Gz/EsxkGTlt4gtDv8/cj7xaVTnn
 JsAE1ze4v/KnbTZRWL2m5fPiYqDTYLb5k3dhO/B13r1XruiDYgHwPIaNCg4bKB6XqTNP4oTB3
 qbPAv1a4I0JhNYaYk/ujMK80d8YmF4X3bBrBpC9Cj90G2TSDS9BkhCNNS2GQ6OZltOuzl3oZP
 w8lBApf6A/7oaAUXnrOqob30xOn/Q+Uh5w6RLoPH3x7UEPGkpOuCQSsgQHiSVNswuEctvcVC2
 W02fm7hSUh9oPI46jDwV/2W9Vv4nQh/JPOdpgI0lMz0oocFxLw84CPY8e46CBice8DZK/35Bu
 +EgOuXcZNkAktqDl+jHu1zYrxjsBlDeU98mp9iIHwA==
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

for you to fetch changes up to 2732c739d846fc7a1972e984d71a3de0d3eef77b:

  linux-user: fix bug about incorrect base addresss of gdt on i386 and x86_64 (2023-03-10 20:50:11 +0100)

----------------------------------------------------------------
Pull request linux-user 20230308-v2

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
 linux-user/strace.c                  | 113 ++++++++++++++++-
 linux-user/strace.list               |   5 +-
 linux-user/syscall.c                 | 174 +++++++++++++++----------
 linux-user/syscall_defs.h            |   5 +
 target/sparc/cpu.h                   |   3 +-
 18 files changed, 520 insertions(+), 140 deletions(-)

-- 
2.39.2


