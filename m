Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405916B287
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 01:54:13 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnXGs-0008IU-9I
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 19:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38941)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1hnXGV-0007Ai-AS
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 19:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1hnXGU-0001u3-2Z
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 19:53:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1hnXGR-0001rB-9u; Tue, 16 Jul 2019 19:53:43 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GMbu2R103695; Tue, 16 Jul 2019 19:53:35 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsnmne4m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 19:53:35 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6GMdkQX017953;
 Tue, 16 Jul 2019 23:53:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2tq6x637vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 23:53:34 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GNrXGc55378286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 23:53:33 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F4223136051;
 Tue, 16 Jul 2019 23:53:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAD3C13604F;
 Tue, 16 Jul 2019 23:53:32 +0000 (GMT)
Received: from localhost (unknown [9.53.179.212])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 23:53:32 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 18:53:12 -0500
Message-Id: <20190716235313.29806-2-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190716235313.29806-1-mdroth@linux.vnet.ibm.com>
References: <20190716235313.29806-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160261
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH for-4.2 1/2] docs/specs: initial spec summary
 for Ultravisor-related hcalls
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
Cc: linuxram@us.ibm.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now this only covers hcalls relating to TPM communication since
it's the only one particularly important from a QEMU perspective atm,
but others can be added here where it makes sense.

The full specification for all hcalls/ucalls will eventually be made
available in the public/OpenPower version of the PAPR specification.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 docs/specs/ppc-spapr-uv-hcalls.txt | 75 ++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 docs/specs/ppc-spapr-uv-hcalls.txt

diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv-hcalls.txt
new file mode 100644
index 0000000000..6c3066a2b5
--- /dev/null
+++ b/docs/specs/ppc-spapr-uv-hcalls.txt
@@ -0,0 +1,75 @@
+On PPC64 systems supporting Protected Execution Facility (PEF), system
+memory can be placed in a secured region where only an "ultravisor"
+running in firmware can provide to access it. pseries guests on such
+systems can communicate with the ultravisor (via ultracalls) to switch to a
+secure VM mode (SVM) where the guest's memory is relocated to this secured
+region, making its memory inaccessible to normal processes/guests running on
+the host.
+
+The various ultracalls/hypercalls relating to SVM mode are currently
+only documented internally, but are planned for direct inclusion into the
+public OpenPOWER version of the PAPR specification (LoPAPR/LoPAR). An internal
+ACR has been filed to reserve a hypercall number range specific to this
+use-case to avoid any future conflicts with the internally-maintained PAPR
+specification. This document summarizes some of these details as they relate
+to QEMU.
+
+== hypercalls needed by the ultravisor ==
+
+Switching to SVM mode involves a number of hcalls issued by the ultravisor
+to the hypervisor to orchestrate the movement of guest memory to secure
+memory and various other aspects SVM mode. The below documents the hcalls
+relevant to QEMU.
+
+- H_TPM_COMM (0xef10)
+
+  For TPM_COMM_OP_EXECUTE operation:
+    Send a request to a TPM and receive a response, opening a new TPM session
+    if one has not already been opened.
+
+  For TPM_COMM_OP_CLOSE_SESSION operation:
+    Close the existing TPM session, if any.
+
+  Arguments:
+
+    r3 : H_TPM_COMM (0xef10)
+    r4 : TPM operation, one of:
+         TPM_COMM_OP_EXECUTE (0x1)
+         TPM_COMM_OP_CLOSE_SESSION (0x2)
+    r5 : in_buffer, guest physical address of buffer containing the request
+         - Caller may use the same address for both request and response
+    r6 : in_size, size of the in buffer
+         - Must be less than or equal to 4KB
+    r7 : out_buffer, guest physical address of buffer to store the response
+         - Caller may use the same address for both request and response
+    r8 : out_size, size of the out buffer
+         - Must be at least 4KB, as this is the maximum request/response size
+           supported by most TPM implementations, including the TPM Resource
+           Manager in the linux kernel.
+
+  Return values:
+
+    r3 : H_Success    request processed successfully
+         H_PARAMETER  invalid TPM operation
+         H_P2         in_buffer is invalid
+         H_P3         in_size is invalid
+         H_P4         out_buffer is invalid
+         H_P5         out_size is invalid
+         H_RESOURCE   problem communicating with TPM
+         H_FUNCTION   TPM access is not currently allowed/configured
+    r4 : For TPM_COMM_OP_EXECUTE, the size of the response will be stored here
+         upon success.
+
+  Use-case/notes:
+
+    SVM filesystems are encrypted using a symmetric key. This key is then
+    wrapped/encrypted using the public key of a trusted system which has the
+    private key stored in the system's TPM. An Ultravisor will use this
+    hcall to unwrap/unseal the symmetric key using the system's TPM device
+    or a TPM Resource Manager associated with the device.
+
+    The Ultravisor sets up a separate session key with the TPM in advance
+    during host system boot. All sensitive in and out values will be
+    encrypted using the session key. Though the hypervisor will see the 'in'
+    and 'out' buffers in raw form, any sensitive contents will generally be
+    encrypted using this session key.
-- 
2.17.1


