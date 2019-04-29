Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8CDED8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 11:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL2K4-00041S-W0
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 05:11:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hL2GW-0001SF-E3
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hL2Bh-0000Ny-GB
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:03:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1hL2Bh-0000MT-4P
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:03:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3T8sOaH089261
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 05:02:59 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2s5wub14pf-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 05:02:59 -0400
Received: from localhost
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Mon, 29 Apr 2019 10:02:58 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 29 Apr 2019 10:02:55 +0100
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x3T92sRX10879438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 29 Apr 2019 09:02:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F150C6057;
	Mon, 29 Apr 2019 09:02:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE9FC6055;
	Mon, 29 Apr 2019 09:02:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.114.17.106])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2019 09:02:53 +0000 (GMT)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Mon, 29 Apr 2019 05:02:44 -0400
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429090250.7648-1-borntraeger@de.ibm.com>
References: <20190429090250.7648-1-borntraeger@de.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19042909-0004-0000-0000-000015053037
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011015; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000285; SDB=6.01195994; UDB=6.00627178;
	IPR=6.00976844; 
	MB=3.00026644; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-29 09:02:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042909-0005-0000-0000-00008B71A30E
Message-Id: <20190429090250.7648-4-borntraeger@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904290066
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v3 3/9] s390x/cpumodel:
 Miscellaneous-Instruction-Extensions Facility 3
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

Provide the "Miscellaneous-Instruction-Extensions Facility 3" via
stfle.61.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu_features.c     | 1 +
 target/s390x/cpu_features_def.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 1843c84aaa..bbd8902087 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -83,6 +83,7 @@ static const S390FeatDef s390_features[] = {
     FEAT_INIT("minste2", S390_FEAT_TYPE_STFL, 58, "Miscellaneous-instruction-extensions facility 2"),
     FEAT_INIT("sema", S390_FEAT_TYPE_STFL, 59, "Semaphore-assist facility"),
     FEAT_INIT("tsi", S390_FEAT_TYPE_STFL, 60, "Time-slice Instrumentation facility"),
+    FEAT_INIT("minste3", S390_FEAT_TYPE_STFL, 61, "Miscellaneous-Instruction-Extensions Facility 3"),
     FEAT_INIT("ri", S390_FEAT_TYPE_STFL, 64, "CPU runtime-instrumentation facility"),
     FEAT_INIT("zpci", S390_FEAT_TYPE_STFL, 69, "z/PCI facility"),
     FEAT_INIT("aen", S390_FEAT_TYPE_STFL, 71, "General-purpose-adapter-event-notification facility"),
diff --git a/target/s390x/cpu_features_def.h b/target/s390x/cpu_features_def.h
index 5fc7e7bf01..31dd678301 100644
--- a/target/s390x/cpu_features_def.h
+++ b/target/s390x/cpu_features_def.h
@@ -71,6 +71,7 @@ typedef enum {
     S390_FEAT_MISC_INSTRUCTION_EXT,
     S390_FEAT_SEMAPHORE_ASSIST,
     S390_FEAT_TIME_SLICE_INSTRUMENTATION,
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
     S390_FEAT_RUNTIME_INSTRUMENTATION,
     S390_FEAT_ZPCI,
     S390_FEAT_ADAPTER_EVENT_NOTIFICATION,
-- 
2.17.1


