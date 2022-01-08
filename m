Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0D4881F6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:02:02 +0100 (CET)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65jl-0002Ed-HQ
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:02:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eb-0000tw-SS
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eZ-0006td-Ge
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621155; x=1673157155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGIhjaZH0rb1q/XFMqIs7l4hUpB1/CW/pzk5XqvuqZE=;
 b=JXtDKIzFTO9jlkEaZUg9FqtIG5c3DVqrdU/7xsUZ6r4wX9069GTf25Yk
 QTW+yxToSjNg+eIjl0u9E+BzXwogExijbvhqpH3k2oL6wKEWPBVzLB35A
 +Wi6VilKAObuxkwNHCQv5E1l8YXtK+WaNzG9IzQUy6GdmZtkZzYZ0jlnQ
 Wl6nt8d2Ac44InJh5qp9Omub43qcyY2Dz6waUwcwhzo1ycMN9pxx34cxs
 j1WZ7RkNrZpjn4Hvky6qSJBF1ROWB3Ur13rR+2vcErP10SFi51AlYxepH
 6CUq7zHd8V4zXRSqiJN8v0pwdSX9GSFvIqdtTn+EQhImP8Gnc8OB0pBME g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027386"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:33 +0800
IronPort-SDR: bHw1+q9KiL2Zc3v+6DjjSxWtWU+EDcIXBu4XdZil0EtNl74FnCclVAPRftUlpdE1ohUZ8Olo2d
 JMcubBBiPj0l6r8PpQEYiXTqGGP7pKgoGp/dCE7QLissdiITFza8xVgsukclYdy0nPuYtDEDe6
 tyMfAG9tyJb5TFzEy4s6DlDRMZ2XQC16J9zfwk1BXxCZ3hJHRbkc9rdb+yaZwj1vSB1HRkJ5PB
 1HK0VUkrRQuqJr9OFveYwfFV4dZFU0VJifwP2Kow0CTGdprz0JVMOjFBy2DKZGZjfdNgit3jfE
 JpO4wumcPdH7RaPuQFfY9mxo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:00 -0800
IronPort-SDR: 4WZR2srIyK+28/XtvS2awoc1X99Q5ljts79NXFBOG93na79l9x3Q6n1nMJFV8BYlIvj3qREODh
 5hb+yvM7JtJWxJgD5KKbuIEYgUb9LpSSbsXZL2tArHvZ4yXGO+KlcP2fzu0e9QkUl+wDx20xQf
 jVT8NsQGuDGm8Kkr6DKYKNs8hKfVFPnuCOV598Y2cBFDnqvD/rHxeQftpulSidQuLXI/1E9qDU
 h6ByfJwNyOkGPXEpifj80OaICKuvY/Ijyi8RqRHMH6pbo1+ZbcSLauomYvzj8Y0eI4803m42Zl
 j44=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8PY3K40z1VSkW
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621153; x=1644213154; bh=hGIhjaZ
 H0rb1q/XFMqIs7l4hUpB1/CW/pzk5XqvuqZE=; b=oGG98IZvgRl/k/kPkITWHgq
 cEn2hVXJXWLAJ+7qdrD0BvJlLLP/RBAoZr/pCmuyaRJkIsXiHki5l3A3stMfEGFY
 wgtVYkEBAVuniYeyEBvJu2VflwnUW1Snmh5DG082d/Q93i2U/VchGZM5eA14LzfJ
 FOZg6ImBGxtJnBfsCEmlVtN8DUD2ns17grZhYLKt8zHSBJjHmAHFtzPQzxf8OJmf
 /nnizRNDDShv/oAdDr0w6ZlMHOOCLYDM0SeOtXyqBNSHJ30yNARoRsygoYlOEs31
 /Sycs7MueHJmoRLF4I6Fa7yzVdCrbbBuKtGDHZtrRtba3Yh97q3D1HPb8ZYXEHQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ARKL9quJ6hhM for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:33 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8PT1LJcz1VSkc;
 Fri,  7 Jan 2022 21:52:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/37] target/riscv: additional macros to check instruction
 support
Date: Sat,  8 Jan 2022 15:50:31 +1000
Message-Id: <20220108055048.3512645-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Given that the 128-bit version of the riscv spec adds new instructions, a=
nd
that some instructions that were previously only available in 64-bit mode
are now available for both 64-bit and 128-bit, we added new macros to che=
ck
for the processor mode during translation.
Although RV128 is a superset of RV64, we keep for now the RV64 only tests
for extensions other than RVI and RVM.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-5-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5df6c0d800..502bf0d009 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -443,10 +443,22 @@ EX_SH(12)
     }                              \
 } while (0)
=20
-#define REQUIRE_64BIT(ctx) do {    \
-    if (get_xl(ctx) < MXL_RV64) {  \
-        return false;              \
-    }                              \
+#define REQUIRE_64BIT(ctx) do {     \
+    if (get_xl(ctx) !=3D MXL_RV64) {  \
+        return false;               \
+    }                               \
+} while (0)
+
+#define REQUIRE_128BIT(ctx) do {    \
+    if (get_xl(ctx) !=3D MXL_RV128) { \
+        return false;               \
+    }                               \
+} while (0)
+
+#define REQUIRE_64_OR_128BIT(ctx) do { \
+    if (get_xl(ctx) =3D=3D MXL_RV32) {     \
+        return false;                  \
+    }                                  \
 } while (0)
=20
 static int ex_rvc_register(DisasContext *ctx, int reg)
--=20
2.31.1


