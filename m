Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD0653928
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lp-0007PK-HI; Wed, 21 Dec 2022 17:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lm-0007P0-DL
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lj-0000bQ-KE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662459; x=1703198459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/tolp0FI5QSu95NYDTltjd9EctNgrO7SoOyyHZ4l80=;
 b=k0aRm5zD7u0eZz18ENi5dlIqJhCYiId10GAjL5UTCP9NcLovkEWziMwE
 1/d3R9PsioiVzZTUEeizOOwC86K9ZcB6ktszYn7+kXaBqhDiCXhfhfk8R
 6uX3KwgMEGGb4eHQ3acVEvKaD1q0war5H7NotzvDNJEJo6uFRE1ONtBFm
 FB7HcBmgL+aIMPwq2fTIUAb9Qp0ewcj0ItChjAx0FRX5jUdxl/Tx90VPt
 VMD1tUz1jEXkLxbHPRCmL8uA0b1djiR9dJ1+6oL6j1h1GkWuaoFU7U7hG
 emyg7zh8HGSfWEodPKg04eviJW1yNljuO1M6hFZ7QwB+n6rBM7DsRE7Zc g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561306"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:49 +0800
IronPort-SDR: b3gqVcqswv8U8+IEWAhWOrJgjR/Qnn1EZdw6Vllaye8WxMcC6EL2jWDkOfq4ryyCQXOyIC58jE
 DkMqxAZwHlZUEjp9MaK6846+3vbwG69uH7ggkl5VFm4C1DHlTxV1C+mqCF8C9yvLKG9+DbLscU
 qbf/ZFNcJJ7UiiR1/ZoVz8xvAwPPYOE56d45QDURzuWuuFkWCF+aBTruGal7UMbP44PnIrSECJ
 DLo7Pjs+eus1u3vFJpyojs7AIwIEys33AAD5MDV7WRf6iPcwv6JaqzDj9Dtr9ZAgKBASxVYKL4
 rK8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:18 -0800
IronPort-SDR: jkiPC8uP+iRm+3WBRBkk2rOvhPm6gcBdvZmc6ZRzK1xWftekmp5PqENDsysvTmMNxzi9PjZqgC
 oS2DpVyafTal3/e/VUZOXZsb1XhV+/RoBvOBq+KXiZAoL48kh1UfJo7kd6bBIdLvSySfpu4dM2
 Tju6LBzY3JG6n2XBOhYRdWRyWJno3UUWp2ZTvWe27wpG3Lxcmii6YXAbtrXWkh8kNvL4NnMfqB
 JBMuR2ln/Df8CcsTEMAqtV5t9/I0gS4d/kK3QPkX1YxneqN9c17HwfXsQXJVh4PCuwI/2dhbrU
 6IQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLn26HTz1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662448; x=1674254449; bh=v/tolp0FI5QSu95NYD
 Tltjd9EctNgrO7SoOyyHZ4l80=; b=FgBHLVfFBX8ffBbUZt0OTrBKYmYPIh5TYA
 +aUf2Dgt2T/aP9M7v8lL8yjNj3bkA4OZ+ToDIhUV4298eCxddw2/ejttPwcCRote
 UpC4p+yMdgIm8Bj8s7CL9Jg+UMeAhxTOJ4gH5ymYuqqw1PsbeIvfGF7orgkpY4Fh
 9xB7pS4JbcqwAEMROFd6Wjxn9/kiPPd9/b3HmkS448EyGC6NSkz4C4+DHsqZFMPd
 5nDe9H2ABEwVLWVwZAE24Snvba7f6FZzCEz+IiTI7AvvojZTzfRvvAg7KHb0BCsZ
 kTZF+VRWIzNsl3KwKh21Mv4SZzvqZu2aXYPhwHCT2L284TPMwmNg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z7403kXjh5PA for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLk2bzTz1RvLy;
 Wed, 21 Dec 2022 14:40:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 09/45] target/riscv: Add smstateen support
Date: Thu, 22 Dec 2022 08:39:46 +1000
Message-Id: <20221221224022.425831-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Smstateen extension specifies a mechanism to close
the potential covert channels that could cause security issues.

