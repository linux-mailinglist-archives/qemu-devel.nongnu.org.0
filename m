Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A764B3209
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:34:20 +0100 (CET)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgMl-0001S6-H7
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsb-00086k-0Y
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsX-0000QB-Ok
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624184; x=1676160184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCTKbj5OTOUhTD/XG6JhsHUqPfzV/Nk7dwVazqXa3as=;
 b=HlnBEuxekAddDFyuyDTABhs9Ck/runbaHkHaWAXZvUpFtScSRRebPHEJ
 QQQVJC4EV1Z/x3tXpcwG1mHKzHY65LhI9VlA+Ae3cCELU88qHi1weVl2Z
 6eMke8ck6VBsvWNdcnLMC0p1tqjJYYNHSDBUChlcgK0H1NTuFooRhAb/V
 qvpNP3axbfD0qLZTCLL9sMmbBMWJHRsoCinUDlSx6oWS9yv39Ic3/6blE
 ppVtDfS+RKWqhNwdMBhEo2OwEDOLyZod1uKymWJZoeG/+8ObosvMAyju0
 zgxD+Ma3yoHa5xgxYP7onJ8XsBtG4u1QJUobbd+Fj1I4MJXtoHLx7xvK+ A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="192728515"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:03 +0800
IronPort-SDR: 1gb6aS3gNfk6ezm+eiNbQRooQ0JrLBkGv/SXt6l262asuoKhC8GPvYg2VC6NoW4xdUIluD3LaX
 zBMrAUV2Ul94XOyjDFKf3mekIk77d9FbrP3psPSg1UqAqS6jtGerKi92jzsypxfyiywBZ1PBUA
 ify65GqRjxxCM0uMq8KrtmmcNl5A/pnLekdS5gcpYS+/NeDsVvZxpu4WHqUskXOEMaWoIlZIJB
 4TNu742KQY+zF0jYXQALdopKWYT/NYG+jYM2XzPOGCjSCaI1m2Rj+6c9pBHhM6IK+j+JjnUGH9
 h4AV2X01huRsNDDbDgCf/kKv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:49 -0800
IronPort-SDR: qg6NCdj1kR3dumpddV4znQzK7HbFsT6XxJ6lDj3PefEwPz3D0D6zNutvUQZ3AFEHUgBtd/MjHR
 Nf9Zds0Dukxkv2Fb0r7vCE5+9S8Ra45nXH9qLZYTXSEmtVHXeQWoZ05jHw50mqJV5dCC07kNAB
 EMN5gJ3DJh/sZpBd2fp2efrLSXonqzR8mMdoMSKA5jEjDnhFd4oFMoFOWprJ6sLy43Nq+UJlHX
 I/Gxf7YTUpoI5wB4qzPvGQqYSEat41J+DjcT6HfMETbOu8hPWJiBxCuBOJTWv52bnDUJJRe0GS
 rPo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0742MJz1SVny
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624182; x=1647216183; bh=FCTKbj5OTOUhTD/XG6
 JhsHUqPfzV/Nk7dwVazqXa3as=; b=fvwXDV+dwVGE0YIlAbGGA6b4DdiSg+YbGf
 osKf6cY8oHUpHmEPcxtXpFfOk+VozoIhn+TEQZpcyLR1cudLQgTEYdMjlUGiPcsF
 h7/4GaQ8MVc10SQjNMzZGDpNuyoz7l3oS1WaYpHNjp6BBAamPFk0UhS1ZPVm2F8P
 k+PM9HmOQu+5H2U2qNyAG0h/WJpvJNRioFdaE3+3dgxJfoR+rOET6PMMwdMthBUO
 +C132uBdADQNRMLNyEHBGmFaIkcUFnOjHFPCM3FVu1C1zHq9EsvxhEy/sGnhAq1D
 LrLB0vq/ufr1LCXJkDbqZNRIbq+U5xNNYpQA8O8YO4cTAzz9w5kw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4hwGXydlSIC0 for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:02 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW022QgTz1Rwrw;
 Fri, 11 Feb 2022 16:02:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/40] target/riscv: Implement AIA IMSIC interface CSRs
Date: Sat, 12 Feb 2022 10:00:17 +1000
Message-Id: <20220212000031.3946524-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

The AIA specification defines IMSIC interface CSRs for easy access
to the per-HART IMSIC registers without using indirect xiselect and
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-16-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a186b31fcf..fe2c8dd40e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -942,6 +942,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, in=
t csrno)
         return CSR_VSISELECT;
     case CSR_SIREG:
         return CSR_VSIREG;
+    case CSR_SSETEIPNUM:
+        return CSR_VSSETEIPNUM;
+    case CSR_SCLREIPNUM:
+        return CSR_VSCLREIPNUM;
+    case CSR_SSETEIENUM:
+        return CSR_VSSETEIENUM;
+    case CSR_SCLREIENUM:
+        return CSR_VSCLREIENUM;
+    case CSR_STOPEI:
+        return CSR_VSTOPEI;
     default:
         return csrno;
     };
@@ -1094,6 +1104,178 @@ done:
     return RISCV_EXCP_NONE;
 }
