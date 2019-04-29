Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB23DECC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 11:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL2J1-00031b-9m
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 05:10:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hL2GP-0001Sg-CK
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hL2Bl-0000RL-40
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:03:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35082
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1hL2Bk-0000Qv-Vs
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:03:05 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3T8sMvG075269
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 05:03:04 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2s5vfvv883-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 05:03:04 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Mon, 29 Apr 2019 10:03:03 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 29 Apr 2019 10:03:01 +0100
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x3T92x1027721972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 29 Apr 2019 09:02:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4BAFC6055;
	Mon, 29 Apr 2019 09:02:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1FD4C6059;
	Mon, 29 Apr 2019 09:02:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.114.17.106])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2019 09:02:58 +0000 (GMT)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Mon, 29 Apr 2019 05:02:50 -0400
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429090250.7648-1-borntraeger@de.ibm.com>
References: <20190429090250.7648-1-borntraeger@de.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19042909-0036-0000-0000-00000AB0313E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011015; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000285; SDB=6.01195994; UDB=6.00627178;
	IPR=6.00976844; 
	MB=3.00026644; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-29 09:03:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042909-0037-0000-0000-00004B9299AB
Message-Id: <20190429090250.7648-10-borntraeger@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904290066
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v3 9/9] s390x/cpumodel: wire up 8561 and 8562
 as gen15 machines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
	Collin Walling <walling@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

8561 and 8562 will be gen15 machines. There is no name yet, lets us use
gen15a and gen15tb as base name. Later on we can provide aliases with
the proper name.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 target/s390x/cpu_models.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index d683635eb5..21ea819483 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -43,10 +43,9 @@
     }
 
 /*
- * CPU definiton list in order of release. For now, base features of a
- * following release are always a subset of base features of the previous
- * release. Same is correct for the other feature sets.
- * A BC release always follows the corresponding EC release.
+ * CPU definition list in order of release. Up to generation 14 base features
+ * of a following release have been a superset of the previous release. With
+ * generation 15 one base feature and one optional feature have been deprecated.
  */
 static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x2064, 7, 1, 38, 0x00000000U, "z900", "IBM zSeries 900 GA1"),
@@ -83,6 +82,8 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3906, 14, 1, 47, 0x08000000U, "z14", "IBM z14 GA1"),
     CPUDEF_INIT(0x3906, 14, 2, 47, 0x08000000U, "z14.2", "IBM z14 GA2"),
     CPUDEF_INIT(0x3907, 14, 1, 47, 0x08000000U, "z14ZR1", "IBM z14 Model ZR1 GA1"),
+    CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM 8561 GA1"),
+    CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM 8562 GA1"),
 };
 
 #define QEMU_MAX_CPU_TYPE 0x2827
-- 
2.17.1


