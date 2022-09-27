Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DC5EBAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:51:55 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4Rd-0004a7-EZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47p-00053R-6V
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47n-0001F1-56
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260283; x=1695796283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTxemXnZbcn8GfTEOjD2bvRM5CcWr0Uc+73Is0/SJyo=;
 b=iN3TO6TZcCb9J3ft3IzGFcgmyfVlEXP+kMXkfTxpWAKk1UHDae73b0tT
 JEXcdPs90AyM6ehPXAD3YzMpFMN91klCLkfS3FIGFKclwYOm31xfj+pyH
 NhI8Rt0DceH8HaWO4T3iKuB1FGnY6zkY18mTEKBJcfNnxz8qM791u+KnF
 ab6FyIgLpsHcYB5FO5oNCW6P2NTr4mVkKZL9wqCcW1zEkalAGBNSRrsNo
 Go8ocTyX4iqNEiPA3qx46n5N7NuARzXzCD5Hm1LnQ35geEX571ktD1L7Z
 Xrq8a5eK8mLWK7fJ1VdRdthjbidmjrHZ3Q5/mOEojHE7/d2WjMoUMtg8n Q==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530825"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:19 +0800
IronPort-SDR: Pp3+fHs++2SHWxF4hzaGDx9rXkpvsF/QzTq8KzrF4kwI/u6f2bGllBHZzbUrGQPwUlSwZE7Oef
 cFQs7e9ayM9B2A7f0zTRvo8OZzMB1x17pxMC1G03qwVxfY6KmACG/KueN8cFYG+p5VZeNzxrfR
 0DIJZjPy+oeb2N7/T9sgNoi5egzNiUX/WO74o/nB6sRarLGYsPCQTMR0Fr5NigPw1ECsBlkL+k
 KTz0ep6s0nIgfINILRsvoKtf8IHOWbHEDCYGSOL3N6PCXYLtl0EAsUkMS7nH7uUelOB1yBO4lF
 cl5M8itIgWKgmCvR6De6RJCG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:16 -0700
IronPort-SDR: 2ZI+AaLVctr/qvrb16+yl93U5qgAbt9EIkZ2aMgfXKaTd4p0FlcaE+DXy3NV35Z2JDZX03gCB/
 FSW+SD7+2dUwtkkeeT7Zl9sXS1AsU57ndyVtmTjlX7+SeTqAPB1x9SjDo9jNy7fXH/9SyxTWZ5
 8oabWp3XEMEslMT90oqGQQBWLb4lsfHNrFzDyRL9HDfXVjR4b0Qv+VuPVEB83/1lNCdDAGZO0n
 A8BePkcpfdqum71d8APqOwUdEwTL+E8IHAGgbqNbDg0ntu7m5PJQ1vOlF0wmABU45esS1RpFHF
 1k0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sM1Cv0z1RvTr
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260278; x=1666852279; bh=LTxemXnZbcn8GfTEOj
 D2bvRM5CcWr0Uc+73Is0/SJyo=; b=DwuOphu9yMfLEfQlNa86aRZQP0wNzidGFj
 6GZt51MVQbRQk1nR8RttvDzyrkExcFz0KJwTZbC5Fq2V5H/zUeCaR+ashxA7pjDx
 xhzGUzqB6sufbZZUxKuovnHCd9HQ25rs/iniPIq3UAN3HVc9yjt5NflmpB7kf2t3
 6qCZW8jRJEZAYe3wbn3O2Cm3PYj3kV2CABbjL7MAf0xSL2PGzePmvCrwCI8cIdal
 Xr9bum6uoSV2da4bvAR1Bj63UDj8bzopF6HkQfTS8nO+4PhLe9l3avBicqaUykfa
 oyCVIXxx+nC3Cjcy5pACdei4AILAL24a8yzBGgNK32vLW5JhC0sg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2PdJvsxZJAHM for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:18 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sK447Wz1RvTp;
 Mon, 26 Sep 2022 23:31:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Burgess <aburgess@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 06/22] target/riscv: remove fflags, frm,
 and fcsr from riscv-*-fpu.xml
Date: Tue, 27 Sep 2022 16:30:48 +1000
Message-Id: <20220927063104.2846825-7-alistair.francis@opensource.wdc.com>
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

From: Andrew Burgess <aburgess@redhat.com>

While testing some changes to GDB's handling for the RISC-V registers
fcsr, fflags, and frm, I spotted that QEMU includes these registers
twice in the target description it sends to GDB, once in the fpu
feature, and once in the csr feature.

Right now things basically work OK, QEMU maps these registers onto two
different register numbers, e.g. fcsr maps to both 68 and 73, and GDB
can use either of these to access the register.

