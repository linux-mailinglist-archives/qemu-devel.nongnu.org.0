Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4771188F9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 13:58:33 +0100 (CET)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ief60-0003fB-1l
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 07:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ief4D-0002RC-A9
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ief4C-00039K-CK
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:41 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:57771 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ief4C-000395-5a
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:40 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 790DF1A21EB;
 Tue, 10 Dec 2019 13:55:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 480C21A21C7;
 Tue, 10 Dec 2019 13:55:42 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] MAINTAINERS: Add three files to Malta section
Date: Tue, 10 Dec 2019 13:55:18 +0100
Message-Id: <1575982519-29852-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575982519-29852-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1575982519-29852-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, philmd@redhat.com,
 Aleksandar Markovic <amarkovic@wavecomp.com>, aurelien@aurel32.net,
 hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Add two files that were recently introduced in a refactoring,
that Malta emulation relies on. They are added by this patch
to Malta section, but they are not added to the general MIPS
section, since they are really not MIPS-specific, and there
may be some non-MIPS hardware using them in future.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7803fe7..2af7313 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -959,8 +959,11 @@ M: Aleksandar Markovic <amarkovic@wavecomp.com>
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 S: Maintained
+F: hw/isa/piix4.c
+F: hw/acpi/piix4.c
 F: hw/mips/mips_malta.c
 F: hw/mips/gt64xxx_pci.c
+F: include/hw/southbridge/piix.h
 F: tests/acceptance/linux_ssh_mips_malta.py
=20
 Mipssim
--=20
2.7.4


