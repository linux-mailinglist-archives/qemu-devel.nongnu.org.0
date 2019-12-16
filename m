Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2014120622
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:46:46 +0100 (CET)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igplt-0000M9-Gc
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1igpjP-0006kT-LJ
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1igpjO-0006wj-KL
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:11 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:57795 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1igpjO-0006vH-D9
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:10 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 118691A206A;
 Mon, 16 Dec 2019 13:43:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D62191A1D72;
 Mon, 16 Dec 2019 13:43:01 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] MAINTAINERS: Add a file to MIPS section
Date: Mon, 16 Dec 2019 13:42:52 +0100
Message-Id: <1576500172-11264-12-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

File tests/acceptance/linux_ssh_mips_malta.py is crucial for
entire MIPS platform, so add it to the MIPS section. The
maintainership will be shared with others.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1575982519-29852-6-git-send-email-aleksandar.markovic@rt-rk.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2af7313..740401b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -221,6 +221,7 @@ F: include/hw/intc/mips_gic.h
 F: include/hw/mips/
 F: include/hw/misc/mips_*
 F: include/hw/timer/mips_gictimer.h
+F: tests/acceptance/linux_ssh_mips_malta.py
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips
 
-- 
2.7.4


