Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B6674E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1f-0001ld-Pi; Fri, 20 Jan 2023 02:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm13-0000pJ-UX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:52 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm11-0004pk-Ah
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200447; x=1705736447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ux/YK7yCtbbj+1lS74siEIsxHU18w5+gaMSdUfmwMLI=;
 b=W+YcOdkskfcybVMs+fhpYseOsgVzD6q1n5pRbhm7wHl+0lIQfhagVbbP
 iGwTvjqOtPRRXtlDSOwr6zBk3LpqF7U95zdM6Ucee99suI2NRmRw+SZHu
 Cs0lTo9OCL9bE9U4mFc8ARtvLzuihgGQUqqZExLsdtQ84Ce2bYcOLx5ki
 JL/RhEoRAPywmxlKvJmAeqL5vGmRpSKC/meN+3lBPioVp9nvmwecskff+
 nIFIXOvZm41MlT8C+NkXheG3+hwM7eJGW6gmaa39iisnxXVZiiGbiyRWt
 xsvTWJJwzJR1lRd2W8wWygTyjE4Y9seJZ8Reh3sTqwtPrzA3SL45y57Ad A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176746"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:13 +0800
IronPort-SDR: AnjuTFisd/aitlH+KXbxjVp2/nC44w9WV9lfglxEqsF+7TvgvdQ2aJXe1JPp/ysyqSrWoR4lmt
 f3yo4e73TkPRDokwZ6n4bMcdmIa7eekZoMpFaP45ddPYJEDdAWsekSNmfqd1SvlauVQQr+IRTY
 284sdA6w1XoS/qbfV3IK+ly/erVa+4aE0IVufSSs4trOSiiE1CO6pD93g/S3ZPS5+rt83bNI6Z
 NwSchu1Ao7mnlwfQ1Ru3GnbBaviYX1jwh0aZZ8FLLHIR5lkZvVcmJJx4qQwNzjizcz77JlIVsy
 k2U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:51 -0800
IronPort-SDR: +3pUi33DseYVTmjH78DdHzQsubC/bSmcPy2bbxOJ4lWhszyN8MVOOoF2d8kVxDBj/+w5d5DL9P
 eMCImXyAZ6JNnsuNwELxma6bjGApOCMt19XsMk0rxBi+HRMb1n4ODEnoyps+m0xpVb/heH0yzs
 br0py2ryAmtYns9Qk32X9Egu+dive9DnV5ZrJFbN2aULRPk3MkgGPcC9Yh5EgRwxyHOnQSwrst
 dGv5KUTBktmFkeYnYvq8KfmL+BedMOFezKRQvCfH5OBNtIv2/yiTIoZGVcJO4jjx4PwQx5JPd4
 Hs8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxn0g3Hz1Rwt8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200411; x=1676792412; bh=ux/YK7yCtbbj+1lS74
 siEIsxHU18w5+gaMSdUfmwMLI=; b=CzAB9gzK92LJdcXLu7KdPEZhwJX/vTvnxu
 CCLmIR9bgF6b6JQ5gdX3WRaTG0lk3UlQcUwFXLUTFcgkbf00Nk5mQ0UCiZvz3ep5
 RqqJJZWIRp7RXd/l+/pLGK5uyvvgeAdabibbIDY8oOb4GzKHAikJDrNnPcfXX0rO
 dJ5/mswR2jgOFASugyJNM+RcHSeOf2/9xqsudNz+ghdPtd034bnULHls8h3h/7ZY
 v6Y39Fzv+6gQOdFsKWmkwkrO7SfWnn18/yJvOz/x1tJFgMmMXj2ssLtuXlfy8WGd
 DEuegLybmZIa9H95RJ7L1z/NdCMuexgssnqlz7DCL0BSMe2jCoOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iGNM9Cr0-tz8 for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:11 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxk1Fr4z1RvTp;
 Thu, 19 Jan 2023 23:40:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 24/37] target/riscv/cpu.c: do not skip misa logic in
 riscv_cpu_realize()
Date: Fri, 20 Jan 2023 17:39:00 +1000
Message-Id: <20230120073913.1028407-25-alistair.francis@opensource.wdc.com>
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

All RISCV CPUs are setting cpu->cfg during their cpu_init() functions,
meaning that there's no reason to skip all the misa validation and setup
if misa_ext was set beforehand - especially since we're setting an
updated value in set_misa() in the end.

Put this code chunk into a new riscv_cpu_validate_set_extensions()
helper and always execute it regardless of what the board set in
env->misa_ext.

