Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EE509809
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:55:17 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQii-0004Oz-P0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRF-00059X-Cv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:13 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRD-0007wz-BT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523031; x=1682059031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4PC5cmhiA/VscMc7l+/UctJxXA0S+Ha0rF+NodFEV30=;
 b=i22hS+YQ52Mq2jMRE07XgUMc8qpHDSb+MwrlFBPHY7auqZYdr+t+hrJt
 UwsHhYeme85q/QTp1ExAU4TBWeufNUZm+j0loDNQVlXMX+Qen+JkK/Xci
 dOFnOueaUxj61hJX+GjhDyn7QVI5YSvwiZw+tzp2S9UraiCacU3a6cAl0
 FmG7azCRZvPl7IKCaHfLSofYqG2ayyKyljmSZD/aFFnfv49vlRVHOT7X7
 nutvd1d2uJboCdx3z6e+Y9fokP5jzwsT/pP40V3EUXaVu8R0c/245wD0l
 5QWDtdfmz/mUdm0jXStYe3nNAUgteeh57FI5bG+YGxdrra1guUAv2NMZh g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639948"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:10 +0800
IronPort-SDR: atqnvi4FT+fziUQt5mEBuy+9EoHS7NftiwQqb9+dxZoXmvdsFdjTg5xGIxCKzLTyI4BUdFrIgv
 WXVro1h7RIBER5C7yUygSg8JNHB8Rtm/Y/QvtQTMeh8aJk7c9YbDsL16PNdpN35xUohTWhQVFH
 5eZB0zlMzFByXkSxfbGNlPqx00szUwFMSJ2f3EBirpA98yvH9TItulChjT1KLIfJpWYrm1Acsi
 c0fMhi6nH8ENwVMtdw8ovojQJeVzVWVlWXzr+v9w1Jtqs6cuKCBh5ERMEFQFaioalepagVsnUj
 nLi8T+BrSQaie7fC02I0/LR9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:12 -0700
IronPort-SDR: MX50LrkXLPqGt7QfHhcfO+85V5ZPLFdBXfeuHM4qw8nQ/NpRbiG1GYxEFo8t/LV0uvSeNovhQw
 G1qUmiiTNC5DjEulQENLLKYIaIT6pDVgyBQK8lYwO6tzgkYbfsc8pgDjb893DGcu4WEsnTjJnP
 cvx8PQ0jkkW9zBeeBrgFvn8H3oV6qPa1UW4BaVIrR4cruJf9BYB1GjG3x+Ug2MwViu1461DL9M
 PVG5LZ/4zLMzUvzn59SHTeiX+7ad/IDBSRlciH+3Fijl3vNxrviEmRyqixcr6iNqUaqW74xKzt
 dUY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWT6PFTz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523029; x=1653115030; bh=4PC5cmhiA/VscMc7l+
 /UctJxXA0S+Ha0rF+NodFEV30=; b=tt6BPyRzJejBH0oX2goF2imCaCJfNzGQWh
 bmJ0Th7nMU9dhrxb60CgU+JoZZj7lBPDubfUvrevmiW0pm8K3jkyEjvhGLxbTElC
 +0ODFijcPEWItFXsnIea2aptoIbV8jcivbS/vpwwQcDSU2Y1KYsk6bDv6bShCEU7
 nVAF7wc7P8d8qRCzLEQ4vZWsDBIBBs3rWlaHwN+o3GoQaYYXOCfO0m3pPddwUA5q
 y0zCVbFXtt6Z+kR51Sny7WX7wiOAdWS5AEwvjh4z68SF2qHudsaQaFVCLN6nz9TQ
 IDd+PxbkQgUCJ3OBpwA6fD8q/Gi5dNv0M9grqW+K0e1N6yypSS+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id s2gN6uAkzuAz for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWQ2N73z1Rvlx;
 Wed, 20 Apr 2022 23:37:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/31] target/riscv: Add *envcfg* CSRs support
Date: Thu, 21 Apr 2022 16:36:06 +1000
Message-Id: <20220421063630.1033608-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Atish Patra <atishp@rivosinc.com>

The RISC-V privileged specification v1.12 defines few execution
environment configuration CSRs that can be used enable/disable
extensions per privilege levels.

