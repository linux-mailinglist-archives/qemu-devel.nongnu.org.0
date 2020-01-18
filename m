Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B814193B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 20:41:38 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1istyT-0004QS-It
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 14:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1istfR-0006W6-H5
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1istfP-0007nU-QR
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:56 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36243)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1istfP-0007ma-A3
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:55 -0500
Received: by mail-wr1-x444.google.com with SMTP id z3so25753233wru.3
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 11:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/uYPTbZi5GeID8IkJbTa8iPY1aSdd1sKIGwyUQSAnE=;
 b=pLtg9OI0lVjqSq7iaDvQQe47SmB+6oJY2DQ/rL3EO9m9UDjTEiUe+kZymj0n2AvWxd
 zmChXbuWqu7AjN0Ee5RvOeJCnFqG7ngM2t0zHraIZBygzP6SBEdLB7wJRZumetNZbvG8
 ep3BIQGHdHqw4tOSW3bQWt224R19Hmvj9YtA+9Uu4Vs48clq+MwP8wSyaYHf4sSQA1oI
 2qLqEtpKER0AjMEQNnj8tELR3FKuMwe1fYl4gLIRX6LXNhdzr5kyqdXP7tlE3I7XLzJ7
 aW316RQyQeGVV/KbPHcoAiPYiFltDPXnIx7R4rUQwC0y17m4NXWlOZL4r2Eu2iygVnpV
 7x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/uYPTbZi5GeID8IkJbTa8iPY1aSdd1sKIGwyUQSAnE=;
 b=OTYlTbA1gzWyafj2Gc0PLA1WprPxF5srMrVutIjY3pqpCALtdBnSm8xLZ7e5z2WayF
 rCOiuSTnYZubRHD68DU3J3lZVn9ZyI3cXFz+ZwA9XLEO6obllmzOh5EENcfu62ie+G12
 JBL76J+PIUD0/AMr0HLEaahUcNrhP/gpwSQ0Ck79loPiRh2b3BwEfUbS1DWUXh0j3n/C
 iCxR6zfNJZ05/BlCr0OVYPzRgbp8HGw9XH9lQOMYSGrQpz9+yNnmJcN1Qr85cc0KwdlC
 eqhvHDHVD5X2OESCdocPshpGnXvIVstvkFsLNn82YQ4KaqOnzc0wgw3MAbnCCaPktXXO
 yj4g==
X-Gm-Message-State: APjAAAVgum7Q7wMTgPzhdOmIcTNr4xz3uGF17Vx0toKFpRBTta00JaWn
 MSWJNiFbW1rISdbnx6M26J8l8MUrjh85p7AW
X-Google-Smtp-Source: APXvYqwlLaBa+vf9SfbKr2Ze4Ee4eVU4w/56rxfTcu10qUT/usYzuc1USHaRepmire0l4cm+yx/1BA==
X-Received: by 2002:adf:b605:: with SMTP id f5mr9385028wre.383.1579375314144; 
 Sat, 18 Jan 2020 11:21:54 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-108-13.red.bezeqint.net. [109.65.108.13])
 by smtp.gmail.com with ESMTPSA id o16sm2875468wmc.18.2020.01.18.11.21.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 18 Jan 2020 11:21:53 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v41 19/21] target/avr: Add boot serial test
Date: Sat, 18 Jan 2020 21:14:14 +0200
Message-Id: <20200118191416.19934-20-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200118191416.19934-1-mrolnik@gmail.com>
References: <20200118191416.19934-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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

Print out 'T' through serial port

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>

tests/Makefile.include
---
 tests/qtest/boot-serial-test.c | 10 ++++++++++
 tests/qtest/Makefile.include   |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 05c7f44457..e556f09db8 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -16,6 +16,15 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+static const uint8_t bios_avr[] = {
+    0x88, 0xe0,             /* ldi r24, 0x08   */
+    0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
+    0x86, 0xe0,             /* ldi r24, 0x06   */
+    0x80, 0x93, 0xc2, 0x00, /* sts 0x00C2, r24 ; Set the data bits to 8 */
+    0x84, 0xe5,             /* ldi r24, 0x54   */
+    0x80, 0x93, 0xc6, 0x00, /* sts 0x00C6, r24 ; Output 'T' */
+};
+
 static const uint8_t kernel_mcf5208[] = {
     0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
     0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
@@ -103,6 +112,7 @@ typedef struct testdef {
 
 static testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
+    { "avr", "sample", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "ppc", "ppce500", "", "U-Boot" },
     { "ppc", "40p", "-vga none -boot d", "Trying cd:," },
     { "ppc", "g3beige", "", "PowerPC,750" },
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index e6bb4ab28c..4817b6320f 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -65,6 +65,8 @@ check-qtest-i386-y += numa-test
 
 check-qtest-x86_64-y += $(check-qtest-i386-y)
 
+check-qtest-avr-y += boot-serial-test
+
 check-qtest-alpha-y += boot-serial-test
 check-qtest-alpha-$(CONFIG_VGA) += display-vga-test
 
-- 
2.17.2 (Apple Git-113)


