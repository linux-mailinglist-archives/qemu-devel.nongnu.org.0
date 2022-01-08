Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80174881E3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:42:37 +0100 (CET)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65Qy-0004g5-Ju
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:42:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fc-0001qK-9A
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:40 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fZ-0006wZ-Op
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621216; x=1673157216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgTJYGcLNbWmYixLbqBHMCTqUhiJ+tfaD6BHdGWmS0U=;
 b=cvYlcn8vr61hOwx0XssyJzUBatknk9S9wHrt04LirDApLrlIf+nE8MBI
 IFYwwVYHW/bm4qkpVaMWdM7M8+T43Z2JxmAsEHTAmsMfjGblmjw/bDjsf
 cshi0kqLJGWdfX92AsHSQR7wCMaQhlITcnNaMoSTVX+S10mReT6RrYJKd
 /1mETXqb5hCsrLhjWfPIG0N5bMOf5hjd3pwjrLcIEhYdlak8JtJW7ORS5
 mctS3r/2fpzQPFSeB1n67ptrFxVRA1FCjIcDLK8koJiF5I3hP2OiFa/hJ
 cA6C2oJkX+m411X8Ve/+YPatc4zoLV/MSq/ZDwhICrnbQ7MYp3mROk6u9 Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984961"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:35 +0800
IronPort-SDR: nPpKSW3KSJ4PuxYPk6T5fGhn5vn24+MSkFyAxSE5s+I3nAqImtyPB0r3khQZIRUIUHtka59OyT
 KmQ01jytMwjVS+RxyL7hGRtCG8Rjpu3C6AuMPwlrHM2bl2V8wlmsAKR/jN12dH7jMNks8WMnMM
 LSSz75hAjoawAFtCkq7qHw2gkedYv7vDM6O8Ntq3/M4aqI6w4K9hB+lQbkn784YqN8ApWeTDWq
 mPKRwmOJ9UBis3yj3hBVTcuJFL1Ws4up2YFKu9WAJSmQz3yBnVgIHUHWSNCI7dTR2DRxw1Jl0E
 BE6azBOpgJQqDUCej7+489pu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:26:03 -0800
IronPort-SDR: GDZVpyS6mRMyHuBsdPKxuGSyW1n3FqLC8iY7b2N1hkvR2KZdliSwkpNlI5qkAGXFqPfEEeglwj
 mm+ZvG9byr35QrWATvOX1GqkrD+86ux8En4A74ybkkUQEPphLebx/JJEzeevc+2uyQo0qx+q5x
 UxTPs+RbXNjIlK3SxoFN6V5kU/xPJR8dj6SGtX44TRNleThOg+k4b5Pk9PGg1jO1SXrcIo3bOI
 2EDrWWJ9thGWBXlWIJN8WtscfbVbYZ25IP8yuk3zoKRtV7MZqNX2WrYmUh3tBYCUYLUcpaGnz+
 mHY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Qm503Fz1VSkW
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621215; x=1644213216; bh=vgTJYGc
 LNbWmYixLbqBHMCTqUhiJ+tfaD6BHdGWmS0U=; b=uoeTjSfqSMMMYWG0uIopFbq
 PGgyQSBkNXh2iOEAPUa5qLZaCwKkJ0AVdgXPmdDqH0t7o5QOLdabZOMUifN5ofiP
 PS8YFIWRiTblF777lxN8r1PgfB+cbFiYAodh46jpHNGszB1ov/6cQ19Udj4XGZFB
 oZuN3I9fqv/axEoYu4+7MauXOdML7V1H0vSwZqP6egrW83TS6j++IkLWvpai6z8+
 3A4zJ5jiU1NxV0wah/uVZqyq2z8HWUbM62mX/4X8BM/qVfWUKfbrI3yBoVg9WTuQ
 kQ/UjvUm/co5QjypqwWzQJDP7i9X6YGQg618vLHelGX528VvYt3fJbikfA6o5QQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DgSixW7MJPQL for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:35 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Qh23Zvz1VSkd;
 Fri,  7 Jan 2022 21:53:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/37] target/riscv: actual functions to realize crs 128-bit
 insns
Date: Sat,  8 Jan 2022 15:50:45 +1000
Message-Id: <20220108055048.3512645-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

The csrs are accessed through function pointers: we add 128-bit read
operations in the table for three csrs (writes fallback to the
64-bit version as the upper 64-bit information is handled elsewhere):
- misa, as mxl is needed for proper operation,
- mstatus and sstatus, to return sd
In addition, we also add read and write accesses to the machine and
supervisor scratch registers.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-19-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |   7 ++
 target/riscv/cpu_bits.h |   3 +
 target/riscv/csr.c      | 195 +++++++++++++++++++++++++++++++++-------
 3 files changed, 175 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 73d3d22f26..9ee01f761f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -505,12 +505,19 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env,=
 int csrno,
                                 Int128 *ret_value,
                                 Int128 new_value, Int128 write_mask);
