Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E40C38E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:25:14 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFK1Z-0002yk-11
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJte-0004gr-4N
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJtc-0001sE-I0
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:53259 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iFJtc-0000yU-B9
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:00 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 88F8E1A23A5;
 Tue,  1 Oct 2019 17:15:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.55])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6045D1A22D0;
 Tue,  1 Oct 2019 17:15:54 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] MIPS queue for October 1st, 2019
Date: Tue,  1 Oct 2019 17:15:26 +0200
Message-Id: <1569942944-10381-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

The following changes since commit 95e9d74fe4281f7ad79a5a7511400541729aa44a:

  Merge remote-tracking branch 'remotes/borntraeger/tags/s390x-20190930' into staging (2019-09-30 14:21:56 +0100)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-oct-01-2019

for you to fetch changes up to 0a1bb9127ba66c093d5af395ea2630b06b929011:

  target/mips: msa: Move helpers for <AND|NOR|OR|XOR>.V (2019-10-01 16:58:45 +0200)

----------------------------------------------------------------

MIPS queue for October 1st, 2019

Highlights:

  - mostly cleanups related to "checkpatch.pl -f"
  - slight optimization of handling of some MSA instructions

----------------------------------------------------------------

Aleksandar Markovic (18):
  target/mips: Clean up internal.h
  target/mips: Clean up kvm_mips.h
  target/mips: Clean up mips-defs.h
  target/mips: Clean up translate.c
  target/mips: msa: Split helpers for <NLOC|NLZC>.<B|H|W|D>
  target/mips: msa: Split helpers for PCNT.<B|H|W|D>
  target/mips: msa: Split helpers for BINS<L|R>.<B|H|W|D>
  target/mips: msa: Unroll loops and demacro <BMNZ|BMZ|BSEL>.V
  target/mips: msa: Split helpers for B<CLR|NEG|SEL>.<B|H|W|D>
  target/mips: msa: Split helpers for AVE_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for AVER_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for CEQ.<B|H|W|D>
  target/mips: msa: Split helpers for CLE_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for CLT_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for DIV_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for MOD_<S|U>.<B|H|W|D>
  target/mips: msa: Simplify and move helper for MOVE.V
  target/mips: msa: Move helpers for <AND|NOR|OR|XOR>.V

 target/mips/helper.h     |  144 ++-
 target/mips/internal.h   |   60 +-
 target/mips/kvm_mips.h   |    2 +-
 target/mips/mips-defs.h  |   58 +-
 target/mips/msa_helper.c | 2163 ++++++++++++++++++++++++++++++++++++----------
 target/mips/translate.c  |  421 +++++++--
 6 files changed, 2254 insertions(+), 594 deletions(-)

-- 
2.7.4


