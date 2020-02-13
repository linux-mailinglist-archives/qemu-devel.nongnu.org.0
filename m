Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52A15B6D8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 02:48:59 +0100 (CET)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j23cg-0007W8-MS
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 20:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j23ba-0005xm-Mw
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j23bZ-0004Q4-G2
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:50 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:38846 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j23bZ-0002sg-9S
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0CCB71A20C9;
 Thu, 13 Feb 2020 02:46:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id DE06D1A1FF3;
 Thu, 13 Feb 2020 02:46:43 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] linux-user: Update syscall numbers to kernel 5.5 level
Date: Thu, 13 Feb 2020 02:46:24 +0100
Message-Id: <1581558393-9182-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: laurent@vivier.eu, Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

v1->v2:

  - corrected mips parts based on Laurent's review

This series is a spin-off of another larger linux-user series
that become too large to handle, hence these patches related to
syscall numbers are now in this, separate, series.

This series covers updating syscall numbers defined in the following
files:

  - linux-user/alpha/syscall_nr.h
  - linux-user/arm/syscall_nr.h
  - linux-user/m68k/syscall_nr.h
  - linux-user/microblaze/syscall_nr.h
  - linux-user/mips/cpu_loop.c
  - linux-user/mips/syscall_nr.h
  - linux-user/mips64/syscall_nr.h
  - linux-user/sh4/syscall_nr.h
  - linux-user/x86_64/syscall_nr.h
  - linux-user/xtensa/syscall_nr.h

----------------------------------------------------------------------

Aleksandar Markovic (9):
  linux-user: alpha: Update syscall numbers to kernel 5.5 level
  linux-user: arm: Update syscall numbers to kernel 5.5 level
  linux-user: m68k: Update syscall numbers to kernel 5.5 level
  linux-user: microblaze: Update syscall numbers to kernel 5.5 level
  linux-user: mips: Update syscall numbers to kernel 5.5 level
  linux-user: sh4: Update syscall numbers to kernel 5.5 level
  linux-user: x86_64: Update syscall numbers to kernel 5.5 level
  linux-user: xtensa: Update syscall numbers to kernel 5.5 level
  linux-user: xtensa: Remove unused constant TARGET_NR_syscall_count

 linux-user/alpha/syscall_nr.h      | 35 ++++++++++++++++
 linux-user/arm/syscall_nr.h        | 44 ++++++++++++++++++++
 linux-user/m68k/syscall_nr.h       | 50 ++++++++++++++++++++++-
 linux-user/microblaze/syscall_nr.h | 45 +++++++++++++++++++++
 linux-user/mips/syscall_nr.h       | 45 +++++++++++++++++++++
 linux-user/mips64/syscall_nr.h     | 50 ++++++++++++++++++++++-
 linux-user/sh4/syscall_nr.h        | 48 ++++++++++++++++++++++
 linux-user/x86_64/syscall_nr.h     | 24 +++++++++++
 linux-user/xtensa/syscall_nr.h     | 36 ++++++++++++++++-
 linux-user/mips/cpu_loop.c         | 83 +++++++++++++++++++++++++++++++++++++-
 10 files changed, 454 insertions(+), 6 deletions(-)

-- 
2.7.4


