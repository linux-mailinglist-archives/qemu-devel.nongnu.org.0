Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F63514187
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:46:00 +0200 (CEST)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIVz-0007vs-Vt
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIY-0006sT-7z
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:06 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIU-0002SM-RF
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206721; x=1682742721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TtDY3CHKP2waEqDCea7I9yXsodX/+MOu8SOL2DWRJc=;
 b=KmlgxjVKeTDIIDTqehSUyaU2eybYLI17g5UbEZ/oQW53VeXoP+cSG9sc
 A21BW/pw9TVekHsdka+l7oba0BF98WuZj3SFhiHOXOtbt7AUoLZV+f1Vh
 8h7Dcw64bzIP5yklf3ORurkJYyAyJae1OfvqbcLcqQRW5/egm0KIL+myB
 W74YjsFVYdmBywqUY1RdT7EhbUr7s2vu2eT7279pxdRZW7lmq+rudoVc1
 aY4XvM6sihQWkBZJeq7xbIduMSNAY3JtSUOh6BnxtfQeNgY5k+ajSgbW5
 ZjyboiKHFGSoqnwpXoTXsX9Q5qO/jmjb5jrz7gXDkFsX0qAB7TJyVBPSj A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995921"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:00 +0800
IronPort-SDR: 0mfAYJQdhuHpmU8YuMkhZhlBzKAtF1VoysxnRDiead4Tr3CbXoYhMK2l0ny9dP1rL5/jnNfAk7
 /Axwb6Qf4d42V50E9YzmT/aTH1+CGnlL8oipjiuKuyudoZ9sWdYdHxzE/Fokpu95qEpx8QWca3
 a1bK6u8UOpu4VNXAeYZjwsmi6aHmnVuJUq5RPoyRwuot+MLM/T0sqY4Zhrmzi0/iPFzcEq9gPL
 Pw7ouOTvX0FlL36C/EdOfa4pkqVcBxzf/ysZK2D77B8Pz3uEVKdyTWf3STaGIv8PNlkjLEIXpA
 Ibok4UYWDImMklTAfY4YOw7L
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:10 -0700
IronPort-SDR: JCrtPI71KMAxj6vzLmbwmlCGwib+U+QBPJQDZChmG4iEKCHZbxiGykMfGcy5PwJeCDciG/Dqr6
 USkDDVt1Mh3We5ockEwW4TupTP5J2N01hw7McvVhQQHHZCYNokTYxUP7hkvGyiIEyLkAlwWLni
 CxRtC2HAcR6jYdsfZmBvVJSuZQ2EGhspwDVoON6D6JClD20Gyaklk29xqlAgGfuu4DJwW/1qbi
 4N3BzlIu5FUohghuH1imWSbzaBsKvutJE50KPZWwwtFoI4cIuzskMVZ43kW52OX1heHaUub1u6
 M+Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMP1YjXz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1651206720; x=1653798721; bh=+TtDY3C
 HKP2waEqDCea7I9yXsodX/+MOu8SOL2DWRJc=; b=Xtw7cT1CGgHZuOdYLx8GCP/
 yih2PB5NYy0XXicKgIoHBeb044T8EQFMm+eUdxZhUnh1ldRKcCrhlcaxuqjuZwNS
 XgCspCktlC60uETHCFdzm3Fx27RS36qyaTr59G1gIUO6D/4y1DWSmtgGNxDjRpKw
 Ko/2cmJTqiqZ8GRnI/SJibZnY1mj/9HygCsU9TCHtTrgK4VXwD2dO6XeblORmWSo
 gKzLq2gLf5AV+Rr30tYfS8jm7+zPLtpZiUDXzqYMT0SMM8A7EI9dnE5NJ1UWXF1C
 MBhiRs5i39cFHa0PiQ2RdnMe83v7ZdSLiVqg/yhpW2NX/lfF2A3leY2EOI6LPkQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0NzMcT32QPg2 for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMK45zhz1SVny;
 Thu, 28 Apr 2022 21:31:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/25] crypto: move sm4_sbox from target/arm
Date: Fri, 29 Apr 2022 14:31:02 +1000
Message-Id: <20220429043119.1478881-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Weiwei Li <liweiwei@iscas.ac.cn>

   - share it between target/arm and target/riscv

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220423023510.30794-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/crypto/sm4.h       |  6 +++++
 crypto/sm4.c               | 49 ++++++++++++++++++++++++++++++++++++++
 target/arm/crypto_helper.c | 36 +---------------------------
 crypto/meson.build         |  1 +
 4 files changed, 57 insertions(+), 35 deletions(-)
 create mode 100644 include/crypto/sm4.h
 create mode 100644 crypto/sm4.c

diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
new file mode 100644
index 0000000000..9bd3ebc62e
--- /dev/null
+++ b/include/crypto/sm4.h
@@ -0,0 +1,6 @@
+#ifndef QEMU_SM4_H
+#define QEMU_SM4_H
+
+extern const uint8_t sm4_sbox[256];
+
+#endif
diff --git a/crypto/sm4.c b/crypto/sm4.c
new file mode 100644
index 0000000000..9f0cd452c7
--- /dev/null
+++ b/crypto/sm4.c
@@ -0,0 +1,49 @@
+/*
+ * QEMU crypto sm4 support
+ *
+ * Copyright (C) 2013 - 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "crypto/sm4.h"
+
+uint8_t const sm4_sbox[] =3D {
+    0xd6, 0x90, 0xe9, 0xfe, 0xcc, 0xe1, 0x3d, 0xb7,
+    0x16, 0xb6, 0x14, 0xc2, 0x28, 0xfb, 0x2c, 0x05,
+    0x2b, 0x67, 0x9a, 0x76, 0x2a, 0xbe, 0x04, 0xc3,
+    0xaa, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99,
+    0x9c, 0x42, 0x50, 0xf4, 0x91, 0xef, 0x98, 0x7a,
+    0x33, 0x54, 0x0b, 0x43, 0xed, 0xcf, 0xac, 0x62,
+    0xe4, 0xb3, 0x1c, 0xa9, 0xc9, 0x08, 0xe8, 0x95,
+    0x80, 0xdf, 0x94, 0xfa, 0x75, 0x8f, 0x3f, 0xa6,
+    0x47, 0x07, 0xa7, 0xfc, 0xf3, 0x73, 0x17, 0xba,
+    0x83, 0x59, 0x3c, 0x19, 0xe6, 0x85, 0x4f, 0xa8,
+    0x68, 0x6b, 0x81, 0xb2, 0x71, 0x64, 0xda, 0x8b,
+    0xf8, 0xeb, 0x0f, 0x4b, 0x70, 0x56, 0x9d, 0x35,
+    0x1e, 0x24, 0x0e, 0x5e, 0x63, 0x58, 0xd1, 0xa2,
+    0x25, 0x22, 0x7c, 0x3b, 0x01, 0x21, 0x78, 0x87,
+    0xd4, 0x00, 0x46, 0x57, 0x9f, 0xd3, 0x27, 0x52,
+    0x4c, 0x36, 0x02, 0xe7, 0xa0, 0xc4, 0xc8, 0x9e,
+    0xea, 0xbf, 0x8a, 0xd2, 0x40, 0xc7, 0x38, 0xb5,
+    0xa3, 0xf7, 0xf2, 0xce, 0xf9, 0x61, 0x15, 0xa1,
+    0xe0, 0xae, 0x5d, 0xa4, 0x9b, 0x34, 0x1a, 0x55,
+    0xad, 0x93, 0x32, 0x30, 0xf5, 0x8c, 0xb1, 0xe3,
+    0x1d, 0xf6, 0xe2, 0x2e, 0x82, 0x66, 0xca, 0x60,
+    0xc0, 0x29, 0x23, 0xab, 0x0d, 0x53, 0x4e, 0x6f,
+    0xd5, 0xdb, 0x37, 0x45, 0xde, 0xfd, 0x8e, 0x2f,
+    0x03, 0xff, 0x6a, 0x72, 0x6d, 0x6c, 0x5b, 0x51,
+    0x8d, 0x1b, 0xaf, 0x92, 0xbb, 0xdd, 0xbc, 0x7f,
+    0x11, 0xd9, 0x5c, 0x41, 0x1f, 0x10, 0x5a, 0xd8,
+    0x0a, 0xc1, 0x31, 0x88, 0xa5, 0xcd, 0x7b, 0xbd,
+    0x2d, 0x74, 0xd0, 0x12, 0xb8, 0xe5, 0xb4, 0xb0,
+    0x89, 0x69, 0x97, 0x4a, 0x0c, 0x96, 0x77, 0x7e,
+    0x65, 0xb9, 0xf1, 0x09, 0xc5, 0x6e, 0xc6, 0x84,
+    0x18, 0xf0, 0x7d, 0xec, 0x3a, 0xdc, 0x4d, 0x20,
+    0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
+};
+
diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
index 4c8fd34aec..d28690321f 100644
--- a/target/arm/crypto_helper.c
+++ b/target/arm/crypto_helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
+#include "crypto/sm4.h"
 #include "vec_internal.h"
=20
 union CRYPTO_STATE {
@@ -694,41 +695,6 @@ DO_SM3TT(crypto_sm3tt2b, 3)
=20
 #undef DO_SM3TT
=20
-static uint8_t const sm4_sbox[] =3D {
-    0xd6, 0x90, 0xe9, 0xfe, 0xcc, 0xe1, 0x3d, 0xb7,
-    0x16, 0xb6, 0x14, 0xc2, 0x28, 0xfb, 0x2c, 0x05,
-    0x2b, 0x67, 0x9a, 0x76, 0x2a, 0xbe, 0x04, 0xc3,
-    0xaa, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99,
-    0x9c, 0x42, 0x50, 0xf4, 0x91, 0xef, 0x98, 0x7a,
-    0x33, 0x54, 0x0b, 0x43, 0xed, 0xcf, 0xac, 0x62,
-    0xe4, 0xb3, 0x1c, 0xa9, 0xc9, 0x08, 0xe8, 0x95,
-    0x80, 0xdf, 0x94, 0xfa, 0x75, 0x8f, 0x3f, 0xa6,
-    0x47, 0x07, 0xa7, 0xfc, 0xf3, 0x73, 0x17, 0xba,
-    0x83, 0x59, 0x3c, 0x19, 0xe6, 0x85, 0x4f, 0xa8,
-    0x68, 0x6b, 0x81, 0xb2, 0x71, 0x64, 0xda, 0x8b,
-    0xf8, 0xeb, 0x0f, 0x4b, 0x70, 0x56, 0x9d, 0x35,
-    0x1e, 0x24, 0x0e, 0x5e, 0x63, 0x58, 0xd1, 0xa2,
-    0x25, 0x22, 0x7c, 0x3b, 0x01, 0x21, 0x78, 0x87,
-    0xd4, 0x00, 0x46, 0x57, 0x9f, 0xd3, 0x27, 0x52,
-    0x4c, 0x36, 0x02, 0xe7, 0xa0, 0xc4, 0xc8, 0x9e,
-    0xea, 0xbf, 0x8a, 0xd2, 0x40, 0xc7, 0x38, 0xb5,
-    0xa3, 0xf7, 0xf2, 0xce, 0xf9, 0x61, 0x15, 0xa1,
-    0xe0, 0xae, 0x5d, 0xa4, 0x9b, 0x34, 0x1a, 0x55,
-    0xad, 0x93, 0x32, 0x30, 0xf5, 0x8c, 0xb1, 0xe3,
-    0x1d, 0xf6, 0xe2, 0x2e, 0x82, 0x66, 0xca, 0x60,
-    0xc0, 0x29, 0x23, 0xab, 0x0d, 0x53, 0x4e, 0x6f,
-    0xd5, 0xdb, 0x37, 0x45, 0xde, 0xfd, 0x8e, 0x2f,
-    0x03, 0xff, 0x6a, 0x72, 0x6d, 0x6c, 0x5b, 0x51,
-    0x8d, 0x1b, 0xaf, 0x92, 0xbb, 0xdd, 0xbc, 0x7f,
-    0x11, 0xd9, 0x5c, 0x41, 0x1f, 0x10, 0x5a, 0xd8,
-    0x0a, 0xc1, 0x31, 0x88, 0xa5, 0xcd, 0x7b, 0xbd,
-    0x2d, 0x74, 0xd0, 0x12, 0xb8, 0xe5, 0xb4, 0xb0,
-    0x89, 0x69, 0x97, 0x4a, 0x0c, 0x96, 0x77, 0x7e,
-    0x65, 0xb9, 0xf1, 0x09, 0xc5, 0x6e, 0xc6, 0x84,
-    0x18, 0xf0, 0x7d, 0xec, 0x3a, 0xdc, 0x4d, 0x20,
-    0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
-};
-
 static void do_crypto_sm4e(uint64_t *rd, uint64_t *rn, uint64_t *rm)
 {
     union CRYPTO_STATE d =3D { .l =3D { rn[0], rn[1] } };
diff --git a/crypto/meson.build b/crypto/meson.build
index f065f2f277..685fb37097 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -42,6 +42,7 @@ if have_afalg
 endif
 crypto_ss.add(when: gnutls, if_true: files('tls-cipher-suites.c'))
=20
+util_ss.add(files('sm4.c'))
 util_ss.add(files('aes.c'))
 util_ss.add(files('init.c'))
 if gnutls.found()
--=20
2.35.1


