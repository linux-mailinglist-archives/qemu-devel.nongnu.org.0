Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6E4B80E9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:05:00 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEN1-0007h5-SJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrO-0007Ut-Re
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:51227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrC-0006ts-3f
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993125; x=1676529125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZsXkcJzVuSL2NWL/cTuKMF+SnFjwZ9qctY53H23aGfc=;
 b=VkIUx7SizJCcX2i2q7fuBe3XfUQlWj/5ch7LuxH78l0jcIhbsVSL1KLr
 CRDqUyb3w0dOtukjEJ5aIx51d3rDl+RA1lL9J6QWNjoKB33NlWv3iBp4u
 yiSx/bqQ378TCvsbGUPiiwG1+fMU3VD1GtGRxMj/ROyRyi03lEKbmJtKX
 DPbV0dOcS9ldQ3hOWjqth9zEfHXeHm16VmJDrCtcjEPXXsIilo3vp+Mfp
 HGdkTW9xOta8naG/lVEyDOE/EuzLOaj8RjzyrYYh75zTeVINLJWq6KhRl
 L8WpfGm7epOgCpBvr+7RL+tYsYvofL9Nv2Ggvyz+vV+g2kw75aUugJYyL A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="192004576"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:58 +0800
IronPort-SDR: N48hZViOVC6e69uK8vT+QFGtNJkCFOpAgEeo3sXXZ5z2MLkhBZm7BSfuePYvAn/tLfeQQY98v7
 WD7cxPWPstkBg28Tb+Kvc5PSSiiblhJHbYIiqYD6p/8Ta0+erMn/TLlw7tupJsuw6d6vCokNeC
 rDZkzlK2Lcvsob2gJDw5tHPCRcuxc2sWE8/hkagdNjQLE9EMbLqyCQWhnZALHkzl+mPXtLmdZ1
 WvSiPGGAEzSFArNOu2yh5Zwc95MhP0KzX9pz/61Z0llRQnPOWMfnBGFXpF2kp34X166riK56Nb
 ckVoLxDhYi9Rl9jhftDYzqJd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:47 -0800
IronPort-SDR: AYTD2s3uj8eOrB0xxxPEGmYMUQPpit1IYnZhLQOvShrj51xf+t2u6/WYVjZkrrNGTuWBkXrKuP
 lVLQFZLXbda2Ak7O0JdcTpUkLdqS905oV0RcUoH87kY3panA7Q/psS6YDNPwfALXGOJiT/UW7n
 CgYpncAphJG3rygwzfuQWUsjObi1kAvRZBwWQt1JnFJwW4/xXHK+cRHqBYMtMenBPzSSbp51Sd
 Y+xrOsdB7yZIMqStcb2btMzLRlR7k95tFq908bpHkfapAjg9SZqUi+t9O/GO1k4zHW/7s6XYsJ
 vVQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7R24XtGz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993117; x=1647585118; bh=ZsXkcJzVuSL2NWL/cT
 uKMF+SnFjwZ9qctY53H23aGfc=; b=cSDxbPzdXI3cLVtXSzPcdAfCmBqBoVBzgE
 8TzxaJdUgC2brgaRfhmEGH+VSwC5j9ZYgBgKPgaVmfnuyveypZc0FTkWoJiXKtsQ
 RAHFXaCkw0Bhg3GaWXmqarKCXoCoe4mvggyTZUWSaGRhZqfgV862/cywdaUICGwf
 roupdD1yhqV5itELzKzX2NXR4sVZrEy8O+IFTpn/T3q80REEUo7opML/P71kXASx
 yaRanLjKrFBt6i3AvJ0raoqJZoN1VOKFiKvL4RfLakJgpIAiA6hE6mpagIg6xTqZ
 MeEj1Sz6yEBwsCyoxvfZsp/WD8mweyNTc25MGOKfRy6pfUxbuIVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HYZGYizygcnN for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:57 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Qx1gBJz1Rwrw;
 Tue, 15 Feb 2022 22:31:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 33/35] target/riscv: add support for svinval extension
Date: Wed, 16 Feb 2022 16:29:10 +1000
Message-Id: <20220216062912.319738-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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


