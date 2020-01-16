Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E613FC72
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 23:53:59 +0100 (CET)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isE1V-00031V-RY
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 17:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyz-0008MN-9V
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyx-0002f6-QI
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:20 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:51962 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1isDyv-0001zB-TF
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:18 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 033911A2185;
 Thu, 16 Jan 2020 23:50:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 7266D1A21CF;
 Thu, 16 Jan 2020 23:50:08 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] linux-user: Add support for fs, fd,and kcov ioctls 
Date: Thu, 16 Jan 2020 23:49:39 +0100
Message-Id: <1579214991-19602-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

This series is a spin-off of v5 of earlier series "linux-user: Misc
patches for 5.0", that became too large to manage. I will submit the
rest of that large series separately.

The only difference between patches in this series and in the former
series is that all Laurent's comments and concerns were addressed.

The summary of the patches is as follows:

Patches 1-6: Adding support for some filesystem-related ioctls
Patches 7-9: Adding support for some floppy-drive-related ioctls
Patches 10-12: Adding support for kcov-related ioctls

Aleksandar Markovic (12):
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

 configure                  |  9 +++++++++
 linux-user/ioctls.h        | 36 +++++++++++++++++++++++++++++++++
 linux-user/syscall.c       |  3 +++
 linux-user/syscall_defs.h  | 50 +++++++++++++++++++++++++++++++++++++++++++---
 linux-user/syscall_types.h | 29 +++++++++++++++++++++++++++
 5 files changed, 124 insertions(+), 3 deletions(-)

-- 
2.7.4


