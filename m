Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B15EBB23
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:09:33 +0200 (CEST)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4ih-0000Ee-0o
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48V-0005m5-7M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:16 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48S-0001Eu-33
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260324; x=1695796324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKyFaf3tOrfxQ0QcwC9IJ4OwYlfohhHglvpt9xiHY9Q=;
 b=lBYP4he1Nj5T/AoS0x5ffQlCeb2i/9VetLkc90xettQVqe9L1yAp2+UU
 1ejVmAzD397iojScjGTC2C1s/AszbzcfuTgvsDo3VxssgisMKBl6Pr31y
 Emxzy9lYdf1+MaauKrlib1s04/uWqBlZbMpl9FVdBAlOHEV3SYywQYhdI
 qkzdEAfsIkDBOBIfj0ZZWq9llmoZ5/mUk39XIoA9WVM/mLUizW64HDbxg
 0wypvoWLLD6qVWI8eCxV13OLAC5cevYLR8ieo0wZWcVDZk68xR1UrgapQ
 Bk6MmFQB1nAmQUd8AANhcZE1IIlvzdruoLY6TUcJQVqcUg3B8vn9xjvHl g==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530917"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:40 +0800
IronPort-SDR: CmvenI5n9Rnj1UtnKjKSrYKhP6fZr1FclRo7gcleesHCRZdNazoGZlFyul3KkVxbmFiYqov34A
 Jfnaw2eQ7PQ5EgWZyOxAxPRnJGHr4lRG1Smq+QmACo+FS5wQZuBa1qtWZKkRGRvs7HIZo0nkNb
 OEUQQodb1Ab8A7fgwberMXkte2sP//UjiKbTHmo2zSnoPomvkK5FL61AqppqGQhwTGYpHcUkuU
 oruB2jKFoUOpK9pZDuZ3rVwBSAW4vrx7QUI/wtrIA+noCMmR4zxfqhJ3CvEgoUlmxvwazoIFhj
 EE2jyoJRib5fNWhTq8dmID1+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:37 -0700
IronPort-SDR: cr6vCsoOeL5C2AxFvhB/qWnZ3uDzzkrXnM+SPIVQr1brn3g42XCDE5BJg53mHb4TbUz7cSa95R
 H9d0Qe5/Igr0nTkMWmeTgRpPHpyZY2hwBdQu33vIc+r/qlWn+1rkz5zbnxnlUSRVES0489y9u6
 1qW9HCkxjhbQr5mfQK9U6C8EE0FSZR7s+ElwpT4ZgHXaXinsTedlWLuUH6V6ebTLaxvgywRKsd
 MA2HzQnpKP/UKgxzvCt3CCg8kVI4Zo+RUIsAQAaIKPjelJZqr2du4hchtrqWrNecRxrJyjTts9
 Jzc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sl5mqVz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260299; x=1666852300; bh=EKyFaf3tOrfxQ0QcwC
 9IJ4OwYlfohhHglvpt9xiHY9Q=; b=hL+IfpQGolOGoa/DMeFqyiLWDZ2jE7Wy73
 EsV0CbxVAc0jrbMMufhiA69zT1Jgp3XZky6DLcDoSlyfyKGSBropzOdHDczFlwNT
 H4uBIErIeu3APPu7tLRPtdhOmFcIy4OljzV+Q/EfiLR/15yl63TMaBP+MdaVWylI
 0HIfpQoz8JL7czM0dpFn7LY2+KDJZ1NCXDABKS+OmSfX0Mp5GJG6e5inC6IJZJz5
 To0Y8vx/Rng2zS78AVIz1tRZob9l4qruV+1vfDi8JmrrQqwxnwTw1B6PIjaLwdr1
 MoePmIlmSQHWHWrmEecS91ChoBlXU/TQjKJZ4+MUB0Gqtm8gibMg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sgWFSmCyNrFH for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sj4r7Mz1RvTr;
 Mon, 26 Sep 2022 23:31:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/22] target/riscv: debug: Introduce tinfo CSR
Date: Tue, 27 Sep 2022 16:30:59 +1000
Message-Id: <20220927063104.2846825-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

tinfo.info:
  One bit for each possible type enumerated in tdata1.
  If the bit is set, then that type is supported by the currently
  selected trigger.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20220909134215.1843865-6-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/debug.h    |  2 ++
 target/riscv/csr.c      |  8 ++++++++
 target/riscv/debug.c    | 10 +++++++---
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b762807e4e..d8f5f0abed 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -319,6 +319,7 @@
 #define CSR_TDATA1          0x7a1
 #define CSR_TDATA2          0x7a2
 #define CSR_TDATA3          0x7a3
+#define CSR_TINFO           0x7a4
=20
 /* Debug Mode Registers */
 #define CSR_DCSR            0x7b0
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 76146f373a..9f69c64591 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -95,6 +95,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong=
 val);
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al);
=20
+target_ulong tinfo_csr_read(CPURISCVState *env);
+
 void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2c84c29bf0..5c9a7ee287 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3094,6 +3094,13 @@ static RISCVException write_tdata(CPURISCVState *e=
nv, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_tinfo(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val =3D tinfo_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -3898,6 +3905,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_TDATA1]    =3D  { "tdata1",  debug, read_tdata,   write_tdata  =
 },
     [CSR_TDATA2]    =3D  { "tdata2",  debug, read_tdata,   write_tdata  =
 },
     [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata  =
 },
+    [CSR_TINFO]     =3D  { "tinfo",   debug, read_tinfo,   write_ignore =
 },
=20
     /* User Pointer Masking */
     [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,  write=
_umte },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index d6666164cd..7d546ace42 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -37,9 +37,7 @@
  * - tdata1
  * - tdata2
  * - tdata3
- *
- * We don't support writable 'type' field in the tdata1 register, so the=
re is
- * no need to implement the "tinfo" CSR.
+ * - tinfo
  *
  * The following triggers are implemented:
  *
@@ -372,6 +370,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_i=
ndex, target_ulong val)
     }
 }
=20
+target_ulong tinfo_csr_read(CPURISCVState *env)
+{
+    /* assume all triggers support the same types of triggers */
+    return BIT(TRIGGER_TYPE_AD_MATCH);
+}
+
 void riscv_cpu_debug_excp_handler(CPUState *cs)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
--=20
2.37.3


