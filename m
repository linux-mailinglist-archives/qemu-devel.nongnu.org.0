Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7450ACE9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:44:30 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhPR-0007ku-Av
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJG-0007Ax-Ct
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJD-0005Rv-JM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587883; x=1682123883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zbmyGmJOcyh44B97juv66ZS7UlMtHdTZEo46jwcnD94=;
 b=Cnp/o4FCfiy0QFump9FtnD/srZ7gCK2cHaw4gASoCOe/Era4/92wXWuF
 dQBVZCRQWLSXcfEKwCSB6M3wl01ApLXGsEINgY9DvPwu3SxrhblYITCor
 sUaf8ORM5H/7B1Bi3unr2dX3GZBztVuVVfv/yQhGPfVCi2kUOGcvdJrlC
 LZPAiLl3Vm1LmuYiYpRg+ID9SE6Qduq7yg13kmSXnLWapV6tzVyi2gM6p
 ch4AnDXQXwseoGnlzE5EcvV9dhcEdkp+/KiMf7+EHEALpuXFUrZ3+XGCq
 vom9aGyRRUZPB8E5SjYwupNUWa60lAXxL0wmn3H6ogTPwTWs4hHXrsolk g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483394"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:02 +0800
IronPort-SDR: /kVO2FBEXqRFj6IyNY9vf+xc4xtS5lloDZZKQB/0u6JkyVfcryuFM4OFfJMe9Hai0bEabs9Q+2
 sjZoMk24haXXwnz4Hgn5WBo1nFCEApz8rWq7G14tSZ0d0Mj/LifRNPA4cFopMpD0N4JBEoQszg
 4o2o2zK3rslNQ7gg4jsU9ruWeoVH0Oupd3z69CQCf5EbsSsKgYIPs9PISfcpZlLUQWt+nLgEH4
 TN2d32+g3giR2IkfRyy+ic4Oya9rrSCURnB/ZVk/J6VvlEsooQdGq4UC7tdd/psgXvNwZATUFp
 KWxdGlW6HDVaE0yfaKsHmgTc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:19 -0700
IronPort-SDR: tzlro/zgxy2SCvlnzzwonJlXJJ9ALkUF2xlPZNkuUAWBedZuFXuMFNJtN+Gcx9st9+HluWeHML
 gr1Vzv3j/eAi3loB57Z1jpaO6GbGGuFxmF9TL2+m4GQFIGmaQw++LDj2wgtLoVRjigMXZ0dFmw
 00gK1678Ep8ut8mG6hFEv8my2gH/0jJSo8D/jvS+77XbkldqGqg+0+MgFMJa7aTTiEuEm5oicv
 Qn7kQ2JWb73M6MJEIYde2RfW/bwsqaFv+CGrvWwLzlMoxfWu8q4xIP5JVyc5Et8Ho/8fa3ELP5
 gYg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVd6wy0z1SVp2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587881; x=1653179882; bh=zbmyGmJOcyh44B97ju
 v66ZS7UlMtHdTZEo46jwcnD94=; b=OxNrdxbJ/FkMPZEhv3S35BQx39gXVSAmOn
 cTxZCuvzNYCSmvR6OSoTIpoGKJzqVl92SKkxQdEnkCcX7KPxztLPtcu1T1jYXeAF
 n7AqvQnwKTochdp0ARUKIqEdyeFLWU9kfwvrOVqOc/K8sUDnsTVvxXcVIVAVrnn7
 STKNHzgaPFvK+M5FD3eYS3n9slUqXNF0gDh+FfMcuY2hKSVvLT1axqxg4tdLd1Y9
 j3/pV9FY+PsBvTSI/+spjubw20YBcrakqtCqV21nHBX7hBI7wv/91XyJi3/N3vbw
 6Lf5E+VJg86pRHSCqqI2m5DN1AMkvT1fpUgRDX0/b7OIaHxq/CRA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gmmFjnnNpXfu for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:01 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVY3LJhz1SVnx;
 Thu, 21 Apr 2022 17:37:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Stubner <heiko@sntech.de>
Subject: [PULL v2 15/31] target/riscv: Add isa extenstion strings to the
 device tree
Date: Fri, 22 Apr 2022 10:36:40 +1000
Message-Id: <20220422003656.1648121-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Atish Patra <atishp@rivosinc.com>

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending the available ISA extension=
s
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220329195657.1725425-1-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index edc33c44dd..94f9434411 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -36,6 +36,11 @@
=20
 static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
=20
+struct isa_ext_data {
+    const char *name;
+    bool enabled;
+};
+
 const char * const riscv_int_regnames[] =3D {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3"=
,
@@ -908,6 +913,60 @@ static void riscv_cpu_class_init(ObjectClass *c, voi=
d *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
=20
+#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
+
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_=
str_len)
+{
+    char *old =3D *isa_str;
+    char *new =3D *isa_str;
+    int i;
+
+    /**
+     * Here are the ordering rules of extension naming defined by RISC-V
+     * specification :
+     * 1. All extensions should be separated from other multi-letter ext=
ensions
+     *    by an underscore.
+     * 2. The first letter following the 'Z' conventionally indicates th=
e most
+     *    closely related alphabetical extension category, IMAFDQLCBKJTP=
VH.
+     *    If multiple 'Z' extensions are named, they should be ordered f=
irst
+     *    by category, then alphabetically within a category.
+     * 3. Standard supervisor-level extensions (starts with 'S') should =
be
+     *    listed after standard unprivileged extensions.  If multiple
+     *    supervisor-level extensions are listed, they should be ordered
+     *    alphabetically.
+     * 4. Non-standard extensions (starts with 'X') must be listed after=
 all
+     *    standard extensions. They must be separated from other multi-l=
etter
+     *    extensions by an underscore.
+     */
+    struct isa_ext_data isa_edata_arr[] =3D {
+        ISA_EDATA_ENTRY(zfh, ext_zfh),
+        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
+        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
+        ISA_EDATA_ENTRY(zba, ext_zba),
+        ISA_EDATA_ENTRY(zbb, ext_zbb),
+        ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(svinval, ext_svinval),
+        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
+        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
+    };
+
+    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_edata_arr[i].enabled) {
+            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+            g_free(old);
+            old =3D new;
+        }
+    }
+
+    *isa_str =3D new;
+}
+
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
@@ -920,6 +979,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p =3D '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
=20
--=20
2.35.1


