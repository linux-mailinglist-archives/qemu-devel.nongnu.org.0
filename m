Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9F4B131A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:40:54 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICUx-0003QE-1a
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95I-0002JE-W4; Thu, 10 Feb 2022 08:02:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24190
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94y-0004Nm-0k; Thu, 10 Feb 2022 08:02:04 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ACQEtX013086; 
 Thu, 10 Feb 2022 13:01:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e50hhkx5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:59 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ACsdva028599;
 Thu, 10 Feb 2022 13:00:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e50hhkx03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw6MG011561;
 Thu, 10 Feb 2022 13:00:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3e1gv9x2gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0hMh43647430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4637A406A;
 Thu, 10 Feb 2022 13:00:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 992B2A4062;
 Thu, 10 Feb 2022 13:00:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BF3E92201DC;
 Thu, 10 Feb 2022 14:00:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 41/42] docs: rstfy confidential guest documentation
Date: Thu, 10 Feb 2022 14:00:07 +0100
Message-Id: <20220210130008.2599950-42-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PRLvHezbWduFrVQNPnaIAnMpvEujZWYe
X-Proofpoint-ORIG-GUID: yPMlmOXP72AaUoSxvWX59UXpD2uoGP2e
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 clxscore=1034 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100071
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.146,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Also rstfy the documentation for AMD SEV, and link it.

The documentation for PEF had been merged into the pseries doc,
fix the reference.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220204161251.241877-1-cohuck@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 .../confidential-guest-support.rst}           |  15 +--
 .../i386/amd-memory-encryption.rst}           | 102 ++++++++++--------
 docs/system/index.rst                         |   1 +
 docs/system/ppc/pseries.rst                   |   2 +
 docs/system/target-i386.rst                   |   1 +
 MAINTAINERS                                   |   2 +-
 6 files changed, 67 insertions(+), 56 deletions(-)
 rename docs/{confidential-guest-support.txt =3D> system/confidential-guest=
-support.rst} (77%)
 rename docs/{amd-memory-encryption.txt =3D> system/i386/amd-memory-encrypt=
ion.rst} (62%)

diff --git a/docs/confidential-guest-support.txt b/docs/system/confidential=
-guest-support.rst
similarity index 77%
rename from docs/confidential-guest-support.txt
rename to docs/system/confidential-guest-support.rst
index 71d07ba57af8..0c490dbda2b7 100644
--- a/docs/confidential-guest-support.txt
+++ b/docs/system/confidential-guest-support.rst
@@ -19,10 +19,10 @@ Running a Confidential Guest
=20
 To run a confidential guest you need to add two command line parameters:
=20
-1. Use "-object" to create a "confidential guest support" object.  The
+1. Use ``-object`` to create a "confidential guest support" object.  The
    type and parameters will vary with the specific mechanism to be
    used
-2. Set the "confidential-guest-support" machine parameter to the ID of
+2. Set the ``confidential-guest-support`` machine parameter to the ID of
    the object from (1).
=20
 Example (for AMD SEV)::
@@ -37,13 +37,8 @@ Supported mechanisms
=20
 Currently supported confidential guest mechanisms are:
=20
-AMD Secure Encrypted Virtualization (SEV)
-    docs/amd-memory-encryption.txt
-
-POWER Protected Execution Facility (PEF)
-    docs/papr-pef.txt
-
-s390x Protected Virtualization (PV)
-    docs/system/s390x/protvirt.rst
+* AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-enc=
ryption`)
+* POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected=
-execution-facility-pef`)
+* s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
=20
 Other mechanisms may be supported in future.
diff --git a/docs/amd-memory-encryption.txt b/docs/system/i386/amd-memory-e=
ncryption.rst
similarity index 62%
rename from docs/amd-memory-encryption.txt
rename to docs/system/i386/amd-memory-encryption.rst
index ffca382b5f5d..215946f813bb 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/system/i386/amd-memory-encryption.rst
@@ -1,3 +1,6 @@
+AMD Secure Encrypted Virtualization (SEV)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
=20
 SEV is an extension to the AMD-V architecture which supports running encry=
