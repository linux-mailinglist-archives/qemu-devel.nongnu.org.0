Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77C54EA8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 14:18:29 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfkP6-00086k-Sz
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 08:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35709)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hfkL9-0005yx-3x
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hfkL4-0002we-54
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:14:21 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49056 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hfkL3-0001yw-CV
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:14:17 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5D29E1A2166;
 Tue, 25 Jun 2019 14:13:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 414661A1D0D;
 Tue, 25 Jun 2019 14:13:09 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 14:12:49 +0200
Message-Id: <1561464774-20548-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 0/5] target/mips: Improve MSA TCG tests
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

This series contains various improvements and additions of MSA ASE
TCG tests.

v3->v4:

  - patches 1 and 2 from v3 got reviewed and integrated into upstream,
    so they are now removed in v4
  - added tests for MSA int multiply instructions
  - added support for MSA big-endian target testings
  - amend4ed remainign patches
  - rebased to the latest code

v2->v3:

  - added some tests from move group
  - added some tests from int dot product group
  - completed tests from bit move group

v1->v2:

  - added some tests from bit move group
  - improved and updated commit messages


Aleksandar Markovic (5):
  tests/tcg: target/mips: Add tests for MSA bit move instructions
  tests/tcg: target/mips: Add tests for MSA move instructions
  tests/tcg: target/mips: Amend tests for MSA int dot product
    instructions
  tests/tcg: target/mips: Amend tests for MSA int multiply instructions
  tests/tcg: target/mips: Add support for MSA big-endian target testings

 tests/tcg/mips/include/wrappers_msa.h              |  80 ++-
 .../mips/user/ase/msa/bit-move/test_msa_binsl_b.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsl_d.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsl_h.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsl_w.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsr_b.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsr_d.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsr_h.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_binsr_w.c  | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_bmnz_v.c   | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_bmz_v.c    | 214 +++++++
 .../mips/user/ase/msa/bit-move/test_msa_bsel_v.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_s_d.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_s_h.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_s_w.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_u_d.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_u_h.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpadd_u_w.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_s_d.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_s_h.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_s_w.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_u_d.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_u_h.c   | 214 +++++++
 .../ase/msa/int-dot-product/test_msa_dpsub_u_w.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_d.c   | 214 +++++++
 tests/tcg/mips/user/ase/msa/move/test_msa_move_v.c | 149 +++++
 .../mips/user/ase/msa/test_msa_compile_64r6eb.sh   | 627 +++++++++++++++++++++
 ...t_msa_compile.sh => test_msa_compile_64r6el.sh} | 561 ++++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_run.sh        | 326 -----------
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh | 355 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh | 355 ++++++++++++
 31 files changed, 7013 insertions(+), 576 deletions(-)
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsl_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsl_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsl_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsl_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsr_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsr_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsr_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_binsr_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bmnz_v.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bmz_v.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bsel_v.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_u_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_u_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_u_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_s_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_s_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_s_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_u_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_u_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpsub_u_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_maddv_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/move/test_msa_move_v.c
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh
 rename tests/tcg/mips/user/ase/msa/{test_msa_compile.sh => test_msa_compile_64r6el.sh} (77%)
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh

-- 
2.7.4


