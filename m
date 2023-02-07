Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0F68D070
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7q-0006mW-2d; Tue, 07 Feb 2023 02:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7n-0006m6-NP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:43 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7l-0000FW-OU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753841; x=1707289841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7PXTslbIT/eY8Txb3jJFcERoBGJNOuOzNURhwv8viQ=;
 b=Hj6ADlPOU5zG6jSB1HgmhA1w6o9YaeqR82zWCk01dTOMW6nL1MpU/DZb
 rmoh0wLQpHR3EvOuW40socotncTFXN3AWIowhJdIlwH7RQDFFoA/eT90B
 4kWtn84F5eHrfV2ZOqzrD4QGZkZsSNOyn7tXd2yW6esqUuFAwcDgrRdKg
 Z/uJKVOFoAJYuiWpDI//WBPUJ3yffmvei+7ARGvLL+9QSMwcSkMjjSFmJ
 /cj0SkEbrpIB4NOSMttsFqcqqKwycaQ4sbf6VEnmJuFMa8H6U9cjvw+cB
 WLupwM4RTQe5ZwUZ0bE+Ei7H6uOBgK8dVPq3/Ba0tgi8GiMsiTY1DtCxU A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657514"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:20 +0800
IronPort-SDR: VVVSmeav8TPZ3QgUPWmGdpPWftF3wqMbt5DkaiDY4weIwC8ebXEo+HtzZU8iu9vfHAcyfCFFUT
 svYJfhAqg3wuUaHlp4p83qOXcpZdDifmOBNtiunkFmDxf9VpXIWub4Rti5Gh4qSrZpqgAY2YZ2
 ZHcpIqvcdOpqbaLPHea9kXqCm946GYXzGXx+j/uPDspCoDUv5FLb7O5KcrlEFoUb6U0xOL2TN0
 qEfZfL2useXxt1eoJwIh2Qe0KJMqMgEHG3KZAJQ7zgFUWrbtAhqn4cp2Hf37p3YJAUa+LNn6Et
 ++E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:37 -0800
IronPort-SDR: FpuJrJ3mVFJ42BFZ8Dm8bDcWE0bztRtZG0qtgl4aAY9mC+vWhXCeCdTTvr1p6Z1ckVucF6y2tY
 Hl7HUuqtTgbywWOU4+riQxtPsXgc4gH4LRuj0w8F3g+Gp+oG8Ume0xR1r4twCSbe127RLyGl+u
 iDFCHIikKmKfBfJRLv1yPz1FAYGhMm5wHTWBV1LWmqceMB2fBTCiIeR6fkojj9L4MZ8+dt87Hj
 MGLsSpgxAQ6M2u+LoWGHKNBzl7xZq0vds1sFNSKAgPbyvulGuxYWSYIyyNMSCzLpGUf8K/Zyrb
 gFM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vR033DHz1Rwt8
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753819; x=1678345820; bh=p7PXTsl
 bIT/eY8Txb3jJFcERoBGJNOuOzNURhwv8viQ=; b=jPu6WDXdXOy8jKq6CIRuz9k
 L/z5VMZVndQpi0MWIhbrPaFq0pmyOYNWuHFHdCZ52A/won1Nigiwhi1BpMFmOS8F
 Vc9Nkre2k6PA87AX6BaD9MoTVqXJ1CHKal2VRzUpBZ39EGu6gJYela9AVBbaY0I9
 Hhqg3bLkzTvXXLVb5TXfdm8aMk+kjESHJSL/SzjIAALXza+zyd7x4HT5tIOXng6Y
 hbdscRoS3+HQ67Mof3F6d9I5R/Wl6vSSul613Xcr9iY4yW0yNDxNCLBuleseHaTr
 o5+Kx1r7F0hapwdHJUVzBEPvXwXWCZ/udragck+du/f0tLps96JgMZJ5AHwhlQw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qCjAKRqtyAUc for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQy0cVbz1RvLy;
 Mon,  6 Feb 2023 23:10:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/32] RISC-V: Adding XTheadSync ISA extension
