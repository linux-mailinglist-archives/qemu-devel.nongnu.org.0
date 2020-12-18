Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6502DDE8D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:26:42 +0100 (CET)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9Dt-0001xx-Hy
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qU-0006KW-Vq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qQ-0002G4-Mf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271687; x=1639807687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vidbo8EhI8MyRUVmSr8AdzEsxfhWjeBL+CHG8Pf4+S4=;
 b=ILm/uqKeGKj12qVmmhOowyHkqDvWYM1mKQ+LAqvS9FE9KTogseyP8alt
 aTBt5+6OYuJBE5QJIshywYMnyvReuOXTRGC2YzdkHe+AE/g1X+ppE1UCU
 /QaX6KFCKi9aq012rL+iQ7KlEIE/xdQqcBgBx52sp9lfKeu4H3Tri9vSW
 hFumXz9N8A0pNirMXpkgofmgh03+MqrVH3hndHnGti4XXiQbfLAE0AKJi
 VM3jPwfaFb4S6T1sbSLNkUJS3ItKXniI39rtgqmREWYvnKHiR/q3Ave8Q
 pP8i1bP6TymQKW5nJx7+4AVa5ZwAUZFC8LgPzhLIFRobNI+PkiafuQhRM w==;
IronPort-SDR: /jn1AJ7SdzDVVRWjCxC3idRVMenOa4TsXpv8jrWJUzIqssrqjrgB4sEU/n2dYXkFCBWaFEVY06
 6aACpQYbGg3g1yAT96BpcEwT/dP0M6Q9aIknE4UAs1mYHKl+6DTwM1GB0AEXbKg7elUiFekJWV
 CO7jo+fnKcodF/sVgrc92D378+yLXdyRHUIwCY8fG5zmEg57msXd+Wpb2YKHa2HXpoz3cLg73T
 JQyRyqSWtvGrPeOUL+l6sDjlTM1tvGT7ThjGq5fQwdLnTXtvTjrqNW9aueUh9Y2qmNwc6acKtf
 8Nk=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237071"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:35 +0800
IronPort-SDR: QEbxyRvqVWRErDT7iyH2OVmP+0p4sBiZyvQ6SRlDiHqtCM+wYwh6A70eCmDsxNKwguBgrDoeOE
 om+zH5fD6zpVmi+ASAa3/RVlapvanHOEnqEa+OIRS11rYRAZEvrjb0MfPPghtCRwXiLszOdsEQ
 kX+SvidGSwXu9Q9hdGhzPTErKtPhaMoMtT5hKs2NyG3hwJe9iH4/00i8pKG/nspLqfbZ0vX32c
 04yh354f7+TK3pMdMaV0BLeSLoHQRA6opzX3dg7I5eknuW3C/7RlEZpJ2853IfSB9JSyKCIpug
 +VfI6pdG6NG+Iqe3ptJVp77J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:41 -0800
IronPort-SDR: ziwd2PZROSJWO7iqj031CibqK3see5ASC6UxYlH1y20loJAg8kH8ltnlHV6fWwJo3R1RLBBVgv
 wqNf/ZIzpx0j0ISByaeg27A4rb5eMMnsgbFCE3pG6q2olSrN2ar9ujLq2mGM07bgiOdJop5dyd
 nvccbk+vRlq8F+qTBlSV4hQnZsgeaXaixiprhjPdW06u7eqVfWSsxudiqepWvQbdLX0CU3+VLl
 bM42KDeh+TcKsNekmQ56e+/6HyntyNM6NJb90Ftk5WbDfH3kYdtel/vKkWI5Oon+PadtMCURxq
 Nz8=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 21/23] target/riscv: cpu: Set XLEN independently from target
Date: Thu, 17 Dec 2020 22:01:12 -0800
Message-Id: <20201218060114.3591217-22-alistair.francis@wdc.com>
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
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 7eddba45b5d223321c031431849fdd42eceb514b.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 47b738c314..254cd83f8b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -151,14 +151,14 @@ static void riscv_any_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-static void riscv_base_cpu_init(Object *obj)
+#if defined(TARGET_RISCV64)
+static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, 0);
+    set_misa(env, RV64);
 }
 
-#ifdef TARGET_RISCV64
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -174,6 +174,13 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
 #else
+static void rv32_base_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, RV32);
+}
+
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -372,7 +379,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
     int vext_version = VEXT_VERSION_0_07_1;
-    target_ulong target_misa = 0;
+    target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -407,8 +414,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
-    /* If misa isn't set (rv32 and rv64 machines) set it here */
-    if (!env->misa) {
+    /* If only XLEN is set for misa, then set misa from properties */
+    if (env->misa == RV32 || env->misa == RV64) {
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -504,7 +511,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             set_vext_version(env, vext_version);
         }
 
-        set_misa(env, RVXLEN | target_misa);
+        set_misa(env, target_misa);
     }
 
     riscv_cpu_register_gdb_regs_for_features(cs);
@@ -655,13 +662,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
-- 
2.29.2


