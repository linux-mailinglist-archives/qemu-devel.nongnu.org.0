Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C50514191
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:51:17 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIb6-00081I-B9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJ8-0008ER-J5
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:42 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJ4-0002Vn-SL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206758; x=1682742758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XRcETipoEeaGvOleUbCzSy0CY6kmfZEXRVQWlUGGfMM=;
 b=dMCNMJpyyWR1amzD611bxjgaZMD+1gjZR24s2eRJ6rlCUa6xGHEFaa4x
 fdly13hA6cunUVppgWIDqbHeW6aTzBUgclBtCIHQVKFY5dmiv9PvzBq1a
 cFNr2Td28LnRHJheqo5AlyjktduGWucfTcNI+3o8dahO9/6hgxU+yQG/l
 FUHOtid+ngtCQT7arHVHA4F+L+81UPCtq1rV3WsXQWulWTJsh1U1m3ok5
 aTYO9ibtBN+g03HbTRsW980j1xE7y2SqcOqL5S/TzgPZ4/jl3Fjioyt9x
 GvfIDeMWkTiB34ctGAWJwodCcwhXvMRnApI0gVNbw+nk+38c9lu9ywLGS A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995966"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:26 +0800
IronPort-SDR: MleA+bOFaXhaJ35+SQD556tj7iKSgpnf01dUfNk1Tylxu4PgpTDLYEDRcplHC/IDzwWlmN3CBd
 9TPuOx5g/8jORKlHqp4MdjM8sVOj2fL0m/kZ2nUDhMcuTrxlBgygHEj0NZIYWW22qgL2qPE5W/
 HAe62XBQBBpL+YW0AchynDZVix97ni3Qkq1f3VJtgYw6bSbcWMGuumfsyFZ2iSEItVucQ8XxTw
 c9FrG/PmnOMqrEnYfhcSg0oejZUSqFnDGU+l7imbkL+dcEFSdDQQVGB+BKXz3cIqjVnKf2jWQl
 +IAPDg+YUeSoPItt7Zp4ZPc+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:36 -0700
IronPort-SDR: L+h9/6SCRSn4W1NywTkj0S+/Om15mkm2OkvieXHSQEKylPeWBTY48S8AgEiZQPoRk4zDI6bIe+
 tp4YAaBbUuNH8xsf6D/mLc19xWIuTpF1P5Ky4oJXG9GnFJNsgoep5YcLpo0YtCy56BgeQf9q38
 0s8T0fFLM3LR25wJckDHOzy2kMbWhvyI1ury1apvcdNT44UDz55JAdBlZBPGEfeMkrq/c1Jn2F
 K2zq3gCZLtUCQYaJQL2nvgKJBd3XQWae1nZtM4074X9wyDgnsDWb4zpFxYt7+UEP+PMRC+tivY
 yZ4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMv56Xdz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206746; x=1653798747; bh=XRcETipoEeaGvOleUb
 CzSy0CY6kmfZEXRVQWlUGGfMM=; b=RNlmTgdmRzT4hWRHXLsatUZshypwszVsxC
 n0fLvZxPk+3EsbqnZ2S+sRlBDRwYTs15ih9k1SYNgv+o/bMKMMtnEUAT0jyZmIDe
 VMIhyhsmc0T8IiugSx9B6zCBXWC2owE1rhq85xz6Q/HLvvdou8RIoKeyFR/Qi0iH
 oaI9UYiznVarBNKodnTvnFnmnFBi2CSCOrKrc9swqEQhBM3davoq3lyMbJTxl5tM
 ad3M/uHqWTjvpg+ymHFrLxqjJ+oyUz2PG4u6O5Uqh8ED7/P64L2Mf8TMpf9lA2/t
 Gpz/xuEvStKep4edEkqAiUffUKabbvLYibjH78f8vQA7vwAl/rHg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 87FgEoPAWEKJ for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMq56Gcz1Rwrw;
 Thu, 28 Apr 2022 21:32:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Ruibo Lu <luruibo2000@163.com>, Zewen Ye <lustrew@foxmail.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/25] target/riscv: rvk: add CSR support for Zkr
Date: Fri, 29 Apr 2022 14:31:09 +1000
Message-Id: <20220429043119.1478881-16-alistair.francis@opensource.wdc.com>
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - add SEED CSR which must be accessed with a read-write instruction:
   A read-only instruction such as CSRRS/CSRRC with rs1=3Dx0 or CSRRSI/CS=
RRCI
with uimm=3D0 will raise an illegal instruction exception.
 - add USEED, SSEED fields for MSECCFG CSR

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-13-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h  |  9 +++++
 target/riscv/pmp.h       |  8 ++--
 target/riscv/csr.c       | 80 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/op_helper.c |  9 +++++
 4 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4a9e4f7d09..4d04b20d06 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -458,6 +458,9 @@
 #define CSR_VSPMMASK        0x2c1
 #define CSR_VSPMBASE        0x2c2
