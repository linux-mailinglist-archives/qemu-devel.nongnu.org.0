Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DC564380
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:34:35 +0200 (CEST)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nZK-0000R1-JY
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nFF-0001V9-3M
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nFC-0001zT-Pq
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807225; x=1688343225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pHuvF8R26SN2gMqYKCO1XIj3tlF9Xk0AZHCTtMpzao4=;
 b=WEcm/hF0+fyZ3vDlzm0O7hek85mu2kQc01HLEjaP8nrlCIjtIyTBfYCM
 fEX1mQaKS7iChZznJBC55koWIHvlv5IeBL6OG7/hgZ5ueoGKzpDO4TmhF
 AxsplkS05D6QZtuLPWI4gRuE0zUWUIWzbuG6yrZAhR9lHJb33+ECaW708
 XyLVBY09ViFutpqgRLoSg0rZblmoLnY147/oBFEtDtpK71GxVio7+M4ry
 zuMxATZj5zVz2ROSAiHaXRpvK3vrrcEO59Mcx2+x8SikqZxtHK133UcJm
 oYaK73+0eAL9RMcjOB7YcucwERuAQlAvREztYMtisbMpiKBUY6m5wrcFQ g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667276"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:20 +0800
IronPort-SDR: QovwY8ryVaeFDZqKuj0+DwpcKTP0Jw1qV7r/R61aA3PzNqDpend5rMGCd7+9dOREVR3vePOPo1
 WzGlZ8pvvbQmvynN+L+1DvSxfJMYuCljYCKpCqjSLLgce1SPrkBV0BjViLHPMVIhsM6XFrM1u7
 bH1isaZUoLSqShZi8NIvq5YHbmgb0jlrsFgtP8oNYDkLGFgHBOaWbz/T1eynOp105SR8Xe+19b
 LYNdS+CI9oatoZUrDQTts/8uia7rU/iRhGvwvssGvMMBZfibC/FsWekVjS3in5bSlh8t2qIm0W
 vbsBJZph3FL4AttFK3WPu+qn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:43 -0700
IronPort-SDR: IWgS69m+SdaaTXQQh3IALy1MpI4qDde2gOD9xYQpUlI79dw2V2J44NdkN8xlgLAN9u/or1FSH0
 wzIE/8WrjewDL/WGqm8fra3xOPX5s8hXJT2I2kOxJnmU+kT5/JDInlID/iOrxFti9g42/MKCJ2
 tZeCg3bm8ZP8pXN18TLc1vb2D70d1KSd+iPJR6C6Q9wVyJSseqxXPLks1FzJLvt2jTWi7b61Qn
 kk3fkiECkDnX0XS4EFZDT/WgQZH1Pizu4sI9kWJTsYwU4KuM1MwL7Jrx5kiB91XCGgIUgKUhhq
 wSY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xw60tJz1RwqM
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807199; x=1659399200; bh=pHuvF8R26SN2gMqYKC
 O1XIj3tlF9Xk0AZHCTtMpzao4=; b=kVw6YOzTH7RiRuLqpXYJsAgtUsTYOMqcmO
 fKgphMhPd/VCy3ioNdOMHHEZM28yJCx3oyr4QQIQQIHdAbCwVNDgLrdPLvLBW2pN
 r0oto2E3CXpTLNLh7ZK3dN08sRyqRBWyd1RPAvDf0Yv8CKHxTUTG1DNt+MtDzAkO
 0Myhla8Uz8ChGuFNQDc0Ik8UcmkDWxHyCJ6iGrfFM1qlfJ38V3KTbXHjbdVBT/fj
 P5z902dfYQ3T7iKfguSotTr5O3pHvLpWkw4AvbuOjZpPJnFVkViwjSky0XcwmJAd
 A+8UXVu6n8bArUlAsiuw4u6nP9zrKoVm20ajeh1UIySD3+OmM3Qw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CHyLKckgBVGa for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:19 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xt2WHJz1RtVk;
 Sat,  2 Jul 2022 17:13:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 18/19] target/riscv: Remove CSRs that set/clear an IMSIC
 interrupt file bits
Date: Sun,  3 Jul 2022 10:12:33 +1000
Message-Id: <20220703001234.439716-19-alistair.francis@opensource.wdc.com>
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

From: Anup Patel <apatel@ventanamicro.com>

Based on architecture review committee feedback, the [m|s|vs]seteienum,
[m|s|vs]clreienum, [m|s|vs]seteipnum, and [m|s|vs]clreipnum CSRs are
removed in the latest AIA draft v0.3.0 specification.
(Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)

