Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027E60969
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 17:36:16 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjQFy-0006XM-6I
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 11:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34321)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <borntraeger@de.ibm.com>) id 1hjQDn-0005lB-NF
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <borntraeger@de.ibm.com>) id 1hjQDg-0008CM-QQ
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:33:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
 id 1hjQDg-00041a-Fu
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:33:52 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FVqlX075845
 for <qemu-devel@nongnu.org>; Fri, 5 Jul 2019 11:32:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tj7chd168-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 11:32:56 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
 Fri, 5 Jul 2019 16:32:54 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 5 Jul 2019 16:32:52 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x65FWolh35324318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 15:32:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D0F352051;
 Fri,  5 Jul 2019 15:32:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 5CF185204F;
 Fri,  5 Jul 2019 15:32:50 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 04660E00C5; Fri,  5 Jul 2019 17:32:50 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Fri,  5 Jul 2019 17:32:49 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070515-0020-0000-0000-000003509241
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070515-0021-0000-0000-000021A435D3
Message-Id: <20190705153249.12525-1-borntraeger@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050189
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH] s390x/cpumodel: Set up CPU model for AQIC
 interception
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pierre Morel <pmorel@linux.ibm.com>

Let's add support for the AP-Queue interruption facility to the CPU
model.

The S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL, CPU facility indicates
whether the PQAP instruction with the AQIC command is available
to the guest.
This feature will be enabled only if the AP instructions are
available on the linux host and AQIC facility is installed on
the host.

This feature must be turned on from userspace to intercept AP
instructions on the KVM guest. The QEMU command line to turn
this feature on looks something like this:

    qemu-system-s390x ... -cpu xxx,apqi=on ...
or
    ... -cpu host

Right now AP pass-through devices do not support migration,
which means that we do not have to take care of migrating
the interrupt data:
virsh migrate apguest --live qemu+ssh://root@target.lan/system
error: Requested operation is not valid: domain has assigned non-USB host devices

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
[rebase to newest qemu and fixup description]
---
 target/s390x/cpu_features_def.inc.h | 1 +
 target/s390x/cpu_models.c           | 1 +
 target/s390x/gen-features.c         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_features_def.inc.h
index c20c780f2ea7..ef190e2fc783 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -77,6 +77,7 @@ DEF_FEAT(SEMAPHORE_ASSIST, "sema", STFL, 59, "Semaphore-assist facility")
 DEF_FEAT(TIME_SLICE_INSTRUMENTATION, "tsi", STFL, 60, "Time-slice Instrumentation facility")
 DEF_FEAT(MISC_INSTRUCTION_EXT3, "minste3", STFL, 61, "Miscellaneous-Instruction-Extensions Facility 3")
 DEF_FEAT(RUNTIME_INSTRUMENTATION, "ri", STFL, 64, "CPU runtime-instrumentation facility")
+DEF_FEAT(AP_QUEUE_INTERRUPT_CONTROL, "apqi", STFL, 65, "AP-Queue interruption facility")
 DEF_FEAT(ZPCI, "zpci", STFL, 69, "z/PCI facility")
 DEF_FEAT(ADAPTER_EVENT_NOTIFICATION, "aen", STFL, 71, "General-purpose-adapter-event-notification facility")
 DEF_FEAT(ADAPTER_INT_SUPPRESSION, "ais", STFL, 72, "General-purpose-adapter-interruption-suppression facility")
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 2cb09c078055..1d16d7d5e794 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -818,6 +818,7 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_PTFF_QTOUE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_PTFF_STOE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_PTFF_STOUE, S390_FEAT_MULTIPLE_EPOCH },
+        { S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL, S390_FEAT_AP },
     };
     int i;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index af06be3e3b98..9f216219ff53 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -519,6 +519,7 @@ static uint16_t full_GEN12_GA1[] = {
     S390_FEAT_EDAT_2,
     S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2,
     S390_FEAT_AP_QUERY_CONFIG_INFO,
+    S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL,
     S390_FEAT_AP_FACILITIES_TEST,
     S390_FEAT_AP,
 };
-- 
2.21.0


