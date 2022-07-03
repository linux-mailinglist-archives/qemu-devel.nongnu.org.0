Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9AA56437A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:28:19 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nTG-0001kq-PS
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEZ-0008RT-Bc
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:08 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEV-0001zT-3p
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807182; x=1688343182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N99F1/5x4ohiaShjotG2aDGsbpXS1PNRRC2Rj68+zdg=;
 b=OfsVeQ+/t0S+HSxy7cbh38CvpPKb4VGXigZ7JfAeEE7mdITK7FjqWNuE
 MdLm78UmUnkQsgSxzXscERw+jZws6s6F2JGvN85O9ie0nS5IksiEgM7Vl
 NdORvxFfOf8v89jIPRCtdOeH+9RxeX7lcCALGZITvCQk4Y9SR758Zf4LX
 odEB8hqyycvfOmB1hSRncpH3DLcDfUS22AkMZ303Xf6RIxA4jeAJWQNIx
 HVKOPRsnmHFRgNM5xLKTXA7HoFWr4DCchtfuT6yc9M2qRMkbNdUopLvlc
 u1tf3z4N7VcWdY85O4tL04PkRAAhu/3twEHsqb70GpBZ4Opc3mZL/nNft w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667241"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:00 +0800
IronPort-SDR: m6XVh0RZJJTAakAA2iiqwz8IUfikgY5ewjcnM3Z2C6tBylbAR1ATg8PcdNX0ZSVkCh1sSdELw8
 1mIxMWQjZ1uTJiIASSaBZE1Xd88WLKkbbSB1bm8PONH1mnoeuYpCfz4oh0GP28Klnm3RPgwKQ/
 0JT0VTCYeeKZqImDRm6RKsG0ZcwHei5ONhTcEvICSUWgg7hR9m7jfsEUzaV819hhENdJBb9Vyy
 TF2EpKVDxn5kDYya5uwGqnDdro/feF6rAKDqyXCTVfyYiAVgCsCfesLxocfd5/Mth+tWEHAiuS
 Edl7ITkJcJy3TBD23Y+9NyAM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:23 -0700
IronPort-SDR: Y83OCL7WpkbY5oYWVrLwKhv4QAI2PfLGpSZ410de9v1OP1KN936I4Oc4xDEf63q7ZyNj+P9r7w
 Bg0HsjOmHeNsyq80+UK6XtsxgLj94YTXNKmxtASgCskDJ4Vc9vsCMsKdfHGzo1fSFejAIRzLSM
 0wkQLDeV8p028uOL9tSKYnOeqZKFXON08RGVjfmO5omBFJheai67GPYfiFCeKrKXtexVi2cPCp
 N9p8AFEkl0oIcwY+pkWMixWi2V12RiXcQG07NNdQUZpfckEUnLWL2oh1iyjREmuBEG3+kaHlCg
 iVk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XY363xz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807180; x=1659399181; bh=N99F1/5x4ohiaShjot
 G2aDGsbpXS1PNRRC2Rj68+zdg=; b=TbbeEi3Uzb/2PAM7RxW1b09BiTRDaFdLVr
 QJi4ImAsI2o4DQE0L453rPNaw5r8MbHtkc+5h4PbChpPrMD2f7lnNRujRoy8wsiR
 E+5tfiyXiVv7606+vfs8lt+eENpHvPSW7RTdHB5YPMmNXcNiRvUwBmJWC+YS2wqq
 jzA8sr8hbwnEcY132vqeb7isbpNOEzAIsZgvrdxDeo2V4sA/clya6UMdlLy9Jlxq
 kS4x9eiKz3cnXcPafjSxL2NX5iX45iXZuw+MlJHp18A2DFomY9tBfdKj4l2URrPO
 xQwHEQSfgC9TXdQ4OME9GGOZH24HDtwkvExoz32QFtdNyIDxH5fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id es1un0nIQjuS for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XV4Ymvz1Rw4L;
 Sat,  2 Jul 2022 17:12:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 10/19] target/riscv: Implement mcountinhibit CSR
Date: Sun,  3 Jul 2022 10:12:25 +1000
Message-Id: <20220703001234.439716-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Atish Patra <atish.patra@wdc.com>

As per the privilege specification v1.11, mcountinhibit allows to start/s=
top
a pmu counter selectively.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-6-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 25 +++++++++++++++++++++++++
 target/riscv/machine.c  |  1 +
 4 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ffee54ea5c..0a916db9f6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,6 +275,8 @@ struct CPUArchState {
     target_ulong scounteren;
     target_ulong mcounteren;
=20
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
=20
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..b3f7fa7130 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -367,6 +367,10 @@
 #define CSR_MHPMCOUNTER29   0xb1d
 #define CSR_MHPMCOUNTER30   0xb1e
 #define CSR_MHPMCOUNTER31   0xb1f
+
+/* Machine counter-inhibit register */
+#define CSR_MCOUNTINHIBIT   0x320
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b4a8e15f49..94d39a4ce1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1475,6 +1475,28 @@ static RISCVException write_mtvec(CPURISCVState *e=
nv, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
+                                         target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val =3D env->mcountinhibit;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
+                                          target_ulong val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit =3D val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
                                       target_ulong *val)
 {
@@ -3745,6 +3767,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,   read_zero },
=20
+    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",   any,    read_mcountinh=
ibit,
+                                                       write_mcountinhib=
it },
+
     [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 2a437b29a1..87cd55bfd3 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -330,6 +330,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
--=20
2.36.1


