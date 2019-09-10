Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6CAEFE5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 18:48:45 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7jJr-0000LV-LH
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 12:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7j7t-0004ZN-FP
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7j7s-00023V-A3
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:36:21 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33503)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i7j7s-00022P-15
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:36:20 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3UlW-1i7B9p1GiY-000fJH; Tue, 10 Sep 2019 18:36:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 18:35:45 +0200
Message-Id: <20190910163600.19971-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w68c7TCAGMBgj66/OgsHBcrJQm0tigPSKk1Uxugi5UZF0oQsmM6
 dtKt4EYbtSFquPzeMdPPQ4SZljtDCJGL04qHVI4GW+5W+Ij5832JfyGHN4WPt6uX6zqxS4+
 pY4+1krbhPURobo3LRohDAlE7L2gsfwbs+2zQaBt/CmQ4F0l+rKkgaj+rAGG2bGNFFdjPYF
 PyxWCSXRyzhOuSRGqfmGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RbkYoJvXPig=:YsiTZTDuJnIVq/qS5ah82Y
 nfzGcaV4ILZo0fn1R703mBEIqK9xyWC52PAk2mdn+sfe2s+o97uoHDkogciDxIzJ8c+lZmAQH
 WOVr/JTqWt35cIxw0MA3TFnq1CNvfnLEyDbXybq0gAZK1xhlx/z7FZFivESk6xwY0PN2kLKnN
 Q1g1M6YSkg1FBPtFMPG1d5zrPF7tXKgncpqb4KsnscFtrYjWGyqbAIUezBYLY9bDBUxW/+coo
 Vzdn3aBb464Jt+h1ahGC7OyfGwTlJXPJK8K3BKHCPcIBkh+6YZCHCs2cI7Ga1vcrkSKO7sRhl
 ydYnUyID0tDHGB5O0Tx8MkyqbWQSGeX3OupFk8xDodBYoQ4vZsyyKFJNUjQ7bEXOW6gBj+S+C
 mHY0sVbtarZaDjc5yu0GxnYWNOaP+qpQMzMQCgp9J+pD9DIq4vL6ULenI3qazJIn7S8ZN6/rN
 CZjqmQLc5IXkw4aitV6B5MyI0CYn/H1FwRyUgyJqSYWD4q8PgQt7Ftjg2lu0cFLhm6+FGZDJT
 X9A0cXny8cG2K74RMJjZKJQ+stXmKyqSPP7+y2I1h0IEl3ug1cfspF9MyYIm33DTJG1OpmBSa
 9wa/tplvlg9T9mzknciZ2IvICKx30Ydter0byyxnzgLgEpIgK/IqVRA2A/kzv/dbNELEpdd2a
 fvWBAaDLtO0eqmUf8WO/RcGo6ofuZmTqk/IyOFdZ/YNvhM0XPDJVF0j12OVI7WaZGejX69TKs
 qEfyMKGHMNu2pRYyJvfN8nJsx8JM2bHvv+J5gd++jC54AYhFMbkHwtP9IqTUaxykgqRXLioKQ
 2MHtWYqb8Qe/SwhqzIlPYgmw4F6Tz1HalJoRTXIeJxDSCsXr1I=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-devel] [PULL 00/15] Linux user for 4.2 patches
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 89ea03a7dc83ca36b670ba7f787802791fcb04b1:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/m68k-pull-2019-09-07' into staging (2019-09-09 09:48:34 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/linux-user-for-4.2-pull-request

for you to fetch changes up to a11ac305687965b0b556b3703c376b4127413a40:

  linux-user: Add support for FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT ioctls (2019-09-10 10:53:12 +0200)

----------------------------------------------------------------
Add several floppy drive ioctl,
xtensa call0 ABI support, arm MAX_RESERVED_VA for M-profile,
aarch64 AT_HWCAP2, qOffsets' query for ELF, memfd_create,
and some code cleanup

----------------------------------------------------------------

Aleksandar Markovic (4):
  linux-user: Add support for RNDRESEEDCRNG ioctl
  linux-user: Add support for FIOGETOWN and FIOSETOWN ioctls
  linux-user: Add support for FDMSGON and FDMSGOFF ioctls
  linux-user: Add support for FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT
    ioctls

Alex Bennée (1):
  linux-user: fail and report on bad dfilter specs

Josh Kunz via Qemu-devel (1):
  linux-user: Support gdb 'qOffsets' query for ELF

Laurent Vivier (1):
  linux-user: remove useless variable

Max Filippov (2):
  target/xtensa: linux-user: add call0 ABI support
  linux-user: drop redundant handling of environment variables

Richard Henderson (3):
  linux-user: Add AT_HWCAP2 for aarch64-linux-user
  linux-user: Pass CPUState to MAX_RESERVED_VA
  linux-user/arm: Adjust MAX_RESERVED_VA for M-profile

Shu-Chun Weng via Qemu-devel (2):
  linux-user: erroneous fd_trans_unregister call
  linux-user: add memfd_create

YunQiang Su (1):
  linux-user: Add support for FDFLUSH ioctl

 include/qemu/memfd.h        |  4 +++
 linux-user/arm/target_cpu.h | 24 +++++++++++--
 linux-user/elfload.c        | 33 +++++++++++++++---
 linux-user/ioctls.h         | 13 +++++++
 linux-user/main.c           | 69 +++++++++++++++++++++----------------
 linux-user/syscall.c        | 14 +++++++-
 linux-user/syscall_defs.h   | 15 ++++++++
 linux-user/xtensa/signal.c  | 25 +++++++++-----
 target/xtensa/cpu.c         | 24 ++++++++++---
 target/xtensa/cpu.h         |  3 ++
 util/memfd.c                |  2 +-
 11 files changed, 175 insertions(+), 51 deletions(-)

-- 
2.21.0


