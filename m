Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42E47A4DA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:08:12 +0100 (CET)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBqF-0007Ju-A0
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoi-0004cw-WB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoc-0000EC-NA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976546; x=1671512546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlHtkJmdy8bQRJ0IVPqpApYc0FpQJP0rCIMVz+0wABo=;
 b=WYBbI3Uj8HKxOzkBS0EEEt5+w75txY0y/dGVP49Oc/8r9haalJQCtnaG
 PVpyWgfvkLAHIWTSk5LFCDuzjlSKbI+OoOihRaU/014Zs0PYKqlNCrqtP
 HkCrflVRgtLid299Boem9v0ocERca9YO5aLk5qilvp4cSD+7p0L1H4bS9
 oGg87hQ35Gzv30JQxv/CgNT5TrGbxrPfAamgaW/C0iGKGKhuZjQMW0r5Z
 F0cBMAl/tuulzFPQkW2+Hgu5HbynfqLrrNSU5dSxWd1RKpKrVOLCqxBLx
 LDOOkCN26Zoxh94+P//epYhF/NCMb0XYBcBYagk32ta7JleTBtnnXSFQz Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662323"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:23 +0800
IronPort-SDR: hENPT79SMr60WsVTvoONPtRr4ayFLc47p94qcK26imdkjmpBfFC1l/I72f5lDHOPlB1wXeai2e
 NmR6U4rf0flshAQaFyQUtVbPBtASC7AGPtQJ1ZPam6jwSSGsWruMLsbxwl+d67mpr6bsvERgzM
 //mV6pGAzaqgTVDyI4gjTtIj6JDrZPO4W+a1ekvrho2rnZSO6eAqCKIplT2MEvBxjJkjOhqQCk
 AVEcqTw2orGMQUCvXgE67iXQo+wgBkUJWdcg0LrA7aSwdXJ/o0hD4dGss+jfVw7oFTIucTfIdD
 4YBkTA9IFiO39NtXDfkRcJeR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:12 -0800
IronPort-SDR: 1b8CiOGR2F0twB+NsUKW5yTfNqpkqGBRIr9c03tjKWykOId7m+FnKOg4dcEUWErBwIBkIcJyAg
 GDgx9Pj4BIwLyCp8MlN3P2tcvwRKtXCNu62EXFw2LDSefsEe70oKxPHdMmWuMqDs41TOpEddH0
 D27UvZnXppt7uNRZVGOY5yyNXTyf2a/AUo3bsywqC2nKJ2TX9svRfPS0ClfgQHIHBpxDOVIs37
 1OIhMQH8S+98ast5c9pzqE9enIsTkpz4DXiOLcVxwfNMQtAfnYxTOkff3gbq71SXvvRoI5GNmn
 KqQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBQ4vzFz1Rwnv
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976541; x=1642568542; bh=FlHtkJmdy8bQRJ0IVP
 qpApYc0FpQJP0rCIMVz+0wABo=; b=pfu8D5iB2yS54Edr9YZxkuXxrFDImWGi+F
 6XlqiRtAkK4Yn54L0i30RWqskbtxkkQflP150oRKNpOFpI1KkgBu1r6PIqgexTBD
 CaGoBFSVoop8tfrVQGDjGn/Cw0o78YGtOqqLUtT7aZ8bvIyjDYuixEY2WY5rMGiQ
 YVlTP5ZztnW5LQIv2JuDDVThBJv+/aimX6t8AtS7cqT2bwzY1ahET7FWra5ZAq4m
 hWaqrTs7nQKfn8jSA3Avj81kW1AoeZwtu/JRTjEC0gy1hsF8JM3ymueTYb9mNXLv
 g5TMX6R1xb1Sh8ZaE5rsTaF4IGgUVmgyzL7vzgoSSryf8CzeD2IA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Tk5l5QPFGpBx for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:21 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBK3G41z1RtVG;
 Sun, 19 Dec 2021 21:02:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Hsiangkai Wang <kai.wang@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 76/88] target/riscv: gdb: support vector registers for rv64 &
 rv32
Date: Mon, 20 Dec 2021 14:56:53 +1000
Message-Id: <20211220045705.62174-77-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-69-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   1 +
 target/riscv/cpu.c     |   2 +
 target/riscv/gdbstub.c | 184 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d93ccdfa7..dc10f27093 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -291,6 +291,7 @@ struct RISCVCPU {
     CPURISCVState env;
=20
     char *dyn_csr_xml;
+    char *dyn_vreg_xml;
=20
     /* Configuration Settings */
     struct {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 728092f78c..9776297c79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -675,6 +675,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState=
 *cs, const char *xmlname)
=20
     if (strcmp(xmlname, "riscv-csr.xml") =3D=3D 0) {
         return cpu->dyn_csr_xml;
+    } else if (strcmp(xmlname, "riscv-vector.xml") =3D=3D 0) {
+        return cpu->dyn_vreg_xml;
     }
=20
     return NULL;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2..881ab33392 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,6 +20,32 @@
 #include "exec/gdbstub.h"
 #include "cpu.h"
=20
+struct TypeSize {
+    const char *gdb_type;
+    const char *id;
+    int size;
+    const char suffix;
+};
+
+static const struct TypeSize vec_lanes[] =3D {
+    /* quads */
+    { "uint128", "quads", 128, 'q' },
+    /* 64 bit */
+    { "uint64", "longs", 64, 'l' },
+    /* 32 bit */
+    { "uint32", "words", 32, 'w' },
+    /* 16 bit */
+    { "uint16", "shorts", 16, 's' },
+    /*
+     * TODO: currently there is no reliable way of telling
+     * if the remote gdb actually understands ieee_half so
+     * we don't expose it in the target description for now.
+     * { "ieee_half", 16, 'h', 'f' },
+     */
+    /* bytes */
+    { "uint8", "bytes", 8, 'b' },
+};
+
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n=
)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
@@ -101,6 +127,96 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uin=
t8_t *mem_buf, int n)
     return 0;
 }
