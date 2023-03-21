Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF96C33C6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecjG-0002Al-8L; Tue, 21 Mar 2023 10:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecjD-0002AB-Vh
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecj9-0000qB-LV
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:43 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LDJenh013910
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2NtDALnxlBeD1AOfPrM4Hc4W6G1+ySCurzZWTPkPWK8=;
 b=edPcvpCYWaWYKnORL/4kRV+pzFHHn7jYXWmjDP8QMFgr5MKoCX7KR8d9UdOolYlVFMbp
 qr3ulHNdeolMg+Cu3YAxUVI2my3z8WnDVkRqzSvUCO+VpLBIhti5L19/VsT0lSg19iPb
 HKB3qikizhye5Ybctg1rAVuoHotywxCiwfvNLF4rL7EsBV219/IYMZxxs8VluM9syGUN
 fpVhRnDd6Z4lU25/nZGhk66VOXtVGpe/MTD2ub5TOiZHKcH1LuqbdsocuNnBmAXY4AFC
 inl1NiRMZbyoXZEFfAOGmu76CnVb9aFkMXJX0KhM7ll5nrhXdSA+OTGqt9PonmluJGUF IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfdc405pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32LECboB023736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:37 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Mar 2023 07:12:36 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, Matheus Bernardino
 <quic_mathbern@quicinc.com>, Marco Liebel <quic_mliebel@quicinc.com>
Subject: [PATCH 1/2] Use hexagon toolchain version 16.0.0
Date: Tue, 21 Mar 2023 07:12:04 -0700
Message-ID: <20230321141206.751719-2-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321141206.751719-1-quic_mliebel@quicinc.com>
References: <20230321141206.751719-1-quic_mliebel@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qaW407VtEPyyJWvGipuMjuQemzetfFcZ
X-Proofpoint-ORIG-GUID: qaW407VtEPyyJWvGipuMjuQemzetfFcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_10,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=689 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210110
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 5308ccb8fe..b99d99f943 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -27,7 +27,7 @@ RUN apt-get update && \
 
 
 ENV TOOLCHAIN_INSTALL /opt
-ENV TOOLCHAIN_RELEASE 15.0.3
+ENV TOOLCHAIN_RELEASE 16.0.0
 ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
 ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
 
-- 
2.25.1


