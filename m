Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A485BF0C1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:01:00 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamEd-0005b2-FF
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6H-00043Q-VC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:02 -0400
Received: from mout.gmx.net ([212.227.17.20]:48609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003I6-GL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695113;
 bh=hzt2zhvN8fnWwPfx0UlAy3x0xyJut3FN/OrEOB7FiIg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lAn5sJLPAFbNqbgvAKaFa7Cz436SqD5ZHootKEODu/of2q8YMtn0bImDycFAJbjOx
 wbAqhbGGtEL3ob7ufwZf4XWnLFgzVSO7VppALwIdZdR1Uj1IIlYTad87aY/XOQ0LED
 KowoK4fhbDcXEqBhAMMoR6seAsz4hNw5TY980J88=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1p9Tke0025-00ZenE; Tue, 20
 Sep 2022 19:31:53 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 00/12] Publish1 patches
Date: Tue, 20 Sep 2022 19:31:40 +0200
Message-Id: <20220920173152.199359-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ORB9GUvTrdqJyVSz5NN8KR6R7hNM9YncemqKsy+JHa7cMAlfLLD
 ovBrsDUzHDufoxbTH1IaugzGj0LtOr4Rbre9YK96NaCuTG99+l8StYoaaJ9eV0nkfbVSA+U
 YT6NDr6thz5sJWCDWPZvbUR2B+eyPMZVaJXNttZYC9ADDOclSvVca1jgiqTUjuUWbrx7WgY
 gycqS7AFgh3zq2gwyWTCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WwQ23ZULsLo=:gh2f8zaDfwnfWRuflgiBtf
 lQhVzTITWvDnDrdiX6ofNJk1Z6KGKomu0HUuK03pv3hk7cJgezK/EDD2KbqsPXpmjje1fwlgT
 r2WFRXj25KMnXiChOxk5wSryRGscJYVmHXXUBw3n3AGqKxS+YqUoDQyq/CWEjhNvUGxnlDkS+
 RsDPt0tdymGze04COAgQKskZoXROus+Tp0rXaErl3854wHefUrTiBd+gjHkFxV4ilk487I6vQ
 qyJFBroI81EZ7IdVgJgis+Zg8rSow+rcmDAFYysDNdTXSYlLEsKKudX9LlC9/O37j7MIgUokK
 uM5NfDdsOGECqI/qVfdyT/JCrlcgzYMiUSzPt/CAOF8UVw+72Px2kS01e04izKk6foxqQr3Ks
 I/VEw+D3IfLyY1bhGLob+JStGtpFQ0Mkk9Jx4nTUkKa+I8zejjA4WqGo8L420qTWTbNmO1Kno
 +ly0aQywAORfiHCMADAsWDvOZHaeW7mViSJBCyTJkHjnBrPp8CiOKElmE1MyGFPfu2h5GKkS0
 n5ayGkSDcceVBdZ+CaYNyPc+A/gby4TGcAvyANalNHP7VJBcAk73CZB7EDq9WbHGaXjPinE+9
 zYXyGITBFfxBqeHJ3MfcqnAQ+qOfT0OCgn+U1Bqww5J9D3E95UOzNga9lKbmcHkLXjE35xBg/
 5wIQG7BZ91T/UCJ3QnAIQFGAierE2JH8kQFJ05XJZiC0PIRRMPuHvpwWa30krxte1aigCJGWi
 Dw6c5n+odiWuyvrSZsF840QUaDYw9VBpWxG25guf0XdQKQzjAEtLcV9NhX6tIpeietSBdJF5J
 XAgkqsqyMrG35XE4HGzf1AoJBDq3H6eOMrcfMPP9qsGRDFkjIm0aMqnk0s4RS8ftNXdX9stjF
 7xNydlcSLT6a5SS+oX/qzy/3E8ADX4aCNE5Ka/nR3E+JIcg8WbJfvaVzbE8jTfmvy+Mot4RZh
 qEkNgHSVt8zVbGeq4dZ24cdxNb0q4y59i7t+AeKqriN4KXkYnUXjzLFcJzV4FxwB3rEY26b7F
 2LDs1YbXlfxkYhEgjv6vU/Unqg7yy8/tGGzj571cwPIFDdqB/avUorlZIaeNwWPQK8zzrVAIY
 +E0UFTOzhBaregS1eun1CVhA5Ze0odFXWW5FmQDf1UiR3lfgKoRm38U2BDp7iB/i7K8gpc6V0
 R5ZEiOuj1bKZC6Ny/eCjwgdsVh
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 621da7789083b80d6f1ff1c0fb499334007b4f5=
1:

  Update version for v7.1.0 release (2022-08-30 09:40:11 -0700)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/publish1-pull-request

for you to fetch changes up to 7f8674a61a908592bb4e8e698f5bef84d0eeb8cc:

  linux-user: Add parameters of getrandom() syscall for strace (2022-09-18=
 21:35:27 +0200)

=2D---------------------------------------------------------------
linux-user: Add more syscalls, enhance tracing & logging enhancements

Here is a bunch of patches for linux-user.

Most of them add missing syscalls and enhance the tracing/logging.
Some of the patches are target-hppa specific.
I've tested those on productive hppa debian buildd servers (running qemu-u=
ser).

Thanks!
Helge

Changes to v2:
- Fix build of close_range() and pidfd_*() patches on older Linux
  distributions (noticed by Stefan Hajnoczi)

Changes to v1:
- Dropped the faccessat2() syscall patch in favour of Richard's patch
- Various changes to the "missing signals in strace output" patch based on
  Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build =
when
  TARGET_SIGIOT does not exist
- Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
  unconditionally and turn into a switch statement - as suggested by Richa=
rd

=2D---------------------------------------------------------------

Helge Deller (12):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace
  linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
    syscalls
  linux-user: Log failing executable in EXCP_DUMP()
  linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
  linux-user/hppa: Dump IIR on register dump
  linux-user: Fix strace of chmod() if mode =3D=3D 0
  linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
  linux-user: Add strace for clock_nanosleep()
  linux-user: Show timespec on strace for futex()
  linux-user: Add close_range() syscall
  linux-user: Add parameters of getrandom() syscall for strace

 linux-user/cpu_loop-common.h |   2 +
 linux-user/hppa/cpu_loop.c   |   6 +-
 linux-user/mmap.c            |   4 +
 linux-user/signal-common.h   |  46 ++++++++++++
 linux-user/signal.c          |  37 +--------
 linux-user/strace.c          | 142 ++++++++++++++++++++++++++++++-----
 linux-user/strace.list       |  21 +++++-
 linux-user/syscall.c         |  50 ++++++++++++
 target/hppa/helper.c         |   6 +-
 9 files changed, 255 insertions(+), 59 deletions(-)

=2D-
2.37.3


