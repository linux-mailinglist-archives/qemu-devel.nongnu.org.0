Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62D3FD12F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:21:01 +0200 (CEST)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFrz-0002Sy-RG
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiv-00069R-S8
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:34 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFih-0008Fb-Oi
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462278; x=1661998278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZeZw1rFHMyCdjwtcB+dTpGsD9zIcn3Vwae2e5wZhJhU=;
 b=JGSL2MZ9r8x5oznIu9kqfgw7j9+tfPFK9Zf5J95UF6uN1qojrHE5kww5
 tXFtgsziCGaAjHhQsuxL21K9DAyVwPZlWudaxE9wA4RWPN1f9egXfChJ1
 2Bxl9vyGUFWB7enO5/y8p1sC2fEZuYE1rE6lZDc8XueJPDrEkoK9xJeZL
 A3n7zZfiQDvIvcq47P7khV9cDHOJAVRoag3uvTT4qroo9LTGtB6MfZqLw
 5OMHhpoO4CxH03oH6NxBZ6csIlwAbMtYL7Ni2k+BK2oCHfGTFaxWCDzz4
 aCZz0m3OIc9BwsGpMK1ogCX0sjGTGlXuwqmNum946dRpRpEbVW537pBmz Q==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910764"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:17 +0800
IronPort-SDR: 2YF1SoN1giqiAN3FcVXo9d4I8BNOsjS+TV5ZUhn0DGcm5ROCHq7AE0jeMPFq0kOY/Nc56kbNoF
 2hZJZ4E4UJzFW9fssElln/KAn6n8OnamQ/O3/qRK8w2I3BLeU5s63z9xiC7HFfBAt5qzinIXEs
 +FLyzo//hw1pZW16abNmfAZeomiQpqi/G6iMMfmyOCxPAvH28NG3RoEiduk+NnVFrUonoZWdvH
 0zMJeJOX5T7nDYgvCMd/H7vRUbcbQZljwir2ZYEsfiF4ldHar3Mze7n3tlScyuSUwL7x0+FZJA
 7ypiQgchjt/xI4tn2ukFB4rp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:46:23 -0700
IronPort-SDR: AkCYi/KYtLAcxo4yTrICIxWLBZUIPSE9TlvFq+S+tYo7I4e7h5WgM2vqCjlnyIO8nn7CL9VN3a
 Jz8ty3WBa3Gp6LzymCG7UC/rpO1DG6q+NVAwPqNGsAg6GdNwTrsh1FpQitZDiSBet8lYBupw1M
 iA8MHUm2r3/w0EXbvi1laxsg61NnQX54yEPcZlaA1sS0VaPmHDt5ITq5bJrYBB5EYxV5QczMFD
 znUW65V1PsTrfHEPnU2/KqeApEs2bsGKfxAq/VfHCe70vx0NuEKkmBxMdrsdBpYSwit9I13X0r
 +Z8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznbn4wTbz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462272; x=1633054273; bh=ZeZw1rFHMyCdjwtcB+
 dTpGsD9zIcn3Vwae2e5wZhJhU=; b=HU74ua6RSKMlaGjk3Kw7NSs06FcuntdY8V
 WnBGxnJlJjBNHDBJwgNJAZ5UatF6Lausd5Gm4jNm2ls3oOgKITJ8rlMLk5znnq8O
 brZafsmyzDosLIEp21ff3qID5+mYTWVzcQhFhbBQUyZ6920Spa++VubFd5K0AAfz
 FdX1P3PM8O3QsFQpNhL7KXpSpxirHIszqsNN9Kz8qvjgrhxS0xV8O/wMfQDm+qUf
 l2dmu+7qreN1NU7owwNBqdtMarcmYvTy6ouLktqbKOiFAb0qb3BfiZDr9xL6E1v8
 RJ7JwxmnwFrvtZ6oRhjFc0xFeiFt65KsT70ooDoCBbWkFMjAXvwg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Mrd8WbSz0n4A for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznbc2xPqz1RvlY;
 Tue, 31 Aug 2021 19:11:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/33] tests/tcg/riscv64: Add test for division
Date: Wed,  1 Sep 2021 12:09:36 +1000
Message-Id: <20210901020958.458454-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-3-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/tcg/riscv64/test-div.c      | 58 +++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |  5 +++
 2 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

diff --git a/tests/tcg/riscv64/test-div.c b/tests/tcg/riscv64/test-div.c
new file mode 100644
index 0000000000..a90480be3f
--- /dev/null
+++ b/tests/tcg/riscv64/test-div.c
@@ -0,0 +1,58 @@
+#include <assert.h>
+#include <limits.h>
+
+struct TestS {
+    long x, y, q, r;
+};
+
+static struct TestS test_s[] =3D {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, -1, 0 },                /* div by zero cases */
+    { 9, 0, -1, 9 },
+    { LONG_MIN, -1, LONG_MIN, 0 },  /* overflow case */
+};
+
+struct TestU {
+    unsigned long x, y, q, r;
+};
+
+static struct TestU test_u[] =3D {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, ULONG_MAX, 0 },         /* div by zero cases */
+    { 9, 0, ULONG_MAX, 9 },
+};
+
+#define ARRAY_SIZE(X)  (sizeof(X) / sizeof(*(X)))
+
+int main (void)
+{
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(test_s); i++) {
+        long q, r;
+
+        asm("div %0, %2, %3\n\t"
+            "rem %1, %2, %3"
+            : "=3D&r" (q), "=3Dr" (r)
+            : "r" (test_s[i].x), "r" (test_s[i].y));
+
+        assert(q =3D=3D test_s[i].q);
+        assert(r =3D=3D test_s[i].r);
+    }
+
+    for (i =3D 0; i < ARRAY_SIZE(test_u); i++) {
+        unsigned long q, r;
+
+        asm("divu %0, %2, %3\n\t"
+            "remu %1, %2, %3"
+            : "=3D&r" (q), "=3Dr" (r)
+            : "r" (test_u[i].x), "r" (test_u[i].y));
+
+        assert(q =3D=3D test_u[i].q);
+        assert(r =3D=3D test_u[i].r);
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefi=
le.target
new file mode 100644
index 0000000000..d41bf6d60d
--- /dev/null
+++ b/tests/tcg/riscv64/Makefile.target
@@ -0,0 +1,5 @@
+# -*- Mode: makefile -*-
+# RISC-V specific tweaks
+
+VPATH +=3D $(SRC_PATH)/tests/tcg/riscv64
+TESTS +=3D test-div
--=20
2.31.1


