Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1B4C0BE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 20:23:33 +0200 (CEST)
Received: from localhost ([::1]:40992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdfF7-0002HK-1Z
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 14:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdfCL-0000Ne-0k
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdfCJ-000051-T4
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:40 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50525 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdfCJ-0008VI-Ma
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F30741A4541;
 Wed, 19 Jun 2019 20:20:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D15461A2079;
 Wed, 19 Jun 2019 20:20:36 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 20:20:18 +0200
Message-Id: <1560968418-21301-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560968418-21301-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1560968418-21301-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 2/2] MAINTAINERS: Consolidate MIPS
 disassembler-related items
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

Eliminate duplicate MIPS disassembler-related items in the
MAINTAINERS file, and use wildcards to shorten the list of
involved files.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 869e87b..f9f66e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -212,9 +212,7 @@ R: Aleksandar Rikalo <arikalo@wavecomp.com>
 S: Maintained
 F: target/mips/
 F: default-configs/*mips*
-F: disas/mips.c
-F: disas/nanomips.cpp
-F: disas/nanomips.h
+F: disas/*mips*
 F: hw/intc/mips_gic.c
 F: hw/mips/
 F: hw/misc/mips_*
@@ -2321,7 +2319,6 @@ M: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <arikalo@wavecomp.com>
 S: Maintained
 F: tcg/mips/
-F: disas/mips.c
 
 PPC TCG target
 M: Richard Henderson <rth@twiddle.net>
-- 
2.7.4


