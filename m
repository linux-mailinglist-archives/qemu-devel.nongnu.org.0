Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248376A98B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 15:22:45 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnNPm-0003fh-M6
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 09:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59229)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <iii@linux.ibm.com>) id 1hnMfj-00078H-Ps
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:35:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <iii@linux.ibm.com>) id 1hnMfh-0007em-Mt
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:35:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28584
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <iii@linux.ibm.com>) id 1hnMfg-0007V2-Vq
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:35:05 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GCX1IR015526
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 08:34:56 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsdhrbck6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 08:34:56 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <iii@linux.ibm.com>;
 Tue, 16 Jul 2019 13:34:55 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 13:34:53 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GCYpxR60293302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 12:34:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7488D42041;
 Tue, 16 Jul 2019 12:34:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 360A542042;
 Tue, 16 Jul 2019 12:34:51 +0000 (GMT)
Received: from white.boeblingen.de.ibm.com (unknown [9.152.96.205])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 12:34:51 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, rth@twiddle.net,
 david@redhat.com, cohuck@redhat.com
Date: Tue, 16 Jul 2019 14:34:46 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071612-4275-0000-0000-0000034D6EBB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071612-4276-0000-0000-0000385D80A6
Message-Id: <20190716123446.24039-1-iii@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=895 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160155
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Tue, 16 Jul 2019 09:22:23 -0400
Subject: [Qemu-devel] [PATCH] s390: support EDAT-2 in mmu_translate_region
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
Cc: borntraeger@de.ibm.com, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging s390 linux kernel with qemu kvm gdbstub, dumping memory
contents at addresses in range 0x80000000-0x100000000 results in an
error or all zeroes being returned.

The problem appears to be that linux puts 2G page at that location,
which qemu currently does not know about.

Check FC bit of Region-Third-Table Entry in mmu_translate_region, just
like it's already done for FC bit of Segment-Table Entry in
mmu_translate_segment.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 target/s390x/cpu.h        | 1 +
 target/s390x/mmu_helper.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index a606547b4d..947553386f 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -548,6 +548,7 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
 #define ASCE_TABLE_LENGTH     0x03        /* region table length              */
 
 #define REGION_ENTRY_ORIGIN   (~0xfffULL) /* region/segment table origin    */
+#define REGION_ENTRY_FC       0x400       /* region format control          */
 #define REGION_ENTRY_RO       0x200       /* region/segment protection bit  */
 #define REGION_ENTRY_TF       0xc0        /* region/segment table offset    */
 #define REGION_ENTRY_INV      0x20        /* invalid region table entry     */
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 6e9c4d6151..76cf920cd2 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -242,6 +242,14 @@ static int mmu_translate_region(CPUS390XState *env, target_ulong vaddr,
         return -1;
     }
 
+    if (level == ASCE_TYPE_REGION3
+        && (new_entry & REGION_ENTRY_FC) && (env->cregs[0] & CR0_EDAT)) {
+        /* Decode EDAT-2 region frame absolute address (2GB page) */
+        *raddr = (new_entry & 0xffffffff80000000ULL) | (vaddr & 0x7fffffff);
+        PTE_DPRINTF("%s: REG=0x%" PRIx64 "\n", __func__, new_entry);
+        return 0;
+    }
+
     if (level == ASCE_TYPE_SEGMENT) {
         return mmu_translate_segment(env, vaddr, asc, new_entry, raddr, flags,
                                      rw, exc);
-- 
2.21.0


