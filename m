Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4F374BEF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:32:44 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR0V-00047W-K2
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQth-0001tG-Ix
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtf-0000wu-H5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257139; x=1651793139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4xfBUHTz99KeO4XUesDnPxK/SiUu00qLVoeeLc7XQY=;
 b=K+f0NatpOewuhCr/Jhl+2cQgWJBXaj+D1oiVq3KbylqlFCsgdsoXiGAE
 EfB7xhIEkc5GjUTGHXtyYd0LBwsWIktIAYDSxgUBx6ys+yk+BQQeWi+n0
 i3WVR4jayobONz9JpM68NkxNa13eCJ4LuS5VacIqZaKA2BCgWRE3RNumm
 Q73qs6KZiUukO/+ElR5hKlrZ5DQrKGcM35bBS7jZn2GRbWJcEopcUB/PW
 9+I5uxX3K19x8CcazS9BbBi1PQ/NhagVWU8c3uPrsTy4Sxt7aV1eCpvmj
 TSg0ZwXVavVYXbQQS3nxxE4eiqIcCM136BTqje/MamtBRUy/E2TSKy0cU w==;
IronPort-SDR: 9ZafMxzYSzb+BFJI2Eru5eHw+GnpNjSbQTmF0Oh5ymBOdxycAmyC+Ukzur6sxwRbvW3nDLMUue
 8EABkcMpdI75i9TBdYzGM1EQOAy7wwpbP88Ph1d22F5K2tJNgS7/xhfRmeVTXdbDIbqDLgZ482
 5Ayg4LKzR9E+GSKrBz5QqxH8YYJOoceAOAMIef9x2QT2ocsLPeFjueVA2SHmeQGW21Fl5mtutQ
 4PQiWtlLUxrBU44liLGVH5EQTNrIit1gosxkWzeRcSCZCmSkoY6CEHieMetlgesw4cejZFYhIg
 ZDI=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586014"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:19 +0800
IronPort-SDR: VIWLO7sNpl+bexAymgHL534VVxWcBOIUIxVgDqCEs0Tns3yArafJAtuTdLoFHWVan5IjdWvrQV
 en1BPVISo2/vkzQUwD7AYljG8zevok1GkV9WWkr0XSPoqvhWgeSZoF+3jJjZFNnQqilGd5ir8w
 2/Sem6ZSmg8NMX48DRdjxIAK6Lil4K1IcwNNXZUes4Jc3v2XgNaahrVUblynydHefhkt+7PLsk
 861uwsKEg5KkI3v5d7AyRRhzijCpSw9BsITw79CEnuaQq56H5zzIJQHDv1pjrtSNS8sXTQZRKg
 9n658Dwk4eRij6dJmL2f1Kkc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:59 -0700
IronPort-SDR: +C7b1pwd6DHT5tXHouNVb2sMseSrPt8seEj+H9PGTlHNoHfHSfTmnIq1kX5XrpJJ3z0wtjIYDY
 WJxPaDGRTCiCTrzCY/KwCABSAGgCLn1vYY2oRrncll2OpXlu9uw+enK47dFF9bM/F7Udto6dlS
 dCUaqkN6wrSrR9F0qCWuQ+GkhF+plRqy7WhQpuAJInzDJk3+7qB+nA/9+r1xQ3hOSYa/2/+HGQ
 DiNa+7EXKtRJnUlGp6iP7+dcc12u3RL/767hEeSCApZuK9Ps2INIy3ivAw0+N5XV9QRSdhgPPJ
 jY8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 36/42] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Thu,  6 May 2021 09:23:06 +1000
Message-Id: <20210505232312.4175486-37-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h  | 10 ----------
 target/riscv/csr.c       | 12 ++++++++++--
 target/riscv/translate.c | 19 +++++++++++++++++--
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d738e2fdbd..6e30b312f0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -368,16 +368,6 @@
 #define MXL_RV64            2
 #define MXL_RV128           3
 
-#if defined(TARGET_RISCV32)
-#define MSTATUS_SD MSTATUS32_SD
-#define MISA_MXL MISA32_MXL
-#define MXL_VAL MXL_RV32
-#elif defined(TARGET_RISCV64)
-#define MSTATUS_SD MSTATUS64_SD
-#define MISA_MXL MISA64_MXL
-#define MXL_VAL MXL_RV64
-#endif
-
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
 #define SSTATUS_SIE         0x00000002
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41951a0a84..e955753441 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -538,7 +538,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    mstatus = set_field(mstatus, MSTATUS_SD, dirty);
+    if (riscv_cpu_is_32bit(env)) {
+        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
+    } else {
+        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    }
     env->mstatus = mstatus;
 
     return RISCV_EXCP_NONE;
@@ -614,7 +618,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     }
 
     /* misa.MXL writes are not supported by QEMU */
-    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+    if (riscv_cpu_is_32bit(env)) {
+        val = (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
+    } else {
+        val = (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    }
 
     /* flush translation cache */
     if (val != env->misa) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 26eccc5eb1..a596f80f20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
+#ifdef TARGET_RISCV32
+# define is_32bit(ctx)  true
+#elif defined(CONFIG_USER_ONLY)
+# define is_32bit(ctx)  false
+#else
+static inline bool is_32bit(DisasContext *ctx)
+{
+    return (ctx->misa & RV32) == RV32;
+}
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -369,6 +380,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
+    target_ulong sd;
+
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
@@ -376,13 +389,15 @@ static void mark_fs_dirty(DisasContext *ctx)
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
+    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
 
     if (ctx->virt_enabled) {
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
     }
     tcg_temp_free(tmp);
-- 
2.31.1


