Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DB17FEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:44:11 +0100 (CET)
Received: from localhost ([::1]:33326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBfB4-00044d-QF
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jBf9Q-0002SV-3V
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jBf9N-0007jh-OG
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:42:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59954
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jBf9N-0007iJ-JE
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:42:25 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ADgJZu074555
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:42:25 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ym649xmn8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:42:24 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 10 Mar 2020 13:42:23 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Mar 2020 13:42:20 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02ADgJjq42729936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:42:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C977C11C04C;
 Tue, 10 Mar 2020 13:42:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D0DD11C04A;
 Tue, 10 Mar 2020 13:42:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.23.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 13:42:18 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/15] docs: Add protvirt docs
Date: Tue, 10 Mar 2020 09:40:07 -0400
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310134008.130038-1-frankja@linux.ibm.com>
References: <20200310134008.130038-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031013-0016-0000-0000-000002EF0551
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031013-0017-0000-0000-000033526972
Message-Id: <20200310134008.130038-15-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_07:2020-03-10,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=1 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100091
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets add some documentation for the Protected VM functionality.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 docs/system/index.rst    |  1 +
 docs/system/protvirt.rst | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 docs/system/protvirt.rst

diff --git a/docs/system/index.rst b/docs/system/index.rst
index 6e5f20fa13..74afbd7cc3 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -34,3 +34,4 @@ Contents:
    deprecated
    build-platforms
    license
+   protvirt
diff --git a/docs/system/protvirt.rst b/docs/system/protvirt.rst
new file mode 100644
index 0000000000..6c8cf0f791
--- /dev/null
+++ b/docs/system/protvirt.rst
@@ -0,0 +1,56 @@
+Protected Virtualization on s390x
+=================================
+
+The memory and most of the registers of Protected Virtual Machines
+(PVMs) are encrypted or inaccessible to the hypervisor, effectively
+prohibiting VM introspection when the VM is running. At rest, PVMs are
+encrypted and can only be decrypted by the firmware, represented by an
+entity called Ultravisor, of specific IBM Z machines.
+
+
+Prerequisites
+-------------
+
+To run PVMs a machine with the Protected Virtualization feature
+which is indicated by the Ultravisor Call facility (stfle bit
+158) is required. The Ultravisor needs to be initialized at boot by
+setting `prot_virt=1` on the kernel command line.
+
+If those requirements are met, the capability `KVM_CAP_S390_PROTECTED`
+will indicate that KVM can support PVMs on that LPAR.
+
+
+QEMU Settings
+-------------
+
+To indicate to the VM that it can transition into protected mode, the
+`Unpack facility` (stfle bit 161 represented by the feature
+`S390_FEAT_UNPACK`) needs to be part of the cpu model of the VM.
+
+All I/O devices need to use the IOMMU.
+Passthrough (vfio) devices are currently not supported.
+
+Host huge page backings are not supported. However guests can use huge
+pages as indicated by its facilities.
+
+
+Boot Process
+------------
+
+A secure guest image can either be loaded from disk or supplied on the
+QEMU command line. Booting from disk is done by the unmodified
+s390-ccw BIOS. I.e., the bootmap is interpreted, multiple components
+are read into memory and control is transferred to one of the
+components (zipl stage3). Stag3 does some fixups and then transfers
+control to some program residing in guest memory, which is normally
+the OS kernel. The secure image has another component prepended
+(stage3a) that uses the new diag308 subcodes 8 and 10 to trigger the
+transition into secure mode.
+
+Booting from the image supplied via the QEMU command line requires
+that the file passed via -kernel has the same memory layout as would
+result from the disk boot. This memory layout includes the encrypted
+components (kernel, initrd, cmdline), the stage3a loader and
+metadata. In case this boot method is used, the command line
+options -initrd and -cmdline are ineffective. The preparation of a PVM
+image is done by genprotimg of the s390-tools package.
-- 
2.20.1


