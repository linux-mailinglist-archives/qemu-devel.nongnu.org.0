Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC920BC50
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 00:17:15 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joweo-0007Hu-CG
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 18:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowIh-0003fu-3d
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:54:23 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:52693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowId-0002yn-6P
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593208460; x=1624744460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0nR+vyHWNRwVemIwrzzbEdRPbL5PN//Hwr593bK8IyM=;
 b=GAxpKOWqxogYeQgaMzYOt1uzbpM0FQjZXwU2xM6atFrGfpEbRh0K1CFg
 Kz1dveqF+DoKFx7YJLWT0nxEloIJnLWvU5i5q2CE43M1zixPHY3AynWF/
 p/Js2fvDfc7tLQsq2ZGC7BLYvzDY3YH/iPRKJFINqpF9VlFsq4IscBs+v
 h1/0/PtMe6S1ZmCaDB9RCuA1yc8Ilh3yq5Lme5SBYCZSVjWEj2VFBPO9q
 tLW1rnkrckB2AyC5RgHZdMUT5qWyHSPexctTB4w67Fb5BbR5pxpnBvFVr
 jY+cqT2UWKKDqZwTENUmtvIJMsRNc89qwf1+eiEuOBHBStQEAioR4taqc Q==;
IronPort-SDR: kj5z5TbPmVAMGidHxqVRp3yy0c9lSkwpwd6ydRdjUS7u7c+WgsQe1JqGAaEbbWD/iur5WaleKK
 2TIW3XI4f8z6wSMQlaSk8HxxQ4yIzD5ohiGv51mXBo4O8w5fXfZp45FQLzcmruw7FiO2lTScCc
 Z+wMRWBknHO5qZU5OgsjBkfr/50mXHEhDK4tt5pphameHQv5hASN9QMkbSItC/9Bx05fNj24iU
 ZipvFCo4MU0Z+pJZX8M59Ni5whDfaEgPyPFhIrrGA8tzTK65/uAEcwKBt+XZUH7qo9KVeZ3ZbZ
 9GE=
X-IronPort-AV: E=Sophos;i="5.75,285,1589212800"; d="scan'208";a="145360042"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2020 05:53:44 +0800
IronPort-SDR: 2F91I4SxIybyJHrVP5/9yaMcqbAWIXBmnsBsBeUpvMHBARebFHdnlkemuK9ta6exO9IXrMv3TF
 /Hxd688ntlxRhesDXGSe2+3PpcVS1G50U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 14:42:41 -0700
IronPort-SDR: YKnk7BmbMZvnL24Ys0XUsmJbnXTdCGGLK9d0DzIV2XZgiaWDn8jI2/AgoQbjxyW28aZeuIMD3q
 gmqgi3O4lDdw==
WDCIronportException: Internal
Received: from 2hc7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.206])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Jun 2020 14:53:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 31/63] target/riscv: vector narrowing fixed-point clip
 instructions
Date: Fri, 26 Jun 2020 14:43:38 -0700
Message-Id: <20200626214410.3613258-32-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626214410.3613258-1-alistair.francis@wdc.com>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=439617756=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 17:53:34
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200623215920.2594-30-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  13 +++
 target/riscv/insn32.decode              |   6 +
 target/riscv/insn_trans/trans_rvv.inc.c |   8 ++
 target/riscv/vector_helper.c            | 141 ++++++++++++++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 78438f1ad6..5fa4330200 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -790,3 +790,16 @@ DEF_HELPER_6(vssra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vnclip_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d5dfeb5c7..78e6da6205 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -439,6 +439,12 @@ vssrl_vi        101010 . ..... ..... 011 ..... 1010111 @r_vm
 vssra_vv        101011 . ..... ..... 000 ..... 1010111 @r_vm
 vssra_vx        101011 . ..... ..... 100 ..... 1010111 @r_vm
 vssra_vi        101011 . ..... ..... 011 ..... 1010111 @r_vm
+vnclipu_vv      101110 . ..... ..... 000 ..... 1010111 @r_vm
+vnclipu_vx      101110 . ..... ..... 100 ..... 1010111 @r_vm
+vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
+vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
+vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
+vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 31be40f4ba..b9d29f4051 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1775,3 +1775,11 @@ GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
 GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
 GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
+
+/* Vector Narrowing Fixed-Point Clip Instructions */
+GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
+GEN_OPIVV_NARROW_TRANS(vnclip_vv)
+GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
+GEN_OPIVX_NARROW_TRANS(vnclip_vx)
+GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
+GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b22651d7d5..64e26085ef 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -875,6 +875,12 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 #define WOP_SSU_B int16_t, int8_t, uint8_t, int16_t, uint16_t
 #define WOP_SSU_H int32_t, int16_t, uint16_t, int32_t, uint32_t
 #define WOP_SSU_W int64_t, int32_t, uint32_t, int64_t, uint64_t
+#define NOP_SSS_B int8_t, int8_t, int16_t, int8_t, int16_t
+#define NOP_SSS_H int16_t, int16_t, int32_t, int16_t, int32_t
+#define NOP_SSS_W int32_t, int32_t, int64_t, int32_t, int64_t
+#define NOP_UUU_B uint8_t, uint8_t, uint16_t, uint8_t, uint16_t
+#define NOP_UUU_H uint16_t, uint16_t, uint32_t, uint16_t, uint32_t
+#define NOP_UUU_W uint32_t, uint32_t, uint64_t, uint32_t, uint64_t
 
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
@@ -3009,6 +3015,7 @@ vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
     res   = (a >> shift)  + round;
     return res;
 }
