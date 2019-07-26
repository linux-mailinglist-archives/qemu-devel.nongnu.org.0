Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69575F8E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 09:18:19 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hquUb-000309-La
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 03:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47791)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUM-0002Vk-AH
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUJ-0006Fb-Ay
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41898)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sathnaga@linux.vnet.ibm.com>)
 id 1hquUJ-00064R-2q
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:17:59 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q7HWEH137450
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:17:54 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tytnjwe7s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:17:54 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <sathnaga@linux.vnet.ibm.com>;
 Fri, 26 Jul 2019 08:17:52 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Jul 2019 08:17:50 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6Q7Hn1G52035790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2019 07:17:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AB0EA405F;
 Fri, 26 Jul 2019 07:17:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C259A4064;
 Fri, 26 Jul 2019 07:17:48 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.193.110.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jul 2019 07:17:48 +0000 (GMT)
From: sathnaga@linux.vnet.ibm.com
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:47:37 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072607-0028-0000-0000-000003880808
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072607-0029-0000-0000-0000244849D7
Message-Id: <20190726071737.32298-1-sathnaga@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=638 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260096
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 0/2] Add support for powerpc acceptance test
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

This series attempt to add support for avocado acceptance
test for powerpc and adds linux console boot test.

avocado run boot_linux_console.py:BootLinuxConsole.test_ppc64le_pseries version.py vnc.py 
JOB ID     : 918ed65e5e8bc1370c84c166a2c41936a700571e
JOB LOG    : /home/sath/tests/results/job-2019-07-26T03.08-918ed65/job.log
 (1/6) boot_linux_console.py:BootLinuxConsole.test_ppc64le_pseries: PASS (3.98 s)
 (2/6) version.py:Version.test_qmp_human_info_version: PASS (0.15 s)
 (3/6) vnc.py:Vnc.test_no_vnc: PASS (0.14 s)
 (4/6) vnc.py:Vnc.test_no_vnc_change_password: PASS (0.13 s)
 (5/6) vnc.py:Vnc.test_vnc_change_password_requires_a_password: PASS (0.14 s)
 (6/6) vnc.py:Vnc.test_vnc_change_password: PASS (0.14 s)
RESULTS    : PASS 6 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 5.68 s


Satheesh Rajendran (2):
  tests.acceptance.avocado_qemu: Add support for powerpc
  tests.acceptance.boot_linux_console: Add pseries linux boot console
    test

 tests/acceptance/avocado_qemu/__init__.py |  4 ++++
 tests/acceptance/boot_linux_console.py    | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.21.0


