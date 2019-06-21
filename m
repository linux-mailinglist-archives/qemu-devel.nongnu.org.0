Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16834E534
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:58:34 +0200 (CEST)
Received: from localhost ([::1]:57790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heGJV-0007sl-QI
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53563)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1heGHB-0006XV-2S
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1heGH7-0005cT-WF
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:56:09 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52948 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1heGH7-0004wk-QZ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:56:05 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6E5FC1A1E46;
 Fri, 21 Jun 2019 11:54:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2ABF21A217C;
 Fri, 21 Jun 2019 11:54:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:54:39 +0200
Message-Id: <1561110888-14022-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561110888-14022-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561110888-14022-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 01/10] MAINTAINERS: Update file items for MIPS
 Malta board
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

hw/mips/gt64xxx_pci.c is used for Malta only, so it is logical to
place this file in Malta board section of the MAINTAINERS file.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1561037595-14413-2-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d32c5c2..64b7576 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -930,6 +930,7 @@ M: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <arikalo@wavecomp.com>
 S: Maintained
 F: hw/mips/mips_malta.c
+F: hw/mips/gt64xxx_pci.c
 F: tests/acceptance/linux_ssh_mips_malta.py
=20
 Mipssim
--=20
2.7.4