Date: Tue,  7 Feb 2023 17:09:27 +1000
Message-Id: <20230207070943.2558857-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadSync ISA extension.
The patch uses the T-Head specific decoder and translation.

The implementation introduces a helper to execute synchronization tasks:
helper_tlb_flush_all() performs a synchronized TLB flush on all CPUs.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-3-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/helper.h                      |  1 +
 target/riscv/xthead.decode                 |  9 +++
 target/riscv/cpu.c                         |  2 +
 target/riscv/op_helper.c                   |  6 ++
 target/riscv/translate.c                   |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 85 ++++++++++++++++++++++
 7 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d3ebc6f112..ea00586436 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,6 +474,7 @@ struct RISCVCPUConfig {
=20
     /* Vendor-specific custom extensions */
     bool ext_xtheadcmo;
+    bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
=20
     uint8_t pmu_num;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 58a30f03d6..0497370afd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -109,6 +109,7 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
+DEF_HELPER_1(tlb_flush_all, void, env)
 /* Native Debug */
 DEF_HELPER_1(itrigger_match, void, env)
 #endif
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 30533a66f5..1d86f3a012 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -10,9 +10,11 @@
=20
 # Fields:
 %rs1       15:5
+%rs2       20:5
=20
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
+@rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
=20
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
@@ -36,3 +38,10 @@ th_icache_iva    0000001 10000 ..... 000 00000 0001011=
 @sfence_vm
 th_l2cache_call  0000000 10101 00000 000 00000 0001011
 th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
 th_l2cache_iall  0000000 10110 00000 000 00000 0001011
+
+# XTheadSync
+th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
+th_sync          0000000 11000 00000 000 00000 0001011
+th_sync_i        0000000 11010 00000 000 00000 0001011
+th_sync_is       0000000 11011 00000 000 00000 0001011
+th_sync_s        0000000 11001 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ea61e5b22..f76639845d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
+    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
 };
=20
@@ -1090,6 +1091,7 @@ static Property riscv_cpu_extensions[] =3D {
=20
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
=20
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 878bcb03b8..48f918b71b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -258,6 +258,12 @@ void helper_tlb_flush(CPURISCVState *env)
     }
 }
=20
+void helper_tlb_flush_all(CPURISCVState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+    tlb_flush_all_cpus_synced(cs);
+}
+
 void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs =3D env_cpu(env);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1e29ac9886..0657a4bea2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,7 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
=20
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadcmo;
+    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index 24acaf188c..f35bf6ea89 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -22,6 +22,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADSYNC(ctx) do {             \
+    if (!ctx->cfg_ptr->ext_xtheadsync) {         \
+        return false;                            \
+    }                                            \
+} while (0)
+
 /* XTheadCmo */
=20
 static inline int priv_level(DisasContext *ctx)
@@ -79,3 +85,82 @@ NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIR=
E_PRIV_MSU)
 NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
+
+/* XTheadSync */
+
+static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MS(ctx);
+    gen_helper_tlb_flush_all(cpu_env);
+    return true;
+#else
+    return false;
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+static void gen_th_sync_local(DisasContext *ctx)
+{
+    /*
+     * Emulate out-of-order barriers with pipeline flush
+     * by exiting the translation block.
+     */
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp =3D DISAS_NORETURN;
+}
+#endif
+
+static bool trans_th_sync(DisasContext *ctx, arg_th_sync *a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MSU(ctx);
+
+    /*
+     * th.sync is an out-of-order barrier.
+     */
+    gen_th_sync_local(ctx);
+
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_th_sync_i(DisasContext *ctx, arg_th_sync_i *a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MSU(ctx);
+
+    /*
+     * th.sync.i is th.sync plus pipeline flush.
+     */
+    gen_th_sync_local(ctx);
+
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_th_sync_is(DisasContext *ctx, arg_th_sync_is *a)
+{
+    /* This instruction has the same behaviour like th.sync.i. */
+    return trans_th_sync_i(ctx, a);
+}
+
+static bool trans_th_sync_s(DisasContext *ctx, arg_th_sync_s *a)
+{
+    /* This instruction has the same behaviour like th.sync. */
+    return trans_th_sync(ctx, a);
+}
--=20
2.39.1


