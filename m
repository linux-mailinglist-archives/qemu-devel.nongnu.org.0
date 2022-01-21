Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18842495CC2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:23:02 +0100 (CET)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAq8J-0002RS-56
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0y-0000Cq-MK
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:19 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0u-0004KU-NL
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744988; x=1674280988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=My+y4xwrIoPeaWHLgNp5KOb2eyb0GktoaTHMAVqUJVU=;
 b=bIdO457wVeF7Ukux3i3q00579IJc6P5AHKSMw9p39ccgQBfhGzYl3Wvi
 MQmN9oZWi43I8wRqyHIHYqMF256A2zRuEMXUIu2g9OdV/lO1Q66+wpVOT
 2/NdbyEACnsR8AEVXVK+HYqc5ZHfY6jdN+EgY2tNSrwQ6/OYETvm3GtXp
 sXH31eXyV1y6+cOJ8O/z5paNfVYQI6Nesv2Iv287cMi4442RFqIIep0Bc
 DqrhUg54KjM7dHv59tx6PuTJDx9TeAPtKQ8WjtBK2+2U3VPqfVsquqXXX
 sGIAoxu6vG7dTHGv56tOXGh2kJ3Y+nug+pg8usjHdNrTIsYN8XngLGkrt A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083094"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:54 +0800
IronPort-SDR: 216oAfc0MERJ757hx1qW3hmys5AM2ycaDiBC4AIA9axkqgKQUOyypU7FvDuA1mG0Hecsg4XGAu
 9qtkNc+sXlfaE8Olcjkc3XmhYKkWAx96uaOyFCnSSYUU1LnRah1HKBtkZK7KFNr2C7k0y1LYc0
 NizOd2xQ2GoQQqKSydIO/OGDd2TH6VdI/JhLjjge9JXsqqfVx9gO2krBQamBK6vFCEQrjrUW7z
 UgTdU38zxU7YG5Z2tTrHmiA0vCNZrmmSHDD6GsztI6/FErHmB0dPitcYNI538DheTgWrshRKm4
 OLY3Opu5IiVGf8R4pFnHvl/L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:22 -0800
IronPort-SDR: Xt+Svdwk355gDWjoXmqFbgKvlEhq5PfgM3+jf718qP6B5ODJA5O5BHooxtZTE5mWgI+zCrV685
 WukKWDTB/Vgi9OpdkPyyomzwq/m/WCXJIzKn3clvVzYN0CVQGVNiqz0GkwJ4i9GqZCZDZZkRmP
 yN4ysYl8tw8Uxokv/57lpFfW1Nf9P/lvdoPz3YNzZ7gS3rQ8OnTcrQMDyjxfXanJzpqYX8T10u
 HvrIQGlJsAHj5bH3CCDLxi80IdaruwDlbO+ctLaWCyPhrLO7ROT/Ef8K0l6piUy8GQ+9S9fZX3
 rU8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80L1WdVz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744913; x=1645336914; bh=My+y4xwrIoPeaWHLgN
 p5KOb2eyb0GktoaTHMAVqUJVU=; b=ZexEKcn+MUB5236bMGymZmyEFs639UNED+
 l/v1TrWj/ImgOcp3CDv34+q0+VLOl2uC5T9znQTPG0gWwaHzZHI3ga0liYDsk3j/
 oZuWLKce5eBWSlHN5x+YqaWk6gq6kBunqnCRjxaTv0Nj7ScoZEcTJCY9TUd7njio
 5scRJKIzM7elJHJao4PGBU2aDXn4K700MEVVvXxrhhrSLkKA3b07ZOQy48gsf+eX
 3jS5QZNSlj+hqf2he8f5l9kxBFex789Z+ROICu3hhWuWJRJQrptVhIgkWZK981qr
 gm3DQ/EhSaHOmXP2taDNxmsbEXY/45UePmrOQ4Z+VHQXuqsBm/2w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9vAG5wqsRGxh for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:53 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80G2QcQz1RvlN;
 Thu, 20 Jan 2022 22:01:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 46/61] target/riscv: Use gdb xml according to max mxlen
