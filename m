Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17078495B8A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:05:26 +0100 (CET)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAovD-0004P2-Ui
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:05:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0Q-0007vN-R9
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:38 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:53939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn00-0005AO-EB
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744932; x=1674280932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4soeCmdQ2vjsAiWXcDwPw7kOq4kDmAaL+Zjclw0Xf8=;
 b=J05/xK7EaPjRIToY7LE7KUc5FLwDFF3xze0AQf2bn1j5o/rhiKzpb7Bi
 9pTToQ9eHURKh57nCu2bvp40kKKBIHvrqtB+Kvc17BoY6rWObklg0qvEv
 X0C4SCrrJtRvkS9hgUXc2rnSuggCuGFB99OOK2SrzM+2dKJ4n6J1tvQ49
 Qk1jHe19C4+jMXZigmxUmqN20Qu83uKv/krVzPX2MgkY3zDypzAFVOP+X
 861WJlPxYPPhKLGloML9YZsPNSb+x+7ji2kwXvTg97GDPHh8+I3U6jklc
 BavRB54IdqYSEMoIsmTXDl7yzXVNC994waf6EAWNuAnGKFliUq4rcOpz0 A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814202"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:06 +0800
IronPort-SDR: eCVi4snE1UIKSFdE2ZwDmvKFeBVP1yDLa1/ubl1vtAv9gpJCt4vRgvNjzFmR8cDYcTN2px0DV6
 67AioKa+mv75Isyjdj0yAHakYjHX6O/KIlJqyH3o6V8rphaWrxOFMuSbI7PiJWjylm9YvZYD8g
 aTcoV8fTrLtm6qHwXNmjJI7hU5ip1i/YZbPRyiTOareg57rHBjt1eYY5GX8uLsgIY4ysP1lwAy
 T8yd4WFDFh1mklkUOsbqpNZajGOfIXa921nyuGnjc/4OxeVNDoFKwgN3uV13MQsHd4iQBkJuqK
 7lALytt1OCBdDHnbXTMYBHEj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:34 -0800
IronPort-SDR: 25JaqG/yJwKU5RajmBCpob634cs6RNqzTL8lxh4XhMdoFQB7p4PWUbiaoaHm4UBdXlARMF8rJt
 N4iUq+iEPrsmplaM5C7j14yuUUGXEwdeI8o8bgijse8mwTq8MGNnCjvgwPVHioby6T/5Ya1B2O
 jwn1SNr6WBJs66TtrCfWA4beV3QT/PZaRKKcgVXAc5qE0J1CMVcTtv1DrDddiGL997xoga9dGk
 JyULTABMjI9RGU+IZ8tTmNwQ754lYjY/nBUckMz8qE1oCyu2TMPaEbFUJZ/RKcjnpYhHF2d/xC
 MOE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80b1RBPz1SVp5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744926; x=1645336927; bh=s4soeCmdQ2vjsAiWXc
 DwPw7kOq4kDmAaL+Zjclw0Xf8=; b=HXHQGnWKbqx2Ut65yxPFkDIZ7y0b/QY8An
 cQa9JCy7n8TzmCpX1t15ObdcoFU79pZ7EkrsKX24WRaWtYdgW6dQNGRVpJ+Urtfb
 zK7CpEJ6X5p0AdLEY75Ro0wITRr5JJvqVPf05DH0dZafp9a6XXlv9bcOWxbIYcMV
 eOlgB0Lbqgj5IoIp3nF384Ps8BGiHobjOE6rKrjjS7KJ5XXB+4zHR6M+otkSaoDz
 TxVW0pxKKhOnOpEyOylovAbmMNmTlc4+R7glfZxiE4LyNZImUmpd3YQf79bXYDcB
 a2uE8ztKMhix5qRvz5OjYoSI4/jwvrg1ROJ3eiB8BivD6TKSfPJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hXQzjmXK_9a5 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:06 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80W3988z1RvlN;
 Thu, 20 Jan 2022 22:02:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 49/61] target/riscv: Create current pm fields in env
