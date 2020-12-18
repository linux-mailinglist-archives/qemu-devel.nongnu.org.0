Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A32DDE79
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:14:31 +0100 (CET)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq926-0000yJ-S5
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qF-00060u-93
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:15 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qD-0002GA-Cu
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271666; x=1639807666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VpZUgyhJvVlDUH8ILpPm7P8WlStpKgf31n1DHhdqmw=;
 b=Vuq9i4mhlz1qB2g/qGuUdiKnHWw7LPPNnLb0do37fiCPyF5fXibtGsTg
 iW9SZBcHy5k4tnj/eoDIr9+vnLforwjv77mnuZ2Qz2MF8QL3Bpwav3Md2
 jX3QqjtvbasU5LGPLQsGeYaVHjzeRsCNexev424/wSLJzHpgr2w0sjomH
 DppJl9zv7wyl8zzgvr0FqNjNRDVjN1rujtzfsKjCzn0aBjVQxaegXPanA
 0FkQCHGf7BaAD6TqelaeEcLJ6XuQCV87CXiPotGFwdZDigmrptQxK+QA4
 AUOvXg1/KhUObHp2DT/AkPm4iglTEpd7/DGXX6udyTnZkzsf8EL7cHE5d w==;
IronPort-SDR: inmBGEjT2h/aibwwz7j/cYXTN8BCNJohcJAlTHB9MVMIZ9XF63su/XP6rWXxonH/GA/ZaoG3Ot
 qgH0bleApLcLJkZaSqlsu4K6dwWzlCucpW4ZRLb/2QyfdRYTvUXAstEYjpw2IHtGubGRWhk9Jw
 J9PNSBKeqslCeilU/r/u4n9MGFRN9EWxbZ+foQD8/1tcPOQ0MoNH7Js8t3iBCyNYj9YeknQy+G
 AYkrCd1FU87iMZ1iUA76l+CefgMT3Z2RdYCP0tvqKkIBwavrUbSkOV9++zaT/NQ1qezvTp7q3k
 MsI=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237066"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:33 +0800
IronPort-SDR: MjraJSQ49QKD541AgPxni4KDk2lJMpwpzCdWpIQgqCk0i5En6c04GI6mEFrVxO6dx8YlcjNBqJ
 bI0lM1vf9WVZtwXEPOoPWDkxIbGzcxrXZEt7zMBahptmlsjLQ7OCikVc8yQ+fvyF8zzAwuAI9f
 bmFZisOTZwgEMrWsvRZ0L7AKh9KoGXRCesILIN6N2FiOSYO37+q0/AxyS1qQ3hXuO4zad7EOzo
 r0GkgFOxOp8R6GCW8UeRCi35rk/nOzwJschjOByeNBCNpinuRfuwmU9TkwuhZfStu9D6qdsPUc
 iwdD5mkpTLfjcP3Nj7vlg3AN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:40 -0800
IronPort-SDR: 5aXs+N4EYyWzruVEOtdC91KIz1Jcq6qu+6bnKodkU+luBhy4SwhlZVklGBXbxUh43+LA3oSP9i
 qp1lp6runfD8tk5Tp+ppC5xAV37pnbI7PFrW1OhdYpCfqVuOYLdJpvwkJHmeFvwy1Ue7XYOyKL
 x7JXQ8qfpZxArKeuCwiZrDENAjvpzX30/PZgjnS3DiW8TaXmVPPDS8shm0GxqO2RIMYjRq75bc
 Udf/5serkL6n6SB2Lf3Beov5c3IqkdtBIp8gMA6WIAhUZriyxxqnzZYBXXywjMtyhJpPz3m9e0
 1kw=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:24 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 17/23] target/riscv: Specify the XLEN for CPUs
Date: Thu, 17 Dec 2020 22:01:08 -0800
Message-Id: <20201218060114.3591217-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: c1da66affbb83ec4a2fbeb0194293bd24d65f5dc.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32a6916b8a..7d6f032122 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -158,22 +158,36 @@ static void riscv_base_cpu_init(Object *obj)
     set_misa(env, 0);
 }
 
-static void rvxx_sifive_u_cpu_init(Object *obj)
+#ifdef TARGET_RISCV64
+static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
-static void rvxx_sifive_e_cpu_init(Object *obj)
+static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+#else
+static void rv32_sifive_u_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}
 
-#if defined(TARGET_RISCV32)
+static void rv32_sifive_e_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+}
 
 static void rv32_ibex_cpu_init(Object *obj)
 {
@@ -191,7 +205,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
-
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -643,13 +656,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.29.2


