Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A3155088
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 03:09:37 +0100 (CET)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izt5K-0005n6-00
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 21:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvm-0006Ij-1e
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvj-0001M6-J4
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:41 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53212 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1izsvj-0001AN-9k
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id EF13F1A1FEE;
 Fri,  7 Feb 2020 02:58:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C04651A212D;
 Fri,  7 Feb 2020 02:58:23 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc5 30/32] .travis.yml: Run the AVR acceptance tests
Date: Fri,  7 Feb 2020 02:57:58 +0100
Message-Id: <1581040680-308-31-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

We have one test so far, and it is very fast:

  $ avocado --show=3Dapp run -t arch:avr tests/acceptance/
  (1/1) tests/acceptance/machine_avr6.py:AVR6Machine.test_freertos: PASS =
(2.13 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
  JOB TIME   : 2.30 s

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Reviewed-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 6c0ec6c..72615ae 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -313,7 +313,7 @@ matrix:
     # Acceptance (Functional) tests
     - name: "GCC check-acceptance"
       env:
-        - CONFIG=3D"--target-list=3Dx86_64-softmmu,mips-softmmu,mips64el=
-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-soft=
mmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
+        - CONFIG=3D"--target-list=3Dx86_64-softmmu,mips-softmmu,mips64el=
-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-soft=
mmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu,avr-softmmu"
         - TEST_CMD=3D"make check-acceptance"
       after_script:
         - python3 -c 'import json; r =3D json.load(open("tests/results/l=
atest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["sta=
tus"] not in ("PASS", "SKIP")]' | xargs cat
--=20
2.7.4


