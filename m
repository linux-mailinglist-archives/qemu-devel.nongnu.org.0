Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332294927EE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:02:50 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9p4R-000369-0H
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDE-0003cX-78; Tue, 18 Jan 2022 08:07:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30350
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oD9-0000CF-T1; Tue, 18 Jan 2022 08:07:47 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IAtHi8005090; 
 Tue, 18 Jan 2022 13:07:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnpyvu288-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:40 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICrIup021316;
 Tue, 18 Jan 2022 13:07:39 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnpyvu27b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:39 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID25Ff007215;
 Tue, 18 Jan 2022 13:07:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3dknw9b9y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7ZtO40567198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 707F54C063;
 Tue, 18 Jan 2022 13:07:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241444C064;
 Tue, 18 Jan 2022 13:07:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5CC5B22016C;
 Tue, 18 Jan 2022 14:07:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/31] rSTify ppc-spapr-uv-hcalls.txt.
Date: Tue, 18 Jan 2022 14:07:03 +0100
Message-Id: <20220118130730.1927983-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TXaXaPis-LdjN3dbhL03eJHX8MkEUXrF
X-Proofpoint-GUID: FCjdgl-MvJa5L4sjx2awDE_1viQPrT5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1034 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=843 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <243a714d3861f7539d29b02a899ffc376757d668.1642446876.git.laga=
rcia@br.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/specs/ppc-spapr-uv-hcalls.txt | 165 ++++++++++++++++-------------
 1 file changed, 89 insertions(+), 76 deletions(-)

diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv=
-hcalls.txt
index 389c2740d764..a00288deb360 100644
--- a/docs/specs/ppc-spapr-uv-hcalls.txt
+++ b/docs/specs/ppc-spapr-uv-hcalls.txt
@@ -1,76 +1,89 @@
-On PPC64 systems supporting Protected Execution Facility (PEF), system
-memory can be placed in a secured region where only an "ultravisor"
-running in firmware can provide to access it. pseries guests on such
-systems can communicate with the ultravisor (via ultracalls) to switch t=
o a
-secure VM mode (SVM) where the guest's memory is relocated to this secur=
ed
-region, making its memory inaccessible to normal processes/guests runnin=
g on
-the host.
-
-The various ultracalls/hypercalls relating to SVM mode are currently
-only documented internally, but are planned for direct inclusion into th=
e
-public OpenPOWER version of the PAPR specification (LoPAPR/LoPAR). An in=
ternal
-ACR has been filed to reserve a hypercall number range specific to this
-use-case to avoid any future conflicts with the internally-maintained PA=
PR
-specification. This document summarizes some of these details as they re=
late
-to QEMU.
-
-=3D=3D hypercalls needed by the ultravisor =3D=3D
-
-Switching to SVM mode involves a number of hcalls issued by the ultravis=
or
-to the hypervisor to orchestrate the movement of guest memory to secure
-memory and various other aspects SVM mode. Numbers are assigned for thes=
e
-hcalls within the reserved range 0xEF00-0xEF80. The below documents the
-hcalls relevant to QEMU.
-
-- H_TPM_COMM (0xef10)
-
-  For TPM_COMM_OP_EXECUTE operation:
-    Send a request to a TPM and receive a response, opening a new TPM se=
ssion
-    if one has not already been opened.
-
-  For TPM_COMM_OP_CLOSE_SESSION operation:
-    Close the existing TPM session, if any.
-
-  Arguments:
-
-    r3 : H_TPM_COMM (0xef10)
-    r4 : TPM operation, one of:
-         TPM_COMM_OP_EXECUTE (0x1)
-         TPM_COMM_OP_CLOSE_SESSION (0x2)
-    r5 : in_buffer, guest physical address of buffer containing the requ=
est
-         - Caller may use the same address for both request and response
-    r6 : in_size, size of the in buffer
-         - Must be less than or equal to 4KB
-    r7 : out_buffer, guest physical address of buffer to store the respo=
nse
-         - Caller may use the same address for both request and response
-    r8 : out_size, size of the out buffer
-         - Must be at least 4KB, as this is the maximum request/response=
 size
-           supported by most TPM implementations, including the TPM Reso=
urce
-           Manager in the linux kernel.
-
-  Return values:
-
-    r3 : H_Success    request processed successfully
-         H_PARAMETER  invalid TPM operation
-         H_P2         in_buffer is invalid
-         H_P3         in_size is invalid
-         H_P4         out_buffer is invalid
-         H_P5         out_size is invalid
-         H_RESOURCE   problem communicating with TPM
-         H_FUNCTION   TPM access is not currently allowed/configured
-    r4 : For TPM_COMM_OP_EXECUTE, the size of the response will be store=
d here
-         upon success.
-
-  Use-case/notes:
-
-    SVM filesystems are encrypted using a symmetric key. This key is the=
n
-    wrapped/encrypted using the public key of a trusted system which has=
 the