+
 RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, H1, vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
@@ -3026,3 +3033,137 @@ GEN_VEXT_VX_RM(vssra_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vssra_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssra_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssra_vx_d, 8, 8, clearq)
+
+/* Vector Narrowing Fixed-Point Clip Instructions */
+static inline int8_t
+vnclip8(CPURISCVState *env, int vxrm, int16_t a, int8_t b)
+{
+    uint8_t round, shift = b & 0xf;
+    int16_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT8_MAX) {
+        env->vxsat = 0x1;
+        return INT8_MAX;
+    } else if (res < INT8_MIN) {
+        env->vxsat = 0x1;
+        return INT8_MIN;
+    } else {
+        return res;
+    }
+}
+
+static inline int16_t
+vnclip16(CPURISCVState *env, int vxrm, int32_t a, int16_t b)
+{
+    uint8_t round, shift = b & 0x1f;
+    int32_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT16_MAX) {
+        env->vxsat = 0x1;
+        return INT16_MAX;
+    } else if (res < INT16_MIN) {
+        env->vxsat = 0x1;
+        return INT16_MIN;
+    } else {
+        return res;
+    }
+}
+
+static inline int32_t
+vnclip32(CPURISCVState *env, int vxrm, int64_t a, int32_t b)
+{
+    uint8_t round, shift = b & 0x3f;
+    int64_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT32_MAX) {
+        env->vxsat = 0x1;
+        return INT32_MAX;
+    } else if (res < INT32_MIN) {
+        env->vxsat = 0x1;
+        return INT32_MIN;
+    } else {
+        return res;
+    }
+}
+
+RVVCALL(OPIVV2_RM, vnclip_vv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
+RVVCALL(OPIVV2_RM, vnclip_vv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
+RVVCALL(OPIVV2_RM, vnclip_vv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
+GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4, clearl)
+
+RVVCALL(OPIVX2_RM, vnclip_vx_b, NOP_SSS_B, H1, H2, vnclip8)
+RVVCALL(OPIVX2_RM, vnclip_vx_h, NOP_SSS_H, H2, H4, vnclip16)
+RVVCALL(OPIVX2_RM, vnclip_vx_w, NOP_SSS_W, H4, H8, vnclip32)
+GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4, clearl)
+
+static inline uint8_t
+vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
+{
+    uint8_t round, shift = b & 0xf;
+    uint16_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT8_MAX) {
+        env->vxsat = 0x1;
+        return UINT8_MAX;
+    } else {
+        return res;
+    }
+}
+
+static inline uint16_t
+vnclipu16(CPURISCVState *env, int vxrm, uint32_t a, uint16_t b)
+{
+    uint8_t round, shift = b & 0x1f;
+    uint32_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT16_MAX) {
+        env->vxsat = 0x1;
+        return UINT16_MAX;
+    } else {
+        return res;
+    }
+}
+
+static inline uint32_t
+vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
+{
+    uint8_t round, shift = b & 0x3f;
+    int64_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT32_MAX) {
+        env->vxsat = 0x1;
+        return UINT32_MAX;
+    } else {
+        return res;
+    }
+}
+
+RVVCALL(OPIVV2_RM, vnclipu_vv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
+RVVCALL(OPIVV2_RM, vnclipu_vv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
+RVVCALL(OPIVV2_RM, vnclipu_vv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
+GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4, clearl)
+
+RVVCALL(OPIVX2_RM, vnclipu_vx_b, NOP_UUU_B, H1, H2, vnclipu8)
+RVVCALL(OPIVX2_RM, vnclipu_vx_h, NOP_UUU_H, H2, H4, vnclipu16)
+RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
+GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
-- 
2.27.0


