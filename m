Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002664CD5D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 14:03:18 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdvmg-0002ia-4v
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 08:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56357)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdvZh-0000on-Mh
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdvZb-0006bW-TH
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:49:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:38026 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdvZV-0006Ko-4p
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:49:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 055341A2432;
 Thu, 20 Jun 2019 13:49:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D832E1A22BF;
 Thu, 20 Jun 2019 13:49:27 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 13:49:16 +0200
Message-Id: <1561031359-6727-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 0/3] target/mips: Improve MSA tests
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

v1-v2:

  - added some tests from bit move group
  - improved and updated commit messages

Aleksandar Markovic (3):
  tests/tcg: target/mips: Include isa/ase and group name in test output
  tests/tcg: target/mips: Amend tests for MSA pack instructions
  tests/tcg: target/mips: Add tests for MSA bit move instructions

 tests/tcg/mips/include/test_utils_128.h            |  17 +-
 tests/tcg/mips/include/test_utils_64.h             |   9 +-
 tests/tcg/mips/include/wrappers_msa.h              |  30 +++
 .../mips/user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nloc_h.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nloc_w.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_b.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_d.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_h.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_w.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_b.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_d.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_h.c  |   9 +-
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_w.c  |   9 +-
 .../mips/user/ase/msa/bit-move/test_msa_bmnz_v.c   | 214 +++++++++++++++++++++
 .../mips/user/ase/msa/bit-move/test_msa_bmz_v.c    | 214 +++++++++++++++++++++
 .../mips/user/ase/msa/bit-move/test_msa_bsel_v.c   | 214 +++++++++++++++++++++
 .../mips/user/ase/msa/bit-set/test_msa_bclr_b.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bclr_d.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bclr_h.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bclr_w.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bneg_b.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bneg_d.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bneg_h.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bneg_w.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bset_b.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bset_d.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bset_h.c    |   9 +-
 .../mips/user/ase/msa/bit-set/test_msa_bset_w.c    |   9 +-
 .../user/ase/msa/fixed-multiply/test_msa_mul_q_h.c |   9 +-
 .../user/ase/msa/fixed-multiply/test_msa_mul_q_w.c |   9 +-
 .../ase/msa/fixed-multiply/test_msa_mulr_q_h.c     |   9 +-
 .../ase/msa/fixed-multiply/test_msa_mulr_q_w.c     |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmax_a_d.c |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmax_a_w.c |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmax_d.c   |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmax_w.c   |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmin_a_d.c |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmin_a_w.c |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmin_d.c   |   9 +-
 .../user/ase/msa/float-max-min/test_msa_fmin_w.c   |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_add_a_b.c   |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_add_a_d.c   |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_add_a_h.c   |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_add_a_w.c   |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_a_b.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_a_d.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_a_h.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_a_w.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_s_b.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_s_d.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_s_h.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_s_w.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_u_b.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_u_d.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_u_h.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_adds_u_w.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_addv_b.c    |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_addv_d.c    |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_addv_h.c    |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_addv_w.c    |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_d.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_h.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_w.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_d.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_h.c  |   9 +-
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_w.c  |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_s_b.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_s_d.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_s_h.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_s_w.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_u_b.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_u_d.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_u_h.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_ave_u_w.c    |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_s_b.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_s_d.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_s_h.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_s_w.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_u_b.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_u_d.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_u_h.c   |   9 +-
 .../user/ase/msa/int-average/test_msa_aver_u_w.c   |   9 +-
 .../mips/user/ase/msa/int-compare/test_msa_ceq_b.c |   9 +-
 .../mips/user/ase/msa/int-compare/test_msa_ceq_d.c |   9 +-
 .../mips/user/ase/msa/int-compare/test_msa_ceq_h.c |   9 +-
 .../mips/user/ase/msa/int-compare/test_msa_ceq_w.c |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_s_b.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_s_d.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_s_h.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_s_w.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_u_b.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_u_d.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_u_h.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_cle_u_w.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_s_b.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_s_d.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_s_h.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_s_w.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_u_b.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_u_d.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_u_h.c    |   9 +-
 .../user/ase/msa/int-compare/test_msa_clt_u_w.c    |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_s_b.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_s_d.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_s_h.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_s_w.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_u_b.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_u_d.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_u_h.c     |   9 +-
 .../user/ase/msa/int-divide/test_msa_div_u_w.c     |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_s_d.c    |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_s_h.c    |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_s_w.c    |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_u_d.c    |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_u_h.c    |   9 +-
 .../ase/msa/int-dot-product/test_msa_dotp_u_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_a_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_a_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_a_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_a_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_s_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_s_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_s_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_s_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_u_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_u_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_u_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_max_u_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_a_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_a_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_a_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_a_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_s_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_s_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_s_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_s_w.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_u_b.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_u_d.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_u_h.c    |   9 +-
 .../user/ase/msa/int-max-min/test_msa_min_u_w.c    |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_s_b.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_s_d.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_s_h.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_s_w.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_u_b.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_u_d.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_u_h.c     |   9 +-
 .../user/ase/msa/int-modulo/test_msa_mod_u_w.c     |   9 +-
 .../user/ase/msa/int-multiply/test_msa_mulv_b.c    |   9 +-
 .../user/ase/msa/int-multiply/test_msa_mulv_d.c    |   9 +-
 .../user/ase/msa/int-multiply/test_msa_mulv_h.c    |   9 +-
 .../user/ase/msa/int-multiply/test_msa_mulv_w.c    |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_s_b.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_s_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_s_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_s_w.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_u_b.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_u_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_u_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_asub_u_w.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_s_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_s_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_s_w.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_u_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_u_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_hsub_u_w.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_s_b.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_s_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_s_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_s_w.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_u_b.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_u_d.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_u_h.c  |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subs_u_w.c  |   9 +-
 .../ase/msa/int-subtract/test_msa_subsus_u_b.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsus_u_d.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsus_u_h.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsus_u_w.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsuu_s_b.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsuu_s_d.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsuu_s_h.c     |   9 +-
 .../ase/msa/int-subtract/test_msa_subsuu_s_w.c     |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subv_b.c    |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subv_d.c    |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subv_h.c    |   9 +-
 .../user/ase/msa/int-subtract/test_msa_subv_w.c    |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvev_b.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvev_d.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvev_h.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvev_w.c     |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvl_b.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvl_d.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvl_h.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvl_w.c |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvod_b.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvod_d.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvod_h.c     |   9 +-
 .../user/ase/msa/interleave/test_msa_ilvod_w.c     |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvr_b.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvr_d.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvr_h.c |   9 +-
 .../mips/user/ase/msa/interleave/test_msa_ilvr_w.c |   9 +-
 tests/tcg/mips/user/ase/msa/logic/test_msa_and_v.c |   9 +-
 tests/tcg/mips/user/ase/msa/logic/test_msa_nor_v.c |   9 +-
 tests/tcg/mips/user/ase/msa/logic/test_msa_or_v.c  |   9 +-
 tests/tcg/mips/user/ase/msa/logic/test_msa_xor_v.c |   9 +-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_b.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_d.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_h.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_w.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_b.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_d.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_h.c  |  67 ++++++-
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_w.c  |  67 ++++++-
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_b.c |  67 ++++++-
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_d.c |  67 ++++++-
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_h.c |  67 ++++++-
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_w.c |  67 ++++++-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_b.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_d.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_h.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_w.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_b.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_d.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_h.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_w.c |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_b.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_d.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_h.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_w.c  |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_b.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_d.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_h.c |   9 +-
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_w.c |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_b.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_d.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_h.c  |   9 +-
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_w.c  |   9 +-
 .../isa/mips64r6/bit-count/test_mips64r6_clo.c     |   4 +-
 .../isa/mips64r6/bit-count/test_mips64r6_clz.c     |   4 +-
 .../isa/mips64r6/bit-count/test_mips64r6_dclo.c    |   4 +-
 .../isa/mips64r6/bit-count/test_mips64r6_dclz.c    |   4 +-
 .../isa/mips64r6/bit-swap/test_mips64r6_bitswap.c  |   4 +-
 .../isa/mips64r6/bit-swap/test_mips64r6_dbitswap.c |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_dmuh.c |   4 +-
 .../mips64r6/int-multiply/test_mips64r6_dmuhu.c    |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_dmul.c |   4 +-
 .../mips64r6/int-multiply/test_mips64r6_dmulu.c    |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_muh.c  |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_muhu.c |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_mul.c  |   4 +-
 .../isa/mips64r6/int-multiply/test_mips64r6_mulu.c |   4 +-
 .../user/isa/mips64r6/logic/test_mips64r6_and.c    |   4 +-
 .../user/isa/mips64r6/logic/test_mips64r6_nor.c    |   4 +-
 .../user/isa/mips64r6/logic/test_mips64r6_or.c     |   4 +-
 .../user/isa/mips64r6/logic/test_mips64r6_xor.c    |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_dsllv.c  |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_dsrav.c  |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_dsrlv.c  |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_sllv.c   |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_srav.c   |   4 +-
 .../user/isa/mips64r6/shift/test_mips64r6_srlv.c   |   4 +-
 264 files changed, 2848 insertions(+), 748 deletions(-)
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bmnz_v.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bmz_v.c
 create mode 100644 tests/tcg/mips/user/ase/msa/bit-move/test_msa_bsel_v.c

-- 
2.7.4


