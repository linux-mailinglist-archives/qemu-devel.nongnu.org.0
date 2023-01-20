Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BC674E46
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:42:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1b-0001CD-O9; Fri, 20 Jan 2023 02:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm11-0000oD-5S
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:47 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0y-0004pU-61
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200444; x=1705736444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=75p6q6papmZYiiyu7huH6SZQbAyDQNAew4tAaHInoTU=;
 b=l1w23yARTrew5x4jEYQorxNoFiJfAc9gKwUTagVW04HxFY31UR5KXZuO
 RKuOpOUFXBBgLDjdSRCQoARq6DKkLbqzNeegqMKejhGcEvNTIGOMCeN8B
 mpEhNQ314esSXrKRNdE8xZ7BYowREBCmw5/1ndRqsW3TwKQhoP7ey2yHD
 KyVwSKXOlabGK62hhFjEcGqOqhZFyqj9a0AcgTLc6WbE67/EOq8tm1Dxv
 lma1IuZTjUn1ynBpYXQhZ/9wOuaFZ5YolY2hVxsKd1ALvqrKDDRlRuZR+
 lEE2dX4/tWT9sViRjEcemNQWJq5+CaXffavXjXJeRtMAUFg8iLU5D5CYI w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176742"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:10 +0800
IronPort-SDR: E/w8Tp7ABvR4lKv7bgljok2GEgiD46SorC7EByzYFX1JBBWroc+WtQqdMfertXTKz/A2CsjOfO
 FEWTl+pn+wTjK9Z0HvJezCPor9mipOIWybx2x3oulr1rD1bj9Z6OGn5c4MES5T99fI+xBzXZZW
 fuuW3GguYud+qMFnWjqlU4Ognbmvv8zLOnOFdBdJPUw7D4ybZWxfOYtaZE+GXRDJaFK74mXooZ
 XgSrpRAoMeLIpY/xYx/EWM9eK0XDnY3myuV/ta5rU/nA4Mew0UyWlLlPh3itgTbvjKhSxGzgVS
 5t8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:48 -0800
IronPort-SDR: i/Az0veKLX5U4p/FLXllrGek54ZIv1kVbL6hxkj2t1BU0Rnd+yNaaRYSyqt8bf6RB5Jw3S2SH/
 V9ySq/7oVDsghkUJRRlPZjE0ZooRILZmr6JGQYZczem5F/stpl9K+9JjuWXb1SQuQPfDuHczcc
 2i8EP3PDuG1NO+xyXoBOS2+rL9R8ovEvsamF3li85l5Otr6FYGO8QVoKY+Xm8FZSRo4/qKSQDf
 9a3iM5JsCfD+7RjmJTuV8vpM6iXSmXLOx/8uEKGG4zja8F3NPD7thwgY0RF8cDXTFNe4AXAUM7
 /Jc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxk34Hhz1Rwt8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200409; x=1676792410; bh=75p6q6papmZYiiyu7h
 uH6SZQbAyDQNAew4tAaHInoTU=; b=S364zsjV5MEfEdk21CHKywBUaszMVj1AID
 c2QpKujq0cSYe2SxE8TVi+Mjm6dYl5ImTa82YjLzbVPcBqZpDFiBuX/URZa4VUWl
 +wAFJE5fQs1tfeRi1MHPT1rhS9646pOAzo6PkTilLa7cTKZC+LMrsaah0A81RrgN
 PnasKefY+7qpkpRFgTLUuJ/0Y2/poSLtNym78PA4mBj+KKY8Oh5Wi4v7gzojeDkd
 ZEvg4tiQKhhEJSGi98o9SSYLEWV+6o3wyEZ2hMsBEsADuWfDtisuiZevxpFSA8lm
 QIL1K+6fxyMLUhRq5yYVOc4Isb/K5VeFCLZfJaCPOzBrg/zRHHlg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eBHX7SFNLMCx for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:09 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxh3PRTz1RvLy;
 Thu, 19 Jan 2023 23:40:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/37] target/riscv/cpu: set cpu->cfg in register_cpu_props()
Date: Fri, 20 Jan 2023 17:38:59 +1000
Message-Id: <20230120073913.1028407-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

