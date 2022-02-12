Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773D4B31EB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:24:28 +0100 (CET)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgDD-0006Gq-Ij
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsH-00084B-Dx
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:54 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsF-0000Nz-3E
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624165; x=1676160165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KrOIW+U93XGr14+WEgjD9HZ1fYMLZyyxoTC7SdKW/mA=;
 b=PZojKClSWFQwb2JWEZkxTlMeXqHesT+6l6GGAD86+kLLIp44HWwafhun
 8wteJNaFPS3namMFQVw0GxGoqvpBu5WYAocOjOCvvTMlWVo4jyJxyXzeS
 M1grknNudie3PY+LKkZaFJ5K2Qgm9f248MsnL3GBEhV61kL5IfrlCRjxx
 Rm7TY85qDaAG4zg5nO5igpkuB0/gmKc+Az2flJtTGYch6IrDuFMAXg4Xl
 Cb5KgAyhNPQxd+ZXyMCnQd+bfQsUfdkY41ZC/jJ8jJNbuYwswn/wJBb+N
 knX8GENnCUWE/Z16Z//rnvu1fmBdKxPVSe+R5Wg7XlWbTn0bhNeMOnE/U A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552471"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:42 +0800
IronPort-SDR: uVm6bt/rK7UoKILFzXqiv5K8w+xJ0exQTLvW7E0pN9xifb3aG5MsIWURN9VfOcKPMo+tdRK2jk
 pQpUyZU1l37W+XLF+YHTAP/zIZXPrHEmOq2Qy5HDRJfrvSvzC4fgRUkKvcTL8FgzhLxVWGUY4F
 iFsP+zQ0mYbtEuIEEMg0k3CScq5ksM+9CAsH+ujM+zmA9DDvjJcc/NjbvURCUstN1/V8kFXNpW
 LUvKVU6EPyzJLQWDa5CaN8QMfU/tfJF2FfzbUsVTSq72PNXhlf8su/d5HvaE9FBY+u9JKJE19Q
 DOJa8OrU3n573jMlPnmLtEkd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:38 -0800
IronPort-SDR: EnBIoDHf6rbI2UvHi5BRvMNesAirOVGm780DTgSNX23OHHFFn5z5vZlkJaDqw54/NGicGroqH/
 6OFbb4mguUA5HT7ovvYqgHFZU6NOKWhayJ4DHkweoA5W8VDbpPNeQPAsM/MzAw2Qjd+wwLyrLN
 4vM8JL+eUcrENLVz5vsLqbRVJsx8qOe/fTIGDJrDOclQQXVRoPpJF5x0UC2CDLreHmnfxIqy6o
 mku2ILyR9666xZhHFerGNcfYxoqwQ07K77rrqI5HYWFHC/tRXneoMMquApJWIJ3q4tSuQlYkpZ
 AII=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzl6NgZz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624163; x=1647216164; bh=KrOIW+U93XGr14+WEg
 jD9HZ1fYMLZyyxoTC7SdKW/mA=; b=nTFrAzXcUhvYvbCoBff4O5YMIX+ONBYenY
 6z4l7e9iME7OooGB4Pg5NXZbrxLhS2vXC7CWbO0UjrC37mLrDZBJAbA+TAOqB30m
 z3CBThqSOckh92eu0Sgggg3I9Ud5maAKpM4KGbeer7lmvNoOf2b8wZcOtdXJhyw4
 uymt9Vq/iBQiG/yymdqEuOG2c/B/ZtK6DRMAuMfaLxJRAn3mMSaCN8zVnzqALBtC
 c3HyrwoIX424b7Mo8YvtWTJh8vce4SRpb+ORU21orqLmwU/yeos47z7gONCAB8Ey
 DGuhRBK5ymKavPC7txbOveLP4HIola4sI3eAwtF91Jf2g4oK43vA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AUwLUFXKZZ2y for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzf5qPBz1Rwrw;
 Fri, 11 Feb 2022 16:02:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 22/40] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Sat, 12 Feb 2022 10:00:13 +1000
Message-Id: <20220212000031.3946524-23-alistair.francis@opensource.wdc.com>
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