These CSRs were mostly for software convenience and software can always
use [m|s|vs]iselect and [m|s|vs]ireg CSRs to update the IMSIC interrupt
file bits.

We update the IMSIC CSR emulation as-per above to match the latest AIA
draft specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220616031543.953776-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  24 +------
 target/riscv/csr.c      | 150 +---------------------------------------
 2 files changed, 6 insertions(+), 168 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b3f7fa7130..157d7069f6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -174,14 +174,8 @@
 #define CSR_MIREG           0x351
=20
 /* Machine-Level Interrupts (AIA) */
-#define CSR_MTOPI           0xfb0
-
-/* Machine-Level IMSIC Interface (AIA) */
-#define CSR_MSETEIPNUM      0x358
-#define CSR_MCLREIPNUM      0x359
-#define CSR_MSETEIENUM      0x35a
-#define CSR_MCLREIENUM      0x35b
 #define CSR_MTOPEI          0x35c
+#define CSR_MTOPI           0xfb0
=20
 /* Virtual Interrupts for Supervisor Level (AIA) */
 #define CSR_MVIEN           0x308
@@ -221,14 +215,8 @@
 #define CSR_SIREG           0x151
=20
 /* Supervisor-Level Interrupts (AIA) */
-#define CSR_STOPI           0xdb0
-
-/* Supervisor-Level IMSIC Interface (AIA) */
-#define CSR_SSETEIPNUM      0x158
-#define CSR_SCLREIPNUM      0x159
-#define CSR_SSETEIENUM      0x15a
-#define CSR_SCLREIENUM      0x15b
 #define CSR_STOPEI          0x15c
+#define CSR_STOPI           0xdb0
=20
 /* Supervisor-Level High-Half CSRs (AIA) */
 #define CSR_SIEH            0x114
@@ -279,14 +267,8 @@
 #define CSR_VSIREG          0x251
=20
 /* VS-Level Interrupts (H-extension with AIA) */
-#define CSR_VSTOPI          0xeb0
-
-/* VS-Level IMSIC Interface (H-extension with AIA) */
-#define CSR_VSSETEIPNUM     0x258
-#define CSR_VSCLREIPNUM     0x259
-#define CSR_VSSETEIENUM     0x25a
-#define CSR_VSCLREIENUM     0x25b
 #define CSR_VSTOPEI         0x25c
+#define CSR_VSTOPI          0xeb0
=20
 /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
 #define CSR_HIDELEGH        0x613
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4982e98735..235f2a011e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1257,14 +1257,6 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, =
int csrno)
         return CSR_VSISELECT;
     case CSR_SIREG:
         return CSR_VSIREG;
-    case CSR_SSETEIPNUM:
-        return CSR_VSSETEIPNUM;
-    case CSR_SCLREIPNUM:
-        return CSR_VSCLREIPNUM;
-    case CSR_SSETEIENUM:
-        return CSR_VSSETEIENUM;
-    case CSR_SCLREIENUM:
-        return CSR_VSCLREIENUM;
     case CSR_STOPEI:
         return CSR_VSTOPEI;
     default:
@@ -1419,124 +1411,6 @@ done:
     return RISCV_EXCP_NONE;
 }
