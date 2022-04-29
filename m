Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C140514171
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:33:45 +0200 (CEST)
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIK8-0000RE-1Y
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIE-0005yw-Gc
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIC-0002SM-DL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206702; x=1682742702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iqo29NHyqencjmQOv3DpvMvxEfylQwEtGMdtA8kWGJo=;
 b=Bcf4rc8z/ZB85JRpmi5uCJbuNzhTTEHNoBGMnyXTgsV9YdEW+fdxEdAQ
 mJ/bBKyLlyPvMfIYGf2nNnwuLRMUKwZXKwdu4C6AWbyuudEVhCH09Vl4X
 V/hI/+1IZu6FbG/2Si6kVTvVyzF32CrzFg6dZWSMhCJM2/NMrg4vuKmNP
 6b2229NILOcBfONfYjo23a4RzS5C1bWOiAitrb+PvRO9rsAIm78ROsL90
 HjkrfcYf4Ej5X26qXZEoSn3J5AHM9eHABLm2UYwEcZPOQdKgYvBfQzx3B
 OHadcD1wncHBdBhNkXzBN+BbQ3GKMPmFWV9uvBFS5v39wG8i08+8ehbE8 A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995896"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:42 +0800
IronPort-SDR: O2to0qWOjCvhuUotxVcr4Rqm34/dJGriXkltIl9ctG5LZj6MLZmH+P5FQ3z1pQHiELwufTq3i7
 Ql3QXjFtRHZv6iQ8OrG8m7w1/WNP3SQEJJtbKMzzASYuAQ4TP7nq3nnv8/7AfVaCvn9L/varyu
 tBipeEMDPykUyMvcOtISX8cgFRZDCchVoZr/tOSqDQUK3QoXFUSHEi4eZkUhbtmm6YMeZtyd8X
 b06E6ItHtf+gmhcRpY3G9xj9tNodRtD95ziWYmUw5sctCy/A+Oo8Ssl7KUCfVhtIQJ+wmmkQPM
 RPKM+X4g2uOhU9jvVjm+qkCL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:51 -0700
IronPort-SDR: 5ngjalxG6uwhg9KSN+zuktz2MrxWLjztIF9+SEL8ZAE3PQ6ZPsdJ4IsOW4xV5tvjTup0ySX9YW
 sm8Ao5MoMCrqiGaUFQGjTCXwoK7o2OWE8d/laorAllyKTGm4rYNsVlbNB29Xb0Rl/YP5EDI+Ao
 sBx8dRGz1rVhqVOMfomvqRH9Tp4M0rMdFwcHgaFDDQwrVB/J8WAWRGaOjSnmKAu4JsgMApO2l3
 xKzEfAw5z7MT56nGqiPzG3eGo/+VC70J2nX50ZseN7p+ypFd85GHBJteWjESXIp5T3BybLlGCT
 P6M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKM32KYVz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206702; x=1653798703; bh=iqo29NHyqencjmQOv3
 DpvMvxEfylQwEtGMdtA8kWGJo=; b=SYWgmZZ7Zd+BOVaucLd/7ndfiSeDxV60lk
 HCIoPRSyGGGwzcp37DgQhnwzHvODuwVgEWtLkF2YAJNp5ksnST0ObxSTS9sOYton
 5VGAVHE5viy6RuED813oorz5/9uzP7Lf2yaEX+hMDBlJz1NCA/dSkWaUKSZl3BEd
 uUwv9TPIF4NKiGcGMjIA2NWB/zUW8MldLSWRubbLTThRUH+Di1kYTrbxFWPoJaHu
 yB1eLlhR5qDNkwTO6yXul3nDHfwo2ajPchZl/TlhOhBkh/a+FFCoe3ufuRYcriYX
 69rzYPl4M39cnhANLeaY/fttcefeMoVNNuo7pRsMzMY4ACYPcelA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7KQjF_XtKHMP for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKM01cbgz1Rvlc;
 Thu, 28 Apr 2022 21:31:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 03/25] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
Date: Fri, 29 Apr 2022 14:30:57 +1000
Message-Id: <20220429043119.1478881-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

Allow user to set core's marchid, mvendorid, mipid CSRs through
-cpu command line option.

The default values of marchid and mipid are built with QEMU's version
numbers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220422040436.2233-1-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  4 ++++
 target/riscv/cpu.c |  9 +++++++++
 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c22d5d3b..46c66fbf8e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -393,6 +393,10 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
=20
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mipid;
+
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c774056c5..ace68ed855 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
=20
 /* RISC-V CPU definitions */
=20
+#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
+                             (QEMU_VERSION_MINOR << 8)  | \
+                             (QEMU_VERSION_MICRO))
+#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
+
 static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
=20
 struct isa_ext_data {
@@ -810,6 +815,10 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
+    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6ba85e7b5d..1c2d3f7193 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -612,6 +612,36 @@ static RISCVException write_ignore(CPURISCVState *en=
v, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    *val =3D cpu->cfg.mvendorid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_marchid(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    *val =3D cpu->cfg.marchid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mipid(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    *val =3D cpu->cfg.mipid;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -3260,10 +3290,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_MINSTRETH] =3D { "minstreth", any32, read_instreth },
=20
     /* Machine Information Registers */
-    [CSR_MVENDORID] =3D { "mvendorid", any,   read_zero    },
-    [CSR_MARCHID]   =3D { "marchid",   any,   read_zero    },
-    [CSR_MIMPID]    =3D { "mimpid",    any,   read_zero    },
-    [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid },
+    [CSR_MVENDORID] =3D { "mvendorid", any,   read_mvendorid },
+    [CSR_MARCHID]   =3D { "marchid",   any,   read_marchid   },
+    [CSR_MIMPID]    =3D { "mimpid",    any,   read_mipid     },
+    [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid   },
=20
     [CSR_MCONFIGPTR]  =3D { "mconfigptr", any,   read_zero,
                                         .min_priv_ver =3D PRIV_VERSION_1=
_12_0 },
--=20
2.35.1


