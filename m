Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064F564378
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:26:42 +0200 (CEST)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nRh-0007DE-7p
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nFG-0001Ys-1I
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nFE-00021g-02
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807226; x=1688343226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lveJUEN4lzVWHZY7Q+NLuNHznSV4Bm0HQn0yhdEnRSo=;
 b=P3LFQgWteJ/pe8fCDk7fxNNfd2uNOhaXaLHC0oapPKLM7SSS+NmkbFAQ
 GdA5WtpISm1LtXYsL4EkJJRUNywxvHbKjkrzU9TgTiGeYcyxFt3iPamDb
 jxmnhT/Vs7cX8cwk417rajP2Mo4SyZHsCyiw6yAewKrmnCynXJ23GhT7s
 Y6z9B5+c2dmkSoM09P2jW4Tpnzt8EaImOg4scISWmKl/Wg77prYNz3QQw
 sQzzkTNw1/UIbgs6YDLbyo27fvd+Omiot703cHib8x/wwYsTs9fABDnZv
 zpbQJADI01KMAKxpMn7R3QgW4PXixk3ghTf7aQe4Q+QOgqjii9EBWVX6z g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667279"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:21 +0800
IronPort-SDR: 2VRPJCrupan0sJeHQqXGNhl9uaUnTqAFUS6KE22ZtI0SUHOlmcu6Ckrt2hYxmKKmFzezC0cYin
 56VlFjglNN3O+DEhbbNOFcGiUXLiyvUECAlssmuKtLjTVdn/kteCm7R6HPL/Me2P3nwei/Z1Wu
 TOzai+aBiNJJWy8QFwvPu+gIQ9JrYboxCUXYN2gkH7CRY3Kp7BC/TGgYkCp9ca4HK3KqRLJJVE
 zDfhIBIB2wgUju/nJelNx2hRng56PSoz8pg5UPUFdErwWYdbVpXUsFtb8Sg+Qw90zgigcbaZbH
 sGC9C42tN5G5MY0UAilIv9/X
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:44 -0700
IronPort-SDR: ql4Jrzzr7eZHPrDXMwvUbYwm0xuqxmq0R8aK88lFWprDXAousbJZijI0CBjUL7RPdM9WtwsqvC
 AJIez90EHUtrDtZ1GwoGBmeam3zxiyjiWxXZjFdtZUTqPtaNhgCsPj2S81Rl/6NGwzi6F/kOaS
 mZBn71Ai8eDLreV/tWYDipOG3NvyXAm+iTIMFXh5dGLeZxarfXIDpgleQSd4W061Na8kaP/Jof
 pr+z3BSpq4/mS/XM2kJQqOaJcXAsVNN4auQaCqUgFc1NP5Tiu5U5NcmftS2kyjS5HB+xjDvNxI
 uNw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xy0szJz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807201; x=1659399202; bh=lveJUEN4lzVWHZY7Q+
 NLuNHznSV4Bm0HQn0yhdEnRSo=; b=Q7mZybKhfbcVx5kQ1AlEqua+PK6UE0WeFt
 BeaRoMCyByTQYXGncw4PX96+H8dtjqFghmWKNkpazzhL5vwPyR/FmM1Zt2TmIfPV
 YRiJEhicMjwLBU55RwVdXGrfMUf+wAkf9OvSnDgDj6VKlJil47+IyLm3bBsSpUIE
 fc3EVOfGi+FHUm/LRKtYKMphA2ICgEUJJei4UMApWteDkpLhVXLRwoddXJ8eEw5A
 QmVTjNnCDx9iFUWNSEB2XLZL28ghhBokU8LEEofJt+Cg1nEOdurVNOSAyPqnFNVg
 vKk1zFR63QAiAXFvzSmJgwrqyF5htPEdPaEMjBtLXrfbg7rIFC7w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CAa3zX7atjTl for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xw2nLFz1Rw4L;
 Sat,  2 Jul 2022 17:13:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 19/19] target/riscv: Update default priority table for local
 interrupts
Date: Sun,  3 Jul 2022 10:12:34 +1000
Message-Id: <20220703001234.439716-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Anup Patel <apatel@ventanamicro.com>

The latest AIA draft v0.3.0 defines a relatively simpler scheme for
default priority assignments where:
1) local interrupts 24 to 31 and 48 to 63 are reserved for custom use
   and have implementation specific default priority.
2) remaining local interrupts 0 to 23 and 32 to 47 have a recommended
   (not mandatory) priority assignments.

