Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7E4B323D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:02:02 +0100 (CET)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgnY-00061h-OY
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftZ-0000Ve-A9
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:09 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftV-0000Wi-Le
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624245; x=1676160245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZsXkcJzVuSL2NWL/cTuKMF+SnFjwZ9qctY53H23aGfc=;
 b=aCwl1lvXPRHkT5oHLo/RxGj5Doi/in22E+31P4ZP3P/Xuv3L+O6r83Ar
 8qPCrhhQ8PoBoQrrXsix1rOf744AebTF2oBJeYsj+G7612jgMUZ7qNdxt
 ZLlthW07HOWiOWOsAH+cgpFLZuXdoeAf0PW6tOO1XwNf7rSaos3FRUdTL
 nqjUrlADkl9V86HkqojUVEKAe6MVmSYPbbLVxVq3TH/OZmsfZiSvUaokT
 SGtlffOqD85spr0aWlsCvWnpn3vWqyLdfXpZFazV0sw0MlRUL/9sbkMQ8
 VrwI4oD/L0/t4claHZPS/PiZ3mR7Oksd+JuNkcTexZ4fl98GQEbR1XAmb w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636547"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:04:04 +0800
IronPort-SDR: CRA/aRLd0O57XNnajSMkz4nyCy4Bi6cBznWVAA6+wILaUZT7tsw/N+otDDbDtPXKPf24pXzfKT
 Ir8onbVZizJEgB+YUWYArLBcbdVpG5kHxtijvRPE+D3DSZ1PDb7nMaaO5k/rT7ItiCfKwe/mEf
 hfl5/BP7uCvTiSmZaClGLO/VGQvzwtx0U49YpV2yI2gLsdSwhZCDhLEbnz7bNV9fE3AnS3Fa0Q
 R5F37VvH6rR/sKzvESPRCCafCe5gRhYIZ05stDR7WKc6Y7AIMs8SEkuZeb4BNjUdQr1SWfsY0O
 pnVJiDIm/WNpVut9yyzinnzW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:49 -0800
IronPort-SDR: YwFrIRL+kKOjqsnO/b/7DYh85KN2rRw59PJCI0cKT8Njo01VkNKqa2C+9lcWazwrAuXy2PGKjG
 7tBmdxBkaHAjcHXXuYU0wkX/N4wkwHF+FrwcCtW9LkATd39LS2KxP59Py3bY+XWnjqaQlcyxDc
 otH/P3L9Azaub9Q9wKS3y9+CISdK0fa5Ft4sORVI1PyMlAjyDrAg6jezkNddJGCfaFB0QINhbO
 82TfDFC5iTSCDySpjzsjUi+tO6Mu767tKHVKyhQlKoUJkZFjoUlL2x5fTaXXD657z93/1nOuBt
 DQQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:04:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW1H5PPkz1SHwl
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:04:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624242; x=1647216243; bh=ZsXkcJzVuSL2NWL/cT
 uKMF+SnFjwZ9qctY53H23aGfc=; b=ozvG1lKl1RHBWiv4/B7MNWqZkwb66ak3B9
 K+tXcwKOhcDqEA+cbqeSa1dmcCi2oe3OIFZFHMuZrrmqtV0dRn+Xk5rq32tx6tX+
 nfs0CtLG0R3vMfAbP7kmwpE2A2cfG3avkBRHmAhvrnZCI3Hj24fus/cnbf/9bvfX
 ON5S6CCAEaQbMk4jqpH3yTyWLnVbfsowVoitAWdE5eyG9mzpBSFt9XeV8K5zw9kH
 gp7Ixe0eszACS2mp6BdUL+BtcZWWoCLPI6D2P0hZI6AgZQ1O5ZY0R3s9FjjNB+eW
 bzHIC3ttSp353UF9LjKfsPDzbppMrIZhFW59eMZ5WBl4HoieH1DQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id g0EaRvyvDUqK for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:04:02 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW1C0SD5z1Rwrw;
 Fri, 11 Feb 2022 16:03:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 38/40] target/riscv: add support for svinval extension
Date: Sat, 12 Feb 2022 10:00:29 +1000
Message-Id: <20220212000031.3946524-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

- sinval.vma, hinval.vvma and hinval.gvma do the same as sfence.vma, hfen=
ce.vvma and hfence.gvma except extension check
- do nothing other than extension check for sfence.w.inval and sfence.inv=
al.ir

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/cpu.c                          |  1 +
 target/riscv/translate.c                    |  1 +
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cefccb4016..8183fb86d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -359,6 +359,7 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zfh;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5bbedc254c..1d3ff1efe1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r=
2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** Svinval Standard Extension ***
+sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
+sfence_w_inval    0001100 00000 00000 000 00000 1110011
+sfence_inval_ir   0001100 00001 00000 000 00000 1110011
+hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
+hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fda99c2a81..e5676b40d1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -774,6 +774,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
+    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
=20
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index eaf5a72c81..84dbfa6340 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -862,6 +862,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, t=
arget_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
=20
 /* Include the auto-generated decoder for 16 bit insn */
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/i=
nsn_trans/trans_svinval.c.inc
new file mode 100644
index 0000000000..2682bd969f
--- /dev/null
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -0,0 +1,75 @@
+/*
+ * RISC-V translation routines for the Svinval Standard Instruction Set.
+ *
+ * Copyright (c) 2020-2022 PLCT lab
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_SVINVAL(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_svinval) {      \
+        return false;                      \
+    }                                      \
+} while (0)
+
+static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as sfence.vma currently */
+    REQUIRE_EXT(ctx, RVS);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *=
a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir=
 *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.vvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.gvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_gvma_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
--=20
2.34.1


