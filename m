Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E169C35
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 22:02:47 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn7BO-0000rP-4I
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 16:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50771)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn79e-0003Nw-SS
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn79d-0003LN-Gm
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:00:58 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:37414 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hn79d-0003IR-4e
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:00:57 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 505A61A20B1;
 Mon, 15 Jul 2019 22:00:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2E3661A1FA4;
 Mon, 15 Jul 2019 22:00:53 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 22:00:42 +0200
Message-Id: <1563220847-14630-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v4 0/5] target/mips: Fixes for 4.1 rc1
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

At the moment, this includes fixes for problems in switch statements
found by GCC 8.3 improved code analysis features, and one big endian
host fix.

v3->v4:

  - complete the last patch

v2->v3:

  - fix handling of MSA pack instructions on big endian host

v1->v2:

  - excluded the patch on "ucontext" that will go into linux user queue

Aleksandar Markovic (5):
  target/mips: Add 'fall through' comments for handling nanoMips' SHXS,
    SWXS
  target/mips: Add missing 'break' for a case of MTHC0 handling
  target/mips: Add missing 'break' for certain cases of MFTR handling
  target/mips: Add missing 'break' for certain cases of MTTR handling
  target/mips: Fix emulation of MSA pack instructions on big endian
    hosts

 target/mips/msa_helper.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c  |  7 +++++
 2 files changed, 81 insertions(+)

-- 
2.7.4