-    private key stored in the system's TPM. An Ultravisor will use this
-    hcall to unwrap/unseal the symmetric key using the system's TPM devi=
ce
-    or a TPM Resource Manager associated with the device.
-
-    The Ultravisor sets up a separate session key with the TPM in advanc=
e
-    during host system boot. All sensitive in and out values will be
-    encrypted using the session key. Though the hypervisor will see the =
'in'
-    and 'out' buffers in raw form, any sensitive contents will generally=
 be
-    encrypted using this session key.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Hypervisor calls and the Ultravisor
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+On PPC64 systems supporting Protected Execution Facility (PEF), system m=
emory
+can be placed in a secured region where only an ultravisor running in fi=
rmware
+can provide access to. pSeries guests on such systems can communicate wi=
th
+the ultravisor (via ultracalls) to switch to a secure virtual machine (S=
VM) mode
+where the guest's memory is relocated to this secured region, making its=
 memory
+inaccessible to normal processes/guests running on the host.
+
+The various ultracalls/hypercalls relating to SVM mode are currently onl=
y
+documented internally, but are planned for direct inclusion into the Lin=
ux on
+Power Architecture Reference document ([LoPAR]_). An internal ACR has be=
en filed
+to reserve a hypercall number range specific to this use case to avoid a=
ny
+future conflicts with the IBM internally maintained Power Architecture P=
latform
+Reference (PAPR+) documentation specification. This document summarizes =
some of
+these details as they relate to QEMU.
+
+Hypercalls needed by the ultravisor
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Switching to SVM mode involves a number of hcalls issued by the ultravis=
or to
+the hypervisor to orchestrate the movement of guest memory to secure mem=
ory and
+various other aspects of the SVM mode. Numbers are assigned for these hc=
alls
+within the reserved range ``0xEF00-0xEF80``. The below documents the hca=
lls
+relevant to QEMU.
+
+``H_TPM_COMM`` (``0xef10``)
+---------------------------
+
+SVM file systems are encrypted using a symmetric key. This key is then
+wrapped/encrypted using the public key of a trusted system which has the=
 private
+key stored in the system's TPM. An Ultravisor will use this hcall to
+unwrap/unseal the symmetric key using the system's TPM device or a TPM R=
esource
+Manager associated with the device.
+
+The Ultravisor sets up a separate session key with the TPM in advance du=
ring
+host system boot. All sensitive in and out values will be encrypted usin=
g the
+session key. Though the hypervisor will see the in and out buffers in ra=
w form,
+any sensitive contents will generally be encrypted using this session ke=
y.
+
+Arguments:
+
+  ``r3``: ``H_TPM_COMM`` (``0xef10``)
+
+  ``r4``: ``TPM`` operation, one of:
+
+    ``TPM_COMM_OP_EXECUTE`` (``0x1``): send a request to a TPM and recei=
ve a
+    response, opening a new TPM session if one has not already been open=
ed.
+
+    ``TPM_COMM_OP_CLOSE_SESSION`` (``0x2``): close the existing TPM sess=
ion, if
+    any.
+
+  ``r5``: ``in_buffer``, guest physical address of buffer containing the
+  request. Caller may use the same address for both request and response=
.
+
+  ``r6``: ``in_size``, size of the in buffer. Must be less than or equal=
 to
+  4 KB.
+
+  ``r7``: ``out_buffer``, guest physical address of buffer to store the
+  response. Caller may use the same address for both request and respons=
e.
+
+  ``r8``: ``out_size``, size of the out buffer. Must be at least 4 KB, a=
s this
+  is the maximum request/response size supported by most TPM implementat=
ions,
+  including the TPM Resource Manager in the linux kernel.
+
+Return values:
+
+  ``r3``: one of the following values:
+
+    ``H_Success``: request processed successfully.
+
+    ``H_PARAMETER``: invalid TPM operation.
+
+    ``H_P2``: ``in_buffer`` is invalid.
+
+    ``H_P3``: ``in_size`` is invalid.
+
+    ``H_P4``: ``out_buffer`` is invalid.
+
+    ``H_P5``: ``out_size`` is invalid.
+
+    ``H_RESOURCE``: problem communicating with TPM.
+
+    ``H_FUNCTION``: TPM access is not currently allowed/configured.
+
+    ``r4``: For ``TPM_COMM_OP_EXECUTE``, the size of the response will b=
e stored
+    here upon success.
--=20
2.31.1


