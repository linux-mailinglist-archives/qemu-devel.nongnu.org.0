Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89C1913E8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 16:10:54 +0100 (CET)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGlCe-0008BZ-Qk
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 11:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jGlBQ-0006sN-LF
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jGlBP-00037G-FR
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:09:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jGlBP-00035j-80
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:09:35 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OF4Rag043830
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 11:09:33 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywbtgstsh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 11:09:33 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 24 Mar 2020 15:09:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 15:09:27 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02OF9SRW48824320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 15:09:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB18EA4060;
 Tue, 24 Mar 2020 15:09:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65FC6A405C;
 Tue, 24 Mar 2020 15:09:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.9.40])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 15:09:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] pc-bios: s390x: Cleanup part 1
Date: Tue, 24 Mar 2020 11:08:39 -0400
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032415-0020-0000-0000-000003BA3597
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032415-0021-0000-0000-00002212B6BD
Message-Id: <20200324150847.10476-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=344 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240079
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

The bios is in dire need for a cleanup as there are still a lot of
magic constants being used throughout as well as duplicated code.

In the first part of this series we consolidate constants and
functions, as well as doing some minor cleanups and fixes.

The patches are based on my protvirt branch and are available here:
https://github.com/frankjaa/qemu/pull/new/cleanup_bios

Janosch Frank (8):
  pc-bios: s390x: Consolidate timing functions into time.h
  pc-bios: s390x: Get rid of magic offsets into the lowcore
  pc-bios: s390x: Rename and use PSW_MASK_ZMODE constant
  pc-bios: s390x: Use PSW masks where possible
  pc-bios: s390x: Move panic() into header and add infinite loop
  pc-bios: s390x: Use ebcdic2ascii table
  pc-bios: s390x: Replace 0x00 with 0x0 or 0
  pc-bios: s390x: Make u32 ptr check explicit

 pc-bios/s390-ccw/bootmap.c     |  4 +---
 pc-bios/s390-ccw/cio.h         | 17 +++++++++------
 pc-bios/s390-ccw/dasd-ipl.c    | 17 +++++++--------
 pc-bios/s390-ccw/helper.h      |  2 +-
 pc-bios/s390-ccw/jump2ipl.c    | 10 ++++-----
 pc-bios/s390-ccw/main.c        | 15 +++----------
 pc-bios/s390-ccw/menu.c        |  1 +
 pc-bios/s390-ccw/netmain.c     | 23 +++-----------------
 pc-bios/s390-ccw/s390-arch.h   |  4 +++-
 pc-bios/s390-ccw/s390-ccw.h    | 25 ++++++----------------
 pc-bios/s390-ccw/start.S       |  5 +++--
 pc-bios/s390-ccw/time.h        | 39 ++++++++++++++++++++++++++++++++++
 pc-bios/s390-ccw/virtio-net.c  |  1 +
 pc-bios/s390-ccw/virtio-scsi.c |  1 +
 pc-bios/s390-ccw/virtio.c      | 18 +++-------------
 15 files changed, 88 insertions(+), 94 deletions(-)
 create mode 100644 pc-bios/s390-ccw/time.h

-- 
2.25.1


