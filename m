Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60F4B81A7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:36:13 +0100 (CET)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKErD-0007NE-Lt
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpX-0005yN-4u
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:23 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpU-0006Zz-OX
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993020; x=1676529020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FzZUiVDdDWtQHhwfAhtLSgxgCth6Afkp8YZ/LjldLss=;
 b=oeYW7IQq7WSswMg2fabbc9WgMAwVcIFB3x8tyLIVNi6uAoxDbUubIUXI
 nsTh1FSNagsV7YEI7QyIN1qIwpkWz06xAKfK9EbV9xwimCo01V3O5lT8O
 /Wu8/O4YuyEVKAUN/F9DfV2aNUXHG8c9+V9LrdK9Kaoo57bhbLB489mEK
 e+T5WWW7mzZ0pjWDcPzTWceAI41zEKWTcdcGC2zqmrr16+ORpCwfWjB16
 Va0aM3EY7PVE+QRfM1JiPwMacCSLq2ZwkApTCLJsf55p3aZLxOay7Ob83
 V83LGaWzuQyUEip+vrqpAgaAdnNZa3N3O/FrAXUFzPE/N53fvgIhm8awE Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072756"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:19 +0800
IronPort-SDR: NVKY7P9xv/ZFB3Zt0xV+94mP9pKJkI5z7PDBQUoo1BM8PMl0zY4Ea6f4tM1tZJO4BaJJIAajHc
 C0gRNLJKiXpd1UplpfsQ/J+892LA30gt2Zuug2nS2EgDSERKxB7cxoMHNM/MStp0nP9TQbWjL4
 CRFPpaLjSB3H6TBmwqTQ0WJHjWHv7LPBvb/ebQiP70aYOJ3pdf3QDuVtkDtn0GtEB3ShJHf4aF
 +UM2fSUf7wtk83h0ssoQoHgOAZ9OufvmNmN81ruPMssM13SrFaxhVSr1SOX05ZfXY+QpWlu6Ci
 EdP6YtISYtwq8KUs0ETBCFfP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:08 -0800
IronPort-SDR: 4DcbM4BqoDAAJcm5GmkW9cUbJMqMQGYgLgw5d6YrBQVyVfvssnELcyOR2zt5WrFx6vxo+CpD4u
 AI75wCfmqH34scAZWkR3yQHiTA9vtCdgxLFUKyYOY/VcAi+UWZt3YNcymObY6fcYYqPZ921Gn8
 +c0jLCLfG3wMpXJggJ2S1ctAfQqb9pypYWjbk6IkbzEyXl/sjao++oacXPi+Ny4TRNR6CUdbVY
 M76A6WJd1zFixfjm6xGTIuS+D3quB3Q7cH4AgRcopNK7rbGfFxp/hvaq0TUrSEHlFWdXlVGGTv
 o84=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7P74tFnz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993019; x=1647585020; bh=FzZUiVDdDWtQHhwfAh
 tLSgxgCth6Afkp8YZ/LjldLss=; b=ICx+bESq5Z9L5L7z0bnN7fyaCcmwjs4dW4
 cuDEXaWVhWO0kLykLYEn1IM6Fgbe8MhFs8mE4AW0j5Z/uig60bqpsPtjwnnRQaZP
 XE1sDCO0QLA6ZKgnxw5pwXC3AiArXA80m1MT8U3Y7ipyJE3pqPOUUcQPZRXzknDM
 Q1yDZQoLPj2evxSoGGYXI4ozDpYqF1+24QmIRJhBZxyVxCFlwnCbibm8qpa5m/Qe
 Y32sGtykNjCYi8hPooL8sAjQyrekg6f1Hky0pvxFQQaeuguf2fXkCtuk4zystqQD
 NMbHC0pvYk3rS7wjl8kNYeKDs4hWlqHpY7BZwFt+2EVit0AJBZAQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9P65ZJ5K4Xvy for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:19 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7P31ZGHz1Rwrw;
 Tue, 15 Feb 2022 22:30:14 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 13/35] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Wed, 16 Feb 2022 16:28:50 +1000
Message-Id: <20220216062912.319738-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

A hypervisor can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-3-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/cpu.c      |  3 ++-
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7c87433645..e1256a9982 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -540,6 +540,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
=20
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -554,6 +556,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
=20
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1238aabe3f..e1224d26dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -434,6 +434,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         }
     }
     env->mcause =3D 0;
+    env->miclaim =3D MIP_SGEIP;
     env->pc =3D env->resetvec;
     env->two_stage_lookup =3D false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -695,7 +696,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
=20
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
=20
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41a533a310..c635ffb089 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -461,12 +461,13 @@ static RISCVException read_timeh(CPURISCVState *env=
, int csrno,
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
=20
 static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;
 static const target_ulong all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERR=
UPTS |
-                                     VS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -748,7 +749,7 @@ static RISCVException write_mideleg(CPURISCVState *en=
v, int csrno,
 {
     env->mideleg =3D (env->mideleg & ~delegable_ints) | (val & delegable=
_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |=3D VS_MODE_INTERRUPTS;
+        env->mideleg |=3D HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -764,6 +765,9 @@ static RISCVException write_mie(CPURISCVState *env, i=
nt csrno,
                                 target_ulong val)
 {
     env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &=3D ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
=20
@@ -1110,7 +1114,7 @@ static RISCVException rmw_sip(CPURISCVState *env, i=
nt csrno,
     }
=20
     if (ret_value) {
-        *ret_value &=3D env->mideleg;
+        *ret_value &=3D env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1228,7 +1232,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, =
int csrno,
                       write_mask & hvip_writable_mask);
=20
     if (ret_value) {
-        *ret_value &=3D hvip_writable_mask;
+        *ret_value &=3D VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1241,7 +1245,7 @@ static RISCVException rmw_hip(CPURISCVState *env, i=
nt csrno,
                       write_mask & hip_writable_mask);
=20
     if (ret_value) {
-        *ret_value &=3D hip_writable_mask;
+        *ret_value &=3D HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1249,14 +1253,14 @@ static RISCVException rmw_hip(CPURISCVState *env,=
 int csrno,
 static RISCVException read_hie(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-    *val =3D env->mie & VS_MODE_INTERRUPTS;
+    *val =3D env->mie & HS_MODE_INTERRUPTS;
     return RISCV_EXCP_NONE;
 }
=20
 static RISCVException write_hie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
-    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS=
_MODE_INTERRUPTS);
+    target_ulong newval =3D (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS=
_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
=20
--=20
2.34.1


