Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC3178FB3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 12:45:00 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9SSQ-0007ra-V8
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 06:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j9SQn-0005yn-Ci
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j9SQm-0007UU-3P
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j9SQl-0007TO-RX
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:16 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024BdcNq090234
 for <qemu-devel@nongnu.org>; Wed, 4 Mar 2020 06:43:14 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhw6nvvm5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 04 Mar 2020 06:43:14 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 4 Mar 2020 11:43:12 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 11:43:08 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024Bh7Go44105920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 11:43:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1D9942041;
 Wed,  4 Mar 2020 11:43:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7F3B4203F;
 Wed,  4 Mar 2020 11:43:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.55])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 11:43:06 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/18] s390x: Protected Virtualization support
Date: Wed,  4 Mar 2020 06:42:13 -0500
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030411-0020-0000-0000-000003B06303
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030411-0021-0000-0000-000022089806
Message-Id: <20200304114231.23493-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_01:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=1 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040090
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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

Most of the QEMU changes for PV are related to the new IPL type with
subcodes 8 - 10 and the execution of the necessary Ultravisor calls to
IPL secure guests. Note that we can only boot into secure mode from
normal mode, i.e. stfle 161 is not active in secure mode.

The other changes related to data gathering for emulation and
disabling addressing checks in secure mode, as well as CPU resets.

v6:
	* diag308 rc numbers were changed by architecture
	* IPL pv block received one more reserved field by architecture
	* Officially added the bios patch to the series
	* Dropped picked constant rename patch

v5:
	* Moved docs into docs/system
	* Some more enable/disable changes
	* Moved enablement/disablement of pv in separate functions
	* Some review fixes

v4:
	* Sync with KVM changes
	* Review changes

V3:
	* Use dedicated functions to access SIDA
	* Smaller cleanups and segfault fixes
	* Error reporting for Ultravisor calls
	* Inject of RC of diag308 subcode 10 fails

V2:
	* Split out cleanups
	* Internal PV state tracking
	* Review feedback

Christian Borntraeger (1):
  s390x: Add unpack facility feature to GA1

Janosch Frank (17):
  Sync pv
  s390x: protvirt: Add diag308 subcodes 8 - 10
  s390x: protvirt: Support unpack facility
  s390x: protvirt: Add migration blocker
  s390x: protvirt: Handle diag 308 subcodes 0,1,3,4
  s390x: protvirt: Inhibit balloon when switching to protected mode
  s390x: protvirt: KVM intercept changes
  s390x: Add SIDA memory ops
  s390x: protvirt: Move STSI data over SIDAD
  s390x: protvirt: SCLP interpretation
  s390x: protvirt: Set guest IPL PSW
  s390x: protvirt: Move diag 308 data over SIDAD
  s390x: protvirt: Disable address checks for PV guest IO emulation
  s390x: protvirt: Move IO control structures over SIDA
  s390x: protvirt: Handle SIGP store status correctly
  docs: Add protvirt docs
  pc-bios: s390x: Save iplb location in lowcore

 docs/system/index.rst               |   1 +
 docs/system/protvirt.rst            |  57 +++++++++++
 hw/s390x/Makefile.objs              |   1 +
 hw/s390x/ipl.c                      |  80 ++++++++++++++-
 hw/s390x/ipl.h                      |  34 +++++++
 hw/s390x/pv.c                       | 106 ++++++++++++++++++++
 hw/s390x/pv.h                       |  34 +++++++
 hw/s390x/s390-virtio-ccw.c          | 145 +++++++++++++++++++++++++++-
 hw/s390x/sclp.c                     |  17 ++++
 include/hw/s390x/s390-virtio-ccw.h  |   1 +
 include/hw/s390x/sclp.h             |   2 +
 linux-headers/linux/kvm.h           |  45 ++++++++-
 pc-bios/s390-ccw/jump2ipl.c         |   1 +
 pc-bios/s390-ccw/main.c             |   8 +-
 pc-bios/s390-ccw/netmain.c          |   1 +
 pc-bios/s390-ccw/s390-arch.h        |  10 +-
 pc-bios/s390-ccw/s390-ccw.h         |   1 +
 target/s390x/cpu.c                  |  27 ++++--
 target/s390x/cpu.h                  |   8 +-
 target/s390x/cpu_features_def.inc.h |   1 +
 target/s390x/diag.c                 |  60 ++++++++++--
 target/s390x/gen-features.c         |   1 +
 target/s390x/helper.c               |   4 +
 target/s390x/ioinst.c               | 113 +++++++++++++++-------
 target/s390x/kvm.c                  |  54 ++++++++++-
 target/s390x/kvm_s390x.h            |   2 +
 target/s390x/mmu_helper.c           |  14 +++
 target/s390x/sigp.c                 |   1 +
 28 files changed, 762 insertions(+), 67 deletions(-)
 create mode 100644 docs/system/protvirt.rst
 create mode 100644 hw/s390x/pv.c
 create mode 100644 hw/s390x/pv.h

-- 
2.20.1


