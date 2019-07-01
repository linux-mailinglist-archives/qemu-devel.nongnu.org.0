Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE9375C0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 15:54:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYsqO-0001pm-Qr
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 09:54:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mateja.marjanovic@rt-rk.com>) id 1hYsl1-0006Is-NR
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mateja.marjanovic@rt-rk.com>) id 1hYsj4-0000vH-O3
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:46:44 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56647 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mateja.marjanovic@rt-rk.com>)
	id 1hYsj4-0003Tu-EB
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:46:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 9360C1A21B0;
	Thu,  6 Jun 2019 15:45:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw310-lin.domain.local (rtrkw310-lin.domain.local
	[10.10.13.110])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 782A41A2183;
	Thu,  6 Jun 2019 15:45:36 +0200 (CEST)
From: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 15:45:31 +0200
Message-Id: <1559828732-23081-1-git-send-email-mateja.marjanovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH] target/mips: Add implementation of DSPRAM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, aurelien@aurel32.net, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>

This patch is a merge of Yongbok Kim's DSPRAM implementation
with the upstream, with some of Philippe Mathieu-Daude's comments.
It still needs some fixing (work in progress).

Mateja Marjanovic (1):
  target/mips: Add implementation of DSPRAM

 default-configs/mips-softmmu-common.mak |   1 +
 hw/mips/cps.c                           |  28 +++++-
 hw/misc/Makefile.objs                   |   1 +
 hw/misc/mips_dspram.c                   | 153 ++++++++++++++++++++++++++++++++
 include/hw/mips/cps.h                   |   2 +
 include/hw/misc/mips_dspram.h           |  46 ++++++++++
 target/mips/cpu.h                       |   9 +-
 target/mips/internal.h                  |   3 +-
 target/mips/op_helper.c                 |  14 +++
 target/mips/translate.c                 |   8 ++
 target/mips/translate_init.inc.c        |   2 +
 11 files changed, 262 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/mips_dspram.c
 create mode 100644 include/hw/misc/mips_dspram.h

-- 
2.7.4