The AIA hvictl and hviprioX CSRs allow hypervisor to control
interrupts visible at VS-level. This patch implements AIA hvictl
and hviprioX CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-12-anup@brainfault.org
[ Changes by AF:
 - Fix possible unintilised variable error in rmw_sie()
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   2 +
 target/riscv/csr.c     | 128 ++++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c |   2 +
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2dc2485bb4..f0e69f2871 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -209,6 +209,7 @@ struct CPURISCVState {
     uint64_t htimedelta;
=20
     /* Hypervisor controlled virtual interrupt priorities */
+    target_ulong hvictl;
     uint8_t hviprio[64];
=20
     /* Upper 64-bits of 128-bit CSRs */
@@ -512,6 +513,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *e=
nv)
     return env->misa_mxl;
 }
 #endif
+#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
=20
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d8283160b1..46448a2b7e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -234,6 +234,15 @@ static RISCVException pointer_masking(CPURISCVState =
*env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
=20
+static int aia_hmode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+     }
+
+     return hmode(env, csrno);
+}
+
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -1142,6 +1151,9 @@ static RISCVException rmw_sie64(CPURISCVState *env,=
 int csrno,
     uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
=20
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1162,7 +1174,7 @@ static RISCVException rmw_sie(CPURISCVState *env, i=
nt csrno,
     RISCVException ret;
=20
     ret =3D rmw_sie64(env, csrno, &rval, new_val, wr_mask);
-    if (ret_val) {
+    if (ret =3D=3D RISCV_EXCP_NONE && ret_val) {
         *ret_val =3D rval;
     }
=20
@@ -1355,6 +1367,9 @@ static RISCVException rmw_sip64(CPURISCVState *env,=
 int csrno,
     uint64_t mask =3D env->mideleg & sip_writable_mask;
=20
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
         ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1741,6 +1756,110 @@ static RISCVException write_htimedeltah(CPURISCVS=
tate *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val =3D env->hvictl;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hvictl =3D val & HVICTL_VALID_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hvipriox(CPURISCVState *env, int first_index,
+                         uint8_t *iprio, target_ulong *val)
+{
+    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be a multiple of number of irqs per register *=
/
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
+    }
+
+    /* Fill-up return value */
+    *val =3D 0;
+    for (i =3D 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero))=
 {
+            continue;
+        }
+        if (rdzero) {
+            continue;
+        }
+        *val |=3D ((target_ulong)iprio[irq]) << (i * 8);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvipriox(CPURISCVState *env, int first_index,
+                          uint8_t *iprio, target_ulong val)
+{
+    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be a multiple of number of irqs per register *=
/
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
+    }
+
+    /* Fill-up priority arrary */
+    for (i =3D 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero))=
 {
+            continue;
+        }
+        if (rdzero) {
+            iprio[irq] =3D 0;
+        } else {
+            iprio[irq] =3D (val >> (i * 8)) & 0xff;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *va=
l)
+{
+    return read_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong va=
l)
+{
+    return write_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *v=
al)
+{
+    return read_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong v=
al)
+{
+    return write_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *va=
l)
+{
+    return read_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong va=
l)
+{
+    return write_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *v=
al)
+{
+    return read_hvipriox(env, 12, env->hviprio, val);
+}
+
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong v=
al)
+{
+    return write_hvipriox(env, 12, env->hviprio, val);
+}
+
 /* Virtual CSR Registers */
 static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
                                     target_ulong *val)
@@ -2534,9 +2653,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,      wr=
ite_mtval2      },
     [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      wr=
ite_mtinst      },
=20
+    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA=
) */
+    [CSR_HVICTL]      =3D { "hvictl",      aia_hmode, read_hvictl, write=
_hvictl },
+    [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   w=
rite_hviprio1 },
+    [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   w=
rite_hviprio2 },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
     [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL, rmw_=
hviph },
+    [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1h, =
write_hviprio1h },
+    [CSR_HVIPRIO2H]   =3D { "hviprio2h",   aia_hmode32, read_hviprio2h, =
write_hviprio2h },
     [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, NULL, NULL, rmw_=
vsieh },
     [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
=20
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 65e63031ba..dbd7bd0c83 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper =3D {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+
+        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
=20
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
--=20
2.34.1