=20
+typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int c=
srno,
+                                               Int128 *ret_value);
+typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int =
csrno,
+                                             Int128 new_value);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
     riscv_csr_read_fn read;
     riscv_csr_write_fn write;
     riscv_csr_op_fn op;
+    riscv_csr_read128_fn read128;
+    riscv_csr_write128_fn write128;
 } riscv_csr_operations;
=20
 /* CSR function table constants */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1e31f4d35f..5a6d49aa64 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -401,6 +401,7 @@
=20
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
+#define MSTATUSH128_SD      0x8000000000000000ULL
=20
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
@@ -423,6 +424,8 @@ typedef enum {
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
=20
+#define SSTATUS64_UXL       0x0000000300000000ULL
+
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
=20
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4c6a44c0b8..adb3d4381d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -481,7 +481,7 @@ static const target_ulong vs_delegable_excps =3D DELE=
GABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS | (target_ulong)SSTATUS64_UXL=
;
 static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP;
 static const target_ulong hip_writable_mask =3D MIP_VSSIP;
 static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |=
 MIP_VSEIP;
@@ -527,6 +527,8 @@ static uint64_t add_status_sd(RISCVMXL xl, uint64_t s=
tatus)
             return status | MSTATUS32_SD;
         case MXL_RV64:
             return status | MSTATUS64_SD;
+        case MXL_RV128:
+            return MSTATUSH128_SD;
         default:
             g_assert_not_reached();
         }
@@ -576,10 +578,11 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
=20
     mstatus =3D (mstatus & ~mask) | (val & mask);
=20
-    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
+    RISCVMXL xl =3D riscv_cpu_mxl(env);
+    if (xl > MXL_RV32) {
         /* SXL and UXL fields are for now read only */
-        mstatus =3D set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
-        mstatus =3D set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
+        mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
+        mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus =3D mstatus;
=20
@@ -608,6 +611,20 @@ static RISCVException write_mstatush(CPURISCVState *=
env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)
+{
+    *val =3D int128_make128(env->mstatus, add_status_sd(MXL_RV128, env->=
mstatus));
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_misa_i128(CPURISCVState *env, int csrno,
+                                     Int128 *val)
+{
+    *val =3D int128_make128(env->misa_ext, (uint64_t)MXL_RV128 << 62);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -765,6 +782,21 @@ static RISCVException write_mcounteren(CPURISCVState=
 *env, int csrno,
 }
=20
 /* Machine Trap Handling */
+static RISCVException read_mscratch_i128(CPURISCVState *env, int csrno,
+                                         Int128 *val)
+{
+    *val =3D int128_make128(env->mscratch, env->mscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mscratch_i128(CPURISCVState *env, int csrno,
+                                          Int128 val)
+{
+    env->mscratch =3D int128_getlo(val);
+    env->mscratchh =3D int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -844,6 +876,16 @@ static RISCVException rmw_mip(CPURISCVState *env, in=
t csrno,
 }
=20
 /* Supervisor Trap Setup */
+static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)
+{
+    uint64_t mask =3D sstatus_v1_10_mask;
+    uint64_t sstatus =3D env->mstatus & mask;
+
+    *val =3D int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -937,6 +979,21 @@ static RISCVException write_scounteren(CPURISCVState=
 *env, int csrno,
 }
=20
 /* Supervisor Trap Handling */
+static RISCVException read_sscratch_i128(CPURISCVState *env, int csrno,
+                                         Int128 *val)
+{
+    *val =3D int128_make128(env->sscratch, env->sscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sscratch_i128(CPURISCVState *env, int csrno,
+                                          Int128 val)
+{
+    env->sscratch =3D int128_getlo(val);
+    env->sscratchh =3D int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_sscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -1737,16 +1794,13 @@ static RISCVException write_upmbase(CPURISCVState=
 *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
=20
-RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
-                           target_ulong *ret_value,
-                           target_ulong new_value, target_ulong write_ma=
sk)
+static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
+                                               int csrno,
+                                               bool write_mask,
+                                               RISCVCPU *cpu)
 {
-    RISCVException ret;
-    target_ulong old_value;
-    RISCVCPU *cpu =3D env_archcpu(env);
-    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
-
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
+    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
=20
@@ -1778,10 +1832,17 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
     if (!csr_ops[csrno].predicate) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    ret =3D csr_ops[csrno].predicate(env, csrno);
-    if (ret !=3D RISCV_EXCP_NONE) {
-        return ret;
-    }
+
+    return csr_ops[csrno].predicate(env, csrno);
+}
+
+static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
+                                       target_ulong *ret_value,
+                                       target_ulong new_value,
+                                       target_ulong write_mask)
+{
+    RISCVException ret;
+    target_ulong old_value;
=20
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
@@ -1817,20 +1878,89 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
     return RISCV_EXCP_NONE;
 }
=20
-RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
-                               Int128 *ret_value,
-                               Int128 new_value, Int128 write_mask)
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_ma=
sk)
+{
+    RISCVCPU *cpu =3D env_archcpu(env);
+
+    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, cpu=
);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask=
);
+}
+
+static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
+                                        Int128 *ret_value,
+                                        Int128 new_value,
+                                        Int128 write_mask)
 {
-    /* fall back to 64-bit version for now */
-    target_ulong ret_64;
-    RISCVException ret =3D riscv_csrrw(env, csrno, &ret_64,
-                                     int128_getlo(new_value),
-                                     int128_getlo(write_mask));
+    RISCVException ret;
+    Int128 old_value;
+
+    /* read old value */
+    ret =3D csr_ops[csrno].read128(env, csrno, &old_value);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    /* write value if writable and write mask set, otherwise drop writes=
 */
+    if (int128_nz(write_mask)) {
+        new_value =3D int128_or(int128_and(old_value, int128_not(write_m=
ask)),
+                              int128_and(new_value, write_mask));
+        if (csr_ops[csrno].write128) {
+            ret =3D csr_ops[csrno].write128(env, csrno, new_value);
+            if (ret !=3D RISCV_EXCP_NONE) {
+                return ret;
+            }
+        } else if (csr_ops[csrno].write) {
+            /* avoids having to write wrappers for all registers */
+            ret =3D csr_ops[csrno].write(env, csrno, int128_getlo(new_va=
lue));
+            if (ret !=3D RISCV_EXCP_NONE) {
+                return ret;
+            }
+        }
+    }
=20
+    /* return old value */
     if (ret_value) {
-        *ret_value =3D int128_make64(ret_64);
+        *ret_value =3D old_value;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask)
+{
+    RISCVException ret;
+    RISCVCPU *cpu =3D env_archcpu(env);
+
+    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
     }
=20
+    if (csr_ops[csrno].read128) {
+        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write=
_mask);
+    }
+
+    /*
+     * Fall back to 64-bit version for now, if the 128-bit alternative i=
sn't
+     * at all defined.
+     * Note, some CSRs don't need to extend to MXLEN (64 upper bits non
+     * significant), for those, this fallback is correctly handling the =
accesses
+     */
+    target_ulong old_value;
+    ret =3D riscv_csrrw_do64(env, csrno, &old_value,
+                           int128_getlo(new_value),
+                           int128_getlo(write_mask));
+    if (ret =3D=3D RISCV_EXCP_NONE && ret_value) {
+        *ret_value =3D int128_make64(old_value);
+    }
     return ret;
 }
=20
@@ -1895,8 +2025,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid },
=20
     /* Machine Trap Setup */
