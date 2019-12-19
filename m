Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB31264D7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:33:03 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwrO-0004yh-Lw
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ihwbb-0000C4-AX
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ihwba-0000ET-5U
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:43 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:60276 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ihwbZ-00046g-T9
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:16:42 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 99B3E1A2282;
 Thu, 19 Dec 2019 15:15:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 80B021A2190;
 Thu, 19 Dec 2019 15:15:38 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/mips: Correct data on deprecated r4k machine
Date: Thu, 19 Dec 2019 15:15:20 +0100
Message-Id: <1576764920-24514-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576764920-24514-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1576764920-24514-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.rikalo@rt-rk.com, Aleksandar Markovic <amarkovic@wavecomp.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Change the release since r4k machine is deprecated from 4.2 to 5.0.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 qemu-deprecated.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 62680f7..f71c740 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -254,7 +254,7 @@ The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
 
 @section System emulator machines
 
-@subsection mips r4k platform (since 4.2)
+@subsection mips r4k platform (since 5.0)
 
 This machine type is very old and unmaintained. Users should use the 'malta'
 machine type instead.
-- 
2.7.4