There is an informal contract between the cpu_init() functions and
riscv_cpu_realize(): if cpu->env.misa_ext is zero, assume that the
default settings were loaded via register_cpu_props() and do validations
to set env.misa_ext. If it's not zero, skip this whole process and
assume that the board somehow did everything.

At this moment, all SiFive CPUs are setting a non-zero misa_ext during
their cpu_init() and skipping a good chunk of riscv_cpu_realize().  This
causes problems when the code being skipped in riscv_cpu_realize()
contains fixes or assumptions that affects all CPUs, meaning that SiFive
CPUs are missing out.

To allow this code to not be skipped anymore, all the cpu->cfg.ext_*
attributes needs to be set during cpu_init() time. At this moment this
is being done in register_cpu_props(). The SiFive boards are setting
their own extensions during cpu_init() though, meaning that they don't
want all the defaults from register_cpu_props().

Let's move the contract between *_cpu_init() and riscv_cpu_realize() to
register_cpu_props(). Inside this function we'll check if
cpu->env.misa_ext was set and, if that's the case, set all relevant
cpu->cfg.ext_* attributes, and only that. Leave the 'misa_ext' =3D 0 case
as is today, i.e. loading all the defaults from riscv_cpu_extensions[].

register_cpu_props() can then be called by all the cpu_init() functions,
including the SiFive ones. This will make all CPUs behave more in line
with what riscv_cpu_realize() expects.

This will also make the cpu_init() functions even more alike, but at this
moment we would need some design changes in how we're initializing
extensions/attributes (e.g. some CPUs are setting cfg options after
register_cpu_props(), so we can't simply add the function to a common
post_init() hook)  to make a common cpu_init() code across all CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230113175230.473975-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  4 ++++
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 61a9a40958..bcf0826753 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -63,6 +63,10 @@
=20
 #define RV(x) ((target_ulong)1 << (x - 'A'))
=20
+/*
+ * Consider updating register_cpu_props() when adding
+ * new MISA bits here.
+ */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a2e6238bd7..e682102c2a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -256,6 +256,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
=20
@@ -265,6 +266,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu =3D false;
 }
@@ -299,6 +301,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
=20
@@ -308,6 +311,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu =3D false;
 }
@@ -318,6 +322,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu =3D false;
     cpu->cfg.epmp =3D true;
@@ -329,6 +334,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu =3D false;
 }
@@ -1083,10 +1089,44 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_END_OF_LIST(),
 };
=20
+/*
+ * Register CPU props based on env.misa_ext. If a non-zero
+ * value was set, register only the required cpu->cfg.ext_*
+ * properties and leave. env.misa_ext =3D 0 means that we want
+ * all the default properties to be registered.
+ */
 static void register_cpu_props(DeviceState *dev)
 {
+    RISCVCPU *cpu =3D RISCV_CPU(OBJECT(dev));
+    uint32_t misa_ext =3D cpu->env.misa_ext;
     Property *prop;
=20
+    /*
+     * If misa_ext is not zero, set cfg properties now to
+     * allow them to be read during riscv_cpu_realize()
+     * later on.
+     */
+    if (cpu->env.misa_ext !=3D 0) {
+        cpu->cfg.ext_i =3D misa_ext & RVI;
+        cpu->cfg.ext_e =3D misa_ext & RVE;
+        cpu->cfg.ext_m =3D misa_ext & RVM;
+        cpu->cfg.ext_a =3D misa_ext & RVA;
+        cpu->cfg.ext_f =3D misa_ext & RVF;
+        cpu->cfg.ext_d =3D misa_ext & RVD;
+        cpu->cfg.ext_v =3D misa_ext & RVV;
+        cpu->cfg.ext_c =3D misa_ext & RVC;
+        cpu->cfg.ext_s =3D misa_ext & RVS;
+        cpu->cfg.ext_u =3D misa_ext & RVU;
+        cpu->cfg.ext_h =3D misa_ext & RVH;
+        cpu->cfg.ext_j =3D misa_ext & RVJ;
+
+        /*
+         * We don't want to set the default riscv_cpu_extensions
+         * in this case.
+         */
+        return;
+    }
+
     for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
--=20
2.39.0


