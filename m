Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F9654C21
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 06:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8aEk-0007gM-VN; Fri, 23 Dec 2022 00:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p8aEi-0007fy-MP
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 00:04:48 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p8aEh-0008UO-1J
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 00:04:48 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BN4x4aO015340; Fri, 23 Dec 2022 05:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xt1AUDsdeT+15woJV+r7BSgmgLtVqARJyLiQl+rWvvo=;
 b=KNNT4Y+uXTJJmC4fgEKQdYxxpq1ebTQGtR5hjO2Gn11xWkVKG167H77XLG65bRGC2tQu
 GfTs5eCFcy/2rW6sVa2F03Lgyqs30ep7pPh9hvBZ/L1Y9L3qwcnEFcZhItih+Uc/wn4i
 o7IaGt0Vwye1HHY0KmMaF64X+A1Wu9if+HwrGdcA0oxPNPWH9s0qgIGCUIBEv2yUanE/
 MEYnuNW5TUIN0qJyO8LF0yo+ViEt2w4HjFLi/34fn/cpWmegHhubDITztIJnfslib/zC
 9DKgbOSBaIK0fGxNqCzZGC9z0FH7RlHuwRcLtVkuTk9IgvHpf2RlmSCCpSuEtDQW+1Or 9Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm4xkuxtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 05:04:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BN54fVW021917
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 05:04:41 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 21:04:39 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, Mukilan Thiyagarajan
 <quic_mthiyaga@quicinc.com>
Subject: Re: [PULL 0/6] testing updates
Date: Fri, 23 Dec 2022 10:34:10 +0530
Message-ID: <20221223050410.12970-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <87h6xnxjpm.fsf@linaro.org>
References: <87h6xnxjpm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vmAgQuSfe3pd9BUsCGlyqVroNw6AmzdA
X-Proofpoint-ORIG-GUID: vmAgQuSfe3pd9BUsCGlyqVroNw6AmzdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_02,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=920
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212230044
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Thank you, Alex!

Here is the patch to fix the issue. I've also removed
the comment which is no longer applicable.

Regards,
Mukilan

---
 .gitlab-ci.d/container-cross.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 5486dc43c6..e0d75d5824 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -34,14 +34,11 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
-# We never want to build hexagon in the CI system and by default we
-# always want to refer to the master registry where it lives.
 hexagon-cross-container:
   extends: .container_job_template
   stage: containers
   variables:
     NAME: debian-hexagon-cross
-    QEMU_JOB_ONLY_FORKS: 1
 
 hppa-debian-cross-container:
   extends: .container_job_template
-- 
2.17.1


