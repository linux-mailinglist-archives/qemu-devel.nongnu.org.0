Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC9509814
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:59:17 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQma-0007Wz-NQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR8-0004xQ-OI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR6-0007vC-LF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523024; x=1682059024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0AQADVTjrYUVUCkfogfTVgDDTKhSthvqYgTuHQlYhm0=;
 b=gaL6+H+VUmQQjvP4Sx5peTmKIffDwKaR/xnLCNwbJiaSQ/IEMyNe50j8
 465wOpmd5H4fT0G3W4ne9aZmC2rhrjwM5KgLb0voLMpjO/JkYy74hdfq4
 DI/vdMiqo4hvSQ1NMb6G+oZBShfVtJVbO7yATNCPRXaTk6t1AV08HXpX/
 YZEh4SP2SmYBzwzF8rYtWqU2+/OduPohkeknvKBNQiUz3HiidhaOd9Q2E
 R5a56nEkJ/NdN3oXK1jz3FiH+v3zJSQynanymhm1R2Dkl4E5bMk8/SrV2
 MSxnj6sPfrcy6OlbH+IW5l1aC0Mpgk4FMB3e1db+gytPOpxv9mcnYiVfd Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639941"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:03 +0800
IronPort-SDR: 7+VJqCesimzxk1U6MqbqWrbQbhufnYkd7oD0753A2cHJ0I4GBm8tvRrZEcee3t2AE2DqtcPIFx
 Fq+xcHxwa/O4sBMlGQqx/AdPTKIoZWJskAwnufo/RcjoBwhr0tvIyeE8JteMlIK2ZPoA25XHCv
 fbXXa3GUX9tIPQez0/lTzsmn+WZg8TQges9wPS1YkwAVSaO1ZossFydnIUPnVsUvhzg8Y78Ds8
 iBUTw7+yCC8MdnE6ZrPO18pZlYfe3nL+N1+qZc28oydxDP7SNe8GFnCmqllkl+eVy5vyIU2+s1
 N2D8Puva0k9AtSkS5o6v34EM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:06 -0700
IronPort-SDR: maeFZTrLJNIR8AEiJUMEO53qJb6uvTfwnLNFJ3uEOzMWexWy7W88atMc+8Pe16ZAzjPtui6u0G
 6CbqckQL7lf5op0PqtjcLjL9NU4CT74+Ym91iXDEPZUCnkiNilelatyGYevXmlBMKK3PexNktE
 vCTC1aShgpV83slHe1cLLPfsdPDdD/cHEQ22olayVu2kwK0WgMVFxl9bHCgfZfMvXrAAZ/xzpI
 XMbvpBCDGjpOf5JOgvSUTuJa+9WIqe68IpqixU2lge2stAnMLkrbTdVCcC2ZsZjLWaBRG5Z0bE
 GDM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWM2Svpz1SVp1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523022; x=1653115023; bh=0AQADVTjrYUVUCkfog
 fTVgDDTKhSthvqYgTuHQlYhm0=; b=mFzaAxYBXrpRNjb+ns1pUKf+JCRGuaDa6z
 nZZexE9v6swZhnfpFzVYxMQ96NB/qNxHuyJ7FHC6w2FbPvkg+qYV+ZIiHFId7yuC
 LKuB+HPPHaUwsn7qq1i71FUZdrKBkEtD9Lv1DSEZhdePzZYFCBbYZklUNFPy1iK4
 BShz6tapS31//wEuTNgFxB6rmj/6RwB5DtT/nc/INAMyAOgnnbosx/m7v7ydOm5Q
 i8uLcyj21HijZFTdkxHkwKxtGwZwW1qOJrxFmGOl2A5dyFyOjdPxSyy8BtoZwikn
 o4jRPEmq/P60ANpUr3xVo+RglU1saCtkmfYHUtVdF2rgeS5pUbMg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1J2_kd6zpkiX for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:02 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWJ51w6z1Rvlx;
 Wed, 20 Apr 2022 23:37:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/31] target/riscv: Introduce privilege version field in the
 CSR ops.
