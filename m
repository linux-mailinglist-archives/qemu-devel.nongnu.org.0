Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0E5E72C6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:18:34 +0200 (CEST)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba93-0001Ky-M2
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyN-0001ek-56
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:31 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyL-0005cr-92
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906049; x=1695442049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTxemXnZbcn8GfTEOjD2bvRM5CcWr0Uc+73Is0/SJyo=;
 b=n6A2gubvsouLqbDpYixhIJrCZp/7MZqJIxeLqLa0aQuMyPoZ/Nj8fVOS
 dWlZpnsWur7mYZiovZjGVMbdotV2ex6uNXwH2sxdBtE1PTcr02Rb2aSrn
 FcHw1KvA+OuucJDIyRxOeOtRHTdTzpLJuJy2S+1DOBsgOhTj482cukqsC
 QkyVNExY6Gs21F1xSzSG0CwVJJL/d75SU90cpnFno6ne5hhJ4mS5Is2Q5
 9CFNTaWNgp18JvsOcxp2vkFi4vEm20Lxz6X6Q+glrwcO5Ks63eVrbeeUl
 WE2qANPh+16bTOPrgRxccq5nliosZ7myobF5OHFXJZisj2q/vI5FW/DjM A==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510468"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:28 +0800
IronPort-SDR: P4KY7srVABo/E2k9a8+O36WviIE7kSChk23JXdwbu+QhQ4bRfUwCbNLXd2AuswE5frP7WZBiPZ
 EMkbPedmjP+0ProTa5N/cQRTzCGSEaRQvar/Ow0JJGYkZ9V+uyoVM5hLj/KcMXmiCwqSOOdO58
 JTJrZV2yOORo9hliPZlFRTJ0aPJ5FeR1YwUd4uihb/KIiC4+ZaPos5/Sibg5yud/Zt3xURPr3X
 rpG0Qdj4bu7EyzQI5kuKB3KIjeK3oAlWwE8Gi0JcAGk54mqwf1d7jevgsbXTxnBBo2qnyqOATw
 0ls3EPEIHw5qjolxCk1vDt/n
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:30 -0700
IronPort-SDR: B84CXyIYKVPBjBR3B7YkMyWC1JQFMpIQEAFCPnks/Wnqu9Nvzqe6BlvTFwCwJKIw0Yt2X4gqw9
 4TlHZeE9BCuysKHa9g3LLqaDu2+ug007TzZVvNFdfQ/C3apRqXhiWOxQDF/wIgDahIuM9FYi0O
 J8v3jAVYedUIVH16LtcZqHJbo2MO7ItA4P2y2BftaNtRynAMmbsFEPCMpVBcvg4mlhzYEJkZXN
 MKLpHQykoRrd8PRUNQtMv+8ti3DKZTRkJLsByJ75YYZp5uLKBAvSZMi8NXFWhbejTlCPYDamzH
 lzY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsC4nF6z1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906047; x=1666498048; bh=LTxemXnZbcn8GfTEOj
 D2bvRM5CcWr0Uc+73Is0/SJyo=; b=RNDlINbh5fDbupNFDobRw2oG+xgBGyfNfl
 a2nX+QVXrASPkgVHyoBxZOZx0ioVf5HVLdHa8xy3cqB3cbPat4Mm7jlxS3qMExj5
 QzbpjAa3rVRSZDcbTu9BA2sxBQNiL/aK9XckMd1H34iBGDwxQGCvVsJJnzDjHUOI
 2ruQ2hNTfu1MYcaMablA/XxS3457oW7ne/v7U/87+SRnTfxbqiQL4t6QCdezEFMQ
 VHDr92V99aAD9DQDocPMYIJaZtNc6ZCLIrQoorps5+BMVYBZYNQgW+KLMKnvuZi2
 gEhjky6ruJlVy/gBewQ31vUEUq31+Z6cIEknWQc2kTxKweKJitjA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lqUlvRXibcvv for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYds84g9Qz1RvLy;
 Thu, 22 Sep 2022 21:07:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Burgess <aburgess@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/12] target/riscv: remove fflags, frm,
 and fcsr from riscv-*-fpu.xml
Date: Fri, 23 Sep 2022 14:06:58 +1000
Message-Id: <20220923040704.428285-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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


