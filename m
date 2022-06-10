Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F59545B4A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:49:18 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWaD-0003mD-UO
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGg-0003xo-Ed
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:29:07 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGb-0001AI-MM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835342; x=1686371342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yuRmpIB90M4vkWPQxoZF4qoAk4nrNRbV8BXNdCvJoNE=;
 b=RGBr2TB0K5Fy6ahEr/PFT9xmYHYJDr2Rc7JvapK7s7XrH4MmSooSoVCx
 /hWIXLY8PpMxbCxMM5GHSPa0Xl0Cdm3kgfhrTvUVyZq0QsWZqQuC7ZbA4
 PB7+gjjfvpNXc1FRSYbds2i+PzHBIypH1FpyPRtqSVAaLX2bf7m1OGF24
 Y3T3Gc5y9Jv3jKilkB9f/5OS30GqjVEf0J/Qiy+FMCom/CZGQsTZL7EJR
 ndXzeRqulXeMbDWZZBut7kvXZhHq78ccLS7MdZj3QMC4/imxFbvmZZVF3
 QUXlWJJLEuRaL/hAvYDeUBBKRFOE7CZe7a4Rlt6vUvPaX4FnNQH5dWjWN A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="203541931"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:58 +0800
IronPort-SDR: lDbnT6u7it/E0+UGWiqCKAf2HqhjHCuLeBgLVoWDi87rF3v6Cy/OeIONx8PiT65QsMFUvEJmyX
 C2x1ZEeE5MpPkABzDw8Ci4Y3KZbCmqXefWmHsnFI+h0CMiX/lVWFE5z0EyAREMX0/+Ww/4BA64
 CLXVSGfXtgV1cqbQN0DciWPFPYz5/08RO7CdDCFfviWbgcla1GKFYjdhTgRtCAFw3cDZkuMb0+
 4vvuPHl2bQzRwKpZTQe6/JioQtVqBxw/Uz6SEowm9XY6T38nLoFfK/Fy5mUSIvcFTcl77WEG0X
 oQQ0Z7kW2j+UqfwrDf+JobjE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:52:06 -0700
IronPort-SDR: 7Bo+Q65dtRrZnl1tN2sTuRXFb5/CYB0g6ZnlN1LNo/wefgiZyeso0sPJvl0JBeZQIoq3XTKO+K
 pRaHuXSxpdiWWIgfJKBcQFRXxY4jZm1M5yqNZFxEzv+I/T3Mng+Go0CZJZiBge7oUQtnKohwwF
 vMq/ZO3VnCWulYVAtXCiRTKmRAMWGAobh7iwXFE8wgFWl8OETAFjXiEHg7dYswkV3o3MK2LgEo
 4i9S4XF6s37bnuIqUyUmV/oT+d2tsKVMjP8JJPlZwJ+Ot8HxFr4gSiE1sKfa6c3jiC9Ddmt/Vc
 dhY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JT2f9hz1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835336; x=1657427337; bh=yuRmpIB90M4vkWPQxo
 ZF4qoAk4nrNRbV8BXNdCvJoNE=; b=D6kTY2e4xqzEi7aLdZT44B06CaJiSojS9U
 YINUy1m97bPz1drydnftR5WA9HXkF7CpOZMjjsSVTf1Zx3XilUF1pAotwwlrWYJC
 2Yz9NjV/PAN6TVnNIKeSa+2Vu4RVXYhyCrDfKxMm5dJGH9ieAPe80WQgPMLoF4ae
 Cy4WJd/MXUSJKTxruCSioc1yC5W8rRVwR53kpdHevfylHEOIVoCPukgmFoLtv15U
 ZipARMrkswyl6X/TRFIZVFiz1PEAekdWRhr623TO8E6Z72i8EDagLR1U6uJNdBjp
 Gr0JxkPCQk+weATGs9g/ZgVNr0SaDrHPKnlNXZtMHAwUvvlbPG1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ene1DryaO4R1 for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7JQ6j9Nz1Rvlx;
 Thu,  9 Jun 2022 21:28:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 24/25] target/riscv: Don't expose the CPU properties on names
 CPUs
Date: Fri, 10 Jun 2022 14:26:54 +1000
Message-Id: <20220610042655.2021686-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

There are currently two types of RISC-V CPUs:
 - Generic CPUs (base or any) that allow complete custimisation
 - "Named" CPUs that match existing hardware

Users can use the base CPUs to custimise the extensions that they want, f=
or
example -cpu rv64,v=3Dtrue.

We originally exposed these as part of the named CPUs as well, but that w=
as
by accident.

Exposing the CPU properties to named CPUs means that we accidently
enable extensions that don't exist on the CPUs by default. For example
the SiFive E CPU currently support the zba extension, which is a bug.

This patch instead only exposes the CPU extensions to the generic CPUs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220608061437.314434-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e5aa1e9c1b..05e6521351 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,8 @@ static const char * const riscv_intr_names[] =3D {
     "reserved"
 };
=20
+static void register_cpu_props(DeviceState *dev);
+
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
     if (async) {
@@ -161,6 +163,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 #if defined(TARGET_RISCV64)
@@ -169,6 +172,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -181,9 +185,11 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
=20
 static void rv128_base_cpu_init(Object *obj)
@@ -197,6 +203,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
+    register_cpu_props(DEVICE(obj));
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -204,6 +211,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -216,27 +224,33 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 static void rv32_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
=20
 static void rv32_ibex_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
-    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
+    cpu->cfg.mmu =3D false;
+    cpu->cfg.epmp =3D true;
 }
=20
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
 #endif
=20
@@ -249,6 +263,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
+    register_cpu_props(DEVICE(obj));
 }
 #endif
=20
@@ -836,6 +851,12 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
+    cpu->cfg.ext_counters =3D true;
+    cpu->cfg.ext_ifencei =3D true;
+    cpu->cfg.ext_icsr =3D true;
+    cpu->cfg.mmu =3D true;
+    cpu->cfg.pmp =3D true;
+
     cpu_set_cpustate_pointers(cpu);
=20
 #ifndef CONFIG_USER_ONLY
@@ -844,7 +865,7 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
=20
-static Property riscv_cpu_properties[] =3D {
+static Property riscv_cpu_extensions[] =3D {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
@@ -867,17 +888,12 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
-    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
-    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
@@ -915,6 +931,25 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
=20
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void register_cpu_props(DeviceState *dev)
+{
+    Property *prop;
+
+    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
+
+static Property riscv_cpu_properties[] =3D {
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
+    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
=20
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
--=20
2.36.1


