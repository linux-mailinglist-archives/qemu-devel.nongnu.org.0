Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A33FF7D5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:28:10 +0200 (CEST)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLw7t-000855-K7
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3l-0003FM-96
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:23:53 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:16619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3j-0003xk-Hm
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625031; x=1662161031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DWTb7faK5lXbqRqwl4F0MWI3aMOeLqgKbwb65Kqcza8=;
 b=p3/PO7eZkHsQoVa3jU3zDjhymlEg1Li3J+pp2sj3g/WBEO4W6ggp1mDi
 l9if2hmX6/Hu0m7O2+csKs3Cfs/2yTORkzrMv4DG/nrxRWSaQ8ygwfZya
 olk0NWotu95VveSTR7u807f8OmZt0ccBuP7TXvO9U6/1EyUO8g8bMKzi/
 HKbKDeLBJR+XBgkXvj/6Ynoj1RUmQQFm3yZhYg1sI7NiUiUkj58xr86GC
 B0G/jB73WjZ5hinmUXtmV8k9jtSbJkkJMp1+tFpBJ9Re20newuZ6p/rUF
 6mHrfsoitjI/V8WnbSt5H/mCGjc8URTdH5oDoU22aY+yhy9VtmexYEfZT w==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="178192924"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:23:46 +0800
IronPort-SDR: e4t9N/NoQue+61isFhofRMUiCBw6WixAExSIqEV6zAl7bDm5s6VOlTtv0U4JKN5TmIfIdP4nCN
 EjeEVohkRsEbDMfOQVlkNhBHv26Hn8CbiJGP6ZC5x9WysKY0Utd5xMUJehM9k3ayMJUHjc53Mb
 8re8MrRfyWGCQ8GX2OXCMobkzZ2vVE41EvPN8TYc5FQfJBurmeZ9XzbYnemN/Fjqxrbkc+Ot0S
 gPXjRbcRWbgIy9wRS+w7/6J0/Cb7XZ15kYMotkeD0oixlHe50dMUlWmaEa+KXirHwwIWZ7GAp0
 zwSpPediJ5Ox7iW1XNQ+/n+Z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 15:58:50 -0700
IronPort-SDR: PvGV3ACyFGKof8gup6e1HnWesr6XqiEX95Tk8Lbth4/RsGzNpHlqeERivhb1gG+wGuhCw13ATl
 Vymoe19wqHKJHS87sHvBKDcHCmi5I2TAhTf3JMFabsGCEmIFykf0RzRBQK2R39nBQkMB/DaiKV
 8bqbTdA3UvIc71rSWToIXkBs1GP1eTZJxiJwn2xsi9+zHYmwcJ2oHdOF+9TL76itu5iazK0BTr
 eVQEklV9GIMTvDKLrg2S9D27HnXtqSz/wsVsf0TX/vDwO9sy5TE3CR9b44FY18+juOXcGvdvm0
 1J4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:23:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xnZ494Qz1RvlV
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 16:23:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630625026; x=1633217027; bh=DWTb7faK5lXbqRqwl4
 F0MWI3aMOeLqgKbwb65Kqcza8=; b=PLoroVOeGOKty1eKu6bOCyIwzsKD+GFxte
 PlTzuWIE56HeM3weUrLWpVUE7PQkW/iortalccZmMLFBQDhRa4xDKtl42H1UAuSc
 YHgvxuPFYlZaWtVTfyHCt7Yhjjg6wFpIJnRjdFxyYGiKiP6z5ILWElXBBzAoobtG
 /5er7i8SfEF5M0OqjKr3cFTwZUSMXfrmWgmIZ6i2NVXu3M01Ne0U94aYzELAh7fD
 NisTA7dw/8EZmiC+bMm7OBTm3BukapcnqBC8xxCJjZsHabEgFuw+2juubVTieV8L
 sQX1NUOy/h4HyfR8JR8dQRHblIRlwJphfHxmOFTY6X37D4M2P89Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fIkbUQlkpWSu for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 16:23:46 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xnT3Y11z1RvlP;
 Thu,  2 Sep 2021 16:23:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/2] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Fri,  3 Sep 2021 09:23:35 +1000
Message-Id: <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630624983.git.alistair.francis@wdc.com>
References: <cover.1630624983.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers based on the CPU feature.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  5 ++++-
 target/riscv/cpu_helper.c |  9 +++++++++
 target/riscv/translate.c  | 33 +++++++++++++++++++--------------
 3 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..6d41a16ae3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,7 +77,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_MTVAL_INST,
 };
=20
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -130,6 +131,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    target_ulong bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..42edd71c1e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -967,6 +967,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             write_tval  =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            if (riscv_feature(env, RISCV_FEATURE_MTVAL_INST)) {
+                /* The stval/mtval register can optionally also be used =
to
+                 * return the faulting instruction bits on an illegal
+                 * instruction exception.
+                 */
+                tval =3D env->bins;
+            }
+            break;
         default:
             break;
         }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46..4221d8e2d5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -173,8 +173,27 @@ static void lookup_and_goto_ptr(DisasContext *ctx)
     }
 }
=20
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply th=
e
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
+ */
+static TCGv temp_new(DisasContext *ctx)
+{
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] =3D tcg_temp_new();
+}
+
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    TCGv tmp =3D temp_new(ctx);
+
+    tcg_gen_movi_tl(tmp, ctx->opcode);
+    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
@@ -195,20 +214,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, ta=
rget_ulong dest)
     }
 }
=20
-/*
- * Wrappers for getting reg values.
- *
- * The $zero register does not have cpu_gpr[0] allocated -- we supply th=
e
- * constant zero as a source, and an uninitialized sink as destination.
- *
- * Further, we may provide an extension for word operations.
- */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] =3D tcg_temp_new();
-}
-
 static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
     TCGv t;
--=20
2.31.1


