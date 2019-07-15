Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE469CC7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 22:30:16 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn7bz-00045b-Gn
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 16:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bJ-0002Pw-Ar
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bI-00056E-7E
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:33 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:38295 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hn7bH-00054m-Vp
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1FA591A2090;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 05D241A1FA0;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 22:29:19 +0200
Message-Id: <1563222562-2755-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 0/3] MIPS queue for July 15th, 2019
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

The following changes since commit 5ea8ec2fcf57cb9af24ad2cf17b4d64adb03afdf:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-07-15' into staging (2019-07-15 16:11:47 +0100)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-jul-15-2019

for you to fetch changes up to 0d0304f2c4967c892a3216638fc4cb078afa2b44:

  target/mips: Add missing 'break' for certain cases of MTTR handling (2019-07-15 22:22:05 +0200)

----------------------------------------------------------------

MIPS queue for July 15th, 2019

Notes:

  - two patches from the serieas 'MIPS fixes for 4.1' did not get
  reviewed on time to be included for 4.1 rc1, so they are left
  possibly for 4.1 rc2

Highlights:

  - fixes for missing 'break' in switch statements

----------------------------------------------------------------

Aleksandar Markovic (3):
  target/mips: Add missing 'break' for a case of MTHC0 handling
  target/mips: Add missing 'break' for certain cases of MFTR handling
  target/mips: Add missing 'break' for certain cases of MTTR handling

 target/mips/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.7.4


