Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638ED6FCDF7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:43:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSIf-0002CL-N0; Tue, 09 May 2023 14:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pwSIb-0002By-R5
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:42:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pwSIa-0008VQ-1K
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:42:57 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349GgD2h004753
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=8Cs2MPMPodpRvRfb+oHKESwtMNgRQUWWrmGiuBMUmC4=;
 b=H0LWc7WYu2SxIf6aVsbR1YEVXYlO1+zuXZamltpkL1CrbHBabkK+DZLMsZ8d8GIQWkZZ
 12E7uTBLsakx1mJ4lcpXAX8v5rvzbUzd5hwoHVz3szspWdHif+jWiN0hiwPf+5rMx/RQ
 NOnmpM0cYcN9j6xAQkgFXAzts4i7rBmbOahorSskmLIq2xGsNq5CmR5zucomDVERf2si
 nfRcadQVEuzFtzmZ7h4IQeKnGAIKFZyXKnuKc0EMCusfAoYDLYfhzs5ly74xO+2mzBtO
 06fgT527Il5PHKZxi6UyL72JWnPHZdG9E8ZD65hJGkJ6AoEu5HmuFedbYOfwN/fmvQTd Rg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfrut8e4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 18:42:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349IgqRj025345
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 18:42:52 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 9 May 2023 11:42:52 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 Matheus Bernardino <quic_mathbern@quicinc.com>, Marco Liebel
 <quic_mliebel@quicinc.com>
Subject: [PATCH] Remove test_vshuff from hvx_misc tests
Date: Tue, 9 May 2023 11:42:31 -0700
Message-ID: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MQp9moGK5vwfdNmv6wz-3pyqQbX6O497
X-Proofpoint-ORIG-GUID: MQp9moGK5vwfdNmv6wz-3pyqQbX6O497
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=873
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090156
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

test_vshuff checks that the vshuff instruction works correctly when
both vector registers are the same. Using vshuff in this way is
undefined and will be rejected by the compiler in a future version of
the toolchain.

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
 tests/tcg/hexagon/hvx_misc.c | 45 ------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/tests/tcg/hexagon/hvx_misc.c b/tests/tcg/hexagon/hvx_misc.c
index d0e64e035f..bc4e76d7f0 100644
--- a/tests/tcg/hexagon/hvx_misc.c
+++ b/tests/tcg/hexagon/hvx_misc.c
@@ -342,49 +342,6 @@ static void test_vsubuwsat_dv(void)
     check_output_w(__LINE__, 2);
 }
 
-static void test_vshuff(void)
-{
-    /* Test that vshuff works when the two operands are the same register */
-    const uint32_t splat = 0x089be55c;
-    const uint32_t shuff = 0x454fa926;
-    MMVector v0, v1;
-
-    memset(expect, 0x12, sizeof(MMVector));
-    memset(output, 0x34, sizeof(MMVector));
-
-    asm volatile("v25 = vsplat(%0)\n\t"
-                 "vshuff(v25, v25, %1)\n\t"
-                 "vmem(%2 + #0) = v25\n\t"
-                 : /* no outputs */
-                 : "r"(splat), "r"(shuff), "r"(output)
-                 : "v25", "memory");
-
-    /*
-     * The semantics of Hexagon are the operands are pass-by-value, so create
-     * two copies of the vsplat result.
-     */
-    for (int i = 0; i < MAX_VEC_SIZE_BYTES / 4; i++) {
-        v0.uw[i] = splat;
-        v1.uw[i] = splat;
-    }
-    /* Do the vshuff operation */
-    for (int offset = 1; offset < MAX_VEC_SIZE_BYTES; offset <<= 1) {
-        if (shuff & offset) {
-            for (int k = 0; k < MAX_VEC_SIZE_BYTES; k++) {
-                if (!(k & offset)) {
-                    uint8_t tmp = v0.ub[k];
-                    v0.ub[k] = v1.ub[k + offset];
-                    v1.ub[k + offset] = tmp;
-                }
-            }
-        }
-    }
-    /* Put the result in the expect buffer for verification */
-    expect[0] = v1;
-
-    check_output_b(__LINE__, 1);
-}
-
 static void test_load_tmp_predicated(void)
 {
     void *p0 = buffer0;
@@ -489,8 +446,6 @@ int main()
     test_vadduwsat();
     test_vsubuwsat_dv();
 
-    test_vshuff();
-
     test_load_tmp_predicated();
     test_load_cur_predicated();
 
-- 
2.25.1