=20
+static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong =
*val,
+                            target_ulong new_val, target_ulong wr_mask)
+{
+    int ret =3D -EINVAL;
+    bool set, pend, virt;
+    target_ulong priv, isel, vgein, xlen, nval, wmask;
+
+    /* Translate CSR number for VS-mode */
+    csrno =3D aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt =3D set =3D pend =3D false;
+    switch (csrno) {
+    case CSR_MSETEIPNUM:
+        priv =3D PRV_M;
+        set =3D true;
+        pend =3D true;
+        break;
+    case CSR_MCLREIPNUM:
+        priv =3D PRV_M;
+        pend =3D true;
+        break;
+    case CSR_MSETEIENUM:
+        priv =3D PRV_M;
+        set =3D true;
+        break;
+    case CSR_MCLREIENUM:
+        priv =3D PRV_M;
+        break;
+    case CSR_SSETEIPNUM:
+        priv =3D PRV_S;
+        set =3D true;
+        pend =3D true;
+        break;
+    case CSR_SCLREIPNUM:
+        priv =3D PRV_S;
+        pend =3D true;
+        break;
+    case CSR_SSETEIENUM:
+        priv =3D PRV_S;
+        set =3D true;
+        break;
+    case CSR_SCLREIENUM:
+        priv =3D PRV_S;
+        break;
+    case CSR_VSSETEIPNUM:
+        priv =3D PRV_S;
+        virt =3D true;
+        set =3D true;
+        pend =3D true;
+        break;
+    case CSR_VSCLREIPNUM:
+        priv =3D PRV_S;
+        virt =3D true;
+        pend =3D true;
+        break;
+    case CSR_VSSETEIENUM:
+        priv =3D PRV_S;
+        virt =3D true;
+        set =3D true;
+        break;
+    case CSR_VSCLREIENUM:
+        priv =3D PRV_S;
+        virt =3D true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Set/Clear CSRs always read zero */
+    if (val) {
+        *val =3D 0;
+    }
+
+    if (wr_mask) {
+        /* Get interrupt number */
+        new_val &=3D wr_mask;
+
+        /* Find target interrupt pending/enable register */
+        xlen =3D riscv_cpu_mxl_bits(env);
+        isel =3D (new_val / xlen);
+        isel *=3D (xlen / IMSIC_EIPx_BITS);
+        isel +=3D (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
+
+        /* Find the interrupt bit to be set/clear */
+        wmask =3D ((target_ulong)1) << (new_val % xlen);
+        nval =3D (set) ? wmask : 0;
+
+        /* Call machine specific IMSIC register emulation */
+        ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv=
],
+                                         AIA_MAKE_IREG(isel, priv, virt,
+                                                       vgein, xlen),
+                                         NULL, nval, wmask);
+    } else {
+        ret =3D 0;
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
+static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
+                      target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    int ret =3D -EINVAL;
+    target_ulong priv, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno =3D aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt =3D false;
+    switch (csrno) {
+    case CSR_MTOPEI:
+        priv =3D PRV_M;
+        break;
+    case CSR_STOPEI:
+        priv =3D PRV_S;
+        break;
+    case CSR_VSTOPEI:
+        priv =3D PRV_S;
+        virt =3D true;
+        break;
+    default:
+        goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Call machine specific IMSIC register emulation for TOPEI */
+    ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein=
,
+                                  riscv_cpu_mxl_bits(env)),
+                    val, new_val, wr_mask);
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
@@ -2930,6 +3112,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
=20
+    /* Machine-Level IMSIC Interface (AIA) */
+    [CSR_MSETEIPNUM] =3D { "mseteipnum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
+    [CSR_MCLREIPNUM] =3D { "mclreipnum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
+    [CSR_MSETEIENUM] =3D { "mseteienum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
+    [CSR_MCLREIENUM] =3D { "mclreienum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
+    [CSR_MTOPEI]     =3D { "mtopei",     aia_any, NULL, NULL, rmw_xtopei=
 },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
@@ -2966,6 +3155,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
=20
+    /* Supervisor-Level IMSIC Interface (AIA) */
+    [CSR_SSETEIPNUM] =3D { "sseteipnum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
+    [CSR_SCLREIPNUM] =3D { "sclreipnum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
+    [CSR_SSETEIENUM] =3D { "sseteienum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
+    [CSR_SCLREIENUM] =3D { "sclreienum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
+    [CSR_STOPEI]     =3D { "stopei",     aia_smode, NULL, NULL, rmw_xtop=
ei },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
     [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
@@ -3013,6 +3209,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
=20
+    /* VS-Level IMSIC Interface (H-extension with AIA) */
+    [CSR_VSSETEIPNUM] =3D { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
+    [CSR_VSCLREIPNUM] =3D { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
+    [CSR_VSSETEIENUM] =3D { "vsseteienum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
+    [CSR_VSCLREIENUM] =3D { "vsclreienum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
+    [CSR_VSTOPEI]     =3D { "vstopei",     aia_hmode, NULL, NULL, rmw_xt=
opei },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
     [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero, write=
_ignore },
--=20
2.34.1


