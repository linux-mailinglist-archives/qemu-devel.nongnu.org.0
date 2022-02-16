Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489874B80E6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:02:55 +0100 (CET)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEL0-0005Sm-91
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDp6-00051Z-Ms
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:56 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDp4-0006JS-FV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992994; x=1676528994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYE/mOCtndKnFgc+9uvpYG2BClhduKs/P6ABzwgR2HE=;
 b=YAp83XjIphEWuJohWajiaVTk1DNjFOsyLT4/4MSu+2FC4scssa4S8loM
 wfBNj4gi/hpsxpOBE1GdsROc4krqbKPRUzbVBEIN1PE5M+NN0CtGbTPpj
 3BOp5e6e1+1Fu6uWYamtXPzjTlv5vuu9HWyjR/RFCWa4ZRIVAGqLOnUY0
 PXjCC7Pk4d7B/UiqqFzyR2PLw0Nhk1uiCx7EsGmTj/Ra0ZMj7BMZioKtE
 iW9R43IGeV0a1/wqTc+tpZzw0w5u0+ei49F5PvSJR7lny9BEXOkq73B1k
 wGo6C9JwpBLJ5gJfISoaqZGdpEkkKRGnwJojjgv2wCDZy4OCtYqhpjFC/ A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181708"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:53 +0800
IronPort-SDR: zZkCU2tkhguI8AtCbb7o3ixobRdHM4bephyHX5PHjOKTA8ojE6JJ0OZN/bHyNsoonQTU0h2ogV
 PBaml0dM2BDp+9uTt6LWLROAg3xzYgw9ItOFZ1UoUs7F9YjuK1NgxLHRLnnphC4ab0GUd94UHy
 n50G8c65NIbSfC+OGOP1XMxCew/Fmu6CKWW/TsrX13aWnlr/CzQpx3AKgtnxjgBS5eB6CAFcWe
 +bYWO2vy2OqTZzKlqvzr2CUHCWJyqN82bkH5CKiMxkXHm4IZA5WzkjlwEh76dRfeXbfLZroFLA
 7zwe9E32PiOqWVuTliov8wzx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:41 -0800
IronPort-SDR: hNS31K9QCnT6xF0fGGNp4z8W3i0cBsy9cMdG8aXOlxd+6LRWSnC7JRMHpaSaqQ/IqdXtXXklH7
 z5jaYSrJmbci0UuDlBb26r1iSJeDHtgtke/vx7n1/3jk8ewZl5WcCOwstBt0KZo7n/+msuwGBt
 5hbk5U5NunaIDXdsiTOXS7UUdas8iC2c2zZhb23C5g2a2BDF7REEfxLPSvJ5AIB3bQt+MxXPlP
 w6SW3hGWGAX+oJyGIdiG+2OIFwS1TOvZjno10KEsCMaApJmPs1wHapsFcNpBrxaqT/P86YtQFj
 jMg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Nd0CZMz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644992992; x=1647584993; bh=uYE/mOCtndKnFgc+9u
 vpYG2BClhduKs/P6ABzwgR2HE=; b=eTKpetcSvEE2WNiWuszFD7/28hUybXVxy2
 MQ06YyPrwL5MTr0wfPm3XaAxRjVsP5YJfCaX2JVz7qusUONTcOx/cv/V3ChkWwng
 F7r2mhLEDoKNQlwN0BFelJ6YJq4CAt1BwhhB5oh+XChZg2vjxlDcP9EmpCHcUmu/
 34DQE2kEj+P0LUszTPANM6jSKoFg7S3AB45Ea6ZOH76AS550NkN8R1E3OzViu2ij
 QoBqi7uWniMtWkpbkzNgHXkix2WLuxl/z59yOfmYKDg6tjIW37uwU4Kl6iUq3FvW
 lndzL3GMtnZ5iBQge+z+hSKKPrV9Z9EEkAVEG5Res5ks9lpH+MoA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zMot2s3une1J for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7NY1JYCz1SHwl;
 Tue, 15 Feb 2022 22:29:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 07/35] target/riscv: access cfg structure through
 DisasContext
Date: Wed, 16 Feb 2022 16:28:44 +1000
Message-Id: <20220216062912.319738-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-5-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 810431a1d6..f9bd3b7ec4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
=20
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+    if (ctx->cfg_ptr->ext_zba) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+    if (ctx->cfg_ptr->ext_zbb) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+    if (ctx->cfg_ptr->ext_zbc) {                 \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+    if (ctx->cfg_ptr->ext_zbs) {                 \
         return false;                            \
     }                                            \
 } while (0)
--=20
2.34.1


