Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B826ADDFB8
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 19:28:49 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMF0a-0003I3-Cm
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 13:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMExP-0001TP-0x
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 13:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMExN-00062q-Kp
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 13:25:30 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45389 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iMExN-0005mW-E8
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 13:25:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 10C041A1DE2;
 Sun, 20 Oct 2019 19:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id EB2151A0F06;
 Sun, 20 Oct 2019 19:24:23 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] target/mips: Misc cleanups for September/October 2019
Date: Sun, 20 Oct 2019 19:24:08 +0200
Message-Id: <1571592258-27994-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.rikalo@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly cosmetic changes.

v4->v5:

  - minor correction in patch on helper.c
  - added patches 9 and 10

v3->v4:

  - added patches 7 and 8

v2->v3:

  - removed all patches that were already integrated
  - patches 1 and 2 are improved from v2
  - added patches 3-6

v1->v2:

  - minor corrections to satisfy reviews
  - added several more patches

Aleksandar Markovic (10):
  target/mips: Clean up helper.c
  target/mips: Clean up op_helper.c
  MAINTAINERS: Update mail address of Aleksandar Rikalo
  target/mips: msa: Split helpers for <MAX|MIN>_A.<B|H|W|D>
  target/mips: msa: Split helpers for <MAX|MIN>_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for ILV<EV|OD|L|R>.<B|H|W|D>
  target/mips: msa: Split helpers for ADD<_A|S_A|S_S|S_U|V>.<B|H|W|D>
  target/mips: msa: Split helpers for HADD_<S|U>.<H|W|D>
  target/mips: msa: Split helpers for S<LL|RA|RAR|RL|RLR>.<B|H|W|D>
  target/mips: msa: Split helpers for PCK<EV|OD>.<B|H|W|D>

 .mailmap                 |    5 +-
 MAINTAINERS              |   18 +-
 target/mips/helper.c     |  123 +-
 target/mips/helper.h     |  133 +-
 target/mips/msa_helper.c | 4244 +++++++++++++++++++++++++++++-----------------
 target/mips/op_helper.c  | 1010 +++++++----
 target/mips/translate.c  |  442 ++++-
 7 files changed, 3966 insertions(+), 2009 deletions(-)

-- 
2.7.4


