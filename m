Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F54B82F2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:29:39 +0100 (CET)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFgw-0007fp-9a
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqk-0007Gu-5J
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqX-0006ld-TD
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993085; x=1676529085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCTKbj5OTOUhTD/XG6JhsHUqPfzV/Nk7dwVazqXa3as=;
 b=dGuCFBlHZxS9pri9XtihxkjlIZaKCVU1K5spjBFHhblqI6ZKUNGSvgHe
 1xwPynKEzOS6/mwB6KPrxwzVle8+cy7VdgVCoaB85RAsIS36EHEaz4O+m
 OFHpEvA2UOfZMuZL2R/LkCha4ZwQZzcx+oc5iPAn/e11DJFPeBGlnY5hw
 BlOU2RNwOubd3k+IUqj7EEdZQ8anEw+k+3IT/P/FdOviN5y94/zhN8vKs
 ykyKHzIEbBpUQXVLSmamIqje/ouQbmqXgs1SkFRhAFd1hvjaFEJRKZ4KD
 HPrj/xKQ+rGQf1S4/1eLrye3319J3iktOS4NdQ7ByD9jGgkkrwkxKo9Eg Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181852"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:23 +0800
IronPort-SDR: yGo2bUWn9IwPswDD71glPBFcjpCWG+65lQHkuuyDI60KACS1QzqnKbyZSvJp52p3OYae5KTbVQ
 zJKeAP5QL5ud2RaYslXAsUC+x687Ecw0O2hHt2S1t/uyGMkDP/W5mt62CkOmAYI7TfIdNJ7MdW
 cxlxO1syeJywhWaqHkJLN6ghazqM+zcwSk5NWx6VCxyD0V5hEkOaLL60b8DY+NFoFKay7uPcqi
 B6Vw2Y+qUDCO3S1BRepAgbHgeaeEShx/s45HiGICvTdD52+48owVQklLVMOD9q526NiU5B9+3/
 e772OD8VHEOLVRI1cVvP+sEE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:11 -0800
IronPort-SDR: ty4r+mbRBWUtAmAr3M1Sb65Jc2PN33a8enoOUBKclyvyXyZu2M6ZGb44f+AGN2MWgSHtYwnoQP
 Ma8S5l0aGiecSyZRf2xPGA4mhjyvWAXkcCaZ+7VIXhBoXvE+lDBGZEOu+bS0kH4LzX8BUl1Sis
 hXY8FIIZllDbbTwtBZdpy2j0vwJa87p9Obp+NO9p3G5iknWx4RVMcI0RjtA6sm56sU/V9IwwWi
 6reWQHfB01ecTY8sW2azEXuXzHvXzc24HOXAvWZHU0TpH4MyJEHHsVqETFOoJUg6DYl6qT+hhX
 Z7M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7QL573qz1SVp2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993081; x=1647585082; bh=FCTKbj5OTOUhTD/XG6
 JhsHUqPfzV/Nk7dwVazqXa3as=; b=FFcDt8GK3DvJNVkaZCHmUnJzWdXvkv+PnF
 LnqtILdSN8XFFP3ius/399HxH04tayoi3foeXrFTMoJd9PlN03YfhQnYUFXgeJaG
 lHVQZUd3AiIjoGgev1EP9BGMgvZmBG+x1VVyOoZTZ1Qw+KPBrqZiqCYT7tWymnSF
 nx5EI3t4IqxWfvm0SyVxi304FvVTmPsWpMfXyHQjlCHrjLl/03w4lLvGKpp1NaBK
 yZeJQikf1IdaeK9bqvx8r93WBuBhkhmcFuXWqLyQEht2CaApKAqXh5v9M94jewxI
 5IXStwyEQG1Ye/hSMPkDQEsLAl+OKfKdSfkrn+oDV1ljfEUmPbpA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L8Ua-mKRk3z7 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:21 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7QG01hbz1Rwrw;
 Tue, 15 Feb 2022 22:31:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 26/35] target/riscv: Implement AIA IMSIC interface CSRs
Date: Wed, 16 Feb 2022 16:29:03 +1000
Message-Id: <20220216062912.319738-27-alistair.francis@opensource.wdc.com>
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


