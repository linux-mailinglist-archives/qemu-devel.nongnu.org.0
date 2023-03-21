Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FF6C33C9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:13:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecjF-0002Ai-Ne; Tue, 21 Mar 2023 10:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecjD-0002A8-Qk
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecj8-0000aH-M2
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:43 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32L2hGRj025451
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=pIN+ca0sUAm0NqH4dxj2rTnSb583Jj9o5f5Pg5wsJpU=;
 b=QOkj96GO64pVTiytFYpfU3livulNPPuas2dqy/mldFY8xLyn1S1ZoTnMyXHPlMe4+SaT
 ilBvyQZxpuLd6jGXH+Bwn4u7/NxYT72rpTVjcS7G+Z49fm7uv4KRU0HnEK9rMW0nPPzN
 hTw6Yks956DMKQJFp7t42ajArrXvW+enpNxxulaCrcITugQWnvWjrzGG3clHmS0Q8mvV
 5RjE51f11HPOcDzRavgF4yeXvUw3F5pIPWJq3bEQbrupEZ00mHRstiMETupdXB8TR4kp
 lDnBNKN17G4H+zxXLyoieZX1CclJg2EGULcmb21QTAFP12WexSjlLqauUUsnffJQyk8+ Tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pf41vsqtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32LECXQM017710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:33 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Mar 2023 07:12:33 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, Matheus Bernardino
 <quic_mathbern@quicinc.com>, Marco Liebel <quic_mliebel@quicinc.com>
Subject: [PATCH 0/2] Update hexagon toolchain
Date: Tue, 21 Mar 2023 07:12:03 -0700
Message-ID: <20230321141206.751719-1-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1DiIdUfd6cdx2uGSOHbz3LSjvAnX7-ha
X-Proofpoint-GUID: 1DiIdUfd6cdx2uGSOHbz3LSjvAnX7-ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=706 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210111
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0a-0031df01.pphosted.com
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

Updates the hexagon toolchain and adds a test for a bug that was fixed
by the new version.

Marco Liebel (2):
  Use hexagon toolchain version 16.0.0
  Add test for storing .new vector

 .../dockerfiles/debian-hexagon-cross.docker   |  2 +-
 tests/tcg/hexagon/hvx_misc.c                  | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.25.1


