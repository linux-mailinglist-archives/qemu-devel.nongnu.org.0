Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323BF372309
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:36:17 +0200 (CEST)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhAm-0000EG-44
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpf-0004nP-NU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:31 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpc-0000ID-TO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080064; x=1651616064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRMpCu8nBEyzL0FPG1R+3S/zjbyK15XWJlcKZNOjeos=;
 b=ObgflDUDIheBK1UPHgbUs+DRxLUduNliEZwwSGMu7jMdS4USO2Fd9vo5
 rCA6F+f4qgHTbyJtKlIKUa0MFl/AjlOHXcDV7bPrtzAzEqscBXtO4Tis+
 eMtrQDvmvDU6+ZH+cyDfpYq2OEjIBwZwjvTy3mpXcYVOjiExWYekzJ132
 AUac3xovtmB+/zVJK8Ksbt6cmrU0rYiwtvvrwHnFmGdF5AvO2vu4uHu22
 wAF9CeXzG/HnfShMdzzZ4embgctaL+Ss1kHbcqX3dkFocV89y9/HJn2jY
 I9mIvDIOsstQuXn6483eZ+F8fgbhwvHjbXrpgP0oFl+NwIzSlS2veZkbJ Q==;
IronPort-SDR: 8hGpe55y8j2cUfBa9N2oHs3aP2xlFx+hKubWegctfYmPP9cKEQ8mHs7BZQy3w8259jSzlLjp8c
 /LacQl5eb0f9ipUVJxh+Zq9Iy8uKmDUPCgartJVoHGMCL7VCnUgxr5CLxyA9xBhJISbIC0OdiO
 3+q+35nspfD52h40y4rTcU/wFFfR+pAq641NDUOZBMZpForgi+eOCbLCZCWKHFjdXgMvzNGpMn
 AwcB/1lDoyni+zhOsLGCMbkbJNkciPgBbYveGfqyjUYre1yaH+2YA2sPnKxuQDH74mU4+bFl5z
 jcc=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114637"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:23 +0800
IronPort-SDR: FBqS7neDdkZS3YIQG90B4H63erHCh2qIc/kn8J1n+8OgW8ytPhhvNGlOIyBO12O1ulxn6kswj2
 iytCQkA1nPkHKrhALNbejplbNxLqD6I3PVYRmf/dsj4qpvwY8dppdjM9m9AH57uBQMR8NTmv3a
 7attIJmI5ORzN7fIQZX/9S6DHRDXjKL8G8C0DyEEJO0u4xdN+vg7ouRB8HQROe2QiFSAVONhVM
 NlGV/nMteYXljot/tuwor4n86J1CToCPy2EVUylJhOpBcTjrF3eagJHTTTi5MTRyMquzFzsys+
 7oVxGWjHcGV6KR3yMm2X+RYy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:34 -0700
IronPort-SDR: iqCr/OhbMgWRIQw00X3FL2gzqKrrc1p8LoQjb7VetfB/Uj0CvwEDHHr+Ir3JALVBFtldHdvAiP
 q5NpbeT9czKLJQRXJA4GdmXp7ejIuxuR7ZDOEtmk6rt5MQ3kqfTXwRiSL8V+yADRwqkZIf/C4k
 t744CA73hVpOznyKgqrCes2DJ/Jzx0trkKnPYU4WdasOJxOMsUoAbesybsJ14P27IBonVqAMZl
 d1t6LetIK1/hgl2anvEYzQe9oJwwc2lGoBbuayTXo3kwRu4iuFW2XF0MMzgqnyaYiIzJ09I8fZ
 JiA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:21 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 13/42] target/riscv: Use RISCVException enum for CSR access
Date: Tue,  4 May 2021 08:12:58 +1000
Message-Id: <20210503221327.3068768-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h       | 11 +++++++----
 target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
 target/riscv/gdbstub.c   |  8 ++++----
 target/riscv/op_helper.c | 18 +++++++++---------
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a7b8876ea0..842d3ab810 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -454,10 +454,13 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask);
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                      target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f67eaf4042..f0a74f0eb8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1382,10 +1382,11 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1407,41 +1408,37 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     if ((write_mask && read_only) ||
         (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
 
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     /* check predicate */
     if (!csr_ops[csrno].predicate) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
-        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
-        if (ret != RISCV_EXCP_NONE) {
-            return -ret;
-        }
-        return 0;
+        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
     }
 
     /* if no accessor exists then return failure */
     if (!csr_ops[csrno].read) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     /* read old value */
     ret = csr_ops[csrno].read(env, csrno, &old_value);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* write value if writable and write mask set, otherwise drop writes */
@@ -1450,7 +1447,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
             if (ret != RISCV_EXCP_NONE) {
-                return -ret;
+                return ret;
             }
         }
     }
@@ -1460,17 +1457,19 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         *ret_value = old_value;
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
  */
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = true;
 #endif
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5f96b7ea2a..ca78682cf4 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -71,7 +71,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -94,7 +94,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
@@ -108,7 +108,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, &val, 0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -122,7 +122,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de..3fc5e0505d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -42,10 +42,10 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
         target_ulong csr)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -54,10 +54,10 @@ target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -66,10 +66,10 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
-- 
2.31.1


