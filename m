Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30F14F5AD
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 02:24:37 +0100 (CET)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixhWW-00082C-6x
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 20:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIM-000456-NY
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:09:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIL-0006gz-Gw
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:09:58 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIL-0006KL-7l; Fri, 31 Jan 2020 20:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519396; x=1612055396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RhlxqMZsQ1pTYmUtf7J021d16sj5hYHzFRt4jweg47Y=;
 b=ZP4DxDC+Sex0T5WRTYkfCPzCLGTdBLO/mvRPWtPJdvtnVdP+jPr1F4hS
 I5XSWn7VH8W4CRwA96IGPFflj5BDP/xfDSQm2mTZSkhnUCefiC5UzcmvO
 nnwEGg+sPrQElxYo3J9MjO//W3IKiO/okhmQnA3H9WD37v9sLOhdZTxC2
 SvNA0LkYQJDnESpOGSxfiY8vt3hJVQ+tmu8C9QT9GXtnVjdXACTKMxwu4
 VkRpXIfaen8RvdYhas+QrlirIP9KG9vxu0ngUXJmHBbWocFz+tHS+BJ66
 c82RRPcMwphSgjiGmaLFbytXiEnRrmwXynaCk6fVgOFVI6wxFyVACKV47 w==;
IronPort-SDR: OcmG7vmMO0P1CWi2xtcrbEj7EoyTbyNhPQvO8I+6I+I37C20TZ7wp0IPxaidh6gTROdT29J00j
 q6DOQPXyFXAYLnXD0duZmRE9pTa23gbABOr4Nal4NjEwcV5+UDfv1diRpGq+uCyz0y7x66EVrX
 HUNfCMxNocrvFD9ngT6sk0LmQnOk6ls/m6MUcXiTUKAsCTGxUVP4C2lZC3k2JJC9L41/tbTfgT
 Se5meujNphOQ9gRu0rjZ8NF804qhdgJOwVsaNW+JKfZoJCbFDQxC7ATIA8hHGDlT5WJSxK9cW9
 Euw=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872481"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:12 +0800
IronPort-SDR: sfT3E2vWWLSNzuuWYPE6LOV98degS9IrklMtsn/xmzIZqr3rKw3QA7jSj5xpUPKIwXc4C5gFKz
 +CcIC1s0CO3CamJg+7zE0dsdhOl1VQ8I2VUPbZ18fKQsSh/EblmPj1qzrc4nIMT8iMDurwxiql
 T66CBSkIW9aq98kj74JRnmPIY7Io4HZXnm+h916cCkMuJncqJm1+s+jxZ9r/lGDht5Ofl9qIPs
 OwXN6elRVc5YvD2qZWCVRJ99nAMX6huI6FccAfvBD1VDpxVBu93uu7eYw0QHbdYvmpVBYuLloh
 t5kwQmNGuaddAJj8ZNCXmOzV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:21 -0800
IronPort-SDR: j2Q8935Rts0WvMAfAhyf18wtEUaDXsOEe8BgTLjrTv3IsIWUE/r0SFvERHEh4QZGeiKPK+MDRP
 WitFkgV7tH2dVqK65/c0n2a/fQplRcMsC7NNhD5fhZ1gE3I3FvbuZE5yWXcwZkas4xMPUZbxfd
 0meSK/Pv/YPSUogXUZ4kJXr0PDueyZY8O8/T98ImcggDzsvWAKkdfX7nfoAhX0bhehpEj+aD8b
 41/5VPyc7TjQrp9lAYB+zDcc86iJ8FUP6PcVesMNokSf7wAJE0yut1GOlGncjVa3ygoGYa+S0Z
 ZEM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:09:12 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 23/35] target/riscv: Add hfence instructions
Date: Fri, 31 Jan 2020 17:02:36 -0800
Message-Id: <a3831ba233dec5f7c0dfb3399e70706a2baf1602.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode                    | 23 ++++++-----
 .../riscv/insn_trans/trans_privileged.inc.c   | 40 +++++++++++++++++++
 2 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 77f794ed70..cfd9ca6d2b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -63,20 +63,25 @@
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 
+@hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+@hfence_bvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
 
 # *** Privileged Instructions ***
-ecall      000000000000     00000 000 00000 1110011
-ebreak     000000000001     00000 000 00000 1110011
-uret       0000000    00010 00000 000 00000 1110011
-sret       0001000    00010 00000 000 00000 1110011
-hret       0010000    00010 00000 000 00000 1110011
-mret       0011000    00010 00000 000 00000 1110011
-wfi        0001000    00101 00000 000 00000 1110011
-sfence_vma 0001001    ..... ..... 000 00000 1110011 @sfence_vma
-sfence_vm  0001000    00100 ..... 000 00000 1110011 @sfence_vm
+ecall       000000000000     00000 000 00000 1110011
+ebreak      000000000001     00000 000 00000 1110011
+uret        0000000    00010 00000 000 00000 1110011
+sret        0001000    00010 00000 000 00000 1110011
+hret        0010000    00010 00000 000 00000 1110011
+mret        0011000    00010 00000 000 00000 1110011
+wfi         0001000    00101 00000 000 00000 1110011
+hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
+hfence_bvma 0010001    ..... ..... 000 00000 1110011 @hfence_bvma
+sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
+sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index c5e4b3e49a..b9b5a89b52 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -108,3 +108,43 @@ static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
 #endif
     return false;
 }
+
+static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
+
+static bool trans_hfence_bvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
-- 
2.25.0


