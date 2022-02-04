Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560A4A9CF1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:28:46 +0100 (CET)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1S0-0000yW-Mq
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nG1D5-0004eo-NQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nG1Cz-0004PW-7p
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643991189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MwlgOaxq1S4uirKa3Iix62aUSQHqhuG0Xgthii4Yyv8=;
 b=LuIogd1Goxr6wDAQeXnPXw5zhpnbp+IdqlIoqCBrVI8I6uXwAuW74KqYe6NRa5NoCbmzB+
 FUju2MLXY1ycRxUkG+qgjH68m6CaIlo5TEq/5S1trIPy3YZQD7sLUTmGbIrdw7bHDCvXaZ
 ohww8fpD+4W7sfVT/ouyuECBgoio2ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-x7Y2JEF4NvyUc7iizQXDRQ-1; Fri, 04 Feb 2022 11:12:58 -0500
X-MC-Unique: x7Y2JEF4NvyUc7iizQXDRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC481192CC42;
 Fri,  4 Feb 2022 16:12:56 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.194.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4A9A84D03;
 Fri,  4 Feb 2022 16:12:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: rstfy confidential guest documentation
Date: Fri,  4 Feb 2022 17:12:51 +0100
Message-Id: <20220204161251.241877-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also rstfy the documentation for AMD SEV, and link it.

The documentation for PEF had been merged into the pseries doc,
fix the reference.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS                                   |   2 +-
 .../confidential-guest-support.rst}           |  15 +--
 .../i386/amd-memory-encryption.rst}           | 102 ++++++++++--------
 docs/system/index.rst                         |   1 +
 docs/system/ppc/pseries.rst                   |   2 +
 docs/system/target-i386.rst                   |   1 +
 6 files changed, 67 insertions(+), 56 deletions(-)
 rename docs/{confidential-guest-support.txt => system/confidential-guest-support.rst} (77%)
 rename docs/{amd-memory-encryption.txt => system/i386/amd-memory-encryption.rst} (62%)

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
diff --git a/docs/confidential-guest-support.txt b/docs/system/confidential-guest-support.rst
similarity index 77%
rename from docs/confidential-guest-support.txt
rename to docs/system/confidential-guest-support.rst
index 71d07ba57af8..0c490dbda2b7 100644
--- a/docs/confidential-guest-support.txt
+++ b/docs/system/confidential-guest-support.rst
@@ -19,10 +19,10 @@ Running a Confidential Guest
 
 To run a confidential guest you need to add two command line parameters:
 
-1. Use "-object" to create a "confidential guest support" object.  The
+1. Use ``-object`` to create a "confidential guest support" object.  The
    type and parameters will vary with the specific mechanism to be
    used
-2. Set the "confidential-guest-support" machine parameter to the ID of
+2. Set the ``confidential-guest-support`` machine parameter to the ID of
    the object from (1).
 
 Example (for AMD SEV)::
@@ -37,13 +37,8 @@ Supported mechanisms
 
 Currently supported confidential guest mechanisms are:
 
-AMD Secure Encrypted Virtualization (SEV)
-    docs/amd-memory-encryption.txt
-
-POWER Protected Execution Facility (PEF)
-    docs/papr-pef.txt
-
-s390x Protected Virtualization (PV)
-    docs/system/s390x/protvirt.rst
+* AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
+* POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
+* s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
 
 Other mechanisms may be supported in future.
diff --git a/docs/amd-memory-encryption.txt b/docs/system/i386/amd-memory-encryption.rst
similarity index 62%
rename from docs/amd-memory-encryption.txt
rename to docs/system/i386/amd-memory-encryption.rst
index ffca382b5f5d..215946f813bb 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/system/i386/amd-memory-encryption.rst
@@ -1,3 +1,6 @@
+AMD Secure Encrypted Virtualization (SEV)
+=========================================
+
 Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
 
 SEV is an extension to the AMD-V architecture which supports running encrypted
@@ -24,17 +27,18 @@ the hypervisor to satisfy the requested function.
 
 Launching
 ---------
+
 Boot images (such as bios) must be encrypted before a guest can be booted. The
-MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
-LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
+``MEMORY_ENCRYPT_OP`` ioctl provides commands to encrypt the images: ``LAUNCH_START``,
+``LAUNCH_UPDATE_DATA``, ``LAUNCH_MEASURE`` and ``LAUNCH_FINISH``. These four commands
 together generate a fresh memory encryption key for the VM, encrypt the boot
 images and provide a measurement than can be used as an attestation of a
 successful launch.
 
-For a SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
+For a SEV-ES guest, the ``LAUNCH_UPDATE_VMSA`` command is also used to encrypt the
 guest register state, or VM save area (VMSA), for all of the guest vCPUs.
 
-LAUNCH_START is called first to create a cryptographic launch context within
+``LAUNCH_START`` is called first to create a cryptographic launch context within
 the firmware. To create this context, guest owner must provide a guest policy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
 should be treated as a binary blob and must be passed as-is to the SEV firmware.