pted
@@ -24,17 +27,18 @@ the hypervisor to satisfy the requested function.
=20
 Launching
 ---------
+
 Boot images (such as bios) must be encrypted before a guest can be booted.=
 The
-MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_ST=
ART,
-LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
+``MEMORY_ENCRYPT_OP`` ioctl provides commands to encrypt the images: ``LAU=
NCH_START``,
+``LAUNCH_UPDATE_DATA``, ``LAUNCH_MEASURE`` and ``LAUNCH_FINISH``. These fo=
ur commands
 together generate a fresh memory encryption key for the VM, encrypt the bo=
ot
 images and provide a measurement than can be used as an attestation of a
 successful launch.
=20
-For a SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt=
 the
+For a SEV-ES guest, the ``LAUNCH_UPDATE_VMSA`` command is also used to enc=
rypt the
 guest register state, or VM save area (VMSA), for all of the guest vCPUs.
=20
-LAUNCH_START is called first to create a cryptographic launch context with=
in
+``LAUNCH_START`` is called first to create a cryptographic launch context =
within
 the firmware. To create this context, guest owner must provide a guest pol=
icy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
 should be treated as a binary blob and must be passed as-is to the SEV fir=
mware.
@@ -45,37 +49,37 @@ in bad measurement). The guest policy is a 4-byte data =
structure containing
 several flags that restricts what can be done on a running SEV guest.
 See KM Spec section 3 and 6.2 for more details.
=20
-The guest policy can be provided via the 'policy' property (see below)
+The guest policy can be provided via the ``policy`` property::
=20
-# ${QEMU} \
-   sev-guest,id=3Dsev0,policy=3D0x1...\
+  # ${QEMU} \
+     sev-guest,id=3Dsev0,policy=3D0x1...\
=20
 Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as a
-SEV-ES guest (see below)
+SEV-ES guest::
=20
-# ${QEMU} \
-   sev-guest,id=3Dsev0,policy=3D0x5...\
+  # ${QEMU} \
+     sev-guest,id=3Dsev0,policy=3D0x5...\
=20
 The guest owner provided DH certificate and session parameters will be use=
d to
 establish a cryptographic session with the guest owner to negotiate keys u=
sed
 for the attestation.
=20
-The DH certificate and session blob can be provided via the 'dh-cert-file'=
 and
-'session-file' properties (see below)
+The DH certificate and session blob can be provided via the ``dh-cert-file=
`` and
+``session-file`` properties::
=20
-# ${QEMU} \
-     sev-guest,id=3Dsev0,dh-cert-file=3D<file1>,session-file=3D<file2>
+  # ${QEMU} \
+       sev-guest,id=3Dsev0,dh-cert-file=3D<file1>,session-file=3D<file2>
=20
-LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic cont=
ext
-created via the LAUNCH_START command. If required, this command can be cal=
led
+``LAUNCH_UPDATE_DATA`` encrypts the memory region using the cryptographic =
context
+created via the ``LAUNCH_START`` command. If required, this command can be=
 called
 multiple times to encrypt different memory regions. The command also calcu=
lates
 the measurement of the memory contents as it encrypts.
=20
-LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for a SEV-ES guest using the
-cryptographic context created via the LAUNCH_START command. The command al=
so
+``LAUNCH_UPDATE_VMSA`` encrypts all the vCPU VMSAs for a SEV-ES guest usin=
g the
+cryptographic context created via the ``LAUNCH_START`` command. The comman=
d also
 calculates the measurement of the VMSAs as it encrypts them.
=20
-LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory=
 and,
+``LAUNCH_MEASURE`` can be used to retrieve the measurement of encrypted me=
mory and,
 for a SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
 memory contents and, for a SEV-ES guest, the VMSA contents, that can be se=
nt
 to the guest owner as an attestation that the memory and VMSAs were encryp=
ted
@@ -85,27 +89,28 @@ Since the guest owner knows the initial contents of the=
 guest at boot, the
 attestation measurement can be verified by comparing it to what the guest =
owner
 expects.
=20
-LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
+``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
 context.
=20
-See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
+See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A)=
 for the
 complete flow chart.
