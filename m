Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B19D574E
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 20:29:58 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJicu-0008KQ-Uk
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 14:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iJiaa-0006ml-Mz
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 14:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iJiaZ-0003k3-Eu
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 14:27:32 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:40785 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iJiaZ-0002Vs-7T
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 14:27:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 32F271A1E27;
 Sun, 13 Oct 2019 20:26:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0C4061A0F16;
 Sun, 13 Oct 2019 20:26:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] target/mips: Misc cleanups for September/October 2019
Date: Sun, 13 Oct 2019 20:26:10 +0200
Message-Id: <1570991178-5511-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

v3->v4:

  - added patches 7 and 8

v2->v3:

  - removed all patches that were already integrated
  - patches 1 and 2 are improved from v2
  - added patches 3-6

v1->v2:

  - minor corrections to satisfy reviews
  - added several more patches

Aleksandar Markovic (8):
  target/mips: Clean up helper.c
  target/mips: Clean up op_helper.c
  MAINTAINERS: Update mail address of Aleksandar Rikalo
  target/mips: msa: Split helpers for <MAX|MIN>_A.<B|H|W|D>
  target/mips: msa: Split helpers for <MAX|MIN>_<S|U>.<B|H|W|D>
  target/mips: msa: Split helpers for ILV<EV|OD|L|R>.<B|H|W|D>
  target/mips: msa: Split helpers for ADD<_A|S_A|S_S|S_U|V>.<B|H|W|D>
  target/mips: msa: Split helpers for HADD_<S|U>.<H|W|D>

 .mailmap                 |    5 +-
 MAINTAINERS              |   18 +-
 target/mips/helper.c     |  128 ++--
 target/mips/helper.h     |   92 ++-
 target/mips/msa_helper.c | 1876 +++++++++++++++++++++++++++++++++-------------
 target/mips/op_helper.c  | 1010 ++++++++++++++++---------
 target/mips/translate.c  |  317 ++++++--
 7 files changed, 2465 insertions(+), 981 deletions(-)

-- 
2.7.4


