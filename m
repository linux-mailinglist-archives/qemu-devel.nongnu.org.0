Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F655165E1A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 14:03:24 +0100 (CET)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4lUB-0006vF-7d
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 08:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lP6-0006ct-7M
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lP4-0006iE-Un
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9852
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4lP4-0006hF-QG
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:06 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KCtLEZ131759
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:58:05 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8uc18qvf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:58:04 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 12:58:03 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 12:57:53 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KCvrpb29949970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 12:57:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023C1AE04D;
 Thu, 20 Feb 2020 12:57:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B573FAE045;
 Thu, 20 Feb 2020 12:57:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 12:57:51 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/16] docs: Add protvirt docs
Date: Thu, 20 Feb 2020 07:56:38 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220125638.7241-1-frankja@linux.ibm.com>
References: <20200220125638.7241-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022012-0012-0000-0000-000003889AD1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022012-0013-0000-0000-000021C5318D
Message-Id: <20200220125638.7241-17-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=1 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200097
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets add some documentation for the Protected VM functionality.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 docs/protvirt.rst | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 docs/protvirt.rst

diff --git a/docs/protvirt.rst b/docs/protvirt.rst
new file mode 100644
index 0000000000..8bfa72be01
--- /dev/null
+++ b/docs/protvirt.rst
@@ -0,1 +1,53 @@
+Protected Virtualization on s390x
+========================
+The memory and most of the register contents of Protected Virtual
+Machines (PVMs) are inaccessible to the hypervisor, effectively
+prohibiting VM introspection when the VM is running. At rest, PVMs are
+encrypted and can only be decrypted by the firmware of specific IBM Z
+machines.
+
+
+Prerequisites
+-------------
+To run PVMs, you need to have a machine with the Protected
+Virtualization feature, which is indicated by the Ultravisor Call
+facility (stfle bit 158). This is a KVM only feature, therefore you
+need a KVM which is able to support PVMs and activate the Ultravisor
+initialization by setting "prot_virt=1" on the kernel command line.
+
+If those requirements are met, the capability "KVM_CAP_S390_PROTECTED"
+will indicate that KVM can support PVMs on that LPAR.
+
+
+QEMU Settings
+-------------
+To indicate to the VM that it can move into protected mode, the
+"Unpack facility" (stfle bit 161) needs to be part of the cpu model of
+the VM.
+
+All I/O devices need to use the IOMMU.
+Passthrough devices are currently not supported.
+
+Host huge page backings are not supported. The guest however can use
+huge pages as indicated by its facilities.
+
+
+Boot Process
+-----------------
+A secure guest image can be booted from disk and using the QEMU
+command line. Booting from disk is done by the unmodified s390-ccw
+BIOS. I.e., the bootmap is interpreted and a number of components is
+read into memory and control is transferred to one of the components
+(zipl stage3), which does some fixups and then transfers control to
+some program residing in guest memory, which is normally the OS
+kernel. The secure image has another component prepended (stage3a)
+which uses the new diag308 subcodes 8 and 10 to trigger the transition
+into secure mode.
+
+Booting from the command line requires that the file passed
+via -kernel has the same memory layout as would result from the disk
+boot. This memory layout includes the encrypted components (kernel,
+initrd, cmdline), the stage3a loader and metadata. In case this boot
+method is used, the command line options -initrd and -cmdline are
+ineffective.  The preparation of secure guest image is done by a
+program (name tbd) of the s390-tools package.
-- 
2.20.1


