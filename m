Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF362D7437
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:52:48 +0100 (CET)
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kng2Z-0000T7-0D
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kng1J-0008Qp-0S; Fri, 11 Dec 2020 05:51:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kng1G-0008Ci-Ou; Fri, 11 Dec 2020 05:51:28 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBAY4Fu042169; Fri, 11 Dec 2020 05:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QslvlKP2joPixl7uZiPhJ9Bci+SIJeQV8CDHRChbJaE=;
 b=OODJ2V1q+zo9JpZYZzkhMG+Rs3FQy8ApxX4fDmUDXVgycM0HB7UJXUzBMGiyS7+qEzgl
 egBn0NhkJpgJ5eRlpZRHQaA/73qN79EjQgF29EqWNJfpBoyRQ3OfdMw2FsjdwKlT3sXL
 wxq4b+wuD2pBzHuuklcMSB9+bjvM/fzxBUjJFKiCuQGAP/NIYcyJslwdym4bJ3ZzDnVA
 ASfnbDZoQu7E4LhK5gwayED5ZpBLfdBAtcGvpP4DO9/SqhX0TsOw03I9+PlVWAmBT38W
 hrzelQ55iilvooW2cDwtpa9h7aobcZS7S81S6KOwtPY5rcIwApr00ZWifjcEObejJd7S Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c6d1hnf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 05:51:23 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BBAYIeQ043422;
 Fri, 11 Dec 2020 05:51:23 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c6d1hnet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 05:51:22 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBAffVJ029717;
 Fri, 11 Dec 2020 10:51:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u86vyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 10:51:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBApI7f29622672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 10:51:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14DE311C04C;
 Fri, 11 Dec 2020 10:51:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77C4B11C058;
 Fri, 11 Dec 2020 10:51:17 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 10:51:17 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
Date: Fri, 11 Dec 2020 05:51:09 -0500
Message-Id: <20201211105109.2913-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_01:2020-12-09,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no VSIE support for a protected guest, so let's better not
advertise it and its support facilities.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
v2: added hpma2
---
 target/s390x/cpu_features.c | 39 ++++++++++++++++++++++++++++++++++++-
 target/s390x/cpu_models.c   | 25 ++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 42fe0bf4ca..5528acd082 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -107,8 +107,45 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
         feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
     }
 
-    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
+    if (!s390_is_pv()) {
+        return;
+    }
+
+    /*
+     * Some facilities are not available for CPUs in protected mode:
+     * - All SIE facilities because SIE is not available
+     * - DIAG318
+     *
+     * As VMs can move in and out of protected mode the CPU model
+     * doesn't protect us from that problem because it is only
+     * validated at the start of the VM.
+     */
+    switch (type) {
+    case S390_FEAT_TYPE_SCLP_CPU:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_F2)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SKEY)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GPERE)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIGPIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IB)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CEI)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_HPMA2)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_64BSCAO)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CMMA)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_PFMFI)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IBS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_FAC134:
         clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
+        break;
+    default:
+        return;
     }
 }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index b5abff8bef..93d8744d29 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -239,8 +239,29 @@ bool s390_has_feat(S390Feat feat)
         }
         return 0;
     }
-    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
-        return false;
+
+    if (s390_is_pv()) {
+        switch (feat) {
+        case S390_FEAT_DIAG_318:
+        case S390_FEAT_HPMA2:
+        case S390_FEAT_SIE_F2:
+        case S390_FEAT_SIE_SKEY:
+        case S390_FEAT_SIE_GPERE:
+        case S390_FEAT_SIE_SIIF:
+        case S390_FEAT_SIE_SIGPIF:
+        case S390_FEAT_SIE_IB:
+        case S390_FEAT_SIE_CEI:
+        case S390_FEAT_SIE_KSS:
+        case S390_FEAT_SIE_GSLS:
+        case S390_FEAT_SIE_64BSCAO:
+        case S390_FEAT_SIE_CMMA:
+        case S390_FEAT_SIE_PFMFI:
+        case S390_FEAT_SIE_IBS:
+            return false;
+            break;
+        default:
+            break;
+        }
     }
     return test_bit(feat, cpu->model->features);
 }
-- 
2.25.1


