Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3A70558
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 18:23:31 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpb61-0001Jh-SY
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 12:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35419)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hpb5h-0000Wg-Tp
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hpb5e-0003rM-U1
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:23:08 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41829 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hpb5e-0003pP-Jr
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:23:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 69E331A20BB;
 Mon, 22 Jul 2019 18:23:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4E9D91A1FAC;
 Mon, 22 Jul 2019 18:23:00 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 18:22:51 +0200
Message-Id: <1563812573-30309-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v6 0/2] target/mips: Fixes for 4.1 rc2
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, philmd@redhat.com,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This includes fixes for a problems in switch statements found by GCC
8.3 improved code analysis features, and one big endian host fix.

v5->v6:

  - corrected the title to say 'rc2', not 'rc1'
  - amended commit message for patch #1 per Philippe's
    comments
  - added a r-b line

v4->v5:

  - three patches that got integrated in rc1 removed
  - patch on MSA pack instruction corrected
  - added r-b lines

v3->v4:

  - complete the last patch

v2->v3:

  - fix handling of MSA pack instructions on big endian host

v1->v2:

  - excluded the patch on "ucontext" that will go into linux user queue

Aleksandar Markovic (2):
  target/mips: Add 'fall through' comments for handling nanoMips' SHXS,
    SWXS
  target/mips: Fix emulation of MSA pack instructions on big endian
    hosts

 target/mips/msa_helper.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c  |  2 ++
 2 files changed, 76 insertions(+)

-- 
2.7.4