=20
-static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong =
*val,
-                            target_ulong new_val, target_ulong wr_mask)
-{
-    int ret =3D -EINVAL;
-    bool set, pend, virt;
-    target_ulong priv, isel, vgein, xlen, nval, wmask;
-
-    /* Translate CSR number for VS-mode */
-    csrno =3D aia_xlate_vs_csrno(env, csrno);
-
-    /* Decode register details from CSR number */
-    virt =3D set =3D pend =3D false;
-    switch (csrno) {
-    case CSR_MSETEIPNUM:
-        priv =3D PRV_M;
-        set =3D true;
-        pend =3D true;
-        break;
-    case CSR_MCLREIPNUM:
-        priv =3D PRV_M;
-        pend =3D true;
-        break;
-    case CSR_MSETEIENUM:
-        priv =3D PRV_M;
-        set =3D true;
-        break;
-    case CSR_MCLREIENUM:
-        priv =3D PRV_M;
-        break;
-    case CSR_SSETEIPNUM:
-        priv =3D PRV_S;
-        set =3D true;
-        pend =3D true;
-        break;
-    case CSR_SCLREIPNUM:
-        priv =3D PRV_S;
-        pend =3D true;
-        break;
-    case CSR_SSETEIENUM:
-        priv =3D PRV_S;
-        set =3D true;
-        break;
-    case CSR_SCLREIENUM:
-        priv =3D PRV_S;
-        break;
-    case CSR_VSSETEIPNUM:
-        priv =3D PRV_S;
-        virt =3D true;
-        set =3D true;
-        pend =3D true;
-        break;
-    case CSR_VSCLREIPNUM:
-        priv =3D PRV_S;
-        virt =3D true;
-        pend =3D true;
-        break;
-    case CSR_VSSETEIENUM:
-        priv =3D PRV_S;
-        virt =3D true;
-        set =3D true;
-        break;
-    case CSR_VSCLREIENUM:
-        priv =3D PRV_S;
-        virt =3D true;
-        break;
-    default:
-         goto done;
-    };
-
-    /* IMSIC CSRs only available when machine implements IMSIC. */
-    if (!env->aia_ireg_rmw_fn[priv]) {
-        goto done;
-    }
-
-    /* Find the selected guest interrupt file */
-    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
-
-    /* Selected guest interrupt file should be valid */
-    if (virt && (!vgein || env->geilen < vgein)) {
-        goto done;
-    }
-
-    /* Set/Clear CSRs always read zero */
-    if (val) {
-        *val =3D 0;
-    }
-
-    if (wr_mask) {
-        /* Get interrupt number */
-        new_val &=3D wr_mask;
-
-        /* Find target interrupt pending/enable register */
-        xlen =3D riscv_cpu_mxl_bits(env);
-        isel =3D (new_val / xlen);
-        isel *=3D (xlen / IMSIC_EIPx_BITS);
-        isel +=3D (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
-
-        /* Find the interrupt bit to be set/clear */
-        wmask =3D ((target_ulong)1) << (new_val % xlen);
-        nval =3D (set) ? wmask : 0;
-
-        /* Call machine specific IMSIC register emulation */
-        ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv=
],
-                                         AIA_MAKE_IREG(isel, priv, virt,
-                                                       vgein, xlen),
-                                         NULL, nval, wmask);
-    } else {
-        ret =3D 0;
-    }
-
-done:
-    if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
-               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
-    }
-    return RISCV_EXCP_NONE;
-}
-
 static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
                       target_ulong new_val, target_ulong wr_mask)
 {
@@ -3658,14 +3532,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MIREG]    =3D { "mireg",    aia_any,   NULL, NULL,    rmw_xireg=
 },
=20
     /* Machine-Level Interrupts (AIA) */
-    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
-
-    /* Machine-Level IMSIC Interface (AIA) */
-    [CSR_MSETEIPNUM] =3D { "mseteipnum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
-    [CSR_MCLREIPNUM] =3D { "mclreipnum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
-    [CSR_MSETEIENUM] =3D { "mseteienum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
-    [CSR_MCLREIENUM] =3D { "mclreienum", aia_any, NULL, NULL, rmw_xsetcl=
reinum },
     [CSR_MTOPEI]     =3D { "mtopei",     aia_any, NULL, NULL, rmw_xtopei=
 },
+    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
=20
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
@@ -3713,14 +3581,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_SIREG]      =3D { "sireg",      aia_smode, NULL, NULL, rmw_xire=
g },
=20
     /* Supervisor-Level Interrupts (AIA) */
-    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
-
-    /* Supervisor-Level IMSIC Interface (AIA) */
-    [CSR_SSETEIPNUM] =3D { "sseteipnum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
-    [CSR_SCLREIPNUM] =3D { "sclreipnum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
-    [CSR_SSETEIENUM] =3D { "sseteienum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
-    [CSR_SCLREIENUM] =3D { "sclreienum", aia_smode, NULL, NULL, rmw_xset=
clreinum },
     [CSR_STOPEI]     =3D { "stopei",     aia_smode, NULL, NULL, rmw_xtop=
ei },
+    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
=20
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
@@ -3792,14 +3654,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_VSIREG]      =3D { "vsireg",      aia_hmode, NULL, NULL,      r=
mw_xireg },
=20
     /* VS-Level Interrupts (H-extension with AIA) */
-    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
-
-    /* VS-Level IMSIC Interface (H-extension with AIA) */
-    [CSR_VSSETEIPNUM] =3D { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
-    [CSR_VSCLREIPNUM] =3D { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
-    [CSR_VSSETEIENUM] =3D { "vsseteienum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
-    [CSR_VSCLREIENUM] =3D { "vsclreienum", aia_hmode, NULL, NULL, rmw_xs=
etclreinum },
     [CSR_VSTOPEI]     =3D { "vstopei",     aia_hmode, NULL, NULL, rmw_xt=
opei },
+    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
=20
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
--=20
2.36.1


