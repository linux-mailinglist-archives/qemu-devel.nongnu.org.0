Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E00650664
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:28:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ja-0000RR-7c; Sun, 18 Dec 2022 21:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jV-0000QP-2g
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:25 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jT-00019F-2M
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416302; x=1702952302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZ8ZSQ/6EJPt3aV5ej9Xbmbe3XTCl5tkWbAwM/q28aQ=;
 b=au5RXVeHnwuqtAZkSE/cPuiA7Uv9q+D2F6aZ6Y7s4+rdhp0ibGrgLumA
 p8RssDX72HgfLjkQuHMACu4IdAJj3idwK/Ar0qv4dC0RvEux19RuH7N+U
 8Ixfm0eL8/Y3MwN5TvTDtx2NuQQGfjMJWZil/oMS4TxyQeqKZxXbCgyFP
 ETK9GToJnsEOIPr9fFAVug/ZeqPp6VXLCo9aJfjg+Tcrklq95UW4szE0j
 Tnb9sUT9wQQLTUYsTZgy6lE5euQadb+TYyJxc1E/edvvdonnJ24CD6k5h
 e24QzBSaw8fIWFqSWyZqPuoX5Pz4z4IK5a2N3UGbMnsISAGjZGRJbrrZD g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056798"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:21 +0800
IronPort-SDR: H5G9/SFTacBBbk/Qf55dmS8AhUn98Yzem7pK8A/s7DO9HydsJrc7F3k1n4ZODu4bwhwFjiw38I
 0aTmk70dKJWBjBzqESn3Xc8YcF7I+oGX0wSkK+FycDczVaVAXz5mIjg54ytxtkp0E42VRtVk+P
 a4x+xSx8k/b+xv+1sVeNbMZnqRwS2HJBop/2zqPdhGfIWETQbk8jkDJhb/lXNxWFAzP/wM94cc
 jKsGfPzNvziNebYK/0M0DlubZ71iXd0g2H6o/Lo5QRW4t/OtwiPreF9QO8l/jYj89rInEOe2XW
 eQY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:38 -0800
IronPort-SDR: OnCPZDvpcXQJasB6ZIRpwWtbSuH0iPLt5U5mPiwaTnynuciD4TTxoNNamq8rC/6mCsHJa1BYsV
 vrMdaMdQN9n5ox2dJcvaIknkk71ok1WjQkbjKOymhpbF2doh+OeFhDW5pev/xg+Aa781YcaK+i
 fX0Ad2NlMmvBKbxNRHNLmsu9Uom170Oh42ICpcncjVyMydlQ9EP3Ei1yhY7pUFR2H4n4rw28X0
 7eKmSUhz3LellKcgpfg+/qAbuWRIc1o8T7RO94hOQpSPnPl3WdoGeVyFPQAzaB78DYv8eSmTEt
 hKM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3K95SgLz1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416300; x=1674008301; bh=TZ8ZSQ/
 6EJPt3aV5ej9Xbmbe3XTCl5tkWbAwM/q28aQ=; b=Rz9AOWJW0wbVt0uahfnOpjV
 cTj9WAOIqgVBbhqO/qF6Rg32mprh2nFdSYbFubyRJUF0aNm96OIY0mt64Kc0Vvyn
 BN3pbhBlBQcvUswKa++BtoNECSDAFPKH095Q41MhifGcaAHD7GVPPQdEKUmwb0GI
 6rsSAbpckVblXVhPXYOvmo4AbNOl/awPHjVI/fOtJh3uiMMIDdTaYCpCqnweNYpp
 Og4vym9zulaWxGyg+R1W65SZqXYsLUS8r497A9mKz4Cj3XV1DWBTJaxtLUJP1eLT
 9prrjmukXbWV2Ncz5rmR4rasl6nE8t/9M8In6rArBLqu3jbENgDS7DUGrhKdYvg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wY0k28OUQyCQ for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:20 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3K71qDvz1RvLy;
 Sun, 18 Dec 2022 18:18:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/45] RISC-V: Add Zawrs ISA extension support
Date: Mon, 19 Dec 2022 12:16:47 +1000
Message-Id: <20221219021703.20473-30-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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

From: Christoph Muellner <christoph.muellner@vrull.eu>

This patch adds support for the Zawrs ISA extension.
Given the current (incomplete) implementation of reservation sets
there seems to be no way to provide a full emulation of the WRS
instruction (wake on reservation set invalidation or timeout or
interrupt). Therefore, we just exit the TB and return to the main loop.

The specification can be found here:
  https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Note, that the Zawrs extension is frozen, but not ratified yet.

Changes since v3:
* Remove "RFC" since the extension is frozen
* Rebase on master and fix integration issues
* Fix entry ordering in extension list

Changes since v2:
* Rebase on master and resolve conflicts
* Adjustments according to a specification change
* Inline REQUIRE_ZAWRS() since it has only one user

Changes since v1:
* Adding zawrs to the ISA string that is passed to the kernel

Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/cpu.c                          |  7 +++
 target/riscv/translate.c                    |  1 +
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 51 +++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 37f9516941..f5609b62a2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -453,6 +453,7 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zdinx;
+    bool ext_zawrs;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zfinx;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d0253b8104..b7e7613ea2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -718,6 +718,10 @@ vsetvli         0 ........... ..... 111 ..... 101011=
1  @r2_zimm11
 vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
=20
+# *** Zawrs Standard Extension ***
+wrs_nto    000000001101 00000 000 00000 1110011
+wrs_sto    000000011101 00000 000 00000 1110011
+
 # *** RV32 Zba Standard Extension ***
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b2c132e269..cc75ca7667 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -76,6 +76,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei)=
,
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
+    ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
@@ -766,6 +767,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             return;
         }
=20
+        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+            error_setg(errp, "Zawrs extension requires A extension");
+            return;
+        }
+
         if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
             error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
             return;
@@ -1021,6 +1027,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
+    DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 160aefc3df..df38db7553 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1060,6 +1060,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/i=
nsn_trans/trans_rvzawrs.c.inc
new file mode 100644
index 0000000000..8254e7dfe2
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -0,0 +1,51 @@
+/*
+ * RISC-V translation routines for the RISC-V Zawrs Extension.
+ *
+ * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
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
+static bool trans_wrs(DisasContext *ctx)
+{
+    if (!ctx->cfg_ptr->ext_zawrs) {
+        return false;
+    }
+
+    /*
+     * The specification says:
+     * While stalled, an implementation is permitted to occasionally
+     * terminate the stall and complete execution for any reason.
+     *
+     * So let's just exit TB and return to the main loop.
+     */
+
+    /* Clear the load reservation  (if any).  */
+    tcg_gen_movi_tl(load_res, -1);
+
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp =3D DISAS_NORETURN;
+
+    return true;
+}
+
+#define GEN_TRANS_WRS(insn)                                     \
+static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)  \
+{                                                               \
+    (void)a;                                                    \
+    return trans_wrs(ctx);                                      \
+}
+
+GEN_TRANS_WRS(wrs_nto)
+GEN_TRANS_WRS(wrs_sto)
--=20
2.38.1


