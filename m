Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701224B8375
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:58:57 +0100 (CET)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKG9I-00005Q-HS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqT-0007Cs-A0
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:21 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqQ-0006ld-ME
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993078; x=1676529078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lV2H8aXYNZI3v18ib9Zl0I4yxpDpFq/u9I0xi4LQS+I=;
 b=a04TtfsKZgCkcxFAvfp3jzyX1zaNd9Nb1toW72BNxGhojQZvJtMi5adP
 yAHgq3uvTz03DLXJczIYyEpSMBE8ITGwWosTTJhE9JrgiLZ2AEJwvMKDu
 DqTUm0oiPncuttHZaXZR1RvE8rD545QC+lmeixja98A8/zrCGfnVeooYX
 XrHZCiHNoCiaIMEOrm4dfLmLBkcHK60Z03jc/3Ujq2H1wVm1cX287a/P7
 bgXCwgr6ZV5ABoc9oFbZKCbSc/tzdy3CJqq7pJNN4s8LbiBr9B+QawJKN
 dV4PBmM0yr0CaqAs0JPfipHG8fc58xzuMI1ydNM8hMHqRRJPFKrBmJ37s Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181845"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:18 +0800
IronPort-SDR: g+EdzMTRTvUyxkPqdzJKXEeC1oDjhvPzPc6H/mQ+ChaMRG/XBXxsVCmQurMvoJttSEoyVjkS3x
 BqRqI1t92ZK8npiJJHcynhH9IA4uJN0moQ6aOOvEqcKiSAYK24xafkw1KimSztyIz0Qb0PSGnm
 cjwiZI6sDMTBKrhhY8rC+pr6tVjvvX81o7WUqWNde1aUWz4CsRJyQ1gnKGaQeBMfAnXN856r+Z
 1/TYhZjTlCmRZNGkBcAckHda69Ifmw6CvtP4OVE49xE0sU/0Dq8CO6kr/Ks3jsnGUJKgDYgaLM
 DZOI+f/PN9EqL9iBPtihDnEO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:06 -0800
IronPort-SDR: npZMU64RymR6/f5vidMtDPoDPPeWq4temefehoi0/XOnpze5ALyaPxk4PBmSxIFbgXtFlcGNR0
 2oawDN2A947N79Ln8rZZ39A/+pN+OgNRmbnxVoBmGV1sXdznjvkdo3uauLY98fQAJONJgZlN/j
 C0Q6qZqD/7Mts/doHhLTOEvdn4xOnkmeLsFpmNK0TOGUgvuFcqOsEhjFVbWlQPdFbdsFsbZQRc
 STeuRNu6oTunLznMdUn+F+/2BbvniRA+G9oZERSfKDWz4tQ1P6tUiI3ArKAF2EEGzq62wzLMxY
 dG8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:18 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7QF5D45z1SVnx
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993076; x=1647585077; bh=lV2H8aXYNZI3v18ib9
 Zl0I4yxpDpFq/u9I0xi4LQS+I=; b=fBAwM7yIE5Go9D0eob8sFG0Yu37jevGLnZ
 KpSxfsVNkKyqbN3o72iKQSDkq+JrQoentl1f26iN8fRz/X1HEIWhV45cPBQhtJWj
 3Gd5l0i9xt18f9444jCUuRnNKG20gaA+Ugb9+CfiL/PsSJ+ehb2F3+xlxi2WxtWV
 Oj5d/6/oLQseW5ace6IbRrr26dJZE+Fa3eAIwJPFqkSWwZPM9SU0tx1fHkWW1zCX
 Vmj5YDpdKueboR98EI254o9R9dWWw8O9SQZtXeBYtmANleMlEWGz3IwQ4Gr0KJYY
 tWlz7BuDjBcN62H9notq2hyg6l5buZ9+U/BZnFsQZegDKFq8dEFA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Fvlcowgfru6O for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:16 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Q90F4Jz1Rwrw;
 Tue, 15 Feb 2022 22:31:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 25/35] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Wed, 16 Feb 2022 16:29:02 +1000
Message-Id: <20220216062912.319738-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-15-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 177 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 187 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f0e69f2871..c70de10c85 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -196,6 +196,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
=20
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -229,6 +233,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
=20
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
=20
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 39402a6a49..a186b31fcf 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -931,6 +931,169 @@ static int read_mtopi(CPURISCVState *env, int csrno=
, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
=20
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val=
,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno =3D aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect =3D &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect =3D &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect =3D &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val =3D *iselect;
+    }
+
+    wr_mask &=3D ISELECT_MASK;
+    if (wr_mask) {
+        *iselect =3D (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong xlen,
+                     target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+    if (xlen !=3D 32 && iselect & 0x1) {
+        return -EINVAL;
+    }
+
+    nirqs =3D 4 * (xlen / 32);
+    firq =3D ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs);
+
+    old_val =3D 0;
+    for (i =3D 0; i < nirqs; i++) {
+        old_val |=3D ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS =
* i);
+    }
+
+    if (val) {
+        *val =3D old_val;
+    }
+
+    if (wr_mask) {
+        new_val =3D (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i =3D 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-onl=
y
+             * zero. This means default priority order is always preferr=
ed
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) =3D=3D ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] =3D (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff=
;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret =3D -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno =3D aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt =3D false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio =3D env->miprio;
+        isel =3D env->miselect;
+        priv =3D PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio =3D env->siprio;
+        isel =3D env->siselect;
+        priv =3D PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio =3D env->hviprio;
+        isel =3D env->vsiselect;
+        priv =3D PRV_S;
+        virt =3D true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <=3D isel && isel <=3D ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode =
*/
+        if (!virt) {
+            ret =3D rmw_iprio(riscv_cpu_mxl_bits(env),
+                            isel, iprio, val, new_val, wr_mask,
+                            (priv =3D=3D PRV_M) ? IRQ_M_EXT : IRQ_S_EXT)=
;
+        }
+    } else if (ISELECT_IMSIC_FIRST <=3D isel && isel <=3D ISELECT_IMSIC_=
LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[=
priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgei=
n,
+                                                  riscv_cpu_mxl_bits(env=
)),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2760,6 +2923,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
     [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
=20
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] =3D { "miselect", aia_any,   NULL, NULL,    rmw_xisel=
ect },
+    [CSR_MIREG]    =3D { "mireg",    aia_any,   NULL, NULL,    rmw_xireg=
 },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
=20
@@ -2792,6 +2959,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
=20
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   =3D { "siselect",   aia_smode, NULL, NULL, rmw_xise=
lect },
+    [CSR_SIREG]      =3D { "sireg",      aia_smode, NULL, NULL, rmw_xire=
g },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
=20
@@ -2833,6 +3004,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   w=
rite_hviprio1 },
     [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   w=
rite_hviprio2 },
=20
+    /*
+     * VS-Level Window to Indirectly Accessed Registers (H-extension wit=
h AIA)
+     */
+    [CSR_VSISELECT]   =3D { "vsiselect",   aia_hmode, NULL, NULL,      r=
mw_xiselect },
+    [CSR_VSIREG]      =3D { "vsireg",      aia_hmode, NULL, NULL,      r=
mw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
=20
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index dbd7bd0c83..5178b3fec9 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper =3D {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
=20
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -272,6 +273,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
--=20
2.34.1


