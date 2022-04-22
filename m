Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195FB50AD13
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:10:58 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhp3-0006xJ-6y
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJt-00085V-4n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:45 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJr-0005Vz-58
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587922; x=1682123922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7V7bntsiUrBNhbKHQ1ViOvDxpSZHJy1zY6ve2mcyhY=;
 b=LKd7WyBFnujAUwfUBh7jwiNAsp+nlzl200qNoX838VoUKxw+hb1kLl8A
 Rn557Q415VaTQv4KjCa1bkLJ+5AiPUFfNz3Mn9WjJoMQn+LurdDhxhNP5
 ccsKiQAkqfdX6DJ56BuvfIIkrIuRhN4wwlGJKT0qGqxmiHGSv4rmN6sED
 DsKa4UP3cqpDe2f2qA2iV8iZg0LWHXS8c27fLlBaatRgbNWt9Ep2wl1d6
 I0vCbkYjHhiH/P8wv3DhYiZPWZZ7gG7oLksGZkIB3yzJOfkRf7BraOGuL
 k873Cw6E+pi32Hj1KKx2333aFrE9rv6Up6dBaFUpd7klzr2gPtBcISq48 w==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483446"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:32 +0800
IronPort-SDR: B1aMcXQMUx1y+Y73Y8KpSagaCmDLj+eVKBaDKnWtEdJEhZPXUty83AO7MqDlhrlmubMmC8ig74
 aEQgsY6+tkeP9s+GZBZ6ZwOT4czpUnEjlVP/E7+dToPY9eBE/J5dQYIRuPl3wG3Rn6TrDc0n9Z
 150YkSziJ3wxoMPGP1mm0GG9+Ow/6HScXSf6AD82SfBBgK2CE2J2hs2SOeQ+K4LL1I/MfXWolx
 voI405osZWStzW5nLYAujaB+Bc/WRIbgKfW6KVozRXJshIaA/BUB7KVEFJ3tROS47dJHqMAAyz
 Ch/c4CVlgx8kIh8MimW7RrIW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:49 -0700
IronPort-SDR: BpaI+daex9t+DP55JcE8Fb1qnXgxU1l+w/9Em7j7bdOQbMz0EdnXhWdpXG5zJSLiWfZloVEUy5
 aseTZZpzDnvkNDKuLFvBVyX87j8saspd6yaFbikUfHYXGm3q+XXBhjb/wkJc5317XXtjt+GQVX
 Qcb+Tw9+KlCeRkBx33rtiCk/NxeIq8EhPapYb2/0+R/yMdc4dOmxl7/1i7pHK7ghJFTqgIVAWT
 P8e95ROfd6bWkiSl2SpzN0BkzrGptKWSCQOsvx7A/os/RqB1b0+6MjuVdyO3LsILXD7tuUFF2L
 gx0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWD2n3Jz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587911; x=1653179912; bh=E7V7bntsiUrBNhbKHQ
 1ViOvDxpSZHJy1zY6ve2mcyhY=; b=f/KhmDzzoc7CKGDR0pBElPAd6VLVwRkdma
 U7H2NKjrrEulFuJCTPERaDQRRW+K/urL4+UTpc81MIO9/UKL4NmtKcm7dj0mQA/1
 RKAoBUxdwjMUFI91AfThxzU3/67vY1OX1L5zVY75b0X3t+BQ4PZovyhvH6r1YG38
 38jlUH0uf8DmSB+HyMt4sk0zQQX73bzW/KBIOBFcAUp9sfCtcrSaBESCbStnoDdI
 TgxA8MuwAAtHZjo2gpR2E7nzQ+l90+gioWPD4oyfMg7W44NhCEg2+MPUc2Sb4MGe
 0/gdw6aoTSc2kA4+clp/iEtUtuVrEHVz+OmDR7HFDISqehlkCKpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HwMTXzYTkxS1 for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWB0Dnnz1SVnx;
 Thu, 21 Apr 2022 17:38:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 25/31] target/riscv: debug: Implement debug related TCGCPUOps
Date: Fri, 22 Apr 2022 10:36:50 +1000
Message-Id: <20220422003656.1648121-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


