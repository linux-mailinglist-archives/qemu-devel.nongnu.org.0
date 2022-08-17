Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAEE597445
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:40:08 +0200 (CEST)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM5P-000647-F4
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOLt7-00006U-5g; Wed, 17 Aug 2022 12:27:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOLsn-0007EM-Hx; Wed, 17 Aug 2022 12:27:20 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HGDMQV004325;
 Wed, 17 Aug 2022 16:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tFyZujuNnNwFQUf8VTT2tEeN+jd8urmNNT2XTqjSJMc=;
 b=Ifw3qyisdZBEt80QeczzFG3gyUpfKLLzOjhNBb0e9kXSSlpKHnZD1JIOeEWTZxtlnzug
 SV1d4dlhHgaXFOwy06gAZDo4uEdMAu5olQP1rpEt371oWT+SUf9VB4/yMXG09JmkspP9
 n+ZSVobo1NJD1Mwq+xX1YtGOz0LmPd3rCZySevoksvNmIzSLqhmOu+fDhnYsFMJ5cKhO
 VU9LuSjp99w5W9rTrMSERufrEtphSWvWmg6s1oes+L11AT8zUkCfSjmXfcPy9D+XA1zU
 vXzk/hh/bvpDmnGKhLGxVNbv23sfN17kt3QipLO+PYFXqLD7zlyQLuig/US/TSgMFKSv IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j13np82pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 16:15:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HGDt2a006557;
 Wed, 17 Aug 2022 16:15:36 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j13np82mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 16:15:36 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HG5SSi010755;
 Wed, 17 Aug 2022 16:15:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3hyp8sj12r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 16:15:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27HGFou736045078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 16:15:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9F2E11C054;
 Wed, 17 Aug 2022 16:15:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A22E11C058;
 Wed, 17 Aug 2022 16:15:31 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.21.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 16:15:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] target/s390x: Fix CLFIT and CLGIT immediate size
Date: Wed, 17 Aug 2022 18:15:29 +0200
Message-Id: <20220817161529.597414-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qyfIYiUolT1RT8Z_Tvo0v3A5-gmP_98S
X-Proofpoint-ORIG-GUID: 5jGbmpkd9fnwHBRlM6rT6TX0MPrEZ63U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=921 priorityscore=1501 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

I2 is 16 bits, not 32.

Found by running valgrind's none/tests/s390x/traps.

Fixes: 1c2687518235 ("target-s390: Implement COMPARE AND TRAP")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.def | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 5e448bb2c4..6d2cfe5fa2 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -290,8 +290,8 @@
     D(0xb961, CLGRT,   RRF_c, GIE, r1_o, r2_o, 0, 0, ct, 0, 1)
     D(0xeb23, CLT,     RSY_b, MIE, r1_32u, m2_32u, 0, 0, ct, 0, 1)
     D(0xeb2b, CLGT,    RSY_b, MIE, r1_o, m2_64, 0, 0, ct, 0, 1)
-    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
-    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
+    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_16u, 0, 0, ct, 0, 1)
+    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_16u, 0, 0, ct, 0, 1)
 
 /* CONVERT TO DECIMAL */
     C(0x4e00, CVD,     RX_a,  Z,   r1_o, a2, 0, 0, cvd, 0)
-- 
2.37.1