Date: Fri, 21 Jan 2022 15:58:15 +1000
Message-Id: <20220121055830.3164408-47-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-9-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     |  8 ++---
 target/riscv/gdbstub.c | 71 +++++++++++++++++++++++++++++++-----------
 2 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eac5f7bf03..690c879901 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -466,6 +466,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     RISCVCPU *cpu =3D RISCV_CPU(dev);
     CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
+    CPUClass *cc =3D CPU_CLASS(mcc);
     int priv_version =3D 0;
     Error *local_err =3D NULL;
=20
@@ -516,11 +517,13 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     switch (env->misa_mxl_max) {
 #ifdef TARGET_RISCV64
     case MXL_RV64:
+        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
         break;
     case MXL_RV128:
         break;
 #endif
     case MXL_RV32:
+        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
         break;
     default:
         g_assert_not_reached();
@@ -802,11 +805,6 @@ static void riscv_cpu_class_init(ObjectClass *c, voi=
d *data)
     cc->gdb_read_register =3D riscv_cpu_gdb_read_register;
     cc->gdb_write_register =3D riscv_cpu_gdb_write_register;
     cc->gdb_num_core_regs =3D 33;
-#if defined(TARGET_RISCV32)
-    cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
-#elif defined(TARGET_RISCV64)
-    cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
-#endif
     cc->gdb_stop_before_watchpoint =3D true;
     cc->disas_set_info =3D riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a5429b92d4..f531a74c2f 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -50,11 +50,23 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteAr=
ray *mem_buf, int n)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
+    target_ulong tmp;
=20
     if (n < 32) {
-        return gdb_get_regl(mem_buf, env->gpr[n]);
+        tmp =3D env->gpr[n];
     } else if (n =3D=3D 32) {
-        return gdb_get_regl(mem_buf, env->pc);
+        tmp =3D env->pc;
+    } else {
+        return 0;
+    }
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        return gdb_get_reg32(mem_buf, tmp);
+    case MXL_RV64:
+        return gdb_get_reg64(mem_buf, tmp);
+    default:
+        g_assert_not_reached();
     }
     return 0;
 }
@@ -63,18 +75,32 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_=
t *mem_buf, int n)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
-
-    if (n =3D=3D 0) {
-        /* discard writes to x0 */
-        return sizeof(target_ulong);
-    } else if (n < 32) {
-        env->gpr[n] =3D ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+    int length =3D 0;
+    target_ulong tmp;
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        tmp =3D (int32_t)ldl_p(mem_buf);
+        length =3D 4;
+        break;
+    case MXL_RV64:
+        if (env->xl < MXL_RV64) {
+            tmp =3D (int32_t)ldq_p(mem_buf);
+        } else {
+            tmp =3D ldq_p(mem_buf);
+        }
+        length =3D 8;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (n > 0 && n < 32) {
+        env->gpr[n] =3D tmp;
     } else if (n =3D=3D 32) {
-        env->pc =3D ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+        env->pc =3D tmp;
     }
-    return 0;
+
+    return length;
 }
=20
 static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
@@ -387,13 +413,20 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
                                                               cs->gdb_nu=
m_regs),
                                  "riscv-vector.xml", 0);
     }
-#if defined(TARGET_RISCV32)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_vi=
rtual,
-                             1, "riscv-32bit-virtual.xml", 0);
-#elif defined(TARGET_RISCV64)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_vi=
rtual,
-                             1, "riscv-64bit-virtual.xml", 0);
-#endif
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-32bit-virtual.xml", 0);
+        break;
+    case MXL_RV64:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-64bit-virtual.xml", 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
=20
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_r=
egs),
--=20
2.31.1


