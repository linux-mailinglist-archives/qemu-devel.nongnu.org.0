Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23247A450
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:23:56 +0100 (CET)
Received: from localhost ([::1]:38476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB9P-00011C-Um
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkt-0000FD-Uf
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:36 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkq-00086v-UM
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976312; x=1671512312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUOtc8P46KR80ym3sZaMyFDrSTO0R1yEgCKSXl9GaaU=;
 b=eqHzfJWDt+qrGw+ShPrpVlT/nplohgt7D0ZsFNzNzXZAdX51S8DW+qwt
 KnywPm6HRyhAcFhzxiEp9kYDfpsJAg/wm1sjF2tCcXW8UBKd7D0QvmdM6
 TEZhuSqgQ1nuy6+tSrgXU2pJ//pFpk9HWjpzcvjAMOBIb39x/pgDpJiL6
 G3yzU0qxYH8t4wWVGa4ZHcMzA5fZmDT+bmZYHNRnbxatN1oGhUwicby1O
 dLdHhfsDgZ6BEWZW2cwt2orgnN3i7xd06L6uOkq1Hk6z4w+LnMlUM/O0q
 p3FmLkd9Mc61uTLdWKhYxJ+4Wto0H5Ut3y0+Il1k2EJK+5A5BHYbffb5C Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661922"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:30 +0800
IronPort-SDR: f2q0GzE37VAOiaXO0csJ+iYJJ2M2AJTBFkExZ2VdKZhMC4H5dO+jlbIMqZXJB3UHECcX04gMQE
 nUjQGgqKZAnqguRbK41byIiasadV7h86ynO2MBTebPAbxp+EZZmOWMC9oW+3v6p8vp/c5CLcix
 32dx5lUBabtuoWBvHvyz4nrfDtlMdqwsE/b78qXDxHlWGr3dVCJ7QMiweAkIWsq2KNHmwEqkB2
 CU5hUHgfgW30Gzm05Ofh4qEzEpxVn0tY0jyXYywHsCQTjH2xPAEuOWeZDl1gocXt+W72fC0Hh3
 nOT/kBblt8qHkiteCQXZ4Egu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:20 -0800
IronPort-SDR: XTzpiVrT4nHV4DcreNtmWX9h4G4lVv+zY/1Ig+0pLONpUvSudAG6P1m47oEadCNqjsKsHoWEqm
 5oDP8TIHjEGLqAJbf7ajIfGSrWrx8rqwQTLJEc4mXRhttJUeW45wFO7F+vWkBXGBe8BdjfZnHU
 ZhBhWwmJUCEEwcFZfDuwKuYQY+cJeJmfbGIl4jKD/W1WLD8Drwd3fBTZrpAgwXZ6Quv+SVeMgT
 c7ohP9BEaJrtZsBHdWedqkv3BhlYBQ5BANlaxkfDdZSzJrGAEbhq3YyWPahZQZm3VxY+8nFswN
 u4E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5y3xpGz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976310; x=1642568311; bh=MUOtc8P46KR80ym3sZ
 aMyFDrSTO0R1yEgCKSXl9GaaU=; b=ALQcQdQGilfQLVCeubgQc/O1ng/w7rpH8b
 56UgUPDJvC87CxDDpZkcsCGN59GduyRDKoEmNDGNeppbXaM/wJlRC1wkLUB9bplj
 QeqlGcPDKp5FKriqk6N0e8fCxrsowE2ObCnXt2bSeVNoty5arcj4smpTHF6SgU5s
 jLhxAgW/wulC1ASgxzm3Y6TTBbRrp0LjoP8FBaa5vesJfU3CFea7270oSq0qGMS2
 DQ49Kixn499ZqUNHBs6Rywc1D7eji+gR3FFImE78QMaJssTv//2WZmQUCbhQJ8Wq
 zV/rmk2DZaNpXuI1wIeDtDZ/PWJPA7cwqI/Tq25l+anOVkUliV9w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CvmNawCT4uSA for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:30 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5t4dkVz1RvTg;
 Sun, 19 Dec 2021 20:58:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/88] target/riscv: rvv-1.0: add vcsr register
Date: Mon, 20 Dec 2021 14:55:54 +1000
Message-Id: <20211220045705.62174-18-alistair.francis@opensource.wdc.com>
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-10-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb62da7549..8dc6aa62c6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -60,9 +60,16 @@
 #define CSR_VSTART          0x008
 #define CSR_VXSAT           0x009
 #define CSR_VXRM            0x00a
+#define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
=20
+/* VCSR fields */
+#define VCSR_VXSAT_SHIFT    0
+#define VCSR_VXSAT          (0x1 << VCSR_VXSAT_SHIFT)
+#define VCSR_VXRM_SHIFT     1
+#define VCSR_VXRM           (0x3 << VCSR_VXRM_SHIFT)
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c522260986..832ccdcf33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -336,6 +336,22 @@ static RISCVException write_vstart(CPURISCVState *en=
v, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val =3D (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_=
SHIFT);
+    return RISCV_EXCP_NONE;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |=3D MSTATUS_VS;
+#endif
+    env->vxrm =3D (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat =3D (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return RISCV_EXCP_NONE;
+}
+
 /* User Timers and Counters */
 static RISCVException read_instret(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -1816,6 +1832,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_VSTART]   =3D { "vstart",   vs,     read_vstart,  write_vstart =
},
     [CSR_VXSAT]    =3D { "vxsat",    vs,     read_vxsat,   write_vxsat  =
},
     [CSR_VXRM]     =3D { "vxrm",     vs,     read_vxrm,    write_vxrm   =
},
+    [CSR_VCSR]     =3D { "vcsr",     vs,     read_vcsr,    write_vcsr   =
},
     [CSR_VL]       =3D { "vl",       vs,     read_vl                    =
},
     [CSR_VTYPE]    =3D { "vtype",    vs,     read_vtype                 =
},
     /* User Timers and Counters */
--=20
2.31.1