This will put more responsibility in how each board is going to init
their attributes and extensions if they're not using the defaults.
It'll also allow realize() to do its job looking only at the extensions
enabled per se, not corner cases that some CPUs might have, and we won't
have to change multiple code paths to fix or change how extensions work.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20230113175230.473975-3-dbarboza@ventanamicro.com>
[ Changes by AF:
 - Rebase
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 399 +++++++++++++++++++++++----------------------
 1 file changed, 205 insertions(+), 194 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e682102c2a..c192d96a94 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -625,6 +625,207 @@ static void riscv_cpu_disas_set_info(CPUState *s, d=
isassemble_info *info)
     }
 }
=20
+/*
+ * Check consistency between chosen extensions while setting
+ * cpu->cfg accordingly, doing a set_misa() in the end.
+ */
+static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
+{
+    CPURISCVState *env =3D &cpu->env;
+    uint32_t ext =3D 0;
+
+    /* Do some ISA extension error checking */
+    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
+                            cpu->cfg.ext_d &&
+                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cpu->cfg.ext_i =3D true;
+        cpu->cfg.ext_m =3D true;
+        cpu->cfg.ext_a =3D true;
+        cpu->cfg.ext_f =3D true;
+        cpu->cfg.ext_d =3D true;
+        cpu->cfg.ext_icsr =3D true;
+        cpu->cfg.ext_ifencei =3D true;
+    }
+
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
+
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
+
+    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+        error_setg(errp,
+                   "Setting S extension without U extension is illegal")=
;
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+        error_setg(errp,
+                   "H depends on an I base integer ISA with 32 x registe=
rs");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+        error_setg(errp, "H extension implicitly requires S-mode");
+        return;
+    }
+
+    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "F extension requires Zicsr");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+        error_setg(errp, "Zawrs extension requires A extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+        error_setg(errp, "V extension requires D extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f)=
 {
+        error_setg(errp, "Zve32f/Zve64f extensions require F extension")=
;
+        return;
+    }
+
+    /* Set the ISA extensions, checks should have happened above */
+    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+        cpu->cfg.ext_zhinxmin) {
+        cpu->cfg.ext_zfinx =3D true;
+    }
+
+    if (cpu->cfg.ext_zfinx) {
+        if (!cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+        if (cpu->cfg.ext_f) {
+            error_setg(errp,
+                "Zfinx cannot be supported together with F extension");
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zk) {
+        cpu->cfg.ext_zkn =3D true;
+        cpu->cfg.ext_zkr =3D true;
+        cpu->cfg.ext_zkt =3D true;
+    }
+
+    if (cpu->cfg.ext_zkn) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zkne =3D true;
+        cpu->cfg.ext_zknd =3D true;
+        cpu->cfg.ext_zknh =3D true;
+    }
+
+    if (cpu->cfg.ext_zks) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zksed =3D true;
+        cpu->cfg.ext_zksh =3D true;
+    }
+
+    if (cpu->cfg.ext_i) {
+        ext |=3D RVI;
+    }
+    if (cpu->cfg.ext_e) {
+        ext |=3D RVE;
+    }
+    if (cpu->cfg.ext_m) {
+        ext |=3D RVM;
+    }
+    if (cpu->cfg.ext_a) {
+        ext |=3D RVA;
+    }
+    if (cpu->cfg.ext_f) {
+        ext |=3D RVF;
+    }
+    if (cpu->cfg.ext_d) {
+        ext |=3D RVD;
+    }
+    if (cpu->cfg.ext_c) {
+        ext |=3D RVC;
+    }
+    if (cpu->cfg.ext_s) {
+        ext |=3D RVS;
+    }
+    if (cpu->cfg.ext_u) {
+        ext |=3D RVU;
+    }
+    if (cpu->cfg.ext_h) {
+        ext |=3D RVH;
+    }
+    if (cpu->cfg.ext_v) {
+        int vext_version =3D VEXT_VERSION_1_00_0;
+        ext |=3D RVV;
+        if (!is_power_of_2(cpu->cfg.vlen)) {
+            error_setg(errp,
+                    "Vector extension VLEN must be power of 2");
+            return;
+        }
+        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
+            error_setg(errp,
+                    "Vector extension implementation only supports VLEN =
"
+                    "in the range [128, %d]", RV_VLEN_MAX);
+            return;
+        }
+        if (!is_power_of_2(cpu->cfg.elen)) {
+            error_setg(errp,
+                    "Vector extension ELEN must be power of 2");
+            return;
+        }
+    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
+        error_setg(errp,
+                "Vector extension implementation only supports ELEN "
+                "in the range [8, 64]");
+        return;
+    }
+    if (cpu->cfg.vext_spec) {
+        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+            vext_version =3D VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp,
+                   "Unsupported vector spec version '%s'",
+                   cpu->cfg.vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+    }
+    if (cpu->cfg.ext_j) {
+        ext |=3D RVJ;
+    }
+
+    set_misa(env, env->misa_mxl, ext);
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs =3D CPU(dev);
@@ -720,200 +921,10 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
     }
     assert(env->misa_mxl_max =3D=3D env->misa_mxl);
