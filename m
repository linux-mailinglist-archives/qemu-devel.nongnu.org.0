Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEBE150A6E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 17:00:01 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iye8m-0002eI-FY
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 11:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iye7g-0001ev-8q
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:58:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iye7f-0007VI-0D
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:58:51 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34643 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iye7e-0006bX-Ps
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:58:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8816E1A2105;
 Mon,  3 Feb 2020 16:57:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6F39C1A20D8;
 Mon,  3 Feb 2020 16:57:44 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/mips: Separate CP0-related and FPU-related helpers
 into their own files
Date: Mon,  3 Feb 2020 16:57:21 +0100
Message-Id: <1580745443-24650-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

This is just a mechanical movement of the code, done for clarity and
easier maintenance.

In stats it appears that more lines are added than removed - this is
because of license preambles within two new files.

Aleksandar Markovic (2):
  target mips: Separate CP0-related helpers into their own file
  target mips: Separate FPU-related helpers into their own file

 target/mips/Makefile.objs |    5 +-
 target/mips/cp0_helper.c  | 1678 +++++++++++++++++
 target/mips/fpu_helper.c  | 1911 ++++++++++++++++++++
 target/mips/op_helper.c   | 4414 +++++----------------------------------------
 4 files changed, 4040 insertions(+), 3968 deletions(-)
 create mode 100644 target/mips/cp0_helper.c
 create mode 100644 target/mips/fpu_helper.c

-- 
2.7.4


