Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C1247A543
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 08:05:22 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCjY-0006K5-Br
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 02:05:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUR-0006xk-NV
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:43 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUP-0002Oh-O9
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982980; x=1671518980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+7bfdjesS0s3LHB18SglbSGmQHmIYhCVWoJ8rzL6PQ=;
 b=JCK2hhkfrnyTW9D/5SBjtTlnABGhvmDO5nkcb2kwYFsUCcg2COp0ZugD
 nFZC87eMykhfbTRD0plez/ySvVibcHm8BrRwaKL2XVvto0kak+4UL9lnU
 nbdGH5CyAkH2wjJwqR7KVktZPNqcpjA6eslNokb2QsYfNV7JhvpE/OTW3
 Qde8MCSYF2Paes8Ornte4aHpHVC4S8C8a891Jz/voQO15Eav6S0rC1jio
 w+/Av4bW5+qFl4d1ie3aBa0Zr1a1zkfHz4B65JcrVa4Z2Z2ba482MUQKk
 0JcSD1OHI7KAtdE4L+u4J3TNbHGVdI7biXkYQq0tErsTBG5/fQWsXJMIX w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="188654149"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:37 +0800
IronPort-SDR: 7L0+tgKBuh9WcSiwmDMvhZscjxgzrRrVs0i5b+vy4vstjb2X+WU0wgPYriJQkrG9G5iWn7zvVR
 yC2pRGKAXUg98G/H5g66/IuIdHdSiHSc8oGU0NddDWeyViCBhYl6c/XCCoWG/wy2t6sKAKQacP
 ioziWUqm1OydMWl86ZRSsEogMzfTFV7BqXkiIDzgRNv1EjO9w3DZUiompjnmNQIwaXU4SgBi70
 HkXZGgT85s1jqnAEjqbPP+m27PQZe/fAzfK4EsgrEz6sLzZf8elQ3819bQAO3s4qP4Dadf7Q3N
 WMF4G5CQtisudfLJ09v6x9hg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:23:55 -0800
IronPort-SDR: 5+Rs6GAfH4Gdv/jAppZYAdmMjaoYnRB5cxQiY0pXRdexyPXwfVDMyPXDuWJO4g9vfa72SUmIg4
 YbLkPxReQS3y+2BxrwOYVideNxBG08+Qr1ngIq5vWPkAdu8nChQFyvgWlmAOvzax/V/zskLfjI
 yDeRXPyZrNK/tRpHpic0GNWlETSlYKUnARdWsc2WaOb14XDRXS9AX0jK2nmga8vIPsBi+3k3g6
 M+HTMD8EBNZDRnec+AbhXNJsmbuRkZ1BlgTEu0qJ9McVXAsMUDGbwBbEVfJ5jgsKtOQ472zy/I
 gBU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZ96cv6z1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:49:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982977; x=1642574978; bh=F+7bfdjesS0s3LHB18
 SglbSGmQHmIYhCVWoJ8rzL6PQ=; b=pR8DmTHiyZyrwF/xycGiYP2dSsXpLCeMeW
 +6GdTAIqnYVXxf/hikwz9V1Y7WUNhjCHOPCUWuyEyEGclLPIwwnSvH90r00O33dy
 VQ6Ehy0jBQAaYjqBb/MI6Eb84oAQCOBnQzB/k1a5PW3stJBx2m67Olee9lYLDpQw
 WdRq7f1cPvB1JCKnowKVLG9y6M5tWD5gyZGcoP2vtC37+StecbsncdKjPySoC93O
 nE0qWe2rHKjjdCW/osaA6/0M98JN2Qmvk2yHiXjEfI1hVao6O/3JzrG1pp3xS6mF
 Km6LWveDFCnkAL2GbALvE8bUjggPIyfIAyuViBsBv+S4xjudjt7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GTjPgXBM6gIM for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 22:49:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVZ51zRfz1RtVG;
 Sun, 19 Dec 2021 22:49:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 2/3] target/riscv: Fixup setting GVA
Date: Mon, 20 Dec 2021 16:49:15 +1000
Message-Id: <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In preperation for adding support for the illegal instruction address
let's fixup the Hypervisor extension setting GVA logic and improve the
variable names.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..9e1f5ee177 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -967,6 +967,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
+    bool write_gva =3D false;
     uint64_t s;
=20
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wi=
de
@@ -975,7 +976,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg =3D async ? env->mideleg : env->medeleg;
-    bool write_tval =3D false;
     target_ulong tval =3D 0;
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
@@ -1004,7 +1004,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_tval  =3D true;
+            write_gva =3D true;
             tval =3D env->badaddr;
             break;
         default:
@@ -1041,18 +1041,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
@@ -1063,7 +1051,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause =3D=3D IRQ_VS_EXT) {
                     cause =3D cause - 1;
                 }
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
+                write_gva =3D false;
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1072,6 +1060,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
=20
+
                 htval =3D env->guest_phys_fault_addr;
=20
                 riscv_cpu_set_virt_enabled(env, 0);
@@ -1079,7 +1068,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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


