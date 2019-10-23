Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BBE182D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 12:41:59 +0200 (CEST)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNE5U-0001mT-Ui
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 06:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpv-0000yU-0I
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpp-0002wF-Bx
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:47 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45049 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNDpo-0002Ue-9c
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 31B691A21C8;
 Wed, 23 Oct 2019 12:24:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F0EF11A22A1;
 Wed, 23 Oct 2019 12:23:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/14] target/mips: Misc cleanups for September/October 2019
Date: Wed, 23 Oct 2019 12:23:33 +0200
Message-Id: <1571826227-10583-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.rikalo@rt-rk.com, Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly cosmetic changes.

v6->v7:

  - minor corrections in commit messages
  - added patches 13 and 14

v5->v6:

  - minor corrections (r-b, t-b marks) in commit messages
  - added patches 11 and 12

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

Aleksandar Markovic (14):
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
  target/mips: msa: Split helpers for HSUB_<S|U>.<H|W|D>
  target/mips: msa: Split helpers for ASUB_<S|U>.<B|H|W|D>
  target/mips: Add support for emulation of CRC32 group of instructions
  target/mips: Demacro LMI decoder

 .mailmap                 |    5 +-
 MAINTAINERS              |   18 +-
 disas/mips.c             |    8 +
 target/mips/helper.c     |  123 +-
 target/mips/helper.h     |  157 +-
 target/mips/msa_helper.c | 4583 ++++++++++++++++++++++++++++++----------------
 target/mips/op_helper.c  | 1032 +++++++----
 target/mips/translate.c  |  800 ++++++--
 8 files changed, 4565 insertions(+), 2161 deletions(-)

-- 
2.7.4


