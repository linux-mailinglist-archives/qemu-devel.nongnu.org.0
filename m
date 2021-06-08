Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8339EAE0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:39:31 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPmF-0003Ug-1T
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPel-0002oN-Fi
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPej-0004Zo-Hd
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112304; x=1654648304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UEZf/cSHlcu+CBKQ1ahpaVZ+MBU/lpLrB75MIUjVXNg=;
 b=nXaPLMQOWQNOjYtP+CUFDqSjGEPcXd9T74OzfLuJBpzEl1c9XFhSbKpT
 vq9BPG1hQJLOL6PzdYuyAl7wxS7H8l5C66270Kld1EPYwMA5H1dRjKV5s
 HzLol81enhF+QuxDV+Ty/cgVshmXmir4CsAajfJVgZp+8owvPxqn9OczV
 A8frO0NgMd2tozIVtp0J8q1CS2OfaTeRlHTzc4Q9O0US/gzSwumKJXO5S
 KtlJnDxfK5r6wHT0k9btYjpOhAayEhy2LF0NJXzWIy0xReNv2hPUQYM1n
 6EXHAjsqpwoh1Dl2wfJRZY/UjZGwIEytZcXIQmmV+ddY5f9WQhbOoQXSL A==;
IronPort-SDR: vNbIEVsfW1bEx59b3j3iXRXhU+mqA5Msiq6iBwahKjkw0B4XsXwcUP1dhlDhj/4cLqCcgy4yMI
 +UMc6eHO8GcQ5MayLDlVvuF/ipT3kKgLqqgwgiTJDSiLxsM5i4npcFLd3Ge1F5U1Iimbhb5vhr
 M0cGLbpsJVdpxE7CoFM6V+0zyJlPO3vcez/1X8FTAKPs3noSpoA1LG82zokbUtqeNgJDlAh+sO
 4nnCDBoHlISnNkoSkAFl0SYJ5X0XQ+kzGpocOEd661OFrdumAvk2avIw+O7wgjVk6xtG3tnB40
 ppo=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087437"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:28 +0800
IronPort-SDR: OPJzXfZrhw9Fpw/bjXvFc43mBCyepp7jbV1tvmx8X999fWp7qMtx/UvAnRezgfGw+c52TpmPWs
 0ZZ3vhXYIHt4xO2HgiGNEefIDxP1L744hDIUvmrknpKDjfgFhuQU9dgHtTHalQViJRY6jzdvjZ
 9UdVBGy8cSr/mldAMJkiv8CgYTZRiJ5ZODlG1xnC5Qi/545biQt5P0BjbQf3W6M1OTT/V6Ad9B
 rnhoEGjb4U2nXDC8SrbiYsmWcPEkCfMlTKQobpHd+lbOMCVn2ah3pScCLlhQATrieY2Id7OfEr
 0iU9WNk9Fj2pFmzxsqQD9MII
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:35 -0700
IronPort-SDR: hY7gawSsQgW/oyA43a14HSUKQf/GM9XsprSNhVLzqfMc2YxYcnMbM2DlSJONtQJNG7oOtfdjNo
 aqiUzDj3FN+lCC5zctzYQtmZhTsGGI4Oc788EXaJtpd0i943L0BSQC1R2XUu8n7svfU4ahUNNS
 2FVzWwrc1s4eDlPW5iMQiHEQLuYEAtd0Pq5tDTbY0fgETP3awTfyyBbHU4Ef/yDLV4OhqftXMf
 yldaY2pWgivKOKBOAPjVX+bUlkmh21JCyrQv5KukGERGaQ24XVR3iH9Fkt5lH/+OmfPNtGuTd6
 v4c=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 23/32] target/riscv: add gen_shifti() and gen_shiftiw() helper
 functions
Date: Tue,  8 Jun 2021 10:29:38 +1000
Message-Id: <20210608002947.1649775-24-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
interfaces for immediate shift instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-9-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 39 ++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
 2 files changed, 43 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5f1a3c694f..292cf09932 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -652,6 +652,45 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
     return cpu_ldl_code(env, pc);
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index bd93f634cf..6e736c9d0d 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -268,54 +268,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -377,16 +340,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_shli_tl(source1, source1, a->shamt);
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-
-    tcg_temp_free(source1);
-    return true;
+    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
-- 
2.31.1


