Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D299259E5B8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:10:13 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVXh-0003u1-0h
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQUEz-00053E-GW; Tue, 23 Aug 2022 09:46:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:41190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQUEu-0001cJ-NL; Tue, 23 Aug 2022 09:46:48 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NDOEtl026392;
 Tue, 23 Aug 2022 13:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=twYIkrtgSF1v/CFlcx1QyWukV3sAqjGtwOwsndwFWYY=;
 b=eY12KHLFRLySZuPv6wjFZ3++3EiCH/vjMD6lBqRZ0MV7q1hX0dRBA1It9lspJsP1rWQu
 4a9GUCjVq2eM6cAG+73cWLbG/YdOWTMlztwNJRbwAPRqxoM1/S7A7Gnfh7ikPZFEXzE8
 bQkaLpLj51qf1Z0k5ln7HkRiFz9h2paT2Ta6Yebge0/SFzq21si8aHUSETdKQsWHRAAj
 09Z16Jw8hIwKNZdeRGu0tc/pnBHtWrjwBPQkOoDDzunsvpavVWo76XpSjD0rEgIwv0Za
 MLHY7lI7KvMreRNSGGcz2DamuEJ45YPJLj/VPAXLV2WjM5npUSpO+MZaB66bTYIRsO/T 6A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j4vxdrwu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 13:46:21 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NDkKLb022614
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 13:46:20 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 02BEB5F8; Tue, 23 Aug 2022 10:46:19 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] docs/devel/testing: fix minor typo
Date: Tue, 23 Aug 2022 10:46:19 -0300
Message-Id: <421fb28678d1077c0b14978e359b4e1469cc0168.1661262376.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YvIu_V-RxPsyrZoRP77NLESTCB8LYOCz
X-Proofpoint-GUID: YvIu_V-RxPsyrZoRP77NLESTCB8LYOCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208230055
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Aug 2022 11:02:42 -0400
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

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 docs/devel/testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 3f6ebd5073..f35f117d95 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -297,7 +297,7 @@ build and test QEMU in predefined and widely accessible Linux
 environments. This makes it possible to expand the test coverage
 across distros, toolchain flavors and library versions. The support
 was originally written for Docker although we also support Podman as
-an alternative container runtime. Although the many of the target
+an alternative container runtime. Although many of the target
 names and scripts are prefixed with "docker" the system will
 automatically run on whichever is configured.
 
-- 
2.25.1


