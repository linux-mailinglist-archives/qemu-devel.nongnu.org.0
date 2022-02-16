Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AB4B825A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:56:40 +0100 (CET)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFB1-0005EE-JB
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqO-00079x-9u
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqM-0006ld-0W
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993074; x=1676529074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qu/zkqIJUrKSYtYPhIutzeZRZv8Yrs0kM+lNXYvui9E=;
 b=qFVOlSBkPD3f1vto0j8otpTK3TjXU1IFtjn2TG489NdFYV7/OdpSH2kU
 GLTCxbdeoe179g8SVRGv85o8x6rLMkAQoB7m4cb8v7rN/qjXGU7jh/koA
 TSjrdOPi87yzpCDshjWUEqcuGyQe/X8QfLtHM7vWQe9RldeyPrlCA42iE
 RjeBTSGTNrCD6wqWoKhp5W601aWT6/ayqa/vDs030t8hR5p2UdUQcWVBU
 eRN6XzA+KhXGlL8h4hdPa6GSjyg9imQBPjhZV650G8IF71/4UG/L4/MVu
 gyy37FpFY37durIK9dwG8f+dK2S/V8oKm2TwjU6kwvnuUUO0YnfjQ2pUo g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181839"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:13 +0800
IronPort-SDR: 723WWLpT3ptbmEv4FVsexb7YPGnHrIDjb0WN5Jmx3t+XFwYikdJktZRdHY1z89z2th5hoUblAK
 VLCJ8YU47RiW0UsH4v2T7EL0lzSibmufU57HftF0lVayvzP05ve7Ea/crYzlBjEGrwgHunP17Q
 mLrj1irs5bXFRlHJ0N8vgE9azwpLcr5mcmyElS3TdoeE5yPHw5oKfzBu+VUnWbMdUghHc2M/tC
 bKVyCB0dOJsL6l4UcIAMxPnXwBadJBw1yBi1EUMKTax+HgqZg3ojkChP8mwLkBDoLgo9d9CPfw
 BR7RJrQsd486p6XCoOJJ5/OQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:01 -0800
IronPort-SDR: 2FOttgr0qSz+qqCP+RNDa2qamhPWERygs9RGCcbzHQHYus1r1CXXT4il68lfzn67qxfOvecIBO
 3jOucqkzKeJ+sa95IeeNEA2+I0EAkAJDI7RTRUFKaytUUwUOocSOVJho5WOJbgJ1JGljgDuuNh
 GZ5DwQCQvhQFjY5Hy9Mm059sPHF9rXlwedkBxXOHjOYoVJtPlKXxfxI+fnXmkPk9pvJEjDybUj
 dpZEclFlwPbv3ScgunvaduJ4uod7ifejADeHxF9MV8SsfAbBWIMqGF1cp+jAp0WXO0W0pf6jN5
 nsk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Q86hfyz1SVp2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993072; x=1647585073; bh=Qu/zkqIJUrKSYtYPhI
 utzeZRZv8Yrs0kM+lNXYvui9E=; b=IS9Qw60xQgLTDjnzOinJDNW9a9QEehfCj3
 odOM7SvyzV4ZUHH8+bZtMOqCPTfsux/7Zi6Vz2f6cAdxngpSfAlD4ldCeV3RNovA
 cMYHQS7AIdWFq69441RHs2KTVnjZm5OKnpyQQKS4GQePjkG5MvjqJPfppspjO6O7
 gpnV8bab4Wxw4oe6IH1Si5/umZsV+qNmh2IIItaT8Nc0XE0Dvz1Lxgz6Zh89oI08
 VCFzx6bukrmUmfdk4OR/E77dp+syL7PCgC9b/c+SjW+A89tFDZALCcURhtCph2pa
 qZtLCWTqmOFeMEUKKVtxmg5lqqkDFM1zSQWMReqF0S2alYg5r77g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P7rHFLRoaTQT for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:12 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Q44Xfgz1Rwrw;
 Tue, 15 Feb 2022 22:31:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 24/35] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Wed, 16 Feb 2022 16:29:01 +1000
Message-Id: <20220216062912.319738-25-alistair.francis@opensource.wdc.com>
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