=20
-To launch a SEV guest
+To launch a SEV guest::
=20
-# ${QEMU} \
-    -machine ...,confidential-guest-support=3Dsev0 \
-    -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1
+  # ${QEMU} \
+      -machine ...,confidential-guest-support=3Dsev0 \
+      -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1
=20
-To launch a SEV-ES guest
+To launch a SEV-ES guest::
=20
-# ${QEMU} \
-    -machine ...,confidential-guest-support=3Dsev0 \
-    -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1,policy=
=3D0x5
+  # ${QEMU} \
+      -machine ...,confidential-guest-support=3Dsev0 \
+      -object sev-guest,id=3Dsev0,cbitpos=3D47,reduced-phys-bits=3D1,polic=
y=3D0x5
=20
 An SEV-ES guest has some restrictions as compared to a SEV guest. Because =
the
 guest register state is encrypted and cannot be updated by the VMM/hypervi=
sor,
 a SEV-ES guest:
+
  - Does not support SMM - SMM support requires updating the guest register
    state.
  - Does not support reboot - a system reset requires updating the guest re=
gister
@@ -114,35 +119,42 @@ a SEV-ES guest:
    manage booting APs.
=20
 Debugging
------------
+---------
+
 Since the memory contents of a SEV guest are encrypted, hypervisor access =
to
 the guest memory will return cipher text. If the guest policy allows debug=
ging,
 then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to =
access
 the guest memory region for debug purposes.  This is not supported in QEMU=
 yet.
=20
 Snapshot/Restore
------------------
+----------------
+
 TODO
=20
 Live Migration
-----------------
+---------------
+
 TODO
=20
 References
------------------
+----------
=20
-AMD Memory Encryption whitepaper:
-https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Wh=
itepaper_v7-Public.pdf
+`AMD Memory Encryption whitepaper
+<https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_W=
hitepaper_v7-Public.pdf>`_
=20
-Secure Encrypted Virtualization Key Management:
-[1] http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Spec=
ification.pdf
+.. [SEVKM] `Secure Encrypted Virtualization Key Management
+   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Spec=
ification.pdf>`_
=20
 KVM Forum slides:
-http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualiz=
atoin_Memory_Encryption_Technology.pdf
-https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualiz=
ation-with-SEV-ES-Thomas-Lendacky-AMD.pdf
-
-AMD64 Architecture Programmer's Manual:
-   http://support.amd.com/TechDocs/24593.pdf
-   SME is section 7.10
-   SEV is section 15.34
-   SEV-ES is section 15.35
+
+* `AMD=E2=80=99s Virtualization Memory Encryption (2016)
+  <http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtua=
lizatoin_Memory_Encryption_Technology.pdf>`_
+* `Extending Secure Encrypted Virtualization With SEV-ES (2018)
+  <https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtua=
lization-with-SEV-ES-Thomas-Lendacky-AMD.pdf>`_
+
+`AMD64 Architecture Programmer's Manual:
+<http://support.amd.com/TechDocs/24593.pdf>`_
+
+* SME is section 7.10
+* SEV is section 15.34
+* SEV-ES is section 15.35
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 73bbedbc22d4..23e30e26e5e6 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -34,3 +34,4 @@ or Hypervisor.Framework.
    targets
    security
    multi-process
+   confidential-guest-support
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 569237dc0c8b..d9b65ad4e850 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -224,6 +224,8 @@ nested. Combinations not shown in the table are not ava=
ilable.
 .. [3] Introduced on Power10 machines.
=20
=20
+.. _power-papr-protected-execution-facility-pef:
+
 POWER (PAPR) Protected Execution Facility (PEF)
 -----------------------------------------------
=20
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 4daa53c35d8f..96bf54889a82 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -28,6 +28,7 @@ Architectural features
    i386/cpu
    i386/kvm-pv
    i386/sgx
+   i386/amd-memory-encryption
=20
 .. _pcsys_005freq:
=20
diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975c5..8944fb561c0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -408,7 +408,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: docs/amd-memory-encryption.txt
+F: docs/system/i386/amd-memory-encryption.rst
 F: docs/system/i386/sgx.rst
 F: target/i386/kvm/
 F: target/i386/sev*
--=20
2.34.1


