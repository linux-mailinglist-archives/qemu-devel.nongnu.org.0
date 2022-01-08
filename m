Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE44881CF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:15:04 +0100 (CET)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n650J-00044U-7W
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64em-00014O-VT
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:52 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ek-0006td-WD
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621166; x=1673157166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L3WbIfwV5XUOeUjSi6RKwj35BhOqbf9IiZ0lyRmimZs=;
 b=m41JPJHCnx14ZC8g6TIB3yW1i6uJbiTKjtTmOK14GWlRpE1+J91jJwh1
 hBbyAO5a1hvYDM2bvPn6GpKXJ+eA9k8P33noyVdhoXvsLcst6/yNlYxEZ
 4aOWQfAHeF1mT9cpLvNi2pkLpfOaYzQ/aqqKFpKuxYz2ZxsyGFLP1fJ55
 NALQkOu0/hhM8nBQdfZSZJLqq5go/nJ40SczDnpHgORqOVMY0sX7g37xp
 fr1s+lNq8erHZYnOpqAZJ90qg6WRNyAFBYQzM/qLjui4DfmUWDAHyLn5r
 HYgpsraPc5E4eGvrnzO74WquAgp22Pd/j4uLtBv5jWAIJlceHzF2OtMDI A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027396"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:46 +0800
IronPort-SDR: 4Cqc/FQ2l6wAMEFQmUjdQxYyXxGr7Vxz78eg7w+2qRN8YMx+H1Q9sX4mL4MNTrPUMJCnQ7am8r
 q/stATyLuDYnpwNl9m5NpOBnOMxSxV2R+SSnygO7ezRcpv4kcPO+EzEIeCrvtuwK27du5yqBmH
 G28TsZXe8nxYKD3LqGBzS7jlj9SJRh1a+gaVQZY4r3tMwrW7ln1Vc51LPMJNCxwRjAozjotsEn
 Ow6BbYraXXwt4OwnnGU/bkNRO8raJ4aGHuj80432oHxsJR6cYdOsoAYhKUZagXCYUkS8Sotm0n
 LM8PsmdazZPsxWRYwgEuh45/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:12 -0800
IronPort-SDR: XIHvt0TTYdfaVUffFXAQq45sfP6lsHO9khKdaOjScmswmDvaPX3ff8yZNjDeqfSXQqS9RpFz5n
 stjUadcxi0NdELX3bK4VoRfgu09eum9vJkIEt253E6WUMc9imtZGhTTEbxx5AqrPA18TlMaUjH
 FINQSjY2dTbQuba6o85CwkvxwuLLuDx/x8q6r1fH4tAZHr6aR8mqvP+lMT4l3kCQNcuBNkQGhx
 8X8MAxaqerk70ndHTV3WEURYA196ZxA8k6yfj12c9iZf7rPnXuBOVN+IQk5PXelCgwGEgC04oF
 bcs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:47 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Pp0LvTz1VSkj
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:46 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621165; x=1644213166; bh=L3WbIfw
 V5XUOeUjSi6RKwj35BhOqbf9IiZ0lyRmimZs=; b=X5jpxWUGpGiNyE+fygQnhIy
 3LYd4sQQhrFKsPB3ONIN3ZJOMTjAx7uUTPd2S7AavTfQmj3F84gldkw58RJi/9St
 ZGy8parSIrAa1jss3rjvvUXGIcg0F88omQYdf0Pt4QjKvs9BEhCMGMo6GiNIc+23
 I9omGVyY1qvNXB/OY09sMVx8J/HoQNRFsQKB1g2l9hE8D1ZG8LSefY4uCFpUNtGy
 1N/5F4jGqB6RFnR9aR7O0ahNJib5uLy1pT/LQLYxr6cHyTHFsIZZbgEGFKJp26/A
 qzj/J8fntNn+Gk+uNVozkUxtLGC9ZXbHxY/u2UH0FEVyQgYpRgSvvl0EZMKvRyQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AfzRIvbQP1Wu for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:45 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Pk2ft4z1VSkW;
 Fri,  7 Jan 2022 21:52:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/37] target/riscv: setup everything for rv64 to support rv128
 execution
Date: Sat,  8 Jan 2022 15:50:34 +1000
Message-Id: <20220108055048.3512645-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

This patch adds the support of the '-cpu rv128' option to
qemu-system-riscv64 so that we can indicate that we want to run rv128
executables.
Still, there is no support for 128-bit insns at that stage so qemu fails
miserably (as expected) if launched with this option.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-8-frederic.petrot@univ-grenoble-alpes.f=
r
[ Changed by AF
 - Rename CPU to "x-rv128"
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/disas/dis-asm.h |  1 +
 target/riscv/cpu.h      |  1 +
 disas/riscv.c           |  5 +++++
 target/riscv/cpu.c      | 20 ++++++++++++++++++++
 target/riscv/gdbstub.c  |  5 +++++
 5 files changed, 32 insertions(+)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 08e1beec85..102a1e7f50 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
+int print_insn_riscv128         (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 int print_insn_hexagon(bfd_vma, disassemble_info *);
=20
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fa5d238530..fd583e0f41 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
diff --git a/disas/riscv.c b/disas/riscv.c
index 793ad14c27..03c8dc9961 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3090,3 +3090,8 @@ int print_insn_riscv64(bfd_vma memaddr, struct disa=
ssemble_info *info)
 {
     return print_insn_riscv(memaddr, info, rv64);
 }
+
+int print_insn_riscv128(bfd_vma memaddr, struct disassemble_info *info)
+{
+    return print_insn_riscv(memaddr, info, rv128);
+}
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bd4a7c7aa..9bc25d3055 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -178,6 +178,19 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+
+static void rv128_base_cpu_init(Object *obj)
+{
+    if (qemu_tcg_mttcg_enabled()) {
+        /* Missing 128-bit aligned atomics */
+        error_report("128-bit RISC-V currently does not work with Multi =
"
+                     "Threaded TCG. Please use: -accel tcg,thread=3Dsing=
le");
+        exit(EXIT_FAILURE);
+    }
+    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, MXL_RV128, 0);
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -402,6 +415,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
     case MXL_RV64:
         info->print_insn =3D print_insn_riscv64;
         break;
+    case MXL_RV128:
+        info->print_insn =3D print_insn_riscv128;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -464,6 +480,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         break;
+    case MXL_RV128:
+        break;
 #endif
     case MXL_RV32:
         break;
@@ -673,6 +691,7 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     case MXL_RV32:
         return g_strdup("riscv:rv32");
     case MXL_RV64:
+    case MXL_RV128:
         return g_strdup("riscv:rv64");
     default:
         g_assert_not_reached();
@@ -827,6 +846,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
=20
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 881ab33392..a5429b92d4 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -280,6 +280,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, i=
nt base_reg)
     int bitsize =3D 16 << env->misa_mxl_max;
     int i;
=20
+    /* Until gdb knows about 128-bit registers */
+    if (bitsize > 64) {
+        bitsize =3D 64;
+    }
+
     g_string_printf(s, "<?xml version=3D\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd=
\">");
     g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.csr\"=
>");
--=20
2.31.1


