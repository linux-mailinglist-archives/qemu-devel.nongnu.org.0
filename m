Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AD658ADC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp5z-0000iT-12; Thu, 29 Dec 2022 04:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAp5e-0000e9-UQ
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAp5a-0001RW-Dn
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:40 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT6QGJ0011338; Thu, 29 Dec 2022 09:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ke5Y/zE7+LRZE2T1AS2NN+TQGmtCytDxNNS64y+D96U=;
 b=AiKqYZrt4TuQ5ihD6D3mR3vgq1VFv9Mip5MMsUdR6EJ2URZB7ozFIeD41qeo+25zsabq
 85PJ1HliIdPXqDpa7hvyzMQUG+SoAQ/0+DO3tRKS1Qj1OTyaF5cFx2+gUWj8WMsh5XG9
 ODRlQVod943u3YW71I2chIEw4dd8gPCqq22c2JjOOOQONOvCZ8Fy96td0ZplOexBPtgt
 MdNTvnmI+oMC/VmvDLNtfYhU0gLd+PBupWbuhKlGmSZWAZi/mW6lj7YzCIpOMK0oBybs
 URg1CrsU/FEaOqHcctsTSCN0xPF/I5DYGa5mgM+4FduUyMkxIzlLUa1w9jJTyqncMU2C jA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr5fubch2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:20:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BT9KZAq009855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:20:35 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 29 Dec 2022 01:20:32 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>, <laurent@vivier.eu>
CC: <bcain@quicinc.com>, <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH v2 2/2] target/hexagon: rename aliased register HEX_REG_P3_0
Date: Thu, 29 Dec 2022 14:50:06 +0530
Message-ID: <20221229092006.10709-3-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221229092006.10709-1-quic_mthiyaga@quicinc.com>
References: <20221229092006.10709-1-quic_mthiyaga@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HW1676Ppt6Id4N66sGR1WAKgUcrXDl_F
X-Proofpoint-ORIG-GUID: HW1676Ppt6Id4N66sGR1WAKgUcrXDl_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=942
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290077
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The patch renames the identifier of the 32bit register
HEX_REG_P3_0 to HEX_REG_P3_0_ALIASED.

This change is to intended to provide some warning that
HEX_REG_P3_0 is an aliased register which has multiple
representations in CPU state and therefore might require
special handling in some contexts. The hope is to prevent
accidental misuse of this register e.g the issue reported
for the signals tests failure [here][1].

[1]: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01102.html

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/cpu.c      |  6 +++---
 target/hexagon/genptr.c   | 12 ++++++------
 target/hexagon/hex_regs.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 658ca4ff78..807037c586 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -86,7 +86,7 @@ static target_ulong adjust_stack_ptrs(CPUHexagonState *env, target_ulong addr)
     return addr;
 }
 
-/* HEX_REG_P3_0 (aka C4) is an alias for the predicate registers */
+/* HEX_REG_P3_0_ALIASED (aka C4) is an alias for the predicate registers */
 static target_ulong read_p3_0(CPUHexagonState *env)
 {
     int32_t control_reg = 0;
@@ -102,7 +102,7 @@ static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
 {
     target_ulong value;
 
-    if (regnum == HEX_REG_P3_0) {
+    if (regnum == HEX_REG_P3_0_ALIASED) {
         value = read_p3_0(env);
     } else {
         value = regnum < 32 ? adjust_stack_ptrs(env, env->gpr[regnum])
@@ -198,7 +198,7 @@ static void hexagon_dump(CPUHexagonState *env, FILE *f, int flags)
     print_reg(f, env, HEX_REG_M0);
     print_reg(f, env, HEX_REG_M1);
     print_reg(f, env, HEX_REG_USR);
-    print_reg(f, env, HEX_REG_P3_0);
+    print_reg(f, env, HEX_REG_P3_0_ALIASED);
     print_reg(f, env, HEX_REG_GP);
     print_reg(f, env, HEX_REG_UGP);
     print_reg(f, env, HEX_REG_PC);
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6cf2e0ed43..66a968c884 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -163,7 +163,7 @@ static inline void gen_read_p3_0(TCGv control_reg)
 
 /*
  * Certain control registers require special handling on read
- *     HEX_REG_P3_0          aliased to the predicate registers
+ *     HEX_REG_P3_0_ALIASED  aliased to the predicate registers
  *                           -> concat the 4 predicate registers together
  *     HEX_REG_PC            actual value stored in DisasContext
  *                           -> assign from ctx->base.pc_next
@@ -173,7 +173,7 @@ static inline void gen_read_p3_0(TCGv control_reg)
 static inline void gen_read_ctrl_reg(DisasContext *ctx, const int reg_num,
                                      TCGv dest)
 {
-    if (reg_num == HEX_REG_P3_0) {
+    if (reg_num == HEX_REG_P3_0_ALIASED) {
         gen_read_p3_0(dest);
     } else if (reg_num == HEX_REG_PC) {
         tcg_gen_movi_tl(dest, ctx->base.pc_next);
@@ -194,7 +194,7 @@ static inline void gen_read_ctrl_reg(DisasContext *ctx, const int reg_num,
 static inline void gen_read_ctrl_reg_pair(DisasContext *ctx, const int reg_num,
                                           TCGv_i64 dest)
 {
-    if (reg_num == HEX_REG_P3_0) {
+    if (reg_num == HEX_REG_P3_0_ALIASED) {
         TCGv p3_0 = tcg_temp_new();
         gen_read_p3_0(p3_0);
         tcg_gen_concat_i32_i64(dest, p3_0, hex_gpr[reg_num + 1]);
@@ -238,7 +238,7 @@ static void gen_write_p3_0(DisasContext *ctx, TCGv control_reg)
 
 /*
  * Certain control registers require special handling on write
- *     HEX_REG_P3_0          aliased to the predicate registers
+ *     HEX_REG_P3_0_ALIASED  aliased to the predicate registers
  *                           -> break the value across 4 predicate registers
  *     HEX_REG_QEMU_*_CNT    changes in current TB in DisasContext
  *                            -> clear the changes
@@ -246,7 +246,7 @@ static void gen_write_p3_0(DisasContext *ctx, TCGv control_reg)
 static inline void gen_write_ctrl_reg(DisasContext *ctx, int reg_num,
                                       TCGv val)
 {
-    if (reg_num == HEX_REG_P3_0) {
+    if (reg_num == HEX_REG_P3_0_ALIASED) {
         gen_write_p3_0(ctx, val);
     } else {
         gen_log_reg_write(reg_num, val);
@@ -266,7 +266,7 @@ static inline void gen_write_ctrl_reg(DisasContext *ctx, int reg_num,
 static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
                                            TCGv_i64 val)
 {
-    if (reg_num == HEX_REG_P3_0) {
+    if (reg_num == HEX_REG_P3_0_ALIASED) {
         TCGv val32 = tcg_temp_new();
         tcg_gen_extrl_i64_i32(val32, val);
         gen_write_p3_0(ctx, val32);
diff --git a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h
index a63c2c0fd5..bddfc28021 100644
--- a/target/hexagon/hex_regs.h
+++ b/target/hexagon/hex_regs.h
@@ -58,7 +58,7 @@ enum {
     HEX_REG_LC0              = 33,
     HEX_REG_SA1              = 34,
     HEX_REG_LC1              = 35,
-    HEX_REG_P3_0             = 36,
+    HEX_REG_P3_0_ALIASED     = 36,
     HEX_REG_M0               = 38,
     HEX_REG_M1               = 39,
     HEX_REG_USR              = 40,
-- 
2.17.1


