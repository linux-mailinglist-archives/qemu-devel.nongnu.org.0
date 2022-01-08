Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49224881F7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:02:27 +0100 (CET)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65kA-0002rc-Pi
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fl-0002AO-2T
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:49 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fi-0006wZ-5f
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621224; x=1673157224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qh45ZUoWzBpN26riQoG0Sl5Y/CpXDk9WrQ8rVl5mMjM=;
 b=Ae/5qXo7PSsJ73Yoml3AtbF2NNe4C/hm5aLZKsD0GFkMswXlNI5hz5f3
 KafrwF/svVxgJG+OyxLhRWdLQLk9RkBjx4XVj4ODllMyrXrHnzaG7Wfe8
 wNPzsZzNYrbRQJC3N/iK/9SLnsKdV/44SWJZGPekMxlFa4v2TWljKLkDT
 AR2xtsvCXsEbYijV8j+J3GTEaD90RFVw9kfWLDXgBEONKVK+92pnLTAuU
 lz0MnfRCOtHMt9Pls8N2bEdqqAah1IZxp4D19/plrIdE8qWaiWq5V+j0v
 xFzhiOtrv4lbTfNuT7PYNEcJGiuHBQ6uGQMYLcyIfarRnC3cWSuvr+Sm9 g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984963"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:44 +0800
IronPort-SDR: 8M4FWHs7IGZhvm4kBf9yyv2pu86vlnMDMB8Rmn67Os17CzUPl5qpS8DnFXeOnYaWbz3ox0Gbx8
 o4PNsGjPjRxT8n7CzBDt45+trY/pxWP8dvY4yrKUFUkDv+GsCAbicRZ3FYSzuEUzT9/37uooy6
 h8Kx3jLuByJD6hcWrCeekGFNvK+uGMoKpO87aN7mlGlTby2JYmuKtyozkcxXIpM3i8A5OAlqPt
 5qtP7iDgb3M29l3jQ3A/MKQlkbzlpElRgFJl/TbcFTrWJUjPfsdw/flFqe9uiK2LqtALd3NQTe
 C8Wh9PkskJoLhMpnm0MmexE9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:26:11 -0800
IronPort-SDR: QgvVxtnln1GPHzdlnEaVsLEFq4S/dj3O0cE7Tu46QeYO2qeNOQ4CjboZUsS6TD8Q0BfZtNBGvj
 Ug+As+CbKAhOrj2diuGTi2NdlowPi2bw05UpS/TPQe2e3FYYsfZAhDNkDKec7J7FcmJiTQAkrx
 AU+pZ1ESK+L49fAfQVvtzyz9jVwZJU+iEyhvmkuSRGL0691CIz2I5qxM5HLZWbsr8mVvNg50n4
 ztXQxD5BMlrKtPGLKUhnHZEJGwUFSQeshQPYPP1bVT7tFqFMokCHu0WJ44XjkQlyIyvZKVLSKU
 Wqc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Qw6YGvz1VSkf
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621224; x=1644213225; bh=qh45ZUoWzBpN26riQo
 G0Sl5Y/CpXDk9WrQ8rVl5mMjM=; b=WPwdvb4XNguzYiaaSLhUiGk6Rwewyx54fA
 erD9KriMkLrX+xHNPyXXcbc+Bvg/m+uUv0FucTbJ1Re9lC/0uessEMA2D7M8EaB3
 88D/hyq1o+s7+EnAOcCC395SJJ3CtIWOPAD6CE+w5dtelGJpIxiByO7huNpf0GDD
 h1BIWXzM8s/xNEtgTbQP/6n0fks6G4fsKnev/9AvEiMbfZM5GmiVNwUpVfXjXq3k
 ZuhUpFqaQ2CB9Z4ekbJxP0weMiVES5XNQuPA5Ku4fWwNB9pAlQa7bTQOmE8OGcON
 0+JQtrZC1wKCMWgLRbCACJ8CMkwrS/kGpCMevUaX8twl2SRLdkTQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P2oP1OSWLzM4 for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Qs1QyMz1VSkW;
 Fri,  7 Jan 2022 21:53:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 36/37] target/riscv: Fixup setting GVA
Date: Sat,  8 Jan 2022 15:50:47 +1000
Message-Id: <20220108055048.3512645-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

In preparation for adding support for the illegal instruction address
let's fixup the Hypervisor extension setting GVA logic and improve the
variable names.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211220064916.107241-3-alistair.francis@opensource.wdc.com
---
 target/riscv/cpu_helper.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 10f3baba53..ddacb8533a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -998,6 +998,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
+    bool write_gva =3D false;
     uint64_t s;
=20
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wi=
de
@@ -1006,7 +1007,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg =3D async ? env->mideleg : env->medeleg;
-    bool write_tval =3D false;
     target_ulong tval =3D 0;
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
@@ -1035,7 +1035,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_tval  =3D true;
+            write_gva =3D true;
             tval =3D env->badaddr;
             break;
         default:
@@ -1072,18 +1072,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg =3D async ? env->hideleg : env->hedeleg;
=20
-            if (env->two_stage_lookup && write_tval) {
-                /*
-                 * If we are writing a guest virtual address to stval, s=
et
-                 * this to 1. If we are trapping to VS we will set this =
to 0
-                 * later.
-                 */
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 1)=
;
-            } else {
-                /* For other HS-mode traps, we set this to 0. */
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
-            }
-
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
                 /* Trap to VS mode */
                 /*
@@ -1094,7 +1082,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause =3D=3D IRQ_VS_EXT) {
                     cause =3D cause - 1;
                 }
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
+                write_gva =3D false;
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1103,6 +1091,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
=20
+
                 htval =3D env->guest_phys_fault_addr;
=20
                 riscv_cpu_set_virt_enabled(env, 0);
@@ -1110,7 +1099,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV, fa=
lse);
                 htval =3D env->guest_phys_fault_addr;
+                write_gva =3D false;
             }
+            env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, write_=
gva);
         }
=20
         s =3D env->mstatus;
--=20
2.31.1


