Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A52B5E9D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:49:04 +0100 (CET)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezTr-0001d9-59
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kezRv-0000jj-9j; Tue, 17 Nov 2020 06:47:03 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kezRt-000089-Ic; Tue, 17 Nov 2020 06:47:03 -0500
Received: by mail-wr1-x442.google.com with SMTP id r17so22890884wrw.1;
 Tue, 17 Nov 2020 03:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BUzHDIJvM7T4wLFIeN2N+aVQfm+vrWPFdkmupYjZjVY=;
 b=EUcgOXvHEtCCUt7vHYKnKzgwKD/COPfVB868020gMgHQOsHREefLEiHhoiqAIVURX6
 0FJLbvts3BrO+9jlfypwTvGOqcSPuuLrT60PO7yVxarnpmCe2nr5/JQA0Avm+g22KxXG
 oslW7Yqc/zyjX6M/dRDqxxtO4NgpsKquoIEPxru0BZeDJWwikgtAQxh1eRNR0kJZ31+L
 hPBqvgjp+8qWaZM9gkYXsCW4OTu13bcJVNeS0LfqDWkwXZR02HvP9mfXgLRtGTFLewXN
 x0PDRBFjjLK+C/lUAXzS/ZIF/hBCXd9J+HP7l1gzRf7JHvQ0BBZmjEHMqFCtFsoh1wRp
 09rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BUzHDIJvM7T4wLFIeN2N+aVQfm+vrWPFdkmupYjZjVY=;
 b=nAJ5egN/W6KnoZ7XqbrWk2j5tZBdGQ3UBT1OXc1BAyZ0Cflmz9/YJrqzkCPbYNV1N2
 Nh/XpiNwYPpmHexME5G9jSBbKgtQUaLhf8jvhqIxrBHUZNFrU3yWUrTQ+l5wU3NyREc6
 ZFugt/isKI0zURDOzhhztEST3nS7KMVDzI3co1bCd5UhJdwgwD+Ic/xakzq5BbVQYPiK
 sZW7kqcwHLDbXmWq5pdWSXFkzGgQbJnlrPBQH1+lOoqwKqkdoSn3DB5IjEJlY43IrHOJ
 hQRd7QCiB537lop/6hFmy8ODHpTYGJrPJv37j7syiITSemfffrbFzh3iNKtfQQQEo8Tf
 J34w==
X-Gm-Message-State: AOAM530H+/cRocefdDoQRm3baKAM4Aweu2/KbwWCAOtv6kCDL0PU46b5
 CSyo3K1Ums0vynFdF9Ovvc8nqUR3vlI=
X-Google-Smtp-Source: ABdhPJwrIxHbUWYVnuYtWPdx5Jb32uLtzmWiQHIjFt1W+XVm+kJn/oBIfD5bDrA+SUUzyv9JwSLESw==
X-Received: by 2002:adf:f041:: with SMTP id t1mr25026819wro.139.1605613618687; 
 Tue, 17 Nov 2020 03:46:58 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 35sm27419340wro.71.2020.11.17.03.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 03:46:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2?] MAINTAINERS: Fix default-configs/ entries
Date: Tue, 17 Nov 2020 12:46:56 +0100
Message-Id: <20201117114656.1222555-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the F: line after the Meson refactor.

Fixes: 1bb4cb1c338..73362fc0b0c ("default-configs: ...")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e018a0c1da..6378b5ae416 100644
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
@@ -226,7 +226,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: default-configs/*mips*
+F: default-configs/*/*mips*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: hw/intc/mips_gic.c
@@ -250,7 +250,7 @@ S: Maintained
 F: target/moxie/
 F: disas/moxie.c
 F: hw/moxie/
-F: default-configs/moxie-softmmu.mak
+F: default-configs/*/moxie-softmmu.mak
 
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
@@ -260,7 +260,7 @@ F: target/nios2/
 F: hw/nios2/
 F: hw/intc/nios2_iic.c
 F: disas/nios2.c
-F: default-configs/nios2-softmmu.mak
+F: default-configs/*/nios2-softmmu.mak
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
@@ -353,7 +353,7 @@ F: hw/xtensa/
 F: tests/tcg/xtensa/
 F: disas/xtensa.c
 F: include/hw/xtensa/xtensa-isa.h
-F: default-configs/xtensa*.mak
+F: default-configs/*/xtensa*.mak
 
 TriCore TCG CPUs
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
@@ -1018,7 +1018,7 @@ AVR MCUs
 M: Michael Rolnik <mrolnik@gmail.com>
 R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
-F: default-configs/avr-softmmu.mak
+F: default-configs/*/avr-softmmu.mak
 F: hw/avr/
 F: include/hw/char/avr_usart.h
 F: hw/char/avr_usart.c
@@ -1047,7 +1047,7 @@ HP B160L
 M: Richard Henderson <richard.henderson@linaro.org>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
-F: default-configs/hppa-softmmu.mak
+F: default-configs/*/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
@@ -1420,7 +1420,7 @@ F: hw/s390x/
 F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
-F: default-configs/s390x-softmmu.mak
+F: default-configs/*/s390x-softmmu.mak
 T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
@@ -2792,13 +2792,13 @@ F: accel/tcg/user-exec*.c
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
2.26.2