However, GDB's target descriptions don't really work this way, each
register should appear just once in a target description, mapping the
register name onto the number GDB should use when accessing the
register on the target.  Duplicate register names actually result in
duplicate registers on the GDB side, however, as the registers have
the same name, the user can only access one of these registers.

Currently GDB has a hack in place, specifically for RISC-V, to spot
the duplicate copies of these three registers, and hide them from the
user, ensuring the user only ever sees a single copy of each.

In this commit I propose fixing this issue on the QEMU side, and in
the process, simplify the fpu register handling a little.

I think we should, remove fflags, frm, and fcsr from the two (32-bit
and 64-bit) fpu feature xml files.  These files will only contain the
32 core floating point register f0 to f31.  The fflags, frm, and fcsr
registers will continue to be advertised in the csr feature as they
currently are.

With that change made, I will simplify riscv_gdb_get_fpu and
riscv_gdb_set_fpu, removing the extra handling for the 3 status
registers.

Signed-off-by: Andrew Burgess <aburgess@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <0fbf2a5b12e3210ff3867d5cf7022b3f3462c9c8.1661934573.git.abur=
gess@redhat.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/gdbstub.c      | 32 ++------------------------------
 gdb-xml/riscv-32bit-fpu.xml |  4 ----
 gdb-xml/riscv-64bit-fpu.xml |  4 ----
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..9974b7aac6 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -114,20 +114,6 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GBy=
teArray *buf, int n)
         if (env->misa_ext & RVF) {
             return gdb_get_reg32(buf, env->fpr[n]);
         }
-    /* there is hole between ft11 and fflags in fpu.xml */
-    } else if (n < 36 && n > 32) {
-        target_ulong val =3D 0;
-        int result;
-        /*
-         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is =
FP
-         * register 33, so we recalculate the map index.
-         * This also works for CSR_FRM and CSR_FCSR.
-         */
-        result =3D riscv_csrrw_debug(env, n - 32, &val,
-                                   0, 0);
-        if (result =3D=3D RISCV_EXCP_NONE) {
-            return gdb_get_regl(buf, val);
-        }
     }
     return 0;
 }
@@ -137,20 +123,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uin=
t8_t *mem_buf, int n)
     if (n < 32) {
         env->fpr[n] =3D ldq_p(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
-    /* there is hole between ft11 and fflags in fpu.xml */
-    } else if (n < 36 && n > 32) {
-        target_ulong val =3D ldtul_p(mem_buf);
-        int result;
-        /*
-         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is =
FP
-         * register 33, so we recalculate the map index.
-         * This also works for CSR_FRM and CSR_FCSR.
-         */
-        result =3D riscv_csrrw_debug(env, n - 32, NULL,
-                                   val, -1);
-        if (result =3D=3D RISCV_EXCP_NONE) {
-            return sizeof(target_ulong);
-        }
     }
     return 0;
 }
@@ -404,10 +376,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
     CPURISCVState *env =3D &cpu->env;
     if (env->misa_ext & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
-                                 36, "riscv-64bit-fpu.xml", 0);
+                                 32, "riscv-64bit-fpu.xml", 0);
     } else if (env->misa_ext & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
-                                 36, "riscv-32bit-fpu.xml", 0);
+                                 32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
         gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set=
_vector,
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 1eaae9119e..84a44ba8df 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -43,8 +43,4 @@
   <reg name=3D"ft9" bitsize=3D"32" type=3D"ieee_single"/>
   <reg name=3D"ft10" bitsize=3D"32" type=3D"ieee_single"/>
   <reg name=3D"ft11" bitsize=3D"32" type=3D"ieee_single"/>
-
-  <reg name=3D"fflags" bitsize=3D"32" type=3D"int" regnum=3D"66"/>
-  <reg name=3D"frm" bitsize=3D"32" type=3D"int" regnum=3D"67"/>
-  <reg name=3D"fcsr" bitsize=3D"32" type=3D"int" regnum=3D"68"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
index 794854cc01..9856a9d1d3 100644
--- a/gdb-xml/riscv-64bit-fpu.xml
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -49,8 +49,4 @@
   <reg name=3D"ft9" bitsize=3D"64" type=3D"riscv_double"/>
   <reg name=3D"ft10" bitsize=3D"64" type=3D"riscv_double"/>
   <reg name=3D"ft11" bitsize=3D"64" type=3D"riscv_double"/>
-
-  <reg name=3D"fflags" bitsize=3D"32" type=3D"int" regnum=3D"66"/>
-  <reg name=3D"frm" bitsize=3D"32" type=3D"int" regnum=3D"67"/>
-  <reg name=3D"fcsr" bitsize=3D"32" type=3D"int" regnum=3D"68"/>
 </feature>
--=20
2.37.3


