Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C96D1516AE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 09:03:53 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iytBY-0003qi-3S
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 03:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iytA5-0002fG-50
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 03:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iyt9z-0000pj-R7
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 03:02:20 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:41344 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iyt9z-0000dl-K9
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 03:02:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C823B1A152E;
 Tue,  4 Feb 2020 09:02:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id AF87E1A0F0A;
 Tue,  4 Feb 2020 09:02:11 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/3] MIPS queue for February 4th, 2020
Date: Tue,  4 Feb 2020 09:01:54 +0100
Message-Id: <1580803317-4422-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

The following changes since commit f31160c7d1b89cfb4dd4001a23575b42141cb0ec:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-docs-20200203' into staging (2020-02-03 11:14:24 +0000)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-feb-04-2020

for you to fetch changes up to 7b77f048e21af71da7b82155f1f205ca7cebf1b4:

  target/mips: Separate FPU-related helpers into their own file (2020-02-04 08:53:54 +0100)

----------------------------------------------------------------

MIPS queue for February 4th, 2020

  Content:

    - fix for a recent regression in LL/SC
    - mechanical reorganization of files containing helpers

  Notes:

    - v2 was sent because of a mistake in a comment in patch #3; the
      commit message of patch #1 was improved as well
    - six checkpatch errors and two warnings are benign and should be
      ignored

----------------------------------------------------------------

Aleksandar Markovic (2):
  target/mips: Separate CP0-related helpers into their own file
  target/mips: Separate FPU-related helpers into their own file

Alex Richardson (1):
  target/mips: Fix handling of LL/SC instructions after 7dd547e5ab

 target/mips/Makefile.objs |    5 +-
 target/mips/cp0_helper.c  | 1678 +++++++++++++++++
 target/mips/fpu_helper.c  | 1911 ++++++++++++++++++++
 target/mips/op_helper.c   | 4422 +++++----------------------------------------
 4 files changed, 4044 insertions(+), 3972 deletions(-)
 create mode 100644 target/mips/cp0_helper.c
 create mode 100644 target/mips/fpu_helper.c

-- 
2.7.4


