Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4984CF9E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 15:53:17 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdxV6-0000SL-Je
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 09:53:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57206)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxLE-0002eg-VR
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxBy-0004qs-LY
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:35:19 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45625 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdxBy-0004qF-1r
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:33:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 263E31A4766;
 Thu, 20 Jun 2019 15:33:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 02D3F1A4558;
 Thu, 20 Jun 2019 15:33:27 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 15:33:13 +0200
Message-Id: <1561037595-14413-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561037595-14413-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561037595-14413-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 2/4] MAINTAINERS: Consolidate MIPS
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
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
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


