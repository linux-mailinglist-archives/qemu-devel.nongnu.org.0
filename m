Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0910B4E5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 18:57:39 +0100 (CET)
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia1ZJ-00042R-K2
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 12:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1ia1Sv-00086i-TG
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1ia1Su-0003Gl-Kr
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26780
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1ia1Su-0003Fb-Fw
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:00 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARHkU9B107253
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 12:50:59 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqkhxm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 12:50:59 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 27 Nov 2019 17:50:57 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 17:50:54 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARHoqZY47579146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 17:50:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7515EA406E;
 Wed, 27 Nov 2019 17:50:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC6ACA4051;
 Wed, 27 Nov 2019 17:50:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.82.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 17:50:50 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] s390x: Cleanup
Date: Wed, 27 Nov 2019 12:50:40 -0500
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112717-4275-0000-0000-0000038729F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112717-4276-0000-0000-0000389AB991
Message-Id: <20191127175046.4911-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=606
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=1
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270145
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding comments and reordering code for better readability in the
diag308 and machine reset functions. Also making the kvm sclp function
void and refactoring it.

v4
	* Added sclp cleanup
	* Renamed ccpu reset wrapper
	* Added assert to cpu reset function

Janosch Frank (6):
  s390x: Don't do a normal reset on the initial cpu
  s390x: Move reset normal to shared reset handler
  s390x: Move initial reset
  s390x: Move clear reset
  s390x: Beautify diag308 handling
  s390x: kvm: Make kvm_sclp_service_call void

 hw/s390x/s390-virtio-ccw.c |   3 ++
 target/s390x/cpu-qom.h     |   9 +++-
 target/s390x/cpu.c         | 107 ++++++++++++++-----------------------
 target/s390x/cpu.h         |   4 +-
 target/s390x/diag.c        |  54 +++++++++++--------
 target/s390x/kvm.c         |  12 ++---
 target/s390x/sigp.c        |   4 +-
 7 files changed, 91 insertions(+), 102 deletions(-)

-- 
2.20.1


