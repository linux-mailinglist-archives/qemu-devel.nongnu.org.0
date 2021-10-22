Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661543786D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:52:38 +0200 (CEST)
Received: from localhost ([::1]:52956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduyL-0007iM-DT
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdum8-0000tx-5G
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:00 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdum5-0001H7-Mw
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909997; x=1666445997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2QOUfuXhwj9dDf+TI04dXQNMSlWjVmPOclj4YlckYTk=;
 b=hyB8KPVd/oLF8q70FYF+U8xy2DwGks43wncYMmu7YM/jBmVP1WskRD49
 MKkabCcsiCUFvNCATL1L2MZmCPHb7TsgdqCumm7W41mwpwihNCaVG/kuX
 uaEK2lFP8oFC1ek8q3ksK4EfLGoT4ZCBrC3hGaEq8cxRM7hYeRFesf8W9
 KKe0XYFge5pnSn0F8O17RkKEeHvKr2dywmbLus7bhrEOYUE4vAQYo+AQn
 UiIhD289Ok/TvmmWrmnm4ArjZA4yPYy87vzZ/+s2QTqV7caaHCmxMWymf
 TBotUGKbnLYYso6L1Rrgct2anh2c1txQGHij2Ck3FJ3cuclrTzc1x5foL g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="287492716"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:55 +0800
IronPort-SDR: Lai/Ti3VfK3RNKdrViH2dJDkF6ZQzerZyNzBpC6M1JKRLbC5x8WGF+JhSXk5BDERdyq61GmAbR
 fCvk9y/ASX/24BLDSfVqifsCDvxYaGifyuWCw298Vior0WKneqzvCydAsyjqanTxH10LbYiAND
 uSd2tLEocUIhSMpScHhvLe49dLeocwTwfp/XEvCFkaG0DM+iLYyf1ueCjgYF69cDGfT8+h4azh
 r1qEOLhBV1a6eujYYJHYJ2Mr9DBXybOiCwkNqIfAeev8RkcuRAEPZzb4fJ6yqelj/Y7eJRu2Ai
 LhzpSDS5BGIhTvRslyKcvTYX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:13:58 -0700
IronPort-SDR: yjo3QRUlJyNoMzCoRRZIDY1ZWKzLALihLfJYEJ368zKVJGWIM28ghdjGdy1/QEyqhxqO0o/kCs
 PBnq4mLM0hFbUUX2l7Vfy/p2jcsjckEayBRyb7k3NSrQAwpy6Mg8E1Ky0UL3o9B2duXBjA3oa6
 r8sX979uNfv/BFXorC7xSxyIiOPebtO23dFbOyxjct9zADeivKBouiumqcLf+OozZKtz1U+fug
 TcqzmpU82+vKpqgEQNXaUjmdpxpMclCjxj2gRNcYQ8keKoV1kePAJbrmkGKYjQWfikPIzOZSJB
 pgk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSq4rTTz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909995; x=1637501996; bh=2QOUfuXhwj9dDf+TI0
 4dXQNMSlWjVmPOclj4YlckYTk=; b=oXHwcdJ/bo2ea9k7MWew9wQrYc2aNkWuyO
 ElR0QRh/Mox/Bd6JxiwJy8uNOh7ZOoplXDi7+pZLTcjRCm6KF3ysoaZWnjA3VmbC
 ZJWeMGG6uuuxewkT5QQmuSsuhva3+ArQ1vIkSo2c2TTg41eYIiQxOvPwoCTryGoT
 KioGow0SHrOh2B47FpWxNybGLgoRqsCSsMXdlbojJUDTa1bRRzvKTMU8RRukAFtn
 9lbRAk8be5+vKlp2zMCwSBjhPfdhL8cKvb0930GzVXPkOqDlIB7iWHWOgDaFrvAf
 vzuD9BzwD0vc7Kl+gLXeoLp7OuMXm2WuKDWCbZzgIEQwpxm1hukw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7jYQH1NzrK-R for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:55 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSl1xDMz1RtVl;
 Fri, 22 Oct 2021 06:39:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/33] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Fri, 22 Oct 2021 23:37:54 +1000
Message-Id: <20211022133812.3972903-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In preparation for RV128, replace a simple predicate
with a more versatile test.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-9-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 77cad9bc45..d0ba54091e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -91,15 +91,18 @@ static inline bool has_ext(DisasContext *ctx, uint32_=
t ext)
 }
=20
 #ifdef TARGET_RISCV32
-# define is_32bit(ctx)  true
+#define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
-# define is_32bit(ctx)  false
+#define get_xl(ctx)    MXL_RV64
 #else
-static inline bool is_32bit(DisasContext *ctx)
+#define get_xl(ctx)    ((ctx)->xl)
+#endif
+
+/* The word size for this machine mode. */
+static inline int __attribute__((unused)) get_xlen(DisasContext *ctx)
 {
-    return ctx->xl =3D=3D MXL_RV32;
+    return 16 << get_xl(ctx);
 }
-#endif
=20
 /* The word size for this operation. */
 static inline int oper_len(DisasContext *ctx)
@@ -257,7 +260,7 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+    target_ulong sd =3D get_xl(ctx) =3D=3D MXL_RV32 ? MSTATUS32_SD : MST=
ATUS64_SD;
=20
     if (ctx->mstatus_fs !=3D MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -316,16 +319,16 @@ EX_SH(12)
     }                              \
 } while (0)
=20
-#define REQUIRE_32BIT(ctx) do { \
-    if (!is_32bit(ctx)) {       \
-        return false;           \
-    }                           \
+#define REQUIRE_32BIT(ctx) do {    \
+    if (get_xl(ctx) !=3D MXL_RV32) { \
+        return false;              \
+    }                              \
 } while (0)
=20
-#define REQUIRE_64BIT(ctx) do { \
-    if (is_32bit(ctx)) {        \
-        return false;           \
-    }                           \
+#define REQUIRE_64BIT(ctx) do {    \
+    if (get_xl(ctx) < MXL_RV64) {  \
+        return false;              \
+    }                              \
 } while (0)
=20
 static int ex_rvc_register(DisasContext *ctx, int reg)
--=20
2.31.1