Add the basic support for these CSRs.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-6-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |   5 ++
 target/riscv/cpu_bits.h |  39 +++++++++++++++
 target/riscv/csr.c      | 107 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  23 +++++++++
 4 files changed, 174 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7a92892cd6..1ef1b9162f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,11 @@ struct CPUArchState {
     target_ulong spmbase;
     target_ulong upmmask;
     target_ulong upmbase;
+
+    /* CSRs for execution enviornment configuration */
+    uint64_t menvcfg;
+    target_ulong senvcfg;
+    uint64_t henvcfg;
 #endif
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 48d92a81c3..bb47cf7e77 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -202,6 +202,9 @@
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
=20
+/* Supervisor Configuration CSRs */
+#define CSR_SENVCFG         0x10A
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -247,6 +250,10 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
=20
+/* Hypervisor Configuration CSRs */
+#define CSR_HENVCFG         0x60A
+#define CSR_HENVCFGH        0x61A
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -290,6 +297,10 @@
 #define CSR_VSIEH           0x214
 #define CSR_VSIPH           0x254
=20
+/* Machine Configuration CSRs */
+#define CSR_MENVCFG         0x30A
+#define CSR_MENVCFGH        0x31A
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -663,6 +674,34 @@ typedef enum RISCVException {
 #define PM_EXT_CLEAN    0x00000002ULL
 #define PM_EXT_DIRTY    0x00000003ULL
=20
+/* Execution enviornment configuration bits */
+#define MENVCFG_FIOM                       BIT(0)
+#define MENVCFG_CBIE                       (3UL << 4)
+#define MENVCFG_CBCFE                      BIT(6)
+#define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_PBMTE                      BIT(62)
+#define MENVCFG_STCE                       BIT(63)
+
+/* For RV32 */
+#define MENVCFGH_PBMTE                     BIT(30)
+#define MENVCFGH_STCE                      BIT(31)
+
+#define SENVCFG_FIOM                       MENVCFG_FIOM
+#define SENVCFG_CBIE                       MENVCFG_CBIE
+#define SENVCFG_CBCFE                      MENVCFG_CBCFE
+#define SENVCFG_CBZE                       MENVCFG_CBZE
+
+#define HENVCFG_FIOM                       MENVCFG_FIOM
+#define HENVCFG_CBIE                       MENVCFG_CBIE
+#define HENVCFG_CBCFE                      MENVCFG_CBCFE
+#define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_PBMTE                      MENVCFG_PBMTE
+#define HENVCFG_STCE                       MENVCFG_STCE
+
+/* For RV32 */
+#define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
+#define HENVCFGH_STCE                       MENVCFGH_STCE
+
 /* Offsets for every pair of control bits per each priv level */
 #define XS_OFFSET    0ULL
 #define U_OFFSET     2ULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6590cc8aa7..84a398b205 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1398,6 +1398,101 @@ static RISCVException write_mtval(CPURISCVState *=
env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+/* Execution environment configuration setup */
+static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D env->menvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask =3D MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENV=
CFG_CBZE;
+
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
+        mask |=3D MENVCFG_PBMTE | MENVCFG_STCE;
+    }
+    env->menvcfg =3D (env->menvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D env->menvcfg >> 32;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask =3D MENVCFG_PBMTE | MENVCFG_STCE;
+    uint64_t valh =3D (uint64_t)val << 32;
+
+    env->menvcfg =3D (env->menvcfg & ~mask) | (valh & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D env->senvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask =3D SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENV=
CFG_CBZE;
+
+    env->senvcfg =3D (env->senvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D env->henvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask =3D HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENV=
CFG_CBZE;
+
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
+        mask |=3D HENVCFG_PBMTE | HENVCFG_STCE;
+    }
+
+    env->henvcfg =3D (env->henvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D env->henvcfg >> 32;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask =3D HENVCFG_PBMTE | HENVCFG_STCE;
+    uint64_t valh =3D (uint64_t)val << 32;
+
+    env->henvcfg =3D (env->henvcfg & ~mask) | (valh & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3158,6 +3253,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MVIPH]    =3D { "mviph",    aia_any32, read_zero,  write_ignore=
 },
     [CSR_MIPH]     =3D { "miph",     aia_any32, NULL, NULL, rmw_miph    =
 },
=20
+    /* Execution environment configuration */
+    [CSR_MENVCFG]  =3D { "menvcfg",  any,   read_menvcfg,  write_menvcfg=
,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_MENVCFGH] =3D { "menvcfgh", any32, read_menvcfgh, write_menvcfg=
h,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_SENVCFG]  =3D { "senvcfg",  smode, read_senvcfg,  write_senvcfg=
,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_HENVCFG]  =3D { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_HENVCFGH] =3D { "henvcfgh", hmode32, read_henvcfgh, write_henvc=
fgh,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status, NULL,
                                               read_sstatus_i128         =
        },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 5178b3fec9..243f567949 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -231,6 +231,28 @@ static int riscv_cpu_post_load(void *opaque, int ver=
sion_id)
     return 0;
 }
=20
+static bool envcfg_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return (env->priv_ver >=3D PRIV_VERSION_1_12_0 ? 1 : 0);
+}
+
+static const VMStateDescription vmstate_envcfg =3D {
+    .name =3D "cpu/envcfg",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D envcfg_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(env.menvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
+        VMSTATE_UINT64(env.henvcfg, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .version_id =3D 3,
@@ -292,6 +314,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_pointermasking,
         &vmstate_rv128,
         &vmstate_kvmtimer,
+        &vmstate_envcfg,
         NULL
     }
 };
--=20
2.35.1