Date: Thu, 21 Apr 2022 16:36:04 +1000
Message-Id: <20220421063630.1033608-6-alistair.francis@opensource.wdc.com>
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

To allow/disallow the CSR access based on the privilege spec, a new field
in the csr_ops is introduced. It also adds the privileged specification
version (v1.12) for the CSRs introduced in the v1.12. This includes the
new ratified extensions such as Vector, Hypervisor and secconfig CSR.
However, it doesn't enforce the privilege version in this commit.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-4-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |   2 +
 target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
 2 files changed, 70 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0f3ed88f04..7a92892cd6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -658,6 +658,8 @@ typedef struct {
     riscv_csr_op_fn op;
     riscv_csr_read128_fn read128;
     riscv_csr_write128_fn write128;
+    /* The default priv spec version should be PRIV_VERSION_1_10_0 (i.e =
0) */
+    uint32_t min_priv_ver;
 } riscv_csr_operations;
=20
 /* CSR function table constants */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 341c2e6f23..1400027158 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3070,13 +3070,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_FRM]      =3D { "frm",      fs,     read_frm,     write_frm    =
},
     [CSR_FCSR]     =3D { "fcsr",     fs,     read_fcsr,    write_fcsr   =
},
     /* Vector CSRs */
-    [CSR_VSTART]   =3D { "vstart",   vs,     read_vstart,  write_vstart =
},
-    [CSR_VXSAT]    =3D { "vxsat",    vs,     read_vxsat,   write_vxsat  =
},
-    [CSR_VXRM]     =3D { "vxrm",     vs,     read_vxrm,    write_vxrm   =
},
-    [CSR_VCSR]     =3D { "vcsr",     vs,     read_vcsr,    write_vcsr   =
},
-    [CSR_VL]       =3D { "vl",       vs,     read_vl                    =
},
-    [CSR_VTYPE]    =3D { "vtype",    vs,     read_vtype                 =
},
-    [CSR_VLENB]    =3D { "vlenb",    vs,     read_vlenb                 =
},
+    [CSR_VSTART]   =3D { "vstart",   vs,    read_vstart,  write_vstart,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VXSAT]    =3D { "vxsat",    vs,    read_vxsat,   write_vxsat,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VXRM]     =3D { "vxrm",     vs,    read_vxrm,    write_vxrm,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VCSR]     =3D { "vcsr",     vs,    read_vcsr,    write_vcsr,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VL]       =3D { "vl",       vs,    read_vl,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VTYPE]    =3D { "vtype",    vs,    read_vtype,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
+    [CSR_VLENB]    =3D { "vlenb",    vs,    read_vlenb,
+                                          .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
     /* User Timers and Counters */
     [CSR_CYCLE]    =3D { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  =3D { "instret",  ctr,    read_instret  },
@@ -3185,33 +3192,58 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
     [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
=20
-    [CSR_HSTATUS]     =3D { "hstatus",     hmode,   read_hstatus,     wr=
ite_hstatus     },
-    [CSR_HEDELEG]     =3D { "hedeleg",     hmode,   read_hedeleg,     wr=
ite_hedeleg     },
-    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   NULL,   NULL,     rm=
w_hideleg       },
-    [CSR_HVIP]        =3D { "hvip",        hmode,   NULL,   NULL,     rm=
w_hvip          },
-    [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,     rm=
w_hip           },
-    [CSR_HIE]         =3D { "hie",         hmode,   NULL,   NULL,     rm=
w_hie           },
-    [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,  wr=
ite_hcounteren  },
-    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,       wr=
ite_hgeie       },
-    [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,       wr=
ite_htval       },
-    [CSR_HTINST]      =3D { "htinst",      hmode,   read_htinst,      wr=
ite_htinst      },
-    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,       NU=
LL              },
-    [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,       wr=
ite_hgatp       },
-    [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta,  wr=
ite_htimedelta  },
-    [CSR_HTIMEDELTAH] =3D { "htimedeltah", hmode32, read_htimedeltah, wr=
ite_htimedeltah },
-
-    [CSR_VSSTATUS]    =3D { "vsstatus",    hmode,   read_vsstatus,    wr=
ite_vsstatus    },
-    [CSR_VSIP]        =3D { "vsip",        hmode,   NULL,    NULL,    rm=
w_vsip          },
-    [CSR_VSIE]        =3D { "vsie",        hmode,   NULL,    NULL,    rm=
w_vsie          },
-    [CSR_VSTVEC]      =3D { "vstvec",      hmode,   read_vstvec,      wr=
ite_vstvec      },
-    [CSR_VSSCRATCH]   =3D { "vsscratch",   hmode,   read_vsscratch,   wr=
ite_vsscratch   },
-    [CSR_VSEPC]       =3D { "vsepc",       hmode,   read_vsepc,       wr=
ite_vsepc       },
-    [CSR_VSCAUSE]     =3D { "vscause",     hmode,   read_vscause,     wr=
ite_vscause     },
-    [CSR_VSTVAL]      =3D { "vstval",      hmode,   read_vstval,      wr=
ite_vstval      },
-    [CSR_VSATP]       =3D { "vsatp",       hmode,   read_vsatp,       wr=
ite_vsatp       },
-
-    [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,      wr=
ite_mtval2      },
-    [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      wr=
ite_mtinst      },
+    [CSR_HSTATUS]     =3D { "hstatus",     hmode,   read_hstatus,   writ=
e_hstatus,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HEDELEG]     =3D { "hedeleg",     hmode,   read_hedeleg,   writ=
e_hedeleg,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   NULL,   NULL, rmw_hi=
deleg,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HVIP]        =3D { "hvip",        hmode,   NULL,   NULL,   rmw_=
hvip,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,   rmw_=
hip,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HIE]         =3D { "hie",         hmode,   NULL,   NULL,    rmw=
_hie,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren, wri=
te_hcounteren,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,       wr=
ite_hgeie,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,     writ=
e_htval,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HTINST]      =3D { "htinst",      hmode,   read_htinst,    writ=
e_htinst,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,     writ=
e_hgatp,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta, wri=
te_htimedelta,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_HTIMEDELTAH] =3D { "htimedeltah", hmode32, read_htimedeltah, wr=
ite_htimedeltah,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+
+    [CSR_VSSTATUS]    =3D { "vsstatus",    hmode,   read_vsstatus,  writ=
e_vsstatus,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSIP]        =3D { "vsip",        hmode,   NULL,    NULL,  rmw_=
vsip,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSIE]        =3D { "vsie",        hmode,   NULL,    NULL,    rm=
w_vsie ,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSTVEC]      =3D { "vstvec",      hmode,   read_vstvec,    writ=
e_vstvec,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSSCRATCH]   =3D { "vsscratch",   hmode,   read_vsscratch, writ=
e_vsscratch,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSEPC]       =3D { "vsepc",       hmode,   read_vsepc,     writ=
e_vsepc,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSCAUSE]     =3D { "vscause",     hmode,   read_vscause,   writ=
e_vscause,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSTVAL]      =3D { "vstval",      hmode,   read_vstval,    writ=
e_vstval,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_VSATP]       =3D { "vsatp",       hmode,   read_vsatp,     writ=
e_vsatp,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+
+    [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,    writ=
e_mtval2,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
+    [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,    writ=
e_mtinst,
+                                         .min_priv_ver =3D PRIV_VERSION_=
1_12_0 },
=20
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA=
) */
     [CSR_HVIEN]       =3D { "hvien",       aia_hmode, read_zero, write_i=
gnore },
@@ -3245,7 +3277,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
=20
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
 },
+    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
+                                     .min_priv_ver =3D PRIV_VERSION_1_12=
_0 },
     [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG2]    =3D { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg =
 },
--=20
2.35.1


