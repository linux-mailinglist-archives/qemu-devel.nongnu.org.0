Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9F4959F2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:31:13 +0100 (CET)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnS4-0003Sg-Cg
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxe-0006oG-MH
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:52 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxN-00043A-2o
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744769; x=1674280769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gZO4YvdilfsXFQSKide3tjQj1hsYNpUbjfbwwMxrO0=;
 b=md5nLnJXigIdTFBvBb0iD5fSQOaTZoci19LoRKFM7u05sHpIAYYsWomz
 vNgUj/IUeIsuYm6AEKKLrQtSNKPs9Yfnc0g5mbje2vzoC9OZv6wVg7vVw
 sVxWEaHWuZI9rdLmdeJgIHVveIB56w4uopnXsgVl1V2yybQYOZvR61+rv
 hhJM1IhP5LA9WY/HxjYUP4eiOfUX+de8Shg6Qb42A+OjUWxInobxpzsHS
 ol52qwHESxcCPjNLflPXnM4UkiNrUyKAyQYKEGnaR3LwU4HwFUGlfLUCf
 36VAi+ZSZ+z/YbqyxKZAYIO1gZvsRfzQC3FrlhpXR1gWIS5FjPWbgD8ge w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976504"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:16 +0800
IronPort-SDR: HAOqPIk5VJIHew46mNbHMQ0CYZAFAMAZ+CxR+wFKEkiqHTXGnb+KYFULNkmQE+xBr8xByeOVbo
 vIiSYoPAO2ZBg27b3DmDmJtnI66Q9YyhyGslI/3IQg26mBWNyEKgaDDir+Kscrjv8IiQ7EVJIa
 /XneZQXrMo61RMzJi9iG8vxlqHzMpqt1LD7AE8E1K2jxFaWRcpIWSTfO+cCsZqQmRs3egrHmIA
 ZwBpcEKJK84PCmg80xe6kE/x6g5vVyc75Fj9g/NRT8OMg7cN9MXgCsstCLIlzVXMy8u2IkUmAk
 6Cmoe/23eEpQycpBwP1PpEgI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:27 -0800
IronPort-SDR: 52B5KDBU9pwGJCW0iqLVcoT0whsqLOuxBU5cDx3/Fp7BsOycaN7lORr5KQRP6GzpdyZ31uz7Ts
 xvMp4oXJnIAwVMXD8phihZ8RTyvLRS9Evxm0+Ibb2DxlW2h7DG9VBr9J4wMjplCCPpbbtE3v+Y
 RmqOzl7xFDD6l33DujyXfJo2WL8U9ViDyGmWoLwxh4UkVZzrr2tXyXKPOqf8FWQU62e7nAdMTW
 ypYvqM+aszNMpZVvXEQuQkZMvbQ+k/q44jpq2SS7jBv0U8AirTQ5LIKyvHAa4plFhKRWsHczWD
 scw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xJ35lVz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744755; x=1645336756; bh=9gZO4YvdilfsXFQSKi
 de3tjQj1hsYNpUbjfbwwMxrO0=; b=VDu4HLRfueXTwcnyk5h16+g/Afn/GKLSSG
 K+E7+Q8E7dagdIXpD9n3H/mFJI+rzX1e4lP7P96HTBT944JicMhjqB4h8Sjn1EbG
 mDODCrKe5U5RNuyK2nEcTqF3B7LpnUYfWWK5j3hHQU8wNM+3d8qKoYpFxKNxLkPK
 NCcGeLD72QEIE09FA2dr9FJMCoy1/ml68K2m14ZBwr+YqgCVrzfECnFp5dJfCjxd
 IQmReTvijrWku9HzdzBMyP0u+4EZGTMXKBeps2MhRAK1zuxCE1R2GroXdj84DBTD
 jgP1wRi7PklzeTUN4m0DgaF55wj+Htf4WxS5tMavhmOPZ+u+Tx4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HAKhx5U-d3_8 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xD0RCCz1RvlN;
 Thu, 20 Jan 2022 21:59:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 08/61] target/riscv: Implement kvm_arch_put_registers
Date: Fri, 21 Jan 2022 15:57:37 +1000
Message-Id: <20220121055830.3164408-9-alistair.francis@opensource.wdc.com>
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

Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-6-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 039af22125..dbaff53bf2 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -74,6 +74,14 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, u=
int64_t type,
         } \
     } while (0)
=20
+#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
+    do { \
+        int ret =3D kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); =
\
+        if (ret) { \
+            return ret; \
+        } \
+    } while (0)
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret =3D 0;
@@ -99,6 +107,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
     return ret;
 }
=20
+static int kvm_riscv_put_regs_core(CPUState *cs)
+{
+    int ret =3D 0;
+    int i;
+    target_ulong reg;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    reg =3D env->pc;
+    ret =3D kvm_set_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    for (i =3D 1; i < 32; i++) {
+        uint64_t id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
+        reg =3D env->gpr[i];
+        ret =3D kvm_set_one_reg(cs, id, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return ret;
+}
+
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
     int ret =3D 0;
@@ -116,6 +149,24 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     return ret;
 }
=20
+static int kvm_riscv_put_regs_csr(CPUState *cs)
+{
+    int ret =3D 0;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
+    KVM_RISCV_SET_CSR(cs, env, sie, env->mie);
+    KVM_RISCV_SET_CSR(cs, env, stvec, env->stvec);
+    KVM_RISCV_SET_CSR(cs, env, sscratch, env->sscratch);
+    KVM_RISCV_SET_CSR(cs, env, sepc, env->sepc);
+    KVM_RISCV_SET_CSR(cs, env, scause, env->scause);
+    KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
+    KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
+    KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
+
+    return ret;
+}
+
 static int kvm_riscv_get_regs_fp(CPUState *cs)
 {
     int ret =3D 0;
@@ -149,6 +200,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
     return ret;
 }
=20
+static int kvm_riscv_put_regs_fp(CPUState *cs)
+{
+    int ret =3D 0;
+    int i;
+    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+    if (riscv_has_ext(env, RVD)) {
+        uint64_t reg;
+        for (i =3D 0; i < 32; i++) {
+            reg =3D env->fpr[i];
+            ret =3D kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    if (riscv_has_ext(env, RVF)) {
+        uint32_t reg;
+        for (i =3D 0; i < 32; i++) {
+            reg =3D env->fpr[i];
+            ret =3D kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    return ret;
+}
+
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
 };
@@ -177,7 +262,24 @@ int kvm_arch_get_registers(CPUState *cs)
=20
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    return 0;
+    int ret =3D 0;
+
+    ret =3D kvm_riscv_put_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret =3D kvm_riscv_put_regs_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret =3D kvm_riscv_put_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
 }
=20
 int kvm_arch_release_virq_post(int virq)
--=20
2.31.1


