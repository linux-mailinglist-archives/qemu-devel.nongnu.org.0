Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67264CB49
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:47:06 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdter-0000i8-Rk
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdtEn-0004P7-UM
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdtEl-0000kZ-Fk
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:20:08 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35317 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdtEl-0000iF-4W
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 05:20:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7BAD91A4167;
 Thu, 20 Jun 2019 11:20:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4B4291A23C4;
 Thu, 20 Jun 2019 11:20:03 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 11:19:52 +0200
Message-Id: <1561022396-20649-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/4] target/mips: Misc fixes and maintenance
 for 4.1
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

v1->v2:

  - added two patches on cleaning checkpatch warnings

Aleksandar Markovic (4):
  MAINTAINERS: Update file items for MIPS Malta board
  MAINTAINERS: Consolidate MIPS disassembler-related items
  target/mips: Fix some space checkpatch errors in translate.c
  target/mips: Fix if-else arms checkpatch errors in translate.c

 MAINTAINERS             |   6 +-
 target/mips/translate.c | 232 +++++++++++++++++++++++++++---------------------
 2 files changed, 133 insertions(+), 105 deletions(-)

-- 
2.7.4


