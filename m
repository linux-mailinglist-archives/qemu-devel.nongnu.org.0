Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9624881DB
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:27:56 +0100 (CET)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65Cm-0004Vc-20
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:27:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ej-00013n-13
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eh-0006td-09
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621162; x=1673157162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CqGnTBMbhOYdBcfFS7J3/GQxqueJYSHI90AM7Y9WXag=;
 b=VETbkkDPt2MGQmaXN5jfO1E6ThhML2dadoxNatjlwGgRbPhISBrxSBoX
 hLips+tJhb3e+Q/DQXTvN91OUWXDbqRYdIXnxQtQZVyrqAyxnmwi1TqDH
 U5CQL8bIv2L0a/FH/YE/OtzHvqcXgRpN2Pd9h9hDiybxyU+G9MOiEYz1T
 AM5gwOkCPSej2UGPRoukR7LceHoRd/SUmmOM14sa9abFzqMumClD9O+d3
 eYVzC7cSYS+8D0+vxNujhRoC5dGCEdI5wRG8RekzuB6W2yQZ0atfewDJw
 hkpC8QkW0tOqeHGn2r5YJxVMYgj2tGDN2DLx7sY42BdfCpRx3fcOt6ZOR g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027393"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:42 +0800
IronPort-SDR: H46cE9brO1h+jBoDdAlrz9bYNm5A/mwOtWkr2yJ7aSO1vNq0u5QySpquNiYeGwC1/q0EOGIJQD
 Bex3/N7wuBevPB9hFAjxVlCVVJio0/WDw+dUCVbijt1HuCy2BVfOqhAXfG80FqPV54GLq4dwYO
 2ogfk7jUCghWZYXJEpy8AXHiZC3HrZbiEsTpzuRMajMS8gZ4sxyTxc8kBOIIjpBVyxWbUhh8i6
 ORxluoGA6Q65GM3wM0lPaT2tQn3Hkp2+s3KYMYNVUPjel8JSYYhHqS3YqZ0vR1EBxcJrAm9+rV
 y6DmpM4vmIGfDNatMMSBw9Bq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:08 -0800
IronPort-SDR: 0uX2os4oAGIDDjppRSqtKcPh4IJhNFXNRRISLyf2q2EvCdybIkIwhhVe02/zmvS0c2AclpgxD3
 pr1n5zUe3ZrlZ7MBHxCaC1mqkguBickGnjHiJmUJTjQjtKhmyi4/7+26MEW86dtmXfxCtfAO4a
 Ra94BiigvDGGLZbV9TvpaXe3jfo2f0D8rCwNyrQ4QesSdZ+8YTDHXahTpuVTdLjRvSiZHmx/O6
 AqfCBRs17TLyvPFcAFOz77qkpsn3wswJ89MYMr/Wdg0U6PZJyddGBi+mT8Gdumk/xZbb+FAinL
 +40=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:43 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Pk0N23z1VSkh
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621161; x=1644213162; bh=CqGnTBM
 bhOYdBcfFS7J3/GQxqueJYSHI90AM7Y9WXag=; b=Av9ZOaLBYR+rXUYYMu6CSSO
 5js+NQScoECZ90Aq0Sst/TXFZGTZvGsjmgN/ZP3raQDmqhMFcivqR1j8plvdGXI/
 TX0b1OZgYOmU00qX3UFeB3fOMFPSeNo1T1C30dk0be1LV/OwZFbHnPmBDyHRQjE7
 /t+kXjn1MUjfKaR/U3gWuP9onumNUgJGO5cRZvv4f4IepJwIdgwCrnHabEsaGSfb
 7DuxTp/D2sXgnNoWOYXbKA2m8LZLYRYNl0nHMzfmYIqwpJz/P8livi5BhnqsvQgw
 fj3uOqybLf0/xU2rd+9fJCSs51muL5S2DvwS0SC/QDyxoNI+8UOaxvCXV6RF9Hg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nIQkauIzE9ix for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:41 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Pf37Qqz1VSkW;
 Fri,  7 Jan 2022 21:52:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/37] target/riscv: array for the 64 upper bits of 128-bit
 registers
Date: Sat,  8 Jan 2022 15:50:33 +1000
Message-Id: <20220108055048.3512645-23-alistair.francis@opensource.wdc.com>
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

The upper 64-bit of the 128-bit registers have now a place inside
the cpu state structure, and are created as globals for future use.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-7-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  2 ++
 target/riscv/cpu.c       |  9 +++++++++
 target/riscv/machine.c   | 20 ++++++++++++++++++++
 target/riscv/translate.c |  5 ++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093..fa5d238530 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -112,6 +112,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
=20
 struct CPURISCVState {
     target_ulong gpr[32];
+    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
     uint64_t fpr[32]; /* assume both F and D extensions */
=20
     /* vector coprocessor state. */
@@ -344,6 +345,7 @@ static inline bool riscv_feature(CPURISCVState *env, =
int feature)
 #include "cpu_user.h"
=20
 extern const char * const riscv_int_regnames[];
+extern const char * const riscv_int_regnamesh[];
 extern const char * const riscv_fpr_regnames[];
=20
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ce21c1b5b1..1bd4a7c7aa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -42,6 +42,15 @@ const char * const riscv_int_regnames[] =3D {
   "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
=20
+const char * const riscv_int_regnamesh[] =3D {
+  "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0=
h",
+  "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a=
1h",
+  "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a=
7h",
+  "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s=
7h",
+  "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t=
4h",
+  "x30h/t5h",  "x31h/t6h"
+};
+
 const char * const riscv_fpr_regnames[] =3D {
   "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
   "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..8af9caabf5 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,6 +164,25 @@ static const VMStateDescription vmstate_pointermaski=
ng =3D {
     }
 };
=20
+static bool rv128_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return env->misa_mxl_max =3D=3D MXL_RV128;
+}
+
+static const VMStateDescription vmstate_rv128 =3D {
+    .name =3D "cpu/rv128",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D rv128_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .version_id =3D 3,
@@ -218,6 +237,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_rv128,
         NULL
     }
 };
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c3b4950ad0..6c400e8452 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "internals.h"
=20
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_pc, cpu_vl, cpu_vstart;
+static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -858,10 +858,13 @@ void riscv_translate_init(void)
      * unless you specifically block reads/writes to reg 0.
      */
     cpu_gpr[0] =3D NULL;
+    cpu_gprh[0] =3D NULL;
=20
     for (i =3D 1; i < 32; i++) {
         cpu_gpr[i] =3D tcg_global_mem_new(cpu_env,
             offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
+        cpu_gprh[i] =3D tcg_global_mem_new(cpu_env,
+            offsetof(CPURISCVState, gprh[i]), riscv_int_regnamesh[i]);
     }
=20
     for (i =3D 0; i < 32; i++) {
--=20
2.31.1


