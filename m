Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2A4B31F3
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:28:29 +0100 (CET)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgH6-0003ew-V7
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsV-00086M-GR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsQ-0000OO-GH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624177; x=1676160177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qu/zkqIJUrKSYtYPhIutzeZRZv8Yrs0kM+lNXYvui9E=;
 b=WWFchG6P1Mo1Ui7AP+C2oFrHmPTL+4Mwr0aG9f7q/zcizw5L5y95O9bK
 ACPk/C1mn353cuWYI767SoKnbX1gUG/GGFWoInzQy1zV1owGAXxsDxqli
 5IbU26JdqmzdYlHwJuudI0vZrhEaM1rGhvIJBTE6ClmnnTlqJhqKKgiui
 tHdGMAg7CBIejTa7r++hxXYOsGTTxZm+k043GIVy2DRaG9Qc1PoqfR9/x
 3oZT4EPeK7CnXvfGv6H5+djc+ZRzLQKdz6Esge+w/dkNbUQhh99DBwOxe
 Yai9MdOEFVUXdq3OqcTfEVx0arbRrfUte6yL2i9BFEEh21mSXj6+f54cM Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552493"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:52 +0800
IronPort-SDR: guUHp3abO2zl57FfVJxiiwwYlNd4daYfK/1QAwUaQpSbj3FyYdIyNxdtoXFp3W+rG4wPz0y22c
 AiFc56W+6PwA73YNBqUlMAHs5HuAiuI4SoZBx7q2a0b/6hF3IciO0R36jHcrkaglo8EAzuXtzA
 IN/HxsE7HScWv+l/CDSBgufefBVSZ3WPC5WNvJV6/DAMN+GtZowrJk7Kva1BUaR6ZsYyjQpwlw
 dvk7qNToog6Xyhjpdi6v2cYS5foXY9L05CDxkXoGNYXoeJRe2VJ0xv2IJMnMFJMmv67YWxYq5V
 vt5cPBkH0SDBHZPkjC5Zp0Hk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:47 -0800
IronPort-SDR: EQnIiopvAK+HuoGVyt9Zd9czVlgVYbALAOHbpu4s9fwteSmfbhouo3ebIreJ+QVbOHIO3ZHX06
 yAPCLGU5EMhaNAYOyC6GQTPWW9MRFN+gxzSBWhD5TzHYg0NqF/npXATPHyAnO8bP1njXIqu/4w
 Xc+wiXSq7AI8LNNRRKfUrjf+E86K1Z03EyndUXT7RaAVnBc2UOFmcw9tyo6pskIOAEP+7MosCr
 1UfUMeTzJHQriBgx4USbRs2Igm01NkCiyOoCuEu9zotbxMqu8tSHt3yxR72mUE6O2TCMgbsnaK
 fRM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzx1RTTz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624172; x=1647216173; bh=Qu/zkqIJUrKSYtYPhI
 utzeZRZv8Yrs0kM+lNXYvui9E=; b=LzaYDEcqEWpMKkD6Ib8E6HNSTCbZw06NV7
 vAqAZx+STzs/BbW33KzSgvG4ooKHUxs+Dz/DGAZ/uhtWOEAL9DR0Xup4iTI3h3qv
 Js//e4F5TZSh5LZ7/SiSR6UIF8le+PE4vPSBeC072/jf2EV33+QVhcUgrvlLhDgH
 RL+Y2OxYRtVebDFk16V2vQADKonYR6GtKkcef18LfbPocXYPhNCXf1TzJXIj/ujH
 QWCF4f41aSXCPVrd5CPfSCHVdb/VU7skeOjYu0nKEIrmMv5VRHeFquEQ/LooV9oR
 8aQwLfeSG3KroacQO0z9xHRrIQKWLiSf4dfGSOduDCkWInKcO1dg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1nvUSt9eTtQh for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzr6sXRz1Rwrw;
 Fri, 11 Feb 2022 16:02:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/40] target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
Date: Sat, 12 Feb 2022 10:00:15 +1000
Message-Id: <20220212000031.3946524-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-14-anup@brainfault.org
[ Changed by AF:
 - Fixup indentation
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 89700038fb..39402a6a49 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -194,6 +194,15 @@ static int smode32(CPURISCVState *env, int csrno)
     return smode(env, csrno);
 }
