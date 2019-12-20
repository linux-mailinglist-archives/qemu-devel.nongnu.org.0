Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF41278E7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 11:11:10 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiFFV-0004nA-NA
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 05:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iiFDY-0003In-Sb
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 05:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iiFDX-0006GT-Dl
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 05:09:08 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:60029 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iiFDX-0005wO-1K
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 05:09:07 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 96F4D1A22B1;
 Fri, 20 Dec 2019 11:09:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 7CDB01A22AB;
 Fri, 20 Dec 2019 11:09:01 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/mips: Misc MIPS fixes and improvements for 5.0
Date: Fri, 20 Dec 2019 11:08:47 +0100
Message-Id: <1576836531-2392-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.rikalo@rt-rk.com, Aleksandar Markovic <amarkovic@wavecomp.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series contains a variety of fixes and improvements for
target MIPS.

Aleksandar Markovic (2):
  target/mips: Rectify documentation on deprecating r4k machine
  target/mips: Add support for MIPS<32|64>R6 CRC32 ISA

Yongbok Kim (2):
  target/mips: Amend CP0 WatchHi register implementation
  target/mips: Add implementation of GINVT instruction

 disas/mips.c            |  10 +++
 qemu-deprecated.texi    |   2 +-
 target/mips/cpu.h       |   4 +-
 target/mips/helper.c    |  20 ++++-
 target/mips/helper.h    |   7 ++
 target/mips/internal.h  |   1 +
 target/mips/machine.c   |   6 +-
 target/mips/op_helper.c | 171 +++++++++++++++++++++++++++++++++-----
 target/mips/translate.c | 215 +++++++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 402 insertions(+), 34 deletions(-)

-- 
2.7.4


