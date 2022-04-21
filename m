Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E225098A6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:09:55 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQwq-00089B-Pi
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSa-000613-FY
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:36 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSX-0007xw-2X
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523112; x=1682059112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7V7bntsiUrBNhbKHQ1ViOvDxpSZHJy1zY6ve2mcyhY=;
 b=jDYdDv83wJEv6orSfDYWWvV3RbHLoVnN2dVuSy5LhjNyAg1p8H4Y/tC0
 L3tKNMuV5YImUyuUr79lKI30H/cBLyWZkwgSnXKHBl9tz/tUsULsjoR0A
 YKQrE/3QyTnjs40RiUPk9zSqpsuKWqFILTDWLWtPdVLKUSnXTmjppceqT
 G4qRKIKnsgkgfsEq2BgwteHI5LYqnGoMtJnH+qetL+a4/C7T1TsJkeIxw
 kPcFMO0ovgo6mBbPsoGeQZ4NPA0Bo5cGzPh3/tIlnRbS7hvFNb+vdr8Qm
 ICYlDWNYKzvBcJzqi4O9j8GrudAaAfCBA/E1Bz1V/Ll4Ngp3NWf4qttLy Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640021"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:05 +0800
IronPort-SDR: fgo49fkD4JvcN4IzBVMISHK+Rev+KEAhVLgBhFu5UP7OKA7GXlMauB+3ObDFrqqXKnWivfx8nm
 vPB7cyyYyseKZyZw0xGW8hLqTINPHXhy3+B0cZtrasaL+7QCP+AZfj5Mibs5uwpTmr/VJ+zIte
 uxADUwBS4SdCrNWZpXLwMXPv+lAr62AYo7UmJfqHmkIvjPA5ZI8xQ1aX/EK/SlTA1jihC0RcU8
 3EVK0NVaPvnyXh2eNVquOp7EZB/YZJeRxoXQxQERafkWIasR2Z34KTPoneHsnATB6bSma+vBt5
 h/Wch0q7/pmO3GSakYDRw8F7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:07 -0700
IronPort-SDR: AxhQLsvDiMqh/rs12iAF/PREjIuQL+2tVK+6PQs7wyXuradyaaSSuJBt8dCWbICkMgIsP4Swom
 WUb7McfoByN3fm0nSKJZO//5J4J/yrjmOkBZVU3qX5sqMeAKl+n2+5nen0qcQV9vh6UmpvPEtT
 XuVrZyT1yezt+UK21SOrTYH3+KOmhLJfZI7YhU2ttLRIgcreIVZAqaBk4T3+EjHHsYcARli9UH
 ycjjt49IDKJ+Dn4iwpYvYwyX6LZA0DhKY/eLo2Z0f8rJvpes4lhy1d75bGlB3rvROMcFhPElRk
 YH8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXY1XmSz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523084; x=1653115085; bh=E7V7bntsiUrBNhbKHQ
 1ViOvDxpSZHJy1zY6ve2mcyhY=; b=h3E9Tf98zi6PsfZ3eWs3Kb6qSTDYbTAag9
 dmlkAim+RRi0YsOQA8HQ0ej8fbOpA0Ct6nwZ8ky/Y4k3OQMnEXwv6jTc9Y/zp7QJ
 BLWqNEB4DLRCyf/SuLJS6secfpW9HfxTn+fx56fRKf2RJw1IP2JbElpWCEMHyELu
 GkSBIUiohyguGAZd+CzgFKsG0QOfPYEUccLWR1axyMMAVz/0y0puDSArYp124fjP
 IJBpXSv8OLWUXFdysj4xCbAEvqM6yxV+lAlb3ebG0LyX+bA7bEFhAAB0PfdGsUxh
 mfjvzhLnVHIusOz9m9pf5tw852/RAbV+bg1MMzbEpgsG/IuAm1eQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id S_Lp05eJk6JX for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXT0Jf0z1SVnx;
 Wed, 20 Apr 2022 23:38:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/31] target/riscv: debug: Implement debug related TCGCPUOps
Date: Thu, 21 Apr 2022 16:36:24 +1000
Message-Id: <20220421063630.1033608-26-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bin.meng@windriver.com>

Implement .debug_excp_handler, .debug_check_{breakpoint, watchpoint}
TCGCPUOps and hook them into riscv_tcg_ops.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-2-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.h |  4 +++
 target/riscv/cpu.c   |  3 ++
 target/riscv/debug.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index fbc5f946e2..fb21706e1c 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -105,4 +105,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulo=
ng val);
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al);
=20
+void riscv_cpu_debug_excp_handler(CPUState *cs);
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 94f9434411..8919928f4f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -880,6 +880,9 @@ static const struct TCGCPUOps riscv_tcg_ops =3D {
     .do_interrupt =3D riscv_cpu_do_interrupt,
     .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
     .do_unaligned_access =3D riscv_cpu_do_unaligned_access,
+    .debug_excp_handler =3D riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint =3D riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint =3D riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
=20
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index c8cec39217..1a9392645e 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -337,3 +337,78 @@ void tdata_csr_write(CPURISCVState *env, int tdata_i=
ndex, target_ulong val)
=20
     return write_func(env, env->trigger_cur, tdata_index, val);
 }
+
+void riscv_cpu_debug_excp_handler(CPUState *cs)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+
+    if (cs->watchpoint_hit) {
+        if (cs->watchpoint_hit->flags & BP_CPU) {
+            cs->watchpoint_hit =3D NULL;
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        }
+    } else {
+        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        }
+    }
+}
+
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    CPUBreakpoint *bp;
+    target_ulong ctrl;
+    target_ulong pc;
+    int i;
+
+    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+        for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
+            ctrl =3D env->type2_trig[i].mcontrol;
+            pc =3D env->type2_trig[i].maddress;
+
+            if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
+                /* check U/S/M bit against current privilege level */
+                if ((ctrl >> 3) & BIT(env->priv)) {
+                    return true;
+                }
+            }
+        }
+    }
+
+    return false;
+}
+
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    target_ulong ctrl;
+    target_ulong addr;
+    int flags;
+    int i;
+
+    for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
+        ctrl =3D env->type2_trig[i].mcontrol;
+        addr =3D env->type2_trig[i].maddress;
+        flags =3D 0;
+
+        if (ctrl & TYPE2_LOAD) {
+            flags |=3D BP_MEM_READ;
+        }
+        if (ctrl & TYPE2_STORE) {
+            flags |=3D BP_MEM_WRITE;
+        }
+
+        if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
+            /* check U/S/M bit against current privilege level */
+            if ((ctrl >> 3) & BIT(env->priv)) {
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
--=20
2.35.1