Date: Fri, 21 Jan 2022 15:58:18 +1000
Message-Id: <20220121055830.3164408-50-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220120122050.41546-12-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        | 19 +++++++++++++++++
 target/riscv/machine.c    |  1 +
 5 files changed, 68 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7657e22a56..6fe842edfd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -266,6 +266,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
=20
     float_status fp_status;
=20
@@ -515,6 +517,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, =
target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
=20
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_ma=
sk);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 690c879901..a120d474df 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -430,6 +430,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl =3D riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index =3D RISCV_EXCP_NONE;
     env->load_res =3D -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d73925a823..b239d721f4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -122,6 +122,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,
     *pflags =3D flags;
 }
=20
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+    target_ulong mask =3D -1, base =3D 0;
+    /*
+     * TODO: Current RVJ spec does not specify
+     * how the extension interacts with XLEN.
+     */
+#ifndef CONFIG_USER_ONLY
+    if (riscv_has_ext(env, RVJ)) {
+        switch (env->priv) {
+        case PRV_M:
+            if (env->mmte & M_PM_ENABLE) {
+                mask =3D env->mpmmask;
+                base =3D env->mpmbase;
+            }
+            break;
+        case PRV_S:
+            if (env->mmte & S_PM_ENABLE) {
+                mask =3D env->spmmask;
+                base =3D env->spmbase;
+            }
+            break;
+        case PRV_U:
+            if (env->mmte & U_PM_ENABLE) {
+                mask =3D env->upmmask;
+                base =3D env->upmbase;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+#endif
+    if (env->xl =3D=3D MXL_RV32) {
+        env->cur_pmmask =3D mask & UINT32_MAX;
+        env->cur_pmbase =3D base & UINT32_MAX;
+    } else {
+        env->cur_pmmask =3D mask;
+        env->cur_pmbase =3D base;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
@@ -334,6 +376,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ul=
ong newpriv)
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv =3D newpriv;
     env->xl =3D cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
=20
     /*
      * Clear the load reservation - otherwise a reservation placed in on=
e
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c00a82022e..292f7e1624 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1607,6 +1607,7 @@ static RISCVException write_mmte(CPURISCVState *env=
, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet =
*/
     wpri_val &=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte =3D wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus =3D env->mstatus | MSTATUS_XS;
@@ -1682,6 +1683,9 @@ static RISCVException write_mpmmask(CPURISCVState *=
env, int csrno,
     uint64_t mstatus;
=20
     env->mpmmask =3D val;
+    if ((env->priv =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmmask =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1707,6 +1711,9 @@ static RISCVException write_spmmask(CPURISCVState *=
env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask =3D val;
+    if ((env->priv =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmmask =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1732,6 +1739,9 @@ static RISCVException write_upmmask(CPURISCVState *=
env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask =3D val;
+    if ((env->priv =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmmask =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1753,6 +1763,9 @@ static RISCVException write_mpmbase(CPURISCVState *=
env, int csrno,
     uint64_t mstatus;
=20
     env->mpmbase =3D val;
+    if ((env->priv =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmbase =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1778,6 +1791,9 @@ static RISCVException write_spmbase(CPURISCVState *=
env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase =3D val;
+    if ((env->priv =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmbase =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1803,6 +1819,9 @@ static RISCVException write_upmbase(CPURISCVState *=
env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase =3D val;
+    if ((env->priv =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmbase =3D val;
+    }
     env->mmte |=3D PM_EXT_DIRTY;
=20
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index b76e4db99c..a4b7859c2a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -220,6 +220,7 @@ static int riscv_cpu_post_load(void *opaque, int vers=
ion_id)
     CPURISCVState *env =3D &cpu->env;
=20
     env->xl =3D cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
     return 0;
 }
=20
--=20
2.31.1