=20
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -517,6 +526,8 @@ static RISCVException read_timeh(CPURISCVState *env, =
int csrno,
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
=20
+#define VSTOPI_NUM_SRCS 5
+
 static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
@@ -898,6 +909,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, i=
nt csrno,
     return ret;
 }
=20
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    irq =3D riscv_cpu_mirq_pending(env);
+    if (irq <=3D 0 || irq > 63) {
+        *val =3D 0;
+    } else {
+        iprio =3D env->miprio[irq];
+        if (!iprio) {
+            if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
+                iprio =3D IPRIO_MMAXIPRIO;
+            }
+        }
+        *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+        *val |=3D iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1478,6 +1511,120 @@ static RISCVException write_satp(CPURISCVState *e=
nv, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, ret;
+    target_ulong topei;
+    uint64_t vseip, vsgein;
+    uint32_t iid, iprio, hviid, hviprio, gein;
+    uint32_t s, scount =3D 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_S=
RCS];
+
+    gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
+    hviid =3D get_field(env->hvictl, HVICTL_IID);
+    hviprio =3D get_field(env->hvictl, HVICTL_IPRIO);
+
+    if (gein) {
+        vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+        vseip =3D env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        if (gein <=3D env->geilen && vseip) {
+            siid[scount] =3D IRQ_S_EXT;
+            siprio[scount] =3D IPRIO_MMAXIPRIO + 1;
+            if (env->aia_ireg_rmw_fn[PRV_S]) {
+                /*
+                 * Call machine specific IMSIC register emulation for
+                 * reading TOPEI.
+                 */
+                ret =3D env->aia_ireg_rmw_fn[PRV_S](
+                        env->aia_ireg_rmw_fn_arg[PRV_S],
+                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, =
gein,
+                                      riscv_cpu_mxl_bits(env)),
+                        &topei, 0, 0);
+                if (!ret && topei) {
+                    siprio[scount] =3D topei & IMSIC_TOPEI_IPRIO_MASK;
+                }
+            }
+            scount++;
+        }
+    } else {
+        if (hviid =3D=3D IRQ_S_EXT && hviprio) {
+            siid[scount] =3D IRQ_S_EXT;
+            siprio[scount] =3D hviprio;
+            scount++;
+        }
+    }
+
+    if (env->hvictl & HVICTL_VTI) {
+        if (hviid !=3D IRQ_S_EXT) {
+            siid[scount] =3D hviid;
+            siprio[scount] =3D hviprio;
+            scount++;
+        }
+    } else {
+        irq =3D riscv_cpu_vsirq_pending(env);
+        if (irq !=3D IRQ_S_EXT && 0 < irq && irq <=3D 63) {
+            siid[scount] =3D irq;
+            siprio[scount] =3D env->hviprio[irq];
+            scount++;
+        }
+    }
+
+    iid =3D 0;
+    iprio =3D UINT_MAX;
+    for (s =3D 0; s < scount; s++) {
+        if (siprio[s] < iprio) {
+            iid =3D siid[s];
+            iprio =3D siprio[s];
+        }
+    }
+
+    if (iid) {
+        if (env->hvictl & HVICTL_IPRIOM) {
+            if (iprio > IPRIO_MMAXIPRIO) {
+                iprio =3D IPRIO_MMAXIPRIO;
+            }
+            if (!iprio) {
+                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
+                    iprio =3D IPRIO_MMAXIPRIO;
+                }
+            }
+        } else {
+            iprio =3D 1;
+        }
+    } else {
+        iprio =3D 0;
+    }
+
+    *val =3D (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+    *val |=3D iprio;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq =3D riscv_cpu_sirq_pending(env);
+    if (irq <=3D 0 || irq > 63) {
+        *val =3D 0;
+    } else {
+        iprio =3D env->siprio[irq];
+        if (!iprio) {
+            if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
+                iprio =3D IPRIO_MMAXIPRIO;
+           }
+        }
+        *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+        *val |=3D iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Hypervisor Extensions */
 static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2613,6 +2760,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
     [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
=20
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
@@ -2642,6 +2792,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
=20
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
     [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
@@ -2680,6 +2833,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   w=
rite_hviprio1 },
     [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   w=
rite_hviprio2 },
=20
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
     [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero, write=
_ignore },
--=20
2.34.1


