Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F259E50ACED
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:46:45 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhRd-000495-1r
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIj-0006WJ-32
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:33 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIg-0005Jk-8R
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587850; x=1682123850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EdJ5tpqOf88NN1owC/7Uaiw63tiexu2G6Z9ZceWVo/w=;
 b=jzMBlSZQIYFjFQhedQTzJZldOqZh70gW8EBIxZJ3HGf5eg+bsK3SgEpG
 pXcT7rShNvGheCiKrteZzWBPMo0eWwzdA6PMix4HSaUw/xWzwFeMUsr1t
 tcuNhwxxRR+dRmiJXCT4BGwSvmIuk8yRiD/N9nE1GfWSz/MWY3VR1jVd7
 sEA2UhLE3uMcZVuUMWxSWmke2AK3Egxa72VeMqeVNda9SizPV9zHXhAqw
 ANCXxg0wIMgKD0j0urKIDCtyNe3VxnXCECgJymYJda62MIDEWABpMnfU5
 h8Ufu5GprpDJmNrB242WYumzbtpsMM90jAXLaWRZDZlWyVZ4coP5Cj13s g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715728"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:26 +0800
IronPort-SDR: Q17Bh+/G87pkr27zz0mBJtqz3Ln6uckait/bW1yK9OlFnE7XnnOkmi20w35vqrWIw0XO/bkPKU
 pyYGYsmP7IVjldb65lRWZBuxL+OUotOv5VPSQP1ph/a+lkRP7dkPRNkh93DIonA3MmNm6HSctR
 hXMwqSBvko4cC49mAQQpJE0gDazja6oSVvwGw2A8nqQoT3o78E5CzeKUoBkIlgW2bgDt+4I5LO
 NN2d6ZAQYqt88sJDmIMX5rmWwX0AzUK9moh4A85eLABsyb2VpatryOB/6xG5ooWJXUNDpbdWX4
 NWxJ2hMCEJW+iZRN7EmxJPpe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:42 -0700
IronPort-SDR: 3KqvcT8gGqc/F40dYM/F1AETpVh/x532diBc7ib9+AUGf9DVRqaNlWlWSytCmaxipVDk4ADnOH
 sXsuk83fZBIKOLFdko4OYqvWutAlOksQd2AhZ07qFaexcMYAywxt5xne4Wcubkjq27BFBxZA84
 uxL4yF65oGeM2yDVy3z2xe9YBKRUlJaidSr+wqHqVoS7su7adxxMfPOJGdrVhu45JlPo+k8Kcc
 kcU0uyTAo9YmbqP79QxuHwNlxsumnGwpo5LlLdBo9z88OjGalxTBTNuRsuQafQhgkCE8T4RsgB
 wSo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwTx4b82z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587844; x=1653179845; bh=EdJ5tpqOf88NN1owC/
 7Uaiw63tiexu2G6Z9ZceWVo/w=; b=KxDOXHFc9uaMRTQ+VjUqpeiIB/J8wRpM+0
 npWmrnDQ9SWwe+8Piy7MzAlVZGgzIBofBDfmi9rAPbNK3FeH2ERfbLp1qr687nDP
 QNsNUas14sOQXz/W+nBTqCAnwiGU7WyVXU2E4t64ZekkLCyE0IFlfNq/KQS0C+hZ
 PfneIS25XpEd8ndr0mp/LZ7hcXwxt3EE7O8fLrEqZOqLMhbs3ieC1dSgTconpPo7
 +c3hZ528nEjV0l57UzFF5Tb6nvmrIDjkaQt6v9/0vSKCmanmZwqRJEpw6G8sicsj
 DmqiL7ea7LxTqciIiN63FAhDDzCxy9wRfPVTdAl+c5GkbdX/KquA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pUZsfS5KzNKt for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTt33hsz1Rvlx;
 Thu, 21 Apr 2022 17:37:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 05/31] target/riscv: Introduce privilege version field in
 the CSR ops.
Date: Fri, 22 Apr 2022 10:36:30 +1000
Message-Id: <20220422003656.1648121-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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
index 19c3b6610b..5139110c4f 100644
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