=20
+/* Crypto Extension */
+#define CSR_SEED            0x015
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -800,4 +803,10 @@ typedef enum RISCVException {
 #define HVICTL_VALID_MASK                  \
     (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
=20
+/* seed CSR bits */
+#define SEED_OPST                        (0b11 << 30)
+#define SEED_OPST_BIST                   (0b00 << 30)
+#define SEED_OPST_WAIT                   (0b01 << 30)
+#define SEED_OPST_ES16                   (0b10 << 30)
+#define SEED_OPST_DEAD                   (0b11 << 30)
 #endif
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index fcb6b7c467..a8dd797476 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -39,9 +39,11 @@ typedef enum {
 } pmp_am_t;
=20
 typedef enum {
-    MSECCFG_MML  =3D 1 << 0,
-    MSECCFG_MMWP =3D 1 << 1,
-    MSECCFG_RLB  =3D 1 << 2
+    MSECCFG_MML   =3D 1 << 0,
+    MSECCFG_MMWP  =3D 1 << 1,
+    MSECCFG_RLB   =3D 1 << 2,
+    MSECCFG_USEED =3D 1 << 8,
+    MSECCFG_SSEED =3D 1 << 9
 } mseccfg_field_t;
=20
 typedef struct {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1c2d3f7193..3500e07f92 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -24,6 +24,8 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpu-timers.h"
+#include "qemu/guest-random.h"
+#include "qapi/error.h"
=20
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
@@ -301,6 +303,46 @@ static RISCVException debug(CPURISCVState *env, int =
csrno)
 }
 #endif
=20
+static RISCVException seed(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu =3D env_archcpu(env);
+
+    if (!cpu->cfg.ext_zkr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * With a CSR read-write instruction:
+     * 1) The seed CSR is always available in machine mode as normal.
+     * 2) Attempted access to seed from virtual modes VS and VU always r=
aises
+     * an exception(virtual instruction exception only if mseccfg.sseed=3D=
1).
+     * 3) Without the corresponding access control bit set to 1, any att=
empted
+     * access to seed from U, S or HS modes will raise an illegal instru=
ction
+     * exception.
+     */
+    if (env->priv =3D=3D PRV_M) {
+        return RISCV_EXCP_NONE;
+    } else if (riscv_cpu_virt_enabled(env)) {
+        if (env->mseccfg & MSECCFG_SSEED) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    } else {
+        if (env->priv =3D=3D PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
+            return RISCV_EXCP_NONE;
+        } else if (env->priv =3D=3D PRV_U && (env->mseccfg & MSECCFG_USE=
ED)) {
+            return RISCV_EXCP_NONE;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+#else
+    return RISCV_EXCP_NONE;
+#endif
+}
+
 /* User Floating-Point CSRs */
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
@@ -3044,6 +3086,41 @@ static RISCVException write_upmbase(CPURISCVState =
*env, int csrno,
=20
 #endif
=20
+/* Crypto Extension */
+static RISCVException rmw_seed(CPURISCVState *env, int csrno,
+                               target_ulong *ret_value,
+                               target_ulong new_value,
+                               target_ulong write_mask)
+{
+    uint16_t random_v;
+    Error *random_e =3D NULL;
+    int random_r;
+    target_ulong rval;
+
+    random_r =3D qemu_guest_getrandom(&random_v, 2, &random_e);
+    if (unlikely(random_r < 0)) {
+        /*
+         * Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return a
+         * failure indication to the guest.  There is no reason
+         * we know to expect the failure to be transitory, so
+         * indicate DEAD to avoid having the guest spin on WAIT.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      __func__, error_get_pretty(random_e));
+        error_free(random_e);
+        rval =3D SEED_OPST_DEAD;
+    } else {
+        rval =3D random_v | SEED_OPST_ES16;
+    }
+
+    if (ret_value) {
+        *ret_value =3D rval;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -3282,6 +3359,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_TIME]  =3D { "time",  ctr,   read_time  },
     [CSR_TIMEH] =3D { "timeh", ctr32, read_timeh },
=20
+    /* Crypto Extension */
+    [CSR_SEED] =3D { "seed", seed, NULL, NULL, rmw_seed },
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    =3D { "mcycle",    any,   read_instret  },
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index df35736883..09f1f5185d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint32=
_t exception)
=20
 target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
+    /*
+     * The seed CSR must be accessed with a read-write instruction. A
+     * read-only instruction such as CSRRS/CSRRC with rs1=3Dx0 or CSRRSI=
/
+     * CSRRCI with uimm=3D0 will raise an illegal instruction exception.
+     */
+    if (csr =3D=3D CSR_SEED) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong val =3D 0;
     RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0);
=20
--=20
2.35.1


