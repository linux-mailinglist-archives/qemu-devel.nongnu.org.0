Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CE12CB1B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 23:07:57 +0100 (CET)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilgj6-000712-Bq
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 17:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ilgUz-0007la-UG
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ilgUy-00049N-1i
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:21 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51753)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ilgUx-00046h-Fj
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:19 -0500
Received: by mail-wm1-x342.google.com with SMTP id d73so12639989wmd.1
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 13:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzUF3ERAhc2fjIEhSIp3E8yapDl6qfTx2RpX7Ty6cjQ=;
 b=kkJR48y0c3nbBv2IBiItrFj6LTQtD8e6kmp90lu9FG4onxuYBmJcsdTgLuraCs8lAS
 cEpVXh6Ni5yVvdwDRieuPTiRGVJPsgC7aRuKMfWVqtJJH5rfc/SmXDnc5L0uNTF34Kzb
 WFeL4Lj8ZfczPsR3gZLce247o4fZujhp14xyMnmZdP6M6EVVltNNZt278hw5/DAuw2nh
 DfjVmdhFeBus+5IJsjWh4+dWIa5UNUT2GjHsZuYK/x65YZSJ17WkyBP7MZP3MTGq2rLe
 MaWq647kaQF1IqKcOeKI3BM8o0b62eVXfgXcI6S4zEZsnvi+sh24Neb+m8GlgKRkt4On
 5QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzUF3ERAhc2fjIEhSIp3E8yapDl6qfTx2RpX7Ty6cjQ=;
 b=YWKdupVaNl2W2uDmguBo3+j3pJQINNz1V3EkQzREA4Uba93maX5N7foVnhJuu/EjOL
 dgIknQWvoV1Kzy7fJ1L/x5gv8MRnzbSCBnby0x0v7f1zcoQXv0v5pbNXEwTh4HcngMTI
 9JgeQYwe4rnNyDZ7d6KRryIgQppQ2vfCgn2CklIOPLeZnUkUaduaZzweQ17Jgz8sDFoh
 +lLpi+gCO6HOPh4lYZFTFPJaKkgRnRaIA8nUUy9iNvroENmuPsZLun2DBOWrwZj1AaGb
 IAqeCyOz+puJ3RhXrUx422l2Jrvunacg5BTviwPF22NS0YAcOxS7JhOHN6y58rSGhCY0
 liyw==
X-Gm-Message-State: APjAAAVGjdr///Vv0DOLqrpNXiFDP/vqNM22sjJCodISXMJ1ANSvTbg4
 Ma5YfNdnv1FaRho97CmhbhbDw/WJQmxWkA==
X-Google-Smtp-Source: APXvYqzismSj/Vh2Aul40OdanA3J5JJOd9IRT7DBSpmol7GHDF6I/2fAfelP21LIqVrfqVe4DaA+5g==
X-Received: by 2002:a05:600c:48a:: with SMTP id
 d10mr31125487wme.87.1577656397643; 
 Sun, 29 Dec 2019 13:53:17 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-183-93-3.red.bezeqint.net. [79.183.93.3])
 by smtp.gmail.com with ESMTPSA id 25sm18182850wmi.32.2019.12.29.13.53.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 29 Dec 2019 13:53:17 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v40 16/21] target/avr: Register AVR support with the rest of
 QEMU
Date: Sun, 29 Dec 2019 23:51:53 +0200
Message-Id: <20191229215158.5788-17-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191229215158.5788-1-mrolnik@gmail.com>
References: <20191229215158.5788-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add AVR related definitions into QEMU

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

include/disas/dis-asm.h
---
 qapi/machine.json          |  3 ++-
 include/disas/dis-asm.h    | 19 +++++++++++++++++++
 include/sysemu/arch_init.h |  1 +
 arch_init.c                |  2 ++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index ca26779f1a..8c6df54921 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -21,11 +21,12 @@
 #        is true even for "qemu-system-x86_64".
 #
 # ppcemb: dropped in 3.1
+# avr: since 5.0
 #
 # Since: 3.0
 ##
 { 'enum' : 'SysEmuTarget',
-  'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
+  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index e9c7dd8eb4..79bbc8b498 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -211,6 +211,25 @@ enum bfd_architecture
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
   bfd_arch_mn10300,    /* Matsushita MN10300 */
+  bfd_arch_avr,       /* Atmel AVR microcontrollers.  */
+#define bfd_mach_avr1       1
+#define bfd_mach_avr2       2
+#define bfd_mach_avr25      25
+#define bfd_mach_avr3       3
+#define bfd_mach_avr31      31
+#define bfd_mach_avr35      35
+#define bfd_mach_avr4       4
+#define bfd_mach_avr5       5
+#define bfd_mach_avr51      51
+#define bfd_mach_avr6       6
+#define bfd_mach_avrtiny    100
+#define bfd_mach_avrxmega1  101
+#define bfd_mach_avrxmega2  102
+#define bfd_mach_avrxmega3  103
+#define bfd_mach_avrxmega4  104
+#define bfd_mach_avrxmega5  105
+#define bfd_mach_avrxmega6  106
+#define bfd_mach_avrxmega7  107
   bfd_arch_cris,       /* Axis CRIS */
 #define bfd_mach_cris_v0_v10   255
 #define bfd_mach_cris_v32      32
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 62c6fe4cf1..893df26ce2 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,6 +24,7 @@ enum {
     QEMU_ARCH_NIOS2 = (1 << 17),
     QEMU_ARCH_HPPA = (1 << 18),
     QEMU_ARCH_RISCV = (1 << 19),
+    QEMU_ARCH_AVR = (1 << 20),
 };
 
 extern const uint32_t arch_type;
diff --git a/arch_init.c b/arch_init.c
index 705d0b94ad..6a741165b2 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -89,6 +89,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_UNICORE32
 #elif defined(TARGET_XTENSA)
 #define QEMU_ARCH QEMU_ARCH_XTENSA
+#elif defined(TARGET_AVR)
+#define QEMU_ARCH QEMU_ARCH_AVR
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
-- 
2.17.2 (Apple Git-113)


