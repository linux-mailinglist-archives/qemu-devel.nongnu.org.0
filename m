Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6520F626
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 15:49:56 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqGe3-0001vP-Dz
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 09:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.vnet.ibm.com>)
 id 1jqGVu-0004bq-3u
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:41:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.vnet.ibm.com>)
 id 1jqGVs-0006sU-2z
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:41:29 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UDWVEX009257; Tue, 30 Jun 2020 09:41:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041dvwnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 09:41:24 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05UDWac0009436;
 Tue, 30 Jun 2020 09:41:23 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041dvwn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 09:41:23 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05UDZvVH030739;
 Tue, 30 Jun 2020 13:41:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 31wwr8r8d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 13:41:22 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05UDfL3V58458484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 13:41:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F22FC6057;
 Tue, 30 Jun 2020 13:41:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F9D8C6055;
 Tue, 30 Jun 2020 13:41:20 +0000 (GMT)
Received: from Tobins-MBP-2.fios-router.home (unknown [9.85.167.92])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 13:41:20 +0000 (GMT)
From: Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: SEV: QMP support for Inject-Launch-Secret
Date: Tue, 30 Jun 2020 09:41:01 -0400
Message-Id: <20200630134102.46777-1-tobin@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_06:2020-06-30,
 2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=1 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=773
 malwarescore=0 impostorscore=0 cotscore=-2147483648 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300094
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=tobin@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 09:41:26
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: thomas.lendacky@amd.com, jejb@linux.ibm.com, tobin@ibm.com,
 dgilbert@redhat.com, Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>,
 pbonzini@redhat.com, brijesh.singh@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an update to part of a patch submitted previously to
provide support for injecting a secret blob into guest memory
using AMD SEV.

The user provides a header and a wrapped secret blob via QMP,
which are provided to the AMD Secure Processor and injected
into the guest.

Note that this patch requires the user to provide the guest
physical address where the secret will be injected via QMP.

Tobin Feldman-Fitzthum (1):
  sev: add sev-inject-launch-secret

 include/monitor/monitor.h |  3 ++
 include/sysemu/sev.h      |  2 ++
 monitor/misc.c            |  8 ++---
 qapi/misc-target.json     | 18 +++++++++++
 target/i386/monitor.c     |  9 ++++++
 target/i386/sev-stub.c    |  5 +++
 target/i386/sev.c         | 66 +++++++++++++++++++++++++++++++++++++++
 target/i386/trace-events  |  1 +
 8 files changed, 108 insertions(+), 4 deletions(-)

-- 
2.20.1 (Apple Git-117)


