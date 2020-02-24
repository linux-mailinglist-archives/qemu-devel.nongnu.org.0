Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587516A590
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 12:54:09 +0100 (CET)
Received: from localhost ([::1]:35295 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6CJM-0007BU-7g
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 06:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j6CHi-00052M-Ij
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j6CHh-0004cL-N5
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:52:26 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:56983 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j6CHh-0004Gn-GO
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:52:25 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2F0CD1A1EAC;
 Mon, 24 Feb 2020 12:51:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 017651A1EA6;
 Mon, 24 Feb 2020 12:51:22 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Reactivate MIPS KVM CPUs
Date: Mon, 24 Feb 2020 12:50:58 +0100
Message-Id: <1582545058-31609-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582545058-31609-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1582545058-31609-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: James Hogan <jhogan@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Reactivate MIPS KVM maintainership with a modest goal of keeping
the support alive, checking common KVM code changes against MIPS
functionality, etc. (hence the status "Odd Fixes"), with hope that
this component will be fully maintained at some further, but not
distant point in future.

CC: James Hogan <jhogan@kernel.org>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0728c8..9cc55d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -365,8 +365,8 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS KVM CPUs
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
-S: Orphan
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
+S: Odd Fixes
 F: target/mips/kvm.c
 
 PPC KVM CPUs
-- 
2.7.4


