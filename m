Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325E12064F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:51:52 +0100 (CET)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igpqp-0007xm-Jk
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1igpjR-0006l7-LK
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1igpjP-0006xd-LR
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:13 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:57797 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1igpjP-0006vI-Ed
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:44:11 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id ED41F1A20DF;
 Mon, 16 Dec 2019 13:43:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BEACE1A20FB;
 Mon, 16 Dec 2019 13:43:01 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] MAINTAINERS: Adjust maintainership for Fulong 2E board
Date: Mon, 16 Dec 2019 13:42:49 +0100
Message-Id: <1576500172-11264-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Change the maintainership for Fulong 2E board to improve its quality.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <1575982519-29852-3-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac686e2..8b059f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -976,8 +976,8 @@ S: Obsolete
 F: hw/mips/mips_r4k.c
=20
 Fulong 2E
+M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 M: Aleksandar Markovic <amarkovic@wavecomp.com>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
--=20
2.7.4


