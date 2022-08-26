Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAE5A29D2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:43:37 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaYV-0007lw-45
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAn-0000c2-D7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
Received: from mout.gmx.net ([212.227.15.18]:57075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00054o-FA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=M3zLRWInHuOX6qygOEfafUWlm2tS6p+vALenBKGwvY8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Are4WISxekCHA/A+D1cHELxSD07nSTtv3PT7WTk0rU+IdKC/MkFaFG1FjUD1i8JRf
 M5yMWMtIsIO1bPngeVRTlI9CYiEjOIGy9OFCHKZURg57oUQjjGV0ETCjVsFzSDtEAY
 S+qWFmoSk9aJZu3IpG6/i7szMZRhY1B/qrmzPwPc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1oRaAg0ZQe-00022U; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 00/13] linux-user: Add more syscalls,
 enhance tracing & logging enhancements
Date: Fri, 26 Aug 2022 16:18:40 +0200
Message-Id: <20220826141853.419564-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KCuT2MoWcLlQm7fH/H/826fotXV68Wl7v3xUjwZY5a1QI85UTfu
 TZyqSgqnxIXt3hR77eJ/Nup+piSqkxopEYb+qROGLLNxLvDl4Gy6b6XlVfTmWg4GLC5rLdR
 ZgTAJz319VUYcnWlCMOKY+WXG7p2hhujQcKb/wLcmyCkHJ7zwY88ERhRH5+wGQIs8jy0KO3
 cYwU0bNoT4q3onl0/FCxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:umkPnAh6URU=:C9Y3jQSFgHexWKxOcaS7n1
 wk+RlhXGt6imD+w/J72K7j+TOoY/nreL9/2BDBgEd5cG2GXVRqsaNGh8Skh+nWfhSsrZcgS81
 UMEYChEv0YlKjLwLkTG4qtMNtfN7oCrbmC63oG5IeeYxRAQrSrZWn/3CpXeVFR8AGszz+/Xn6
 FL7RvCkwM5A2HQ8OVc/6to9xQ6GH59Y453g8Y9BHxZySHMjwRmCU8dsS/7DNp5ts66cz7EQBw
 ug38fGXdUV3tWI3UGa9PjheaXOcAJd79zdPvAF3lD3XSTh3cdqBYw4FduONaMG8fFp3cFOMQo
 1McnTYf8dUrRDBHxN2zdKR4+4udFrn1/crP4vcBnH+GYe0c/nfiaBiNroe652+kOqENCXovcx
 q7VS2VK3Nz4LtBZjTGOtTk+G51TAR/P0c95jTyUt1fk0UfQLMAGhyEI5LR1WXvU/9g2G9OMLQ
 Undh+ts04gC6kjFhIRlMI8mS0boEN0XsJxLPwByWvJRLAA4OLnwbhzCuS9ljE05LX9UWvu0t1
 K9FTTTmcnxNl1nyClhk6sUuzDaWK+sXAe89Yc9SerwCD9l3bRxvQC5ENsEeolWGzVwDKmDbko
 o7zcdIZqhbtgSl44ZfXZiHqHDe1GGaCgjGP18K6l2XyJZECZ0PyNpFO7OpIOT/TV2WQHNmlvF
 HUggDev1JfYOs0HmjWFXdo9ZOLXdhm75XFoRn6gnoUYWiQNC/ehhSj4ZQBx9YbFEJ3nyC+Egu
 e1n0QbXpRRg0aTxCv7kztlyHz4eyReE5JC7H1/MdHm1t0LG1SaWVYQ7W+OsAAyxwb90N6E5bF
 Ai2PSf3kAPCvLgSqVJLhvv4x3ZL7ifJba0Om2AB2W5w1/zLrrP2Y0HKt4nABQJCpAUMkdYcG9
 n5TSavUeGLUvDK6rQTODGJ84xEvw1cl6Obk3vKJRLLmY+cAyNEvUlG9Inxh9DVrev5HPrzHP8
 MayfLVQIqbFgp1vKlM1MSoDNm3Ucm1ZxN2w8gj05lr5M0iRl6ZFa0xxs+b00CrdbYfj1TjSF7
 P1fGZLm2RQwuV7iLXDoIjuCr+7IxqBIA8SbUtI9VZN00+JpyhL0wjAuXWoYqnNO/tSt9J/r0I
 F3dqdfRuTfvfIgUi2XpDrvvpnaitVCJqix+p8zNF/Mf3XZKEKs7EmJP9g==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Here is a bunch of patches for linux-user, all of them for qemu-v7.2.

Most of them add missing syscalls and enhance the tracing/logging.
Some of the patches are target-hppa specific.
I've tested those on productive hppa debian buildd servers (running qemu-u=
ser).

Please check.

Thanks!
Helge

Helge Deller (13):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace
  linux-user: Add faccessat2() syscall
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
 linux-user/signal-common.h   |  46 +++++++++++
 linux-user/signal.c          |  37 +--------
 linux-user/strace.c          | 144 +++++++++++++++++++++++++++++------
 linux-user/strace.list       |  24 +++++-
 linux-user/syscall.c         |  58 ++++++++++++++
 target/hppa/helper.c         |   6 +-
 9 files changed, 266 insertions(+), 61 deletions(-)

=2D-
2.37.1