=20
+/*
+ * Convert register index number passed by GDB to the correspond
+ * vector CSR number. Vector CSRs are defined after vector registers
+ * in dynamic generated riscv-vector.xml, thus the starting register ind=
ex
+ * of vector CSRs is 32.
+ * Return 0 if register index number is out of range.
+ */
+static int riscv_gdb_vector_csrno(int num_regs)
+{
+    /*
+     * The order of vector CSRs in the switch case
+     * should match with the order defined in csr_ops[].
+     */
+    switch (num_regs) {
+    case 32:
+        return CSR_VSTART;
+    case 33:
+        return CSR_VXSAT;
+    case 34:
+        return CSR_VXRM;
+    case 35:
+        return CSR_VCSR;
+    case 36:
+        return CSR_VL;
+    case 37:
+        return CSR_VTYPE;
+    case 38:
+        return CSR_VLENB;
+    default:
+        /* Unknown register. */
+        return 0;
+    }
+}
+
+static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int=
 n)
+{
+    uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        int cnt =3D 0;
+        for (i =3D 0; i < vlenb; i +=3D 8) {
+            cnt +=3D gdb_get_reg64(buf,
+                                 env->vreg[(n * vlenb + i) / 8]);
+        }
+        return cnt;
+    }
+
+    int csrno =3D riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val =3D 0;
+    int result =3D riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+    if (result =3D=3D 0) {
+        return gdb_get_regl(buf, val);
+    }
+
+    return 0;
+}
+
+static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, in=
t n)
+{
+    uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        for (i =3D 0; i < vlenb; i +=3D 8) {
+            env->vreg[(n * vlenb + i) / 8] =3D ldq_p(mem_buf + i);
+        }
+        return vlenb;
+    }
+
+    int csrno =3D riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val =3D ldtul_p(mem_buf);
+    int result =3D riscv_csrrw_debug(env, csrno, NULL, val, -1);
+
+    if (result =3D=3D 0) {
+        return sizeof(target_ulong);
+    }
+
+    return 0;
+}
+
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < CSR_TABLE_SIZE) {
@@ -187,6 +303,68 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, i=
nt base_reg)
     return CSR_TABLE_SIZE;
 }
=20
+static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    GString *s =3D g_string_new(NULL);
+    g_autoptr(GString) ts =3D g_string_new("");
+    int reg_width =3D cpu->cfg.vlen;
+    int num_regs =3D 0;
+    int i;
+
+    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
+    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.vecto=
r\">");
+
+    /* First define types and totals in a whole VL */
+    for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count =3D reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "%s", vec_lanes[i].id);
+        g_string_append_printf(s,
+                               "<vector id=3D\"%s\" type=3D\"%s\" count=3D=
\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+
+    /* Define unions */
+    g_string_append_printf(s, "<union id=3D\"riscv_vector\">");
+    for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"%s\"/>"=
,
+                               vec_lanes[i].suffix,
+                               vec_lanes[i].id);
+    }
+    g_string_append(s, "</union>");
+
+    /* Define vector registers */
+    for (i =3D 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=3D\"v%d\" bitsize=3D\"%d\""
+                               " regnum=3D\"%d\" group=3D\"vector\""
+                               " type=3D\"riscv_vector\"/>",
+                               i, reg_width, base_reg++);
+        num_regs++;
+    }
+
+    /* Define vector CSRs */
+    const char *vector_csrs[7] =3D {
+        "vstart", "vxsat", "vxrm", "vcsr",
+        "vl", "vtype", "vlenb"
+    };
+
+    for (i =3D 0; i < 7; i++) {
+        g_string_append_printf(s,
+                               "<reg name=3D\"%s\" bitsize=3D\"%d\""
+                               " regnum=3D\"%d\" group=3D\"vector\""
+                               " type=3D\"int\"/>",
+                               vector_csrs[i], TARGET_LONG_BITS, base_re=
g++);
+        num_regs++;
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_vreg_xml =3D g_string_free(s, false);
+    return num_regs;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
@@ -198,6 +376,12 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSta=
te *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
+    if (env->misa_ext & RVV) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set=
_vector,
+                                 ricsv_gen_dynamic_vector_xml(cs,
+                                                              cs->gdb_nu=
m_regs),
+                                 "riscv-vector.xml", 0);
+    }
 #if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_vi=
rtual,
                              1, "riscv-32bit-virtual.xml", 0);
--=20
2.31.1


