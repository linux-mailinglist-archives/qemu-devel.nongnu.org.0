Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B935800E9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:44:29 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzJs-00063p-H5
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFzIT-0004BJ-Ho
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:43:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFzIR-0006Fq-I3
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:43:01 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PDKnuK020724;
 Mon, 25 Jul 2022 14:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=WESeEH/E+WhKGJ0ZbC8ZgDKvm0gD0OONPEG8B8tOMv8=;
 b=nUDchy6wzZS1tbyOpx6gYapokACYJE36w1MfHOa8imZpqpfElgrn6/A+50ARBITQl0Lo
 zZt1FdddVbIKschUesKIFgSZgFs+E7iBxj9jQlL3gc64y3Xq35K7Jy4YqtKVLij8G+LK
 +exdE7EUetKKkrlX9+KucTihwi0AXHiTBuqqErKH7RbCv7dMfgx33v36fSTfjqwQk7u5
 qGcmEGHdrbjvFX7MyE0y0kChJg+2hEmKIGPVRK6anHn1PC5n1xQTdqWlTMuRyz958vdU
 z1m4dYlGRx8NGZf5DRn8xybd6TJDs+vtFcmqhMUuiaM1Gi7RC9eimozacCnfmcBGpKlz ZQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhuyv2qfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 14:42:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PEZA4A011994;
 Mon, 25 Jul 2022 14:42:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6euh93t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 14:42:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26PEgrOb15597902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 14:42:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13561AE04D;
 Mon, 25 Jul 2022 14:42:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD28EAE045;
 Mon, 25 Jul 2022 14:42:52 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.40.49])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jul 2022 14:42:52 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RESEND] tests/tcg/linux-test: Fix random hangs in test_socket
Date: Mon, 25 Jul 2022 16:42:51 +0200
Message-Id: <20220725144251.192720-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6z_BRUoea1PsPorPXXUMZ-n7dXyHZy1
X-Proofpoint-ORIG-GUID: _6z_BRUoea1PsPorPXXUMZ-n7dXyHZy1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_09,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

test_socket hangs randomly in connect(), especially when run without
qemu. Apparently the reason is that linux started treating backlog
value of 0 literally instead of rounding it up since v4.4 (commit
ef547f2ac16b).

So set it to 1 instead.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

This is a rebase of the previous submission:
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg00095.html

 tests/tcg/multiarch/linux/linux-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index 019d8175ca..5a2a4f2258 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -263,7 +263,7 @@ static int server_socket(void)
     sockaddr.sin_port = htons(0); /* choose random ephemeral port) */
     sockaddr.sin_addr.s_addr = 0;
     chk_error(bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)));
-    chk_error(listen(fd, 0));
+    chk_error(listen(fd, 1));
     return fd;
 
 }
-- 
2.35.3


