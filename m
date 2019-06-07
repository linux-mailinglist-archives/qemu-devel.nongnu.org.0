Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 1019A38961
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 13:51:19 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZDOw-00078m-7i
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 07:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hZBl6-0003tm-Vp
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hZBl5-0008Bb-FA
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:06:04 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50256 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hZBl5-00088a-5D
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:06:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8E7991A1D97;
 Fri,  7 Jun 2019 12:05:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6D9E91A1D11;
 Fri,  7 Jun 2019 12:05:50 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 12:05:41 +0200
Message-Id: <1559901944-4578-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559901944-4578-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559901944-4578-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 07/10] tests/tcg: target/mips: Move four tests
 to a better location
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

Move tests for <MUL|MULR>_Q.<H|B> from "integer multiply" directory
to "fixed-point multiply" directory, since they do not operate on
integers, but on fixed point numbers.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1559838440-9866-8-git-send-email-aleksandar.markovic@rt-rk.com>
---
 .../mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_h.c | 0
 .../mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_w.c | 0
 .../user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_h.c     | 0
 .../user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_w.c     | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_h.c (100%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_w.c (100%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_h.c (100%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_w.c (100%)

diff --git a/tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mul_q_h.c b/tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mul_q_h.c
similarity index 100%
rename from tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mul_q_h.c
rename to tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mul_q_h.c
diff --git a/tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mul_q_w.c b/tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mul_q_w.c
similarity index 100%
rename from tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mul_q_w.c
rename to tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mul_q_w.c
diff --git a/tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mulr_q_h.c b/tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mulr_q_h.c
similarity index 100%
rename from tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mulr_q_h.c
rename to tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mulr_q_h.c
diff --git a/tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mulr_q_w.c b/tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mulr_q_w.c
similarity index 100%
rename from tests/tcg/mips/user/ase/msa/int-multiply/test_msa_mulr_q_w.c
rename to tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_mulr_q_w.c
-- 
2.7.4