We update the default priority table and hviprio mapping as-per above.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220616031543.953776-3-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   |   2 +-
 target/riscv/cpu_helper.c | 134 ++++++++++++++++++--------------------
 2 files changed, 66 insertions(+), 70 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 157d7069f6..6be5a9e9f0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -774,7 +774,7 @@ typedef enum RISCVException {
 #define IPRIO_IRQ_BITS                     8
 #define IPRIO_MMAXIPRIO                    255
 #define IPRIO_DEFAULT_UPPER                4
-#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 24)
+#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 12)
 #define IPRIO_DEFAULT_M                    IPRIO_DEFAULT_MIDDLE
 #define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_M + 3)
 #define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_S + 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index be28615e23..59b3680b1b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -168,17 +168,17 @@ void riscv_cpu_update_mask(CPURISCVState *env)
  * 14 "
  * 15 "
  * 16 "
- * 18 Debug/trace interrupt
- * 20 (Reserved interrupt)
+ * 17 "
+ * 18 "
+ * 19 "
+ * 20 "
+ * 21 "
  * 22 "
- * 24 "
- * 26 "
- * 28 "
- * 30 (Reserved for standard reporting of bus or system errors)
+ * 23 "
  */
=20
 static const int hviprio_index2irq[] =3D {
-    0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+    0, 1, 4, 5, 8, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 };
 static const int hviprio_index2rdzero[] =3D {
     1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
=20
@@ -207,50 +207,60 @@ int riscv_cpu_hviprio_index2irq(int index, int *out=
_irq, int *out_rdzero)
  *  Default  |
  *  Priority | Major Interrupt Numbers
  * ----------------------------------------------------------------
- *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
- *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
- *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
- *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+ *  Highest  | 47, 23, 46, 45, 22, 44,
+ *           | 43, 21, 42, 41, 20, 40
  *           |
  *           | 11 (0b),  3 (03),  7 (07)
  *           |  9 (09),  1 (01),  5 (05)
  *           | 12 (0c)
  *           | 10 (0a),  2 (02),  6 (06)
  *           |
- *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
- *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
- *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
- *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+ *           | 39, 19, 38, 37, 18, 36,
+ *  Lowest   | 35, 17, 34, 33, 16, 32
  * ----------------------------------------------------------------
  */
 static const uint8_t default_iprio[64] =3D {
- [63] =3D IPRIO_DEFAULT_UPPER,
- [62] =3D IPRIO_DEFAULT_UPPER + 1,
- [31] =3D IPRIO_DEFAULT_UPPER + 2,
- [30] =3D IPRIO_DEFAULT_UPPER + 3,
- [61] =3D IPRIO_DEFAULT_UPPER + 4,
- [60] =3D IPRIO_DEFAULT_UPPER + 5,
-
- [59] =3D IPRIO_DEFAULT_UPPER + 6,
- [58] =3D IPRIO_DEFAULT_UPPER + 7,
- [29] =3D IPRIO_DEFAULT_UPPER + 8,
- [28] =3D IPRIO_DEFAULT_UPPER + 9,
- [57] =3D IPRIO_DEFAULT_UPPER + 10,
- [56] =3D IPRIO_DEFAULT_UPPER + 11,
-
- [55] =3D IPRIO_DEFAULT_UPPER + 12,
- [54] =3D IPRIO_DEFAULT_UPPER + 13,
- [27] =3D IPRIO_DEFAULT_UPPER + 14,
- [26] =3D IPRIO_DEFAULT_UPPER + 15,
- [53] =3D IPRIO_DEFAULT_UPPER + 16,
- [52] =3D IPRIO_DEFAULT_UPPER + 17,
-
- [51] =3D IPRIO_DEFAULT_UPPER + 18,
- [50] =3D IPRIO_DEFAULT_UPPER + 19,
- [25] =3D IPRIO_DEFAULT_UPPER + 20,
- [24] =3D IPRIO_DEFAULT_UPPER + 21,
- [49] =3D IPRIO_DEFAULT_UPPER + 22,
- [48] =3D IPRIO_DEFAULT_UPPER + 23,
+ /* Custom interrupts 48 to 63 */
+ [63] =3D IPRIO_MMAXIPRIO,
+ [62] =3D IPRIO_MMAXIPRIO,
+ [61] =3D IPRIO_MMAXIPRIO,
+ [60] =3D IPRIO_MMAXIPRIO,
+ [59] =3D IPRIO_MMAXIPRIO,
+ [58] =3D IPRIO_MMAXIPRIO,
+ [57] =3D IPRIO_MMAXIPRIO,
+ [56] =3D IPRIO_MMAXIPRIO,
+ [55] =3D IPRIO_MMAXIPRIO,
+ [54] =3D IPRIO_MMAXIPRIO,
+ [53] =3D IPRIO_MMAXIPRIO,
+ [52] =3D IPRIO_MMAXIPRIO,
+ [51] =3D IPRIO_MMAXIPRIO,
+ [50] =3D IPRIO_MMAXIPRIO,
+ [49] =3D IPRIO_MMAXIPRIO,
+ [48] =3D IPRIO_MMAXIPRIO,
+
+ /* Custom interrupts 24 to 31 */
+ [31] =3D IPRIO_MMAXIPRIO,
+ [30] =3D IPRIO_MMAXIPRIO,
+ [29] =3D IPRIO_MMAXIPRIO,
+ [28] =3D IPRIO_MMAXIPRIO,
+ [27] =3D IPRIO_MMAXIPRIO,
+ [26] =3D IPRIO_MMAXIPRIO,
+ [25] =3D IPRIO_MMAXIPRIO,
+ [24] =3D IPRIO_MMAXIPRIO,
+
+ [47] =3D IPRIO_DEFAULT_UPPER,
+ [23] =3D IPRIO_DEFAULT_UPPER + 1,
+ [46] =3D IPRIO_DEFAULT_UPPER + 2,
+ [45] =3D IPRIO_DEFAULT_UPPER + 3,
+ [22] =3D IPRIO_DEFAULT_UPPER + 4,
+ [44] =3D IPRIO_DEFAULT_UPPER + 5,
+
+ [43] =3D IPRIO_DEFAULT_UPPER + 6,
+ [21] =3D IPRIO_DEFAULT_UPPER + 7,
+ [42] =3D IPRIO_DEFAULT_UPPER + 8,
+ [41] =3D IPRIO_DEFAULT_UPPER + 9,
+ [20] =3D IPRIO_DEFAULT_UPPER + 10,
+ [40] =3D IPRIO_DEFAULT_UPPER + 11,
=20
  [11] =3D IPRIO_DEFAULT_M,
  [3]  =3D IPRIO_DEFAULT_M + 1,
@@ -266,33 +276,19 @@ static const uint8_t default_iprio[64] =3D {
  [2]  =3D IPRIO_DEFAULT_VS + 1,
  [6]  =3D IPRIO_DEFAULT_VS + 2,
=20
- [47] =3D IPRIO_DEFAULT_LOWER,
- [46] =3D IPRIO_DEFAULT_LOWER + 1,
- [23] =3D IPRIO_DEFAULT_LOWER + 2,
- [22] =3D IPRIO_DEFAULT_LOWER + 3,
- [45] =3D IPRIO_DEFAULT_LOWER + 4,
- [44] =3D IPRIO_DEFAULT_LOWER + 5,
-
- [43] =3D IPRIO_DEFAULT_LOWER + 6,
- [42] =3D IPRIO_DEFAULT_LOWER + 7,
- [21] =3D IPRIO_DEFAULT_LOWER + 8,
- [20] =3D IPRIO_DEFAULT_LOWER + 9,
- [41] =3D IPRIO_DEFAULT_LOWER + 10,
- [40] =3D IPRIO_DEFAULT_LOWER + 11,
-
- [39] =3D IPRIO_DEFAULT_LOWER + 12,
- [38] =3D IPRIO_DEFAULT_LOWER + 13,
- [19] =3D IPRIO_DEFAULT_LOWER + 14,
- [18] =3D IPRIO_DEFAULT_LOWER + 15,
- [37] =3D IPRIO_DEFAULT_LOWER + 16,
- [36] =3D IPRIO_DEFAULT_LOWER + 17,
-
- [35] =3D IPRIO_DEFAULT_LOWER + 18,
- [34] =3D IPRIO_DEFAULT_LOWER + 19,
- [17] =3D IPRIO_DEFAULT_LOWER + 20,
- [16] =3D IPRIO_DEFAULT_LOWER + 21,
- [33] =3D IPRIO_DEFAULT_LOWER + 22,
- [32] =3D IPRIO_DEFAULT_LOWER + 23,
+ [39] =3D IPRIO_DEFAULT_LOWER,
+ [19] =3D IPRIO_DEFAULT_LOWER + 1,
+ [38] =3D IPRIO_DEFAULT_LOWER + 2,
+ [37] =3D IPRIO_DEFAULT_LOWER + 3,
+ [18] =3D IPRIO_DEFAULT_LOWER + 4,
+ [36] =3D IPRIO_DEFAULT_LOWER + 5,
+
+ [35] =3D IPRIO_DEFAULT_LOWER + 6,
+ [17] =3D IPRIO_DEFAULT_LOWER + 7,
+ [34] =3D IPRIO_DEFAULT_LOWER + 8,
+ [33] =3D IPRIO_DEFAULT_LOWER + 9,
+ [16] =3D IPRIO_DEFAULT_LOWER + 10,
+ [32] =3D IPRIO_DEFAULT_LOWER + 11,
 };
=20
 uint8_t riscv_cpu_default_priority(int irq)
--=20
2.36.1


