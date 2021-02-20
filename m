Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2007632055B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:38:10 +0100 (CET)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRWT-0001GT-6T
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUH-00074O-6S; Sat, 20 Feb 2021 07:35:53 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003Om-1Q; Sat, 20 Feb 2021 07:35:52 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N18MG-1lyRAk0IuI-012UgL; Sat, 20 Feb 2021 13:35:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] MAINTAINERS: Fix default-configs/ entries
Date: Sat, 20 Feb 2021 13:35:25 +0100
Message-Id: <20210220123525.1353731-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GMWVN9p4E1Ugcqb1732RUQMkEhfsk47oEwSLOiRrDPpZhxPPVvQ
 LHNy2TnRQIvY4SR7n6pdRnmJwzNpHpPoFdnW+IcilBY5BfGacSktZmMybD/bnXvEQY6z2lo
 NTPjqC0iabx5Uv2PXb7FnRZLcU8YTeETO9ePGyMIo2ELQRt4M+SIbuG9PteypcY7BoIv2Jc
 fYW7LyBiCezMkMJfDbblQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pq7tLwybG5o=:LeUFuyW6haQ6fkaY0MRVP2
 xEiPzZXYZzmUdL6FO99rbab40QNTy430nfyxwOdGBPLfANc3QfHsNeSW/wnxwoa/9+ylUxyjY
 /w7qcdeX2jXwLIGIgSCEj+HPb6RyFCbzc8D5TmtynbB7dpmutfGLfouClY1RIEZy3BCrJld2u
 JHI6Jy+2CJwl1NPS8nBFs0ZI4OgNQJi+UI7ak1OLzKn6WJUwKL2xywn7fOexc0PdANV5lFqEG
 PsMR9DbIUu56BLoLsucnEr56hpdLR72zazfpnm/zc+N2gRlNAWaMy1EPWa6Gjvc72hiPcTN2p
 3kp4cGlPjepm2lddd48omQ0rLUdiXJVdw0B2vdHtEk3sbR7CXFhW0AE6delQHolF/0R/3dsG/
 k+eknfsbEWviKEZ6uzkppdTr6LCANUmigxB1aESYS2OwFfvNZXicitqHlhzgxi/XBqnxB+AON
 4mFy9afpcQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Update the F: line after the Meson refactor.

Fixes: 1bb4cb1c338..73362fc0b0c ("default-configs: ...")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201117114656.1222555-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3d22d32d3de..c6f83ecd35d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -87,7 +87,7 @@ S390 general architecture support
 M: Cornelia Huck <cohuck@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Supported
-F: default-configs/s390x-softmmu.mak
+F: default-configs/*/s390x-softmmu.mak
 F: gdb-xml/s390*.xml
 F: hw/char/sclp*.[hc]
 F: hw/char/terminal3270.c
@@ -239,7 +239,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: default-configs/*mips*
+F: default-configs/*/*mips*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: hw/intc/mips_gic.c
@@ -263,7 +263,7 @@ S: Maintained
 F: target/moxie/
 F: disas/moxie.c
 F: hw/moxie/
-F: default-configs/moxie-softmmu.mak
+F: default-configs/*/moxie-softmmu.mak
 
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
@@ -272,7 +272,7 @@ S: Maintained
 F: target/nios2/
 F: hw/nios2/
 F: disas/nios2.c
-F: default-configs/nios2-softmmu.mak
+F: default-configs/*/nios2-softmmu.mak
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
@@ -367,7 +367,7 @@ F: hw/xtensa/
 F: tests/tcg/xtensa/
 F: disas/xtensa.c
 F: include/hw/xtensa/xtensa-isa.h
-F: default-configs/xtensa*.mak
+F: default-configs/*/xtensa*.mak
 
 TriCore TCG CPUs
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
@@ -1038,7 +1038,7 @@ AVR MCUs
 M: Michael Rolnik <mrolnik@gmail.com>
 R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
-F: default-configs/avr-softmmu.mak
+F: default-configs/*/avr-softmmu.mak
 F: hw/avr/
 F: include/hw/char/avr_usart.h
 F: hw/char/avr_usart.c
@@ -1067,7 +1067,7 @@ HP B160L
 M: Richard Henderson <richard.henderson@linaro.org>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
-F: default-configs/hppa-softmmu.mak
+F: default-configs/*/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
@@ -1458,7 +1458,7 @@ F: hw/s390x/
 F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
-F: default-configs/s390x-softmmu.mak
+F: default-configs/*/s390x-softmmu.mak
 F: tests/acceptance/machine_s390_ccw_virtio.py
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
@@ -2887,13 +2887,13 @@ F: accel/tcg/user-exec*.c
 BSD user
 S: Orphan
 F: bsd-user/
-F: default-configs/*-bsd-user.mak
+F: default-configs/targets/*-bsd-user.mak
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: linux-user/
-F: default-configs/*-linux-user.mak
+F: default-configs/targets/*linux-user.mak
 F: scripts/qemu-binfmt-conf.sh
 F: scripts/update-syscalltbl.sh
 F: scripts/update-mips-syscall-args.sh
-- 
2.29.2