-    [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus     },
-    [CSR_MISA]        =3D { "misa",       any,   read_misa,        write=
_misa        },
+    [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus, NULL,
+                                               read_mstatus_i128        =
           },
+    [CSR_MISA]        =3D { "misa",       any,   read_misa,        write=
_misa, NULL,
+                                               read_misa_i128           =
           },
     [CSR_MIDELEG]     =3D { "mideleg",    any,   read_mideleg,     write=
_mideleg     },
     [CSR_MEDELEG]     =3D { "medeleg",    any,   read_medeleg,     write=
_medeleg     },
     [CSR_MIE]         =3D { "mie",        any,   read_mie,         write=
_mie         },
@@ -1906,20 +2038,23 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_MSTATUSH]    =3D { "mstatush",   any32, read_mstatush,    write=
_mstatush    },
=20
     /* Machine Trap Handling */
-    [CSR_MSCRATCH] =3D { "mscratch", any,  read_mscratch, write_mscratch=
 },
+    [CSR_MSCRATCH] =3D { "mscratch", any,  read_mscratch,      write_msc=
ratch, NULL,
+                                         read_mscratch_i128, write_mscra=
tch_i128   },
     [CSR_MEPC]     =3D { "mepc",     any,  read_mepc,     write_mepc    =
 },
     [CSR_MCAUSE]   =3D { "mcause",   any,  read_mcause,   write_mcause  =
 },
     [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
     [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
=20
     /* Supervisor Trap Setup */
-    [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status    },
+    [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status, NULL,
+                                              read_sstatus_i128         =
        },
     [CSR_SIE]        =3D { "sie",        smode, read_sie,        write_s=
ie        },
     [CSR_STVEC]      =3D { "stvec",      smode, read_stvec,      write_s=
tvec      },
     [CSR_SCOUNTEREN] =3D { "scounteren", smode, read_scounteren, write_s=
counteren },
=20
     /* Supervisor Trap Handling */
-    [CSR_SSCRATCH] =3D { "sscratch", smode, read_sscratch, write_sscratc=
h },
+    [CSR_SSCRATCH] =3D { "sscratch", smode, read_sscratch, write_sscratc=
h, NULL,
+                                          read_sscratch_i128, write_sscr=
atch_i128  },
     [CSR_SEPC]     =3D { "sepc",     smode, read_sepc,     write_sepc   =
  },
     [CSR_SCAUSE]   =3D { "scause",   smode, read_scause,   write_scause =
  },
     [CSR_STVAL]    =3D { "stval",    smode, read_stval,   write_stval   =
},
--=20
2.31.1


