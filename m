Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EE731BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 16:34:43 +0200 (CEST)
Received: from localhost ([::1]:52202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqILr-0007VV-6D
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59625)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqILb-0006vV-0K
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqILV-0006xv-He
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:34:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59619 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hqILO-0006U1-HN
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:34:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C97D81A2131;
 Wed, 24 Jul 2019 16:33:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A64A91A1183;
 Wed, 24 Jul 2019 16:33:26 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 16:33:18 +0200
Message-Id: <1563978800-31836-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 0/2] target/mips: Misc patches for 4.2
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series includes misc MIPS patches intended to be integrated after
4.1 release.

Aleksandar Markovic (2):
  tests/tcg: target/mips: Fix target configurations for MSA tests
  tests/tcg: target/mips: Add optional printing of more detailed failure
    info

 tests/tcg/mips/include/test_utils_128.h            |  21 +-
 .../mips/user/ase/msa/test_msa_compile_32r5eb.sh   | 643 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_32r5el.sh   | 643 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_32r6eb.sh   | 643 ---------------------
 .../mips/user/ase/msa/test_msa_compile_32r6el.sh   | 643 ---------------------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r5eb.sh | 371 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_32r5el.sh | 371 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh | 371 ------------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh | 371 ------------
 9 files changed, 2048 insertions(+), 2029 deletions(-)
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r5eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r5el.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r5eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r5el.sh
 delete mode 100644 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh

-- 
2.7.4


