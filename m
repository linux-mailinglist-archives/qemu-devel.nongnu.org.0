Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1401264B0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:29:38 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwo5-00012K-QA
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ihwbX-00005L-C6
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ihwbV-0008Id-Mm
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:38 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:60215 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ihwbV-0003eM-8R
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:37 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9BFE21A244B;
 Thu, 19 Dec 2019 15:15:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 82DB11A2440;
 Thu, 19 Dec 2019 15:15:30 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/mips: Misc MIPS fixes and improvements for 5.0
Date: Thu, 19 Dec 2019 15:15:18 +0100
Message-Id: <1576764920-24514-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
  target/mips: Add support for MIPS<32|64>R6 CRC32 ISA
  target/mips: Correct data on deprecated r4k machine

 disas/mips.c            |   8 +++
 qemu-deprecated.texi    |   2 +-
 target/mips/helper.h    |   2 +
 target/mips/op_helper.c |  19 ++++++++
 target/mips/translate.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 157 insertions(+), 1 deletion(-)

-- 
2.7.4


