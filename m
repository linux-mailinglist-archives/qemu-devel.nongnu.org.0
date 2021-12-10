Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B546FABF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 07:44:55 +0100 (CET)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvZeH-000484-HV
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 01:44:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN9-0005i3-Lm
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:11 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN7-0006GQ-Cx
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639117629; x=1670653629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ULrWoIzf+Nv3eSfqER7vaO5dGa9cRP9lkwCIvaxZ/Qc=;
 b=dgECdJPbjN4n76ykApSzSW5d8lkvUuGrF7KGXWhWlsKTaszmzqrUjx3E
 CAluGFUZfyVjXvGbk5/OLr4yqFSJxxItHj4Fp4vezkjz4UsUcdezRNzR0
 b4AUsYe3EiNVXtTajGeJtwQXdhM5DKhCr2SzOD9KAPNQpP/DZ6db6ZaSr
 4wPqQTQ9Am32/j89zlKrk3Yvdx7VkxqgE0pZLIaB5eD5FxrPlEZZYzfEc
 INy+EJkHj5WkxEJts+wCCIgq3Sv1wgWk9OU+c9HjwOJ52Cj1JhvD46+vy
 JAxZG+lN9UE7HQWFq3h9IjRh3sQcG6pq7MfyUVW0nqtknwdquJhzFOkTE w==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="186896002"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 14:27:06 +0800
IronPort-SDR: 8QXgyiz2qEEsNQ7tD26MvZs7lQ5TItAO5zciW2lnmw3CwzO+bv/NZ6CaWMpmAQODg4XXgg9uT9
 MHFWu2PCEPfdj5PZVs5P+Q5Kv0dOjgZRB/WbNZnEsiOFQlwdY6cwbA3iuse4fNTcAix7exoiEb
 RQWPAdxgU0DoYB8SNYcCbO8U/O0gQeH+WRcUxprc4NiVQwOr4A5XwEvv3JZcNNemQwiNr7LpsE
 NI4DY3o2nWEzxuqclDp/bEOTmqA1bMwUEYA2A6Xu0v/7n1fFnnecgfFBFs8LCW0L++sv9D+bCy
 JEf1VYkW00FjKX5dpWMCE2Hr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:00:08 -0800
IronPort-SDR: fI0p6AAe5DQs1MMd0Top2BbwkvxIJrIYFtP0EbqQJvWa5eL8Eb4nsZiOv1W8NRncHXzkb20mqd
 ywhpOKuUl7vydP27X6bwQoCK7Y1FxsPW0a/vwndHo0VCt19mgKinZ1ImcAZ8nwgWGx+rjYgJif
 5a/p6nVfO0lAAiVSBRUAT64iEU7JjKadOSc9/ymhmOW69/2B4ELf0Ksp1a+p9/e8C+p9a+8xFm
 N16GCpca4CiSwCJnZ1LNTipjIKM8+2T3b3cvkWmtZWXaojnnkfJvIpu303UplZP4rc9fTYuMJZ
 8lM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:27:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9LXp3fClz1RwFN
 for <qemu-devel@nongnu.org>; Thu,  9 Dec 2021 22:27:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639117625; x=1641709626; bh=ULrWoIzf+Nv3eSfqER
 7vaO5dGa9cRP9lkwCIvaxZ/Qc=; b=P0LZhOiO37QbIfcuK0WCg02nD08q4uwAS6
 vAEW2dYwBSbQJ+QXZaRQBlwVQZooU/Lc5zpOqC3sisuXb67dO82hD37HITGsBi4z
 VkHWmzLmtLjkWdrTBzj/yxvWQDWoMS+5IQDAVcifKX3sX7TLfaE/UT9gp9P+2vkg
 TxTv7L3zSET609kzka//0jyZNKVmRJEM5efR7C/CsBE7a5/ByNDNer4FRd4ykVJx
 Sgake78sTBmYWGYsj2haefqLEWncUdyFz0l9nWr/EqLkECM8UYMJ/yWD3rTZK9wF
 pymhmrtQuv6fnXV5mxUjmo7sbxXU8S/PBCLiJwJXRIXNmjqi9wEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GUeze4wOD4hv for <qemu-devel@nongnu.org>;
 Thu,  9 Dec 2021 22:27:05 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9LXj5KCFz1RtVG;
 Thu,  9 Dec 2021 22:27:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Subject: [PATCH 2/2] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Fri, 10 Dec 2021 16:26:38 +1000
Message-Id: <20211210062638.824672-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9719c98f0=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers based on the CPU feature.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 25 +++++++++++--------------
 target/riscv/translate.c  |  3 +++
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..3a163b57ed 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -127,6 +127,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    uint32_t bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..cb5833a6d2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -975,7 +975,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg =3D async ? env->mideleg : env->medeleg;
-    bool write_tval =3D false;
     target_ulong tval =3D 0;
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
@@ -1004,9 +1003,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_tval  =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            tval =3D env->bins;
+            break;
         default:
             break;
         }
@@ -1041,17 +1042,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
+            env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0);
=20
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
                 /* Trap to VS mode */
@@ -1063,7 +1054,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause =3D=3D IRQ_VS_EXT) {
                     cause =3D cause - 1;
                 }
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1071,6 +1061,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                                          env->priv);
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
+                if (tval) {
+                    /*
+                     * If we are writing a guest virtual address to stva=
l, set
+                     * this to 1.
+                     */
+                    env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA=
, 1);
+                }
=20
                 htval =3D env->guest_phys_fault_addr;
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 24251bc8cc..921ca06bf9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -167,6 +167,9 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
--=20
2.31.1