=20
-    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
-    if (env->misa_ext =3D=3D 0) {
-        uint32_t ext =3D 0;
-
-        /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d &&
-                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifence=
i)) {
-            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-            cpu->cfg.ext_i =3D true;
-            cpu->cfg.ext_m =3D true;
-            cpu->cfg.ext_a =3D true;
-            cpu->cfg.ext_f =3D true;
-            cpu->cfg.ext_d =3D true;
-            cpu->cfg.ext_icsr =3D true;
-            cpu->cfg.ext_ifencei =3D true;
-        }
-
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
-
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
-
-        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
-            error_setg(errp,
-                       "Setting S extension without U extension is illeg=
al");
-            return;
-        }
-
-        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
-            error_setg(errp,
-                       "H depends on an I base integer ISA with 32 x reg=
isters");
-            return;
-        }
-
-        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
-            error_setg(errp, "H extension implicitly requires S-mode");
-            return;
-        }
-
-        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "F extension requires Zicsr");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
-            error_setg(errp, "Zawrs extension requires A extension");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
-            error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
-            return;
-        }
-
-        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-            error_setg(errp, "D extension requires F extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
-            error_setg(errp, "V extension requires D extension");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
-            error_setg(errp, "Zve32f/Zve64f extensions require F extensi=
on");
-            return;
-        }
-
-        /* Set the ISA extensions, checks should have happened above */
-        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-            cpu->cfg.ext_zhinxmin) {
-            cpu->cfg.ext_zfinx =3D true;
-        }
-
-        if (cpu->cfg.ext_zfinx) {
-            if (!cpu->cfg.ext_icsr) {
-                error_setg(errp, "Zfinx extension requires Zicsr");
-                return;
-            }
-            if (cpu->cfg.ext_f) {
-                error_setg(errp,
-                    "Zfinx cannot be supported together with F extension=
");
-                return;
-            }
-        }
-
-        if (cpu->cfg.ext_zk) {
-            cpu->cfg.ext_zkn =3D true;
-            cpu->cfg.ext_zkr =3D true;
-            cpu->cfg.ext_zkt =3D true;
-        }
-
-        if (cpu->cfg.ext_zkn) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zkne =3D true;
-            cpu->cfg.ext_zknd =3D true;
-            cpu->cfg.ext_zknh =3D true;
-        }
-
-        if (cpu->cfg.ext_zks) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zksed =3D true;
-            cpu->cfg.ext_zksh =3D true;
-        }
-
-        if (cpu->cfg.ext_i) {
-            ext |=3D RVI;
-        }
-        if (cpu->cfg.ext_e) {
-            ext |=3D RVE;
-        }
-        if (cpu->cfg.ext_m) {
-            ext |=3D RVM;
-        }
-        if (cpu->cfg.ext_a) {
-            ext |=3D RVA;
-        }
-        if (cpu->cfg.ext_f) {
-            ext |=3D RVF;
-        }
-        if (cpu->cfg.ext_d) {
-            ext |=3D RVD;
-        }
-        if (cpu->cfg.ext_c) {
-            ext |=3D RVC;
-        }
-        if (cpu->cfg.ext_s) {
-            ext |=3D RVS;
-        }
-        if (cpu->cfg.ext_u) {
-            ext |=3D RVU;
-        }
-        if (cpu->cfg.ext_h) {
-            ext |=3D RVH;
-        }
-        if (cpu->cfg.ext_v) {
-            int vext_version =3D VEXT_VERSION_1_00_0;
-            ext |=3D RVV;
-            if (!is_power_of_2(cpu->cfg.vlen)) {
-                error_setg(errp,
-                        "Vector extension VLEN must be power of 2");
-                return;
-            }
-            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-                error_setg(errp,
-                        "Vector extension implementation only supports V=
LEN "
-                        "in the range [128, %d]", RV_VLEN_MAX);
-                return;
-            }
-            if (!is_power_of_2(cpu->cfg.elen)) {
-                error_setg(errp,
-                        "Vector extension ELEN must be power of 2");
-                return;
-            }
-            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-                error_setg(errp,
-                        "Vector extension implementation only supports E=
LEN "
-                        "in the range [8, 64]");
-                return;
-            }
-            if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                    vext_version =3D VEXT_VERSION_1_00_0;
-                } else {
-                    error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                    return;
-                }
-            } else {
-                qemu_log("vector version is not specified, "
-                         "use the default value v1.0\n");
-            }
-            set_vext_version(env, vext_version);
-        }
-        if (cpu->cfg.ext_j) {
-            ext |=3D RVJ;
-        }
-
-        set_misa(env, env->misa_mxl, ext);
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    if (local_err !=3D NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
=20
 #ifndef CONFIG_USER_ONLY
--=20
2.39.0


