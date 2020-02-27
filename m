Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE41718BB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:31:30 +0100 (CET)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JGD-0003VZ-DH
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDs-0001Qu-0m
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDq-0005iD-Vv
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:03 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:38951 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j7JDq-0004TV-PH
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:02 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7F55C1A20E7;
 Thu, 27 Feb 2020 14:27:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 54F081A20E4;
 Thu, 27 Feb 2020 14:27:59 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] MAINTAINERS: Orphan MIPS KVM CPUs
Date: Thu, 27 Feb 2020 14:27:32 +0100
Message-Id: <1582810056-22646-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582810056-22646-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1582810056-22646-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, amarkovic@wavecomp.com,
 James Hogan <jhogan@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: James Hogan <jhogan@kernel.org>

I haven't been active for 18 months, and don't have the hardware set up
to test KVM for MIPS, so mark it as orphaned and remove myself as
maintainer. Hopefully somebody from MIPS can pick this up.

Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: James Hogan <jhogan@kernel.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20191221155306.49221-1-jhogan@kernel.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36d94c1..bf8c074 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -365,9 +365,8 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS KVM CPUs
-M: James Hogan <jhogan@kernel.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
-S: Maintained
+S: Orphan
 F: target/mips/kvm.c
 
 PPC KVM CPUs
-- 
2.7.4


