Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFA50992E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:36:36 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRMh-00055G-LI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRo-0005Pp-Dq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRm-0007zd-4k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523065; x=1682059065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zbmyGmJOcyh44B97juv66ZS7UlMtHdTZEo46jwcnD94=;
 b=kuQdkEfwHul4ipmIg1F10opcgaQo62+sWfm/9wqr/XCTF/bAt/AVrF6/
 okopmvz3UePNL7iGpFoQSbpJutaNpoECQOPUOH95KPFBjSXBLaJFj6J+U
 kaFaHkekDpa6SxIuE1DlW0221MepvzEi9+zrwndk+6ZWUgTREI68IH2jI
 TEn6icmJ9j2k0M8sV4dfQbZxIRHPt9UNz7ZEfvmpMcBWLDsUNdPDc2O2+
 XAi9bJpYwDU8G/ZSWLqymdymM/ek3Rr0jkQkSLBeZgCTQIBUyULlZOj0/
 BNPkH6jlp1ivJtN3fnfJ0FrhyHJt/8zBMaIYB+ItuwU8YhAkLilbp05hg A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639990"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:34 +0800
IronPort-SDR: BwWl8y7AyjFBgoEKnwW/bqMaDiPByQkbyd09aP9I+wdFOanjSAC6gCQDFIH20iIkggUo1oOai3
 90l0exXA819COX1NniyBBW7WMCK+gwW9isV3XqaOpS5YetIyeP6ogNeVeBCaeI1//s1k34zeQE
 WdWdZeKO/k/WQqiOofWizvd41BZRomq4ETR811p8DzAgTBLmoHkr87I7rewkw7+a+KazT9cUxd
 4W9Np4RWp21blSKslDwyfIxBwEEnpoehLDAiDnPwwOlwGXdzrvk9uC7n9MQIPtjA1gDa97dcHr
 BVZzkQrLlb4mum8u8uQc+VLU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:37 -0700
IronPort-SDR: VJBmuavS8SGYimhNZPo4nOoh5XPa70u000rlwZ2zEkwFIMFM9BKMEnXAmx/uOj3/RmslZ0IFQ2
 L7w0Ud9pUWsqFGjQf8MxI8kx6s+Q+ilj39IfeDjKeaKy1Y1S62nNnE5dt0CcoQkFrxX/LIL42C
 dJP2RdoL9PrdIsrS4jpVSInLkmgb6GF9rpLudIIEtmNRqH/dKVkRwaDZPFpYc15NqxHp3hh/Ok
 W1pZhCCZPpDYJCCc168A6RBaTzPK8Bx8+OK+xvqhWVRsYTynX4Fo2KK/DO9el8KzWB3hCE8Au9
 bSk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWy1mkJz1SVp3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523053; x=1653115054; bh=zbmyGmJOcyh44B97ju
 v66ZS7UlMtHdTZEo46jwcnD94=; b=Qk/lH6+nZrMzS31tTI6e9HW3PX2QgglDfB
 rMPM+8wh7oeApaC0P3/E/OJmHyUKk7YFa9kZlUxmHAk1un0yQqg3ofBRfX5Yl5XQ
 Sheu6FRDawL9yeDbvLC4PcT/QETD1HxV0PpqkPK0Am6qZToYN8iqDdp5FZEzduI3
 3+lv01i/F7/wWzgLpRmJ8a5Cf0g9u9LJ/DgjHKeNXXH2aZkKdSLAU8RquekBfMjH
 ajmUESQZKQu4XZhl1G99dwKTvhc4A2QNECoxPfjFGfoUp9cNxkZA9i10uu/SBmb4
 AbdrJKn2RN6DQ4RxBsH/CpUxqLUay6J9IcE/NemhDggU4rGcjwYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bIUnBiql1Fkz for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:33 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWt0kKdz1Rvlx;
 Wed, 20 Apr 2022 23:37:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Stubner <heiko@sntech.de>
Subject: [PULL 15/31] target/riscv: Add isa extenstion strings to the device
 tree
Date: Thu, 21 Apr 2022 16:36:14 +1000
Message-Id: <20220421063630.1033608-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


