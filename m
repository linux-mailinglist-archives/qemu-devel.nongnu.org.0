Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411668DC25
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPKu-000595-L6; Tue, 07 Feb 2023 09:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pPPKs-00058v-Mp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:52:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pPPKr-0004NH-0K
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:52:42 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317CEbnk025133; Tue, 7 Feb 2023 14:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=6NLDSfRjg1hLNPHlzPuh58Gjrc6depiO8VLevUkBStI=;
 b=kMBXZMak27WM1UoNiX5sOu70DOhMKuQg+Dv3UJIri58+bK6zx2cr+SR6xZWSIZmU6hLM
 zJQx5yInlA/zsLQvMHs3BAqYKx12d2bFjJM0/qcIfj/PM9logtW8ajoeMkPD0KGLMkAS
 qT7lkMOv4Be900mb98BZ9SilKFPdyOu68Llfw4jlluAI5/ODtvYTWOrRZKD+vMLC7nJ4
 W8Zc/niH1Ov/ekqUJ3sYLc7LYSgyCPetLM3NXo2B8XJeIgS6lNZ7SEGsdirYV6tP+sCz
 GM4JKTC4eUwJHpTkTDuHwyagbHvQAYSy8c9MdFsrLixd5BO9fPsbu+mMEN0GA3iPG7Fm 1w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkmnnrhk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:52:35 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 317EniS3008781; 
 Tue, 7 Feb 2023 14:52:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3nhgekyx8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:52:34 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317EqXHR012114;
 Tue, 7 Feb 2023 14:52:34 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 317EqXHF012113
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:52:33 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 767B761F8; Tue,  7 Feb 2023 11:52:33 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 quic_acaggian@quicinc.com
Subject: [PATCH] Hexagon (meson.build): define min bison version
Date: Tue,  7 Feb 2023 11:52:31 -0300
Message-Id: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5_0WNH__o-17M73teGt_Y92g60w6gaOt
X-Proofpoint-GUID: 5_0WNH__o-17M73teGt_Y92g60w6gaOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=630 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Hexagon's idef-parser machinery uses some bison features that are not
available at older versions. The most preeminent example (as it can
be used as a sentinel) is "%define parse.error verbose". This was
introduced in version 3.0 of the tool, which is able to compile
qemu-hexagon just fine. However, compilation fails with the previous
minor bison release, v2.7. So let's assert the minimum version at
meson.build to give a more comprehensive error message for those trying
to compile QEMU.

[1]: https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index c9d31d095c..42b03c81e6 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -183,7 +183,7 @@ if idef_parser_enabled and 'hexagon-linux-user' in target_dirs
     )
 
     bison = generator(
-        find_program('bison'),
+        find_program('bison', version: '>=3.0'),
         output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
         arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@']
     )
-- 
2.37.2


