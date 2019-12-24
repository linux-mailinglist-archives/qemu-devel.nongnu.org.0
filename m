Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A872129CDA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Dec 2019 03:42:39 +0100 (CET)
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ija9d-0002L3-6N
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 21:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ija8A-00016n-R6
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 21:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ija88-0001pG-Ba
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 21:41:06 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37935 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ija88-00006f-4n
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 21:41:04 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 383161A0EF7;
 Tue, 24 Dec 2019 03:39:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1FF2F1A0EE3;
 Tue, 24 Dec 2019 03:39:58 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] linux-user: Misc patches for 5.0
Date: Tue, 24 Dec 2019 03:39:42 +0100
Message-Id: <1577155187-12622-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

This series is a collection of patches I recently accumulated.

Aleksandar Markovic (5):
  linux-user: Fix some constants in termbits.h
  linux-user: mips: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: Add support for FS_IOC_<GET|SET>VERSION ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>FLAGS ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>VERSION ioctls

 linux-user/aarch64/termbits.h    |   4 +-
 linux-user/alpha/termbits.h      |  10 +--
 linux-user/arm/termbits.h        |   4 +-
 linux-user/cris/termbits.h       |   4 +-
 linux-user/hppa/termbits.h       |   4 +-
 linux-user/i386/termbits.h       |   4 +-
 linux-user/ioctls.h              |   6 ++
 linux-user/m68k/termbits.h       |   4 +-
 linux-user/microblaze/termbits.h |   4 +-
 linux-user/mips/cpu_loop.c       |  41 ++++++++++
 linux-user/mips/syscall_nr.h     |  45 +++++++++++
 linux-user/mips/termbits.h       |   4 +-
 linux-user/mips64/syscall_nr.h   |  13 ++++
 linux-user/nios2/termbits.h      |   4 +-
 linux-user/openrisc/termbits.h   |   6 +-
 linux-user/ppc/termbits.h        |   4 +-
 linux-user/riscv/termbits.h      |   4 +-
 linux-user/s390x/termbits.h      |  26 ++++---
 linux-user/sh4/termbits.h        |   4 +-
 linux-user/sparc/termbits.h      |   4 +-
 linux-user/sparc64/termbits.h    |   4 +-
 linux-user/syscall_defs.h        |  12 ++-
 linux-user/x86_64/termbits.h     |   6 +-
 linux-user/xtensa/termbits.h     | 156 ++++++++++++++++++++++-----------------
 24 files changed, 255 insertions(+), 122 deletions(-)

-- 
2.7.4


