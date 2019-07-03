Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB85D5B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 19:54:14 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiMyr-00057g-Il
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 13:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLl0-0002uM-S2
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLko-0007op-32
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:35:42 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59808 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiLkn-0007jN-MR
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:35:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 59DE61A1DD1;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 3BFB41A2036;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 18:35:17 +0200
Message-Id: <1562085328-5126-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 01/12] tests/machine-none: Test recent MIPS cpus
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

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The MIPS I7200 got added in commit d45942d908e, and the I6500
in commit ca1ffd14ed8.
Extend the coverage on the little-endian machines.
The 4Kc and 20Kc are still covered by the big-endian machines.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190701140143.32706-1-philmd@redhat.com>
---
 tests/machine-none-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 4c6d470..5953d31 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -36,9 +36,9 @@ static struct arch2cpu cpus_map[] =3D {
     /* FIXME: { "microblaze", "any" }, doesn't work with -M none -cpu an=
y */
     /* FIXME: { "microblazeel", "any" }, doesn't work with -M none -cpu =
any */
     { "mips", "4Kc" },
-    { "mipsel", "4Kc" },
+    { "mipsel", "I7200" },
     { "mips64", "20Kc" },
-    { "mips64el", "20Kc" },
+    { "mips64el", "I6500" },
     { "moxie", "MoxieLite" },
     { "nios2", "FIXME" },
     { "or1k", "or1200" },
--=20
2.7.4


