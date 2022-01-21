Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F94959E9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:26:26 +0100 (CET)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnNR-0005mq-AB
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxO-0006nn-9g
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:39 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxA-00040G-2f
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744756; x=1674280756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wdupn2UY8EgzlJsRELG+w0FJCCDOY4Vi5+ZQ17CXibY=;
 b=WFGg1EJ/oIevnh+ECmpVTmIi07YBJLlZGn20VE3p41xDXl/4q73NldUj
 lzwUg1h9iiI3YveTva0COht6yqDkBMQGb3IhEHPawPW0cFS+5PxanPDrR
 6iwBRU43UZ/j7moPixNcFZBNDf/fC65hZHEAb8CRoVfsfZoMCpdVOtkVH
 L0Oi3v1peX7bt8ZP7W7qdlsOGNFGCYSHAAsfgWaSKTDK//rJnme1tMU1L
 R8UzZX45kl3j02JCoOBcLUiA9Z/QJyvBW5N4i9lk3gkrQlqQcAowq1MDa
 ZnDex6yT26BAPql2eTLA+x/5qyD3pCG6oBnoPO+FmIgWL/6DDfzELEIET w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976491"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:11 +0800
IronPort-SDR: wtwXJD4LVkYaCRiMVVG9Ul5ToJCGtZ2NvWxUVWZa3IGyACJAk8/SKNOoDVdv8ZdkT8FUHnpG3P
 /gQXbBz+tJFO+aUs+oapZT5bJCqRgq1lQAXY/Eg2sy52tA5qpWmBYwWb073x2A0zrSq+Rgw/JO
 X7/eEXLDS6Szdadb43Ye5l7QrcnaHtslwDoyM4w7YpxzdjyrJubF7nM/X08WBC14B5zNI8JdfJ
 /R/wGaisYKH0u4c1JM8jumyI2xXFmAzVLnyRLW8VSFirIdBm2Qup2tsoM4NX/Y8HcXLQstySCi
 aRM6z6f6pxW6el7jlHP93ZEc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:23 -0800
IronPort-SDR: SdrPbb02EZ23Ho4a6EvQdVLMz/SkSWWFlMKcetBaAYRDtUerCQTZLMZTrssHQ4y9m9W2cR3aYY
 jvN9g6KA8poKwQ21uT8kB6dWHcs1DuJZY1eMUESNllU694iOQQuawoahhYoIEYqpJHYZWPI8Tw
 Q4LjLyiSg5qQOJi5LVoNEWND5mcy5XApiIqkDkmfRpIZ8i4mJxcYBwaWmhUay9+5VG4evk++/b
 /Zz9Z3FDb8InZcmGdQV4gEsvLLxiE301HZDCXKPjPWQMsss02jXqFk71ZT0gmoaifM4H64wJy3
 cLk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xC4wsjz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744751; x=1645336752; bh=wdupn2UY8EgzlJsREL
 G+w0FJCCDOY4Vi5+ZQ17CXibY=; b=Bs7aIxIuKqXiFcABx/1KXVKDdgyzgVQM+7
 Qrw7GeZUCKrl5D9xNJY5AKMJFDNpGTlOO9indnH+6ZLikvswq2pv0BqbJv1kC54L
 wxjoAWiXhOPoywh4jBmN4kbCFO1fKTEzszK7mjJQQKjaKNXZ5YUhtxBRY7IWhgQG
 1Qdl+V+Qdr9ygtM9o4r3Va5kgC7tkCjx3rDCTFfSnN4EBK/E1B95cLDJ8BXtYasn
 DU47KG7BoHhhhgVYuypZn/BJasOQ9VrIeWjDy/cxxneLnNggazq+XQyPU88Ihhxw
 9mrcJgNiPh1DTj3HFk33PJgT9iw08l2fXf2gB8YjAYoJ2e0TTACQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JtR_eMaxr3Kl for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:11 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7x742WYz1RvlN;
 Thu, 20 Jan 2022 21:59:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 07/61] target/riscv: Implement kvm_arch_get_registers
Date: Fri, 21 Jan 2022 15:57:36 +1000
Message-Id: <20220121055830.3164408-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Yifei Jiang <jiangyifei@huawei.com>

Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-5-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 112 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9e66b4a97f..039af22125 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -56,13 +56,123 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env,=
 uint64_t type,
     return id;
 }
=20
+#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_C=
ORE, \
+                 KVM_REG_RISCV_CORE_REG(name))
+
+#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CS=
R, \
+                 KVM_REG_RISCV_CSR_REG(name))
+
+#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP=
_F, idx)
+
+#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP=
_D, idx)
+
+#define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
+    do { \
+        int ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); =
\
+        if (ret) { \
+            return ret; \
+        } \
+    } while (0)
+
+static int kvm_riscv_get_regs_core(CPUState *cs)
+{
+    int ret =3D 0;
+    int i;
+    target_ulong reg;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    ret =3D kvm_get_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->pc =3D reg;
+
+    for (i =3D 1; i < 32; i++) {
+        uint64_t id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
+        ret =3D kvm_get_one_reg(cs, id, &reg);
+        if (ret) {
+            return ret;
+        }
+        env->gpr[i] =3D reg;
+    }
+
+    return ret;
+}
+
+static int kvm_riscv_get_regs_csr(CPUState *cs)
+{
+    int ret =3D 0;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
+    KVM_RISCV_GET_CSR(cs, env, sie, env->mie);
+    KVM_RISCV_GET_CSR(cs, env, stvec, env->stvec);
+    KVM_RISCV_GET_CSR(cs, env, sscratch, env->sscratch);
+    KVM_RISCV_GET_CSR(cs, env, sepc, env->sepc);
+    KVM_RISCV_GET_CSR(cs, env, scause, env->scause);
+    KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
+    KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
+    KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
+    return ret;
+}
+
+static int kvm_riscv_get_regs_fp(CPUState *cs)
+{
+    int ret =3D 0;
+    int i;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    if (riscv_has_ext(env, RVD)) {
+        uint64_t reg;
+        for (i =3D 0; i < 32; i++) {
+            ret =3D kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+            env->fpr[i] =3D reg;
+        }
+        return ret;
+    }
+
+    if (riscv_has_ext(env, RVF)) {
+        uint32_t reg;
+        for (i =3D 0; i < 32; i++) {
+            ret =3D kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+            env->fpr[i] =3D reg;
+        }
+        return ret;
+    }
+
+    return ret;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
 };
=20
 int kvm_arch_get_registers(CPUState *cs)
 {
-    return 0;
+    int ret =3D 0;
+
+    ret =3D kvm_riscv_get_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret =3D kvm_riscv_get_regs_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret =3D kvm_riscv_get_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
 }
=20
 int kvm_arch_put_registers(CPUState *cs, int level)
--=20
2.31.1


