Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C062030C3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 09:44:24 +0200 (CEST)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnH7u-0004Lf-Js
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 03:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jnH6S-0002if-Ld; Mon, 22 Jun 2020 03:42:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31024
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jnH6Q-0001tV-Na; Mon, 22 Jun 2020 03:42:52 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M7X1N7073046; Mon, 22 Jun 2020 03:42:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31spnuufrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:42:47 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05M7XTSx075392;
 Mon, 22 Jun 2020 03:42:47 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31spnuufr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:42:47 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M7eJte000856;
 Mon, 22 Jun 2020 07:42:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 31sa3817f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 07:42:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05M7gh4Q64028924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 07:42:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A028A4066;
 Mon, 22 Jun 2020 07:42:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70285A4062;
 Mon, 22 Jun 2020 07:42:42 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 07:42:42 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] pc-bios: s390x: Cleanup part 1
Date: Mon, 22 Jun 2020 03:42:26 -0400
Message-Id: <20200622074235.32528-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_02:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 cotscore=-2147483648 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=555 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006220052
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:20:35
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bios is in dire need for a cleanup as there are still a lot of
magic constants being used throughout as well as duplicated code.

In the first part of this series we consolidate constants and
functions, as well as doing some minor cleanups and fixes.

The patches are available here:
https://github.com/frankjaa/qemu/pull/new/cleanup_bios

v4:
	* Renamed time.h to s390-time.h
	* Fixed function names in sleep()
	* Changed order of sense_id_ccw initialization
	* Added missing include before sleep()

v3:
	* Dropped 0x00 to 0x0/0 patch
	* Moved some timing functions into helper.h instead of time.h
	* Fixed IPL psw manipulation in dasd-ipl.c
 	* Minor cosmetic fixes found by review

v2:
	* Included cio fixup to get rid of compile errors...
	* Minor cosmetic fixes found by review

Janosch Frank (9):
  pc-bios: s390x: cio.c cleanup and compile fix
  pc-bios: s390x: Consolidate timing functions into time.h
  pc-bios: s390x: Move sleep and yield to helper.h
  pc-bios: s390x: Get rid of magic offsets into the lowcore
  pc-bios: s390x: Rename and use PSW_MASK_ZMODE constant
  pc-bios: s390x: Use PSW masks where possible and introduce
    PSW_MASK_SHORT_ADDR
  pc-bios: s390x: Move panic() into header and add infinite loop
  pc-bios: s390x: Use ebcdic2ascii table
  pc-bios: s390x: Make u32 ptr check explicit

 pc-bios/s390-ccw/bootmap.c     |  4 +---
 pc-bios/s390-ccw/cio.c         | 40 +++++++++++++++++++---------------
 pc-bios/s390-ccw/cio.h         | 17 ++++++++++-----
 pc-bios/s390-ccw/dasd-ipl.c    |  5 ++---
 pc-bios/s390-ccw/helper.h      | 19 +++++++++++++++-
 pc-bios/s390-ccw/jump2ipl.c    | 10 ++++-----
 pc-bios/s390-ccw/main.c        | 15 +++----------
 pc-bios/s390-ccw/menu.c        |  1 +
 pc-bios/s390-ccw/netmain.c     | 23 +++----------------
 pc-bios/s390-ccw/s390-arch.h   |  4 +++-
 pc-bios/s390-ccw/s390-ccw.h    | 27 ++++++-----------------
 pc-bios/s390-ccw/s390-time.h   | 23 +++++++++++++++++++
 pc-bios/s390-ccw/start.S       |  5 +++--
 pc-bios/s390-ccw/virtio-net.c  |  2 ++
 pc-bios/s390-ccw/virtio-scsi.c |  2 ++
 pc-bios/s390-ccw/virtio.c      | 18 +++------------
 16 files changed, 108 insertions(+), 107 deletions(-)
 create mode 100644 pc-bios/s390-ccw/s390-time.h

-- 
2.25.1