This patch adds the CSRs defined in the specification and
the corresponding predicates and read/write functions.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221016124726.102129-2-mchitale@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  37 +++++
 target/riscv/csr.c      | 316 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  21 +++
 4 files changed, 378 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 443d15a47c..5cac0c5eec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -366,6 +366,9 @@ struct CPUArchState {
=20
     /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
@@ -441,6 +444,7 @@ struct RISCVCPUConfig {
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_zihintpause;
+    bool ext_smstateen;
     bool ext_sstc;
     bool ext_svinval;
     bool ext_svnapot;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d8f5f0abed..8b0d7e20ea 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -197,6 +197,12 @@
 /* Supervisor Configuration CSRs */
 #define CSR_SENVCFG         0x10A
=20
+/* Supervisor state CSRs */
+#define CSR_SSTATEEN0       0x10C
+#define CSR_SSTATEEN1       0x10D
+#define CSR_SSTATEEN2       0x10E
+#define CSR_SSTATEEN3       0x10F
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -244,6 +250,16 @@
 #define CSR_HENVCFG         0x60A
 #define CSR_HENVCFGH        0x61A
=20
+/* Hypervisor state CSRs */
+#define CSR_HSTATEEN0       0x60C
+#define CSR_HSTATEEN0H      0x61C
+#define CSR_HSTATEEN1       0x60D
+#define CSR_HSTATEEN1H      0x61D
+#define CSR_HSTATEEN2       0x60E
+#define CSR_HSTATEEN2H      0x61E
+#define CSR_HSTATEEN3       0x60F
+#define CSR_HSTATEEN3H      0x61F
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -289,6 +305,27 @@
 #define CSR_MENVCFG         0x30A
 #define CSR_MENVCFGH        0x31A
=20
+/* Machine state CSRs */
+#define CSR_MSTATEEN0       0x30C
+#define CSR_MSTATEEN0H      0x31C
+#define CSR_MSTATEEN1       0x30D
+#define CSR_MSTATEEN1H      0x31D
+#define CSR_MSTATEEN2       0x30E
+#define CSR_MSTATEEN2H      0x31E
+#define CSR_MSTATEEN3       0x30F
+#define CSR_MSTATEEN3H      0x31F
+
+/* Common defines for all smstateen */
+#define SMSTATEEN_MAX_COUNT 4
+#define SMSTATEEN0_CS       (1ULL << 0)
+#define SMSTATEEN0_FCSR     (1ULL << 1)
+#define SMSTATEEN0_HSCONTXT (1ULL << 57)
+#define SMSTATEEN0_IMSIC    (1ULL << 58)
+#define SMSTATEEN0_AIA      (1ULL << 59)
+#define SMSTATEEN0_SVSLCT   (1ULL << 60)
+#define SMSTATEEN0_HSENVCFG (1ULL << 62)
+#define SMSTATEEN_STATEEN   (1ULL << 63)
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..c861424e85 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -283,6 +283,72 @@ static RISCVException umode32(CPURISCVState *env, in=
t csrno)
     return umode(env, csrno);
 }
=20
+static RISCVException mstateen(CPURISCVState *env, int csrno)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
+static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int b=
ase)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv < PRV_M) {
+        if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return hmode(env, csrno);
+}
+
+static RISCVException hstateen(CPURISCVState *env, int csrno)
+{
+    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
+}
+
+static RISCVException hstateenh(CPURISCVState *env, int csrno)
+{
+    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
+}
+
+static RISCVException sstateen(CPURISCVState *env, int csrno)
+{
+    bool virt =3D riscv_cpu_virt_enabled(env);
+    int index =3D csrno - CSR_SSTATEEN0;
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv < PRV_M) {
+        if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+
+        if (virt) {
+            if (!(env->hstateen[index] & SMSTATEEN_STATEEN)) {
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            }
+        }
+    }
+
+    return smode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -1861,6 +1927,197 @@ static RISCVException write_henvcfgh(CPURISCVStat=
e *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_mstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val =3D env->mstateen[csrno - CSR_MSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen(CPURISCVState *env, int csrno,
+                                     uint64_t wr_mask, target_ulong new_=
val)
+{
+    uint64_t *reg;
+
+    reg =3D &env->mstateen[csrno - CSR_MSTATEEN0];
+    *reg =3D (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+
+    return write_mstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
+{
+    *val =3D env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
+                                      uint64_t wr_mask, target_ulong new=
_val)
+{
+    uint64_t *reg, val;
+
+    reg =3D &env->mstateen[csrno - CSR_MSTATEEN0H];
+    val =3D (uint64_t)new_val << 32;
+    val |=3D *reg & 0xFFFFFFFF;
+    *reg =3D (*reg & ~wr_mask) | (val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+
+    return write_mstateenh(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_hstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    int index =3D csrno - CSR_HSTATEEN0;
+
+    *val =3D env->hstateen[index] & env->mstateen[index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen(CPURISCVState *env, int csrno,
+                                     uint64_t mask, target_ulong new_val=
)
+{
+    int index =3D csrno - CSR_HSTATEEN0;
+    uint64_t *reg, wr_mask;
+
+    reg =3D &env->hstateen[index];
+    wr_mask =3D env->mstateen[index] & mask;
+    *reg =3D (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+
+    return write_hstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    int index =3D csrno - CSR_HSTATEEN0H;
+
+    *val =3D (env->hstateen[index] >> 32) & (env->mstateen[index] >> 32)=
;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
+                                      uint64_t mask, target_ulong new_va=
l)
+{
+    int index =3D csrno - CSR_HSTATEEN0H;
+    uint64_t *reg, wr_mask, val;
+
+    reg =3D &env->hstateen[index];
+    val =3D (uint64_t)new_val << 32;
+    val |=3D *reg & 0xFFFFFFFF;
+    wr_mask =3D env->mstateen[index] & mask;
+    *reg =3D (*reg & ~wr_mask) | (val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+
+    return write_hstateenh(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_sstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    bool virt =3D riscv_cpu_virt_enabled(env);
+    int index =3D csrno - CSR_SSTATEEN0;
+
+    *val =3D env->sstateen[index] & env->mstateen[index];
+    if (virt) {
+        *val &=3D env->hstateen[index];
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen(CPURISCVState *env, int csrno,
+                                     uint64_t mask, target_ulong new_val=
)
+{
+    bool virt =3D riscv_cpu_virt_enabled(env);
+    int index =3D csrno - CSR_SSTATEEN0;
+    uint64_t wr_mask;
+    uint64_t *reg;
+
+    wr_mask =3D env->mstateen[index] & mask;
+    if (virt) {
+        wr_mask &=3D env->hstateen[index];
+    }
+
+    reg =3D &env->sstateen[index];
+    *reg =3D (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+
+    return write_sstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_sstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3744,6 +4001,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_HENVCFGH] =3D { "henvcfgh", hmode32, read_henvcfgh, write_henvc=
fgh,
                        .min_priv_ver =3D PRIV_VERSION_1_12_0            =
  },
=20
+    /* Smstateen extension CSRs */
+    [CSR_MSTATEEN0] =3D { "mstateen0", mstateen, read_mstateen, write_ms=
tateen0,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN0H] =3D { "mstateen0h", mstateen, read_mstateenh,
+                          write_mstateen0h,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1] =3D { "mstateen1", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1H] =3D { "mstateen1h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2] =3D { "mstateen2", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2H] =3D { "mstateen2h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3] =3D { "mstateen3", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3H] =3D { "mstateen3h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0] =3D { "hstateen0", hstateen, read_hstateen, write_hs=
tateen0,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0H] =3D { "hstateen0h", hstateenh, read_hstateenh,
+                         write_hstateen0h,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1] =3D { "hstateen1", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1H] =3D { "hstateen1h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2] =3D { "hstateen2", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2H] =3D { "hstateen2h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3] =3D { "hstateen3", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3H] =3D { "hstateen3h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN0] =3D { "sstateen0", sstateen, read_sstateen, write_ss=
tateen0,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN1] =3D { "sstateen1", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN2] =3D { "sstateen2", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN3] =3D { "sstateen3", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver =3D PRIV_VERSION_1_12_0 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status,
                          NULL,                read_sstatus_i128         =
      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c2a94a82b3..e687f9fce0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -253,6 +253,26 @@ static int riscv_cpu_post_load(void *opaque, int ver=
sion_id)
     return 0;
 }
=20
+static bool smstateen_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+
+    return cpu->cfg.ext_smstateen;
+}
+
+static const VMStateDescription vmstate_smstateen =3D {
+    .name =3D "cpu/smtateen",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D smstateen_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool envcfg_needed(void *opaque)
 {
     RISCVCPU *cpu =3D opaque;
@@ -364,6 +384,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_kvmtimer,
         &vmstate_envcfg,
         &vmstate_debug,
+        &vmstate_smstateen,
         NULL
     }
 };
--=20
2.38.1


