Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9359B148D20
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 18:43:19 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv2zG-00080X-Lc
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 12:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv2x2-0003fL-Rg
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:41:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv2x1-0001h5-Jf
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:41:00 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:38448 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iv2x1-0001eh-CK
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:40:59 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 648521A213B;
 Fri, 24 Jan 2020 18:40:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4AB711A2126;
 Fri, 24 Jan 2020 18:40:55 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] MIPS queue for January 24th, 2020
Date: Fri, 24 Jan 2020 18:40:39 +0100
Message-Id: <1579887646-5949-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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

The following changes since commit ba2ed84fe6a78f64b2da441750fc6e925d94106a:

  Merge remote-tracking branch 'remotes/palmer/tags/riscv-for-master-5.0-sf1' into staging (2020-01-24 12:34:04 +0000)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-jan-24-2020

for you to fetch changes up to ffbf40a393cdb4237b8ffbb7247b4f437f00a0bf:

  mips/mips_r4k: use memdev for RAM (2020-01-24 18:24:33 +0100)

----------------------------------------------------------------

MIPS queue for January 24th, 2020

  - correct a detail on r4k deprecation
  - style cleanup in helper_do_semihosting()
  - improving passing data to disassembler
  - refactoring of memdev usage for RAM for four MIPS machines

----------------------------------------------------------------

Aleksandar Markovic (2):
  target/mips: Rectify documentation on deprecating r4k machine
  disas: Add a field for target-dependant data

Daniel Henrique Barboza (1):
  mips-semi.c: remove 'uhi_done' label in helper_do_semihosting()

Igor Mammedov (4):
  mips/mips_jazz: use memdev for RAM
  mips/mips_malta: use memdev for RAM
  mips/mips_mipssim: use memdev for RAM
  mips/mips_r4k: use memdev for RAM

 hw/mips/mips_jazz.c     |  7 +++----
 hw/mips/mips_malta.c    | 10 ++++------
 hw/mips/mips_mipssim.c  |  9 +++------
 hw/mips/mips_r4k.c      | 12 ++++--------
 include/disas/dis-asm.h |  3 +++
 qemu-deprecated.texi    |  2 +-
 target/mips/mips-semi.c | 15 +++++++--------
 7 files changed, 25 insertions(+), 33 deletions(-)

-- 
2.7.4


