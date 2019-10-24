Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C9E3022
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 13:18:14 +0200 (CEST)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNb89-0002BS-4g
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 07:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz6-0002fc-Nv
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz4-0007Za-8k
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:52 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50314 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNaz4-000729-1R
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:50 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C87F71A219A;
 Thu, 24 Oct 2019 13:07:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A1E8D1A1EA7;
 Thu, 24 Oct 2019 13:07:44 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] MIPS queue for October 24th, 2019
Date: Thu, 24 Oct 2019 13:06:24 +0200
Message-Id: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

The following changes since commit ea0ec714d3109e0d0523b9dacb38030e4cb142a8:

  Merge remote-tracking branch 'remotes/xtensa/tags/20191023-xtensa' into staging (2019-10-24 09:55:01 +0100)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-oct-24-2019

for you to fetch changes up to f4d200d0e55ebc4e9c9af50cb9317e2f6ebe9d0c:

  target/mips: Add support for emulation of CRC32 group of instructions (2019-10-24 13:00:37 +0200)

----------------------------------------------------------------

MIPS queue for October 24th, 2019

  - added emulation of R6 CRC32 instructions 
  - added several mostly cosmetic leanups
  - a checkpath warning is a false positive

----------------------------------------------------------------

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

Yongbok Kim (1):
  target/mips: Add support for emulation of CRC32 group of instructions

 .mailmap                 |    5 +-
 MAINTAINERS              |   18 +-
 disas/mips.c             |    8 +
 target/mips/helper.c     |  123 +-
 target/mips/helper.h     |  135 +-
 target/mips/msa_helper.c | 4244 +++++++++++++++++++++++++++++-----------------
 target/mips/op_helper.c  | 1032 +++++++----
 target/mips/translate.c  |  483 +++++-
 8 files changed, 4039 insertions(+), 2009 deletions(-)

-- 
2.7.4


