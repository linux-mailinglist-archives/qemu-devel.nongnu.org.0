Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A402A4CF9F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 15:53:29 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdxVI-0001BQ-RG
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 09:53:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56659)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxLG-000201-29
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxBv-0004pp-L5
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:35:16 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45391 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdxBv-0004p1-BQ
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:33:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6701E1A44E8;
 Thu, 20 Jun 2019 15:33:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4A36E1A4163;
 Thu, 20 Jun 2019 15:33:23 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 15:33:11 +0200
Message-Id: <1561037595-14413-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 0/4] target/mips: Misc fixes and maintenance
 items for 4.1
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series contains miscelaneous fixes, improvements, and
maintainance items intended to be integrated into QEMU 4.1.
I will gradually add patches by the end of June 2019.

v3->v4:

  - removed six checkpatch warnings
  - update commit messages

v2->v3:

  - amendeded two patches on cleaning checkpatch warnings

v1->v2:

  - added two patches on cleaning checkpatch warnings


Aleksandar Markovic (4):
  MAINTAINERS: Update file items for MIPS Malta board
  MAINTAINERS: Consolidate MIPS disassembler-related items
  target/mips: Fix some space checkpatch errors in translate.c
  target/mips: Fix if-else-switch-case arms checkpatch errors in
    translate.c

 MAINTAINERS             |   6 +-
 target/mips/translate.c | 445 +++++++++++++++++++++++++++---------------------
 2 files changed, 257 insertions(+), 194 deletions(-)

-- 
2.7.4


