Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D097A56646
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 12:09:34 +0200 (CEST)
Received: from localhost ([::1]:38476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg4rt-0007Sa-Vy
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 06:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg4pm-00063k-3r
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg4pk-0003Jt-Av
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:22 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:38529 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hg4pj-0003H8-Uh
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D2C431A1E5A;
 Wed, 26 Jun 2019 12:07:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9F6CA1A1E3A;
 Wed, 26 Jun 2019 12:07:16 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 12:07:01 +0200
Message-Id: <1561543629-20327-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 0/8] target/mips: Improve MSA TCG tests
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

v5->v6:

  - fixed bad values for some test cases of pack instructions
  - fixex big endian host behavior for interleave instructions

v4->v5:

  - added patch on MIPS32R6 support
  - amended other patches

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


Aleksandar Markovic (8):
  tests/tcg: target/mips: Add tests for MSA bit move instructions
  tests/tcg: target/mips: Add tests for MSA move instructions
  tests/tcg: target/mips: Amend tests for MSA int dot product
    instructions
  tests/tcg: target/mips: Amend tests for MSA int multiply instructions
  tests/tcg: target/mips: Add support for MSA big-endian target testings
  tests/tcg: target/mips: Add support for MSA MIPS32R6 testings
  tests/tcg: target/mips: Fix some test cases for pack MSA instructions
  target/mips: Fix big endian host behavior for interleave MSA
    instructions

 target/mips/msa_helper.c                           |  24 +-
 tests/tcg/mips/include/wrappers_msa.h              |  96 +++-
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
 .../user/ase/msa/int-multiply/test_msa_maddv_b.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_d.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_h.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_w.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_msubv_b.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_msubv_d.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_msubv_h.c   | 214 +++++++
 .../user/ase/msa/int-multiply/test_msa_msubv_w.c   | 214 +++++++
 tests/tcg/mips/user/ase/msa/move/test_msa_move_v.c | 149 +++++
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_b.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_d.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_h.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_w.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_b.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_d.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_h.c  |  64 +--
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_w.c  |  64 +--
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_b.c |  64 +--
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_d.c |  64 +--
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_h.c |  64 +--
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_w.c |  64 +--
 .../mips/user/ase/msa/test_msa_compile_32r6eb.sh   | 627 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_32r6el.sh   | 627 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_64r6eb.sh   | 627 +++++++++++++++++++++
 ...t_msa_compile.sh => test_msa_compile_64r6el.sh} | 561 ++++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_run.sh        | 326 -----------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh | 363 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh | 363 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh | 363 ++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh | 363 ++++++++++++
 55 files changed, 10919 insertions(+), 972 deletions(-)
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
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_maddv_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_maddv_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_maddv_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_maddv_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_msubv_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_msubv_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_msubv_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/int-multiply/test_msa_msubv_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/move/test_msa_move_v.c
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh
 rename tests/tcg/mips/user/ase/msa/{test_msa_compile.sh => test_msa_compile_64r6el.sh} (77%)
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run.sh
 create mode 100644 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh

-- 
2.7.4