@@ -45,37 +49,37 @@ in bad measurement). The guest policy is a 4-byte data structure containing
 several flags that restricts what can be done on a running SEV guest.
 See KM Spec section 3 and 6.2 for more details.
 
-The guest policy can be provided via the 'policy' property (see below)
+The guest policy can be provided via the ``policy`` property::
 
-# ${QEMU} \
-   sev-guest,id=sev0,policy=0x1...\
+  # ${QEMU} \
+     sev-guest,id=sev0,policy=0x1...\
 
 Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as a
-SEV-ES guest (see below)
+SEV-ES guest::
 
-# ${QEMU} \
-   sev-guest,id=sev0,policy=0x5...\
+  # ${QEMU} \
+     sev-guest,id=sev0,policy=0x5...\
 
 The guest owner provided DH certificate and session parameters will be used to
 establish a cryptographic session with the guest owner to negotiate keys used
 for the attestation.
 
-The DH certificate and session blob can be provided via the 'dh-cert-file' and
-'session-file' properties (see below)
+The DH certificate and session blob can be provided via the ``dh-cert-file`` and
+``session-file`` properties::
 
-# ${QEMU} \
-     sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
+  # ${QEMU} \
+       sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
 
-LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
-created via the LAUNCH_START command. If required, this command can be called
+``LAUNCH_UPDATE_DATA`` encrypts the memory region using the cryptographic context
+created via the ``LAUNCH_START`` command. If required, this command can be called
 multiple times to encrypt different memory regions. The command also calculates
 the measurement of the memory contents as it encrypts.
 
-LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for a SEV-ES guest using the
-cryptographic context created via the LAUNCH_START command. The command also
+``LAUNCH_UPDATE_VMSA`` encrypts all the vCPU VMSAs for a SEV-ES guest using the
+cryptographic context created via the ``LAUNCH_START`` command. The command also
 calculates the measurement of the VMSAs as it encrypts them.
 
-LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
+``LAUNCH_MEASURE`` can be used to retrieve the measurement of encrypted memory and,
 for a SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
 memory contents and, for a SEV-ES guest, the VMSA contents, that can be sent
 to the guest owner as an attestation that the memory and VMSAs were encrypted
@@ -85,27 +89,28 @@ Since the guest owner knows the initial contents of the guest at boot, the
 attestation measurement can be verified by comparing it to what the guest owner
 expects.
 
-LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
+``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
+See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A) for the
 complete flow chart.
 
-To launch a SEV guest
+To launch a SEV guest::
 
-# ${QEMU} \
-    -machine ...,confidential-guest-support=sev0 \
-    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
+  # ${QEMU} \
+      -machine ...,confidential-guest-support=sev0 \
+      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
 
-To launch a SEV-ES guest
+To launch a SEV-ES guest::
 
-# ${QEMU} \
-    -machine ...,confidential-guest-support=sev0 \
-    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
+  # ${QEMU} \
+      -machine ...,confidential-guest-support=sev0 \
+      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
 
 An SEV-ES guest has some restrictions as compared to a SEV guest. Because the
 guest register state is encrypted and cannot be updated by the VMM/hypervisor,
 a SEV-ES guest:
+
  - Does not support SMM - SMM support requires updating the guest register
    state.
  - Does not support reboot - a system reset requires updating the guest register
@@ -114,35 +119,42 @@ a SEV-ES guest:
    manage booting APs.
 
 Debugging
------------
+---------
+
 Since the memory contents of a SEV guest are encrypted, hypervisor access to
 the guest memory will return cipher text. If the guest policy allows debugging,
 then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to access
 the guest memory region for debug purposes.  This is not supported in QEMU yet.
 
 Snapshot/Restore
------------------
+----------------
+
 TODO
 
 Live Migration
-----------------
+---------------
+
 TODO
 
 References
------------------
+----------
 
-AMD Memory Encryption whitepaper:
-https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
+`AMD Memory Encryption whitepaper
+<https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf>`_
 
-Secure Encrypted Virtualization Key Management:
-[1] http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf
+.. [SEVKM] `Secure Encrypted Virtualization Key Management
+   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf>`_
 
 KVM Forum slides:
-http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
-https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
-
-AMD64 Architecture Programmer's Manual:
-   http://support.amd.com/TechDocs/24593.pdf
-   SME is section 7.10
-   SEV is section 15.34
-   SEV-ES is section 15.35
+
+* `AMD’s Virtualization Memory Encryption (2016)
+  <http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf>`_
+* `Extending Secure Encrypted Virtualization With SEV-ES (2018)
+  <https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf>`_
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
@@ -224,6 +224,8 @@ nested. Combinations not shown in the table are not available.
 .. [3] Introduced on Power10 machines.
 
 
+.. _power-papr-protected-execution-facility-pef:
+
 POWER (PAPR) Protected Execution Facility (PEF)
 -----------------------------------------------
 
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 4daa53c35d8f..96bf54889a82 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -28,6 +28,7 @@ Architectural features
    i386/cpu
    i386/kvm-pv
    i386/sgx
+   i386/amd-memory-encryption
 
 .. _pcsys_005freq:
 
-- 
2.34.1


