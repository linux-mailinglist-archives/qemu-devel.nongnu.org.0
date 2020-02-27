Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B281718BE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:32:38 +0100 (CET)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JHJ-0005Ri-GJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDu-0001Wc-Qv
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDt-0005k5-PW
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:06 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:39097 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j7JDt-0004US-IX
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:05 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8D27D1A21BA;
 Thu, 27 Feb 2020 14:28:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 510E01A21B5;
 Thu, 27 Feb 2020 14:28:02 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] MAINTAINERS: Reactivate MIPS KVM CPUs
Date: Thu, 27 Feb 2020 14:27:33 +0100
Message-Id: <1582810056-22646-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582810056-22646-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1582810056-22646-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: peter.maydell@linaro.org, Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 amarkovic@wavecomp.com, James Hogan <jhogan@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Reactivate MIPS KVM maintainership with a modest goal of keeping
the support alive, checking common KVM code changes against MIPS
functionality, etc. (hence the status "Odd Fixes"), with hope that
this component will be fully maintained at some further, but not
distant point in future.

Cc: James Hogan <jhogan@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1582545058-31609-2-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf8c074..b084201 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -365,8 +365,8 @@ S: Maintained
 F: target/arm/kvm.c
=20
 MIPS KVM CPUs
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
-S: Orphan
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
+S: Odd Fixes
 F: target/mips/kvm.c
=20
 PPC KVM CPUs
--=20
2.7.4


