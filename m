Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7339EAF1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:45:55 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPsQ-0002Vw-6u
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPec-0002SI-9q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPea-0004b7-EX
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112296; x=1654648296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1gSH8wuUqDWZXjBJkI+arCd9nAFl8QTx4wsWDR6xxs=;
 b=SlKRWFaRxVMXhQTcs4bnbnoRl4IH8pC84g1bEk3dwxxa00IKSsfkb1fW
 weFeMi1LvjyZAbogciHMtl0uaBHpfeldELdqu28uD4DkLOwJ1QjX7JV2S
 r94K0+Rmiazs1EGHyww0OCo1+FbVBSs3n1+XNEn/LHt/AQXnjBHIhtlUg
 yPAjH7sAL/uVt50Ce2+RNYJeDt4WFSC/urY0UfLM24tUKlP6F1gbXZD13
 2CoXrf94Q77e+ARY4B2bMclzv9NGTw+hOurVZfBw5mUU4sTK7ZgMfZWE3
 l4GKz3lQixJH52Ij/VuEPtD4F/5hDhTUHkm1sBql7Mf5UlCGmRV5D9NfZ w==;
IronPort-SDR: FtaCA5MSmqZRi5G1/PX9DfxkLze3bNWUeCjYgDXBOvIjp3rY1ncQdUCiK4KMOuHQh0y4xJ1jhh
 3c1H4lC+Szw099/NEldLzEJhf72oPRrIuk6Nsr2aB3BkVu/MjKomuxrMEDi9rRKcp9hU1iPCdo
 +3FK/IwCAMS8hZiWMq1MaEcmC3ltcY/gTrHk1C7GmMTQvbvEZ8O+DQSTpHWYRqY30OoUMJV6AE
 YhNSCp62VQ9rP4sH58gzJlb3VjF8WRK+O2H9Go6e9vgRs82+AXxuMCgg8zqt2/cI+6CzJjh58I
 5ek=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087425"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:21 +0800
IronPort-SDR: PLMVYM2SElpbbv7GCEqv+XMuXiJiZkzCdkSkxg6occjmVRW28WVCpo9MIQWBf4LsmERIefj19k
 VdF5FQDAOiGb4E3HXU9u1Dqieu7QPyBorEV2FB1pw46eol/rWQc6numTijEbp/3mfYAKYAf536
 asq7BYnMXM7MEXlZTJY+PXazqxlp4geExTZVDqE3NzbUHgM+DOpicloIOKUldSBpUDromqbImp
 IYQvlCGh+5M7yMIM15jr6Ighe/OGjr8KuYIwh+966dL7/LVHUs5bqwO4nxpd1ATL6M/dmqs914
 cQ/wbIV3Vx1djLmEHJEIzctG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:28 -0700
IronPort-SDR: ukSmyZ9A7OfLZzeMBvxPN0KfqnGjuIZsllV5O2bDoE7KcDf8MmkA4j1MVq/A7aiUIclQ4hRtAD
 2BywmoO7AsOvxGM7XVhCWvNvSqQK/v3d5RcUjJadn7gVG3K001fLbyemy5eAeIiHuQCx1zCKrk
 PlQKU+I4Cx+PRH6Mq6qqdgH5scIeKcRKkll6WLHcSEMC39lSGREoqc3t+fyYiBzxkgSrkCsn83
 8fteCNvkVCen6jYEi8gBU33gqhs0lYezwcTmhLctRvyx1fNHXH0Z5lKIrNPfn/qz3cmxBOe9JB
 ZFw=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:18 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 21/32] target/riscv: rvb: min/max instructions
Date: Tue,  8 Jun 2021 10:29:36 +1000
Message-Id: <20210608002947.1649775-22-alistair.francis@wdc.com>
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
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20210505160620.15723-7-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9b2fd4b6fe..81dfdfbafd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -669,6 +669,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 770205f96f..5a4fc02f70 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umax_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.31.1


