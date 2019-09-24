Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A3BC9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:13:05 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iClYt-00071q-Mb
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iCkrH-0007xb-JS
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iCkrD-0001AM-BF
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:27:58 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34190 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iCkrC-0000o1-LJ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:27:54 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6120C1A2213;
 Tue, 24 Sep 2019 15:26:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4838C1A1D45;
 Tue, 24 Sep 2019 15:26:48 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/mips: Misc cleanups for September/October 2019
Date: Tue, 24 Sep 2019 15:26:31 +0200
Message-Id: <1569331602-2586-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly cosmetic changes.

Aleksandar Markovic (11):
  target/mips: Clean up helper.c
  target/mips: Clean up internal.h
  target/mips: Clean up kvm_mips.h
  target/mips: Clean up mips-defs.h
  target/mips: Clean up op_helper.c
  target/mips: Clean up translate.c
  target/mips: msa: Split helpers for <NLOC|NLZC>.<B|H|W|D>
  target/mips: msa: Split helpers for PCNT.<B|H|W|D>
  target/mips: msa: Split helpers for BINS<L|R>.<B|H|W|D>
  target/mips: msa: Unroll loops and demacro <BMNZ|BMZ|BSEL>.V
  target/mips: msa: Split helpers for B<CLR|NEG|SEL>.<B|H|W|D>

 target/mips/helper.c     | 132 ++++---
 target/mips/helper.h     |  55 ++-
 target/mips/internal.h   |  60 ++--
 target/mips/kvm_mips.h   |   2 +-
 target/mips/mips-defs.h  |  53 +--
 target/mips/msa_helper.c | 801 +++++++++++++++++++++++++++++++----------
 target/mips/op_helper.c  | 913 +++++++++++++++++++++++++++++++----------------
 target/mips/translate.c  | 174 +++++++--
 8 files changed, 1562 insertions(+), 628 deletions(-)

-- 
2.7.4


