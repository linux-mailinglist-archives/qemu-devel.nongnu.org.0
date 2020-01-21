Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63344143F72
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:25:29 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituTA-0005Jj-6Z
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittle-0003vq-Uy
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittlb-00037H-2x
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:30 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:54222 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ittla-0002U0-S3
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:27 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A17D91A4596;
 Tue, 21 Jan 2020 14:39:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 77B5C1A456A;
 Tue, 21 Jan 2020 14:39:15 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] target/mips: Misc MIPS fixes and improvements for 5.0
Date: Tue, 21 Jan 2020 14:38:52 +0100
Message-Id: <1579613937-5774-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.rikalo@rt-rk.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series contains a variety of fixes and improvements for
target MIPS.

v2->v3:

    - added micromips R6 disassembler

Aleksandar Markovic (3):
  target/mips: Rectify documentation on deprecating r4k machine
  target/mips: Add support for MIPS<32|64>R6 CRC32 ISA
  disas: mips: Add micromips R6 disassembler

Yongbok Kim (2):
  target/mips: Amend CP0 WatchHi register implementation
  target/mips: Add implementation of GINVT instruction

 disas/Makefile.objs     |    1 +
 disas/micromips_r6.c    | 5669 +++++++++++++++++++++++++++++++++++++++++++++++
 disas/mips.c            |   10 +
 include/disas/dis-asm.h |    1 +
 qemu-deprecated.texi    |    2 +-
 target/mips/cpu.c       |    4 +
 target/mips/cpu.h       |    4 +-
 target/mips/helper.c    |   20 +-
 target/mips/helper.h    |    7 +
 target/mips/internal.h  |    1 +
 target/mips/machine.c   |    6 +-
 target/mips/op_helper.c |  171 +-
 target/mips/translate.c |  215 +-
 13 files changed, 6077 insertions(+), 34 deletions(-)
 create mode 100644 disas/micromips_r6.c

-- 
2.7.4


