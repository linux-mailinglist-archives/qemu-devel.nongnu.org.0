Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8E75F8F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 09:18:35 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hquUt-0003ul-0r
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 03:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49911)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUe-0003RG-Qz
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUb-000750-PX
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34806
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sathnaga@linux.vnet.ibm.com>)
 id 1hquUb-00073f-Hi
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:17 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q7HZSm104778
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:18:17 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tystqfhm9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:18:16 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <sathnaga@linux.vnet.ibm.com>;
 Fri, 26 Jul 2019 08:18:15 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Jul 2019 08:18:13 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6Q7ICsN59048020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2019 07:18:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB82A4064;
 Fri, 26 Jul 2019 07:18:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 706A8A4067;
 Fri, 26 Jul 2019 07:18:11 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.193.110.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jul 2019 07:18:11 +0000 (GMT)
From: sathnaga@linux.vnet.ibm.com
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:48:09 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072607-0016-0000-0000-000002965A7C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072607-0017-0000-0000-000032F4595A
Message-Id: <20190726071809.32389-1-sathnaga@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=721 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260096
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 1/2] tests.acceptance.avocado_qemu: Add support
 for powerpc
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

Current acceptance test will not run in powerpc Little endian
environment due the arch name does not match the qemu binary path,
let's handle it.

Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index aee5d820ed..a05f0bb530 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -19,6 +19,7 @@ sys.path.append(os.path.join(SRC_ROOT_DIR, 'python'))
 
 from qemu.machine import QEMUMachine
 
+
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
@@ -39,6 +40,9 @@ def pick_default_qemu_bin(arch=None):
     """
     if arch is None:
         arch = os.uname()[4]
+    # qemu binary path does not match arch for powerpc, handle it
+    if 'ppc64le' in arch:
+        arch = 'ppc64'
     qemu_bin_relative_path = os.path.join("%s-softmmu" % arch,
                                           "qemu-system-%s" % arch)
     if is_readable_executable_file(qemu_bin_relative_path):
-- 
2.21.0


