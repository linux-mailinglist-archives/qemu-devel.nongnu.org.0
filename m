Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A914C189
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 21:20:50 +0100 (CET)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwXLt-0006tu-LZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 15:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKe-0005Mj-Sm
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKc-00019h-Vi
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:32 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:41530 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iwXKc-0006gb-P2
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:30 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5F02A1A1FC9;
 Tue, 28 Jan 2020 21:09:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 47C2F1A1E9A;
 Tue, 28 Jan 2020 21:09:44 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] target/mips: Rectify documentation on deprecating r4k
 machine
Date: Tue, 28 Jan 2020 21:09:16 +0100
Message-Id: <1580242161-20333-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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

Change the documented (in file qemu-deprecated.texi) release since
r4k machine is deprecated from 4.2 to 5.0.

Fixes: d32dc61421b

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1579883929-1517-2-git-send-email-aleksandar.markovic@rt-rk.c=
om>
---
 qemu-deprecated.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 0968d37..3d2a8ff 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -260,7 +260,7 @@ The 'scsi-disk' device is deprecated. Users should us=
e 'scsi-hd' or
=20
 @section System emulator machines
=20
-@subsection mips r4k platform (since 4.2)
+@subsection mips r4k platform (since 5.0)
=20
 This machine type is very old and unmaintained. Users should use the 'ma=
lta'
 machine type instead.
--=20
2.7.4


