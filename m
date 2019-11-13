Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9BFB1C1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 14:51:23 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUt3K-0002Xo-6R
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 08:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iUt0c-0000lZ-Tj
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 08:48:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iUt0a-0005LD-NL
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 08:48:34 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:47725 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iUt0Y-0004vr-ND
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 08:48:32 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F358A1A2253;
 Wed, 13 Nov 2019 14:47:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C900E1A2292;
 Wed, 13 Nov 2019 14:47:19 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] MAINTAINERS: Adjust maintainership for R4000 systems
Date: Wed, 13 Nov 2019 14:47:05 +0100
Message-Id: <1573652826-23987-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573652826-23987-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1573652826-23987-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, hpoussin@reactos.org, amarkovic@wavecomp.com,
 aleksandar.rikalo@rt-rk.com, philmd@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Change the maintainership for R4000 systems to improve its quality.

Acked-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6afec32..ba9ca98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -971,8 +971,9 @@ F: hw/mips/mips_mipssim.c
 F: hw/net/mipsnet.c
=20
 R4000
-M: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
+R: Aurelien Jarno <aurelien@aurel32.net>
+R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
 S: Maintained
 F: hw/mips/mips_r4k.c
=20
--=20
2.7.4


