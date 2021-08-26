Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA03F8CE8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:23:24 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ63-0005TP-EO
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImn-0005Tv-6i
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImj-0008P2-Rr
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so7402929wme.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ChUttIc68iZkmw41W1FrNjDeUGwRlRF6AIoMDfs22XQ=;
 b=Qy/58P5nZkeR+vvNV3W0uLZhwuPFBVCHaxRbFmwdELoeETUxTBds3HouZRsBq5lV5S
 Hum7x6xx3iaLk+Sbt0TVUhUuKaDzl4oJqi8/II0NtqDRWJayKwYUZx2F3gE5/tbsOfoj
 vW6cgl129Vfmv9NfIHrAZekbiJqNPLMmchsjguz1hu5k9cdpyiitbS55RZL++cep3azs
 Dt/yNuxYuA6FAN2TBG39DGhWr8DXTXMidHZtQGu+P41K8YDG6Z6gg79QxTnJNTigB/Rr
 hIk7tcvl5tW7HPKYDMA1VZHn9952pPpN+Rte/tvD1tV2xRm6b68cjyPB/aSCkiy3p0dG
 8+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChUttIc68iZkmw41W1FrNjDeUGwRlRF6AIoMDfs22XQ=;
 b=FEdWUIVMvAq2b3t3TmvwSnhlASUVPa7bkZZPJEpoeLBNsZRUnTik5fWA1nO1u8r0L1
 8Zoag9gFp1YnzjdKPJnewtEeTfiIXSLnGOQNCGIl0hIxvFeJq8Ncw1bylJZZCknzdH/p
 Om5kZU3A7gBJBklJuJO+pu8by3sfOqL5RlKWp6jDWA2uiH5LUm/HhOcTA+PhrTkfhQjU
 ONZIn2hug6VK2HtoIXJviwibTFHLfoX7GR76OHHHmJHFEO1N8RdPuEtdhtrlYwuEAg4J
 ZYLI3kwQTcVzodyKi4XVb1Q4P0cVpxTnyhQ4no86TFltq1WL6JaSd+bbic7dfv59O9J+
 M96Q==
X-Gm-Message-State: AOAM533xQ1nH8KH0XyrAG35TwATjZ+ymxgNEkJ3i0qZ7LkFjTMZGaQhB
 BPc36u2LcrP10yzFiv0RXoJf9ckrJ0SkuQ==
X-Google-Smtp-Source: ABdhPJwCv4xvJF/kEXjKqbgvKgQAvQsU1S+qemU9gnUeQfZTPM3C5qoHLf8ZYSGiuusYiYZTK8NECQ==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr15282898wme.52.1629997403967; 
 Thu, 26 Aug 2021 10:03:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/37] docs/specs/acpi_nvdimm: Convert to rST
Date: Thu, 26 Aug 2021 18:02:43 +0100
Message-Id: <20210826170307.27733-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the ACPI NVDIMM spec document to rST.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210727170414.3368-5-peter.maydell@linaro.org
---
 docs/specs/acpi_nvdimm.rst | 228 +++++++++++++++++++++++++++++++++++++
 docs/specs/acpi_nvdimm.txt | 188 ------------------------------
 docs/specs/index.rst       |   1 +
 3 files changed, 229 insertions(+), 188 deletions(-)
 create mode 100644 docs/specs/acpi_nvdimm.rst
 delete mode 100644 docs/specs/acpi_nvdimm.txt

diff --git a/docs/specs/acpi_nvdimm.rst b/docs/specs/acpi_nvdimm.rst
new file mode 100644
index 00000000000..ab0335253d7
--- /dev/null
+++ b/docs/specs/acpi_nvdimm.rst
@@ -0,0 +1,228 @@
+QEMU<->ACPI BIOS NVDIMM interface
+=================================
+
+QEMU supports NVDIMM via ACPI. This document describes the basic concepts of
+NVDIMM ACPI and the interface between QEMU and the ACPI BIOS.
+
+NVDIMM ACPI Background
+----------------------
+
+NVDIMM is introduced in ACPI 6.0 which defines an NVDIMM root device under
+_SB scope with a _HID of "ACPI0012". For each NVDIMM present or intended
+to be supported by platform, platform firmware also exposes an ACPI
+Namespace Device under the root device.
+
+The NVDIMM child devices under the NVDIMM root device are defined with _ADR
+corresponding to the NFIT device handle. The NVDIMM root device and the
+NVDIMM devices can have device specific methods (_DSM) to provide additional
+functions specific to a particular NVDIMM implementation.
+
+This is an example from ACPI 6.0, a platform contains one NVDIMM::
+
+  Scope (\_SB){
+     Device (NVDR) // Root device
+     {
+        Name (_HID, "ACPI0012")
+        Method (_STA) {...}
+        Method (_FIT) {...}
+        Method (_DSM, ...) {...}
+        Device (NVD)
+        {
+           Name(_ADR, h) //where h is NFIT Device Handle for this NVDIMM
+           Method (_DSM, ...) {...}
+        }
+     }
+  }
+
+Methods supported on both NVDIMM root device and NVDIMM device
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+_DSM (Device Specific Method)
+   It is a control method that enables devices to provide device specific
+   control functions that are consumed by the device driver.
+   The NVDIMM DSM specification can be found at
+   http://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf
+
+   Arguments:
+
+   Arg0
+     A Buffer containing a UUID (16 Bytes)
+   Arg1
+     An Integer containing the Revision ID (4 Bytes)
+   Arg2
+     An Integer containing the Function Index (4 Bytes)
+   Arg3
+     A package containing parameters for the function specified by the
+     UUID, Revision ID, and Function Index
+
+   Return Value:
+
+   If Function Index = 0, a Buffer containing a function index bitfield.
+   Otherwise, the return value and type depends on the UUID, revision ID
+   and function index which are described in the DSM specification.
+
+Methods on NVDIMM ROOT Device
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+_FIT(Firmware Interface Table)
+   It evaluates to a buffer returning data in the format of a series of NFIT
+   Type Structure.
+
+   Arguments: None
+
+   Return Value:
+   A Buffer containing a list of NFIT Type structure entries.
+
+   The detailed definition of the structure can be found at ACPI 6.0: 5.2.25
+   NVDIMM Firmware Interface Table (NFIT).
+
+QEMU NVDIMM Implementation
+--------------------------
+
+QEMU uses 4 bytes IO Port starting from 0x0a18 and a RAM-based memory page
+for NVDIMM ACPI.
+
+Memory:
+   QEMU uses BIOS Linker/loader feature to ask BIOS to allocate a memory
+   page and dynamically patch its address into an int32 object named "MEMA"
+   in ACPI.
+
+   This page is RAM-based and it is used to transfer data between _DSM
+   method and QEMU. If ACPI has control, this pages is owned by ACPI which
+   writes _DSM input data to it, otherwise, it is owned by QEMU which
+   emulates _DSM access and writes the output data to it.
+
+   ACPI writes _DSM Input Data (based on the offset in the page):
+
+   [0x0 - 0x3]
+      4 bytes, NVDIMM Device Handle.
+
+      The handle is completely QEMU internal thing, the values in
+      range [1, 0xFFFF] indicate nvdimm device. Other values are
+      reserved for other purposes.
+
+      Reserved handles:
+
+      - 0 is reserved for nvdimm root device named NVDR.
+      - 0x10000 is reserved for QEMU internal DSM function called on
+        the root device.
+
+   [0x4 - 0x7]
+      4 bytes, Revision ID, that is the Arg1 of _DSM method.
+
+   [0x8 - 0xB]
+      4 bytes. Function Index, that is the Arg2 of _DSM method.
+
+   [0xC - 0xFFF]
+      4084 bytes, the Arg3 of _DSM method.
+
+   QEMU writes Output Data (based on the offset in the page):
+
+   [0x0 - 0x3]
+      4 bytes, the length of result
+
+   [0x4 - 0xFFF]
+      4092 bytes, the DSM result filled by QEMU
+
+IO Port 0x0a18 - 0xa1b:
+   ACPI writes the address of the memory page allocated by BIOS to this
+   port then QEMU gets the control and fills the result in the memory page.
+
+   Write Access:
+
+   [0x0a18 - 0xa1b]
+      4 bytes, the address of the memory page allocated by BIOS.
+
+_DSM process diagram
+--------------------
+
+"MEMA" indicates the address of memory page allocated by BIOS.
+
+::
+
+ +----------------------+      +-----------------------+
+ |    1. OSPM           |      |    2. OSPM            |
+ | save _DSM input data |      |  write "MEMA" to      | Exit to QEMU
+ | to the page          +----->|  IO port 0x0a18       +------------+
+ | indicated by "MEMA"  |      |                       |            |
+ +----------------------+      +-----------------------+            |
+                                                                    |
+                                                                    v
+ +--------------------+       +-----------+      +------------------+--------+
+ |      5 QEMU        |       | 4 QEMU    |      |        3. QEMU            |
+ | write _DSM result  |       |  emulate  |      | get _DSM input data from  |
+ | to the page        +<------+ _DSM      +<-----+ the page indicated by the |
+ |                    |       |           |      | value from the IO port    |
+ +--------+-----------+       +-----------+      +---------------------------+
+          |
+          | Enter Guest
+          |
+          v
+ +--------------------------+      +--------------+
+ |     6 OSPM               |      |   7 OSPM     |
+ | result size is returned  |      |  _DSM return |
+ | by reading  DSM          +----->+              |
+ | result from the page     |      |              |
+ +--------------------------+      +--------------+
+
+NVDIMM hotplug
+--------------
+
+ACPI BIOS GPE.4 handler is dedicated for notifying OS about nvdimm device
+hot-add event.
+
+QEMU internal use only _DSM functions
+-------------------------------------
+
+Read FIT
+^^^^^^^^
+
+_FIT method uses _DSM method to fetch NFIT structures blob from QEMU
+in 1 page sized increments which are then concatenated and returned
+as _FIT method result.
+
+Input parameters:
+
+Arg0
+  UUID {set to 648B9CF2-CDA1-4312-8AD9-49C4AF32BD62}
+Arg1
+  Revision ID (set to 1)
+Arg2
+  Function Index, 0x1
+Arg3
+  A package containing a buffer whose layout is as follows:
+
+   +----------+--------+--------+-------------------------------------------+
+   |  Field   | Length | Offset |                 Description               |
+   +----------+--------+--------+-------------------------------------------+
+   | offset   |   4    |   0    | offset in QEMU's NFIT structures blob to  |
+   |          |        |        | read from                                 |
+   +----------+--------+--------+-------------------------------------------+
+
+Output layout in the dsm memory page:
+
+   +----------+--------+--------+-------------------------------------------+
+   | Field    | Length | Offset | Description                               |
+   +----------+--------+--------+-------------------------------------------+
+   | length   | 4      | 0      | length of entire returned data            |
+   |          |        |        | (including this header)                   |
+   +----------+--------+--------+-------------------------------------------+
+   |          |        |        | return status codes                       |
+   |          |        |        |                                           |
+   |          |        |        | - 0x0 - success                           |
+   |          |        |        | - 0x100 - error caused by NFIT update     |
+   | status   | 4      | 4      |   while read by _FIT wasn't completed     |
+   |          |        |        | - other codes follow Chapter 3 in         |
+   |          |        |        |   DSM Spec Rev1                           |
+   +----------+--------+--------+-------------------------------------------+
+   | fit data | Varies | 8      | contains FIT data. This field is present  |
+   |          |        |        | if status field is 0.                     |
+   +----------+--------+--------+-------------------------------------------+
+
+The FIT offset is maintained by the OSPM itself, current offset plus
+the size of the fit data returned by the function is the next offset
+OSPM should read. When all FIT data has been read out, zero fit data
+size is returned.
+
+If it returns status code 0x100, OSPM should restart to read FIT (read
+from offset 0 again).
diff --git a/docs/specs/acpi_nvdimm.txt b/docs/specs/acpi_nvdimm.txt
deleted file mode 100644
index 3ec42ecbce4..00000000000
--- a/docs/specs/acpi_nvdimm.txt
+++ /dev/null
@@ -1,188 +0,0 @@
-QEMU<->ACPI BIOS NVDIMM interface
----------------------------------
-
-QEMU supports NVDIMM via ACPI. This document describes the basic concepts of
-NVDIMM ACPI and the interface between QEMU and the ACPI BIOS.
-
-NVDIMM ACPI Background
-----------------------
-NVDIMM is introduced in ACPI 6.0 which defines an NVDIMM root device under
-_SB scope with a _HID of “ACPI0012”. For each NVDIMM present or intended
-to be supported by platform, platform firmware also exposes an ACPI
-Namespace Device under the root device.
-
-The NVDIMM child devices under the NVDIMM root device are defined with _ADR
-corresponding to the NFIT device handle. The NVDIMM root device and the
-NVDIMM devices can have device specific methods (_DSM) to provide additional
-functions specific to a particular NVDIMM implementation.
-
-This is an example from ACPI 6.0, a platform contains one NVDIMM:
-
-Scope (\_SB){
-   Device (NVDR) // Root device
-   {
-      Name (_HID, “ACPI0012”)
-      Method (_STA) {...}
-      Method (_FIT) {...}
-      Method (_DSM, ...) {...}
-      Device (NVD)
-      {
-         Name(_ADR, h) //where h is NFIT Device Handle for this NVDIMM
-         Method (_DSM, ...) {...}
-      }
-   }
-}
-
-Method supported on both NVDIMM root device and NVDIMM device
-_DSM (Device Specific Method)
-   It is a control method that enables devices to provide device specific
-   control functions that are consumed by the device driver.
-   The NVDIMM DSM specification can be found at:
-        http://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf
-
-   Arguments:
-   Arg0 – A Buffer containing a UUID (16 Bytes)
-   Arg1 – An Integer containing the Revision ID (4 Bytes)
-   Arg2 – An Integer containing the Function Index (4 Bytes)
-   Arg3 – A package containing parameters for the function specified by the
-          UUID, Revision ID, and Function Index
-
-   Return Value:
-   If Function Index = 0, a Buffer containing a function index bitfield.
-   Otherwise, the return value and type depends on the UUID, revision ID
-   and function index which are described in the DSM specification.
-
-Methods on NVDIMM ROOT Device
-_FIT(Firmware Interface Table)
-   It evaluates to a buffer returning data in the format of a series of NFIT
-   Type Structure.
-
-   Arguments: None
-
-   Return Value:
-   A Buffer containing a list of NFIT Type structure entries.
-
-   The detailed definition of the structure can be found at ACPI 6.0: 5.2.25
-   NVDIMM Firmware Interface Table (NFIT).
-
-QEMU NVDIMM Implementation
-==========================
-QEMU uses 4 bytes IO Port starting from 0x0a18 and a RAM-based memory page
-for NVDIMM ACPI.
-
-Memory:
-   QEMU uses BIOS Linker/loader feature to ask BIOS to allocate a memory
-   page and dynamically patch its address into an int32 object named "MEMA"
-   in ACPI.
-
-   This page is RAM-based and it is used to transfer data between _DSM
-   method and QEMU. If ACPI has control, this pages is owned by ACPI which
-   writes _DSM input data to it, otherwise, it is owned by QEMU which
-   emulates _DSM access and writes the output data to it.
-
-   ACPI writes _DSM Input Data (based on the offset in the page):
-   [0x0 - 0x3]: 4 bytes, NVDIMM Device Handle.
-
-                The handle is completely QEMU internal thing, the values in
-                range [1, 0xFFFF] indicate nvdimm device. Other values are
-                reserved for other purposes.
-
-                Reserved handles:
-                0 is reserved for nvdimm root device named NVDR.
-                0x10000 is reserved for QEMU internal DSM function called on
-                the root device.
-
-   [0x4 - 0x7]: 4 bytes, Revision ID, that is the Arg1 of _DSM method.
-   [0x8 - 0xB]: 4 bytes. Function Index, that is the Arg2 of _DSM method.
-   [0xC - 0xFFF]: 4084 bytes, the Arg3 of _DSM method.
-
-   QEMU Writes Output Data (based on the offset in the page):
-   [0x0 - 0x3]: 4 bytes, the length of result
-   [0x4 - 0xFFF]: 4092 bytes, the DSM result filled by QEMU
-
-IO Port 0x0a18 - 0xa1b:
-   ACPI writes the address of the memory page allocated by BIOS to this
-   port then QEMU gets the control and fills the result in the memory page.
-
-   write Access:
-   [0x0a18 - 0xa1b]: 4 bytes, the address of the memory page allocated
-                     by BIOS.
-
-_DSM process diagram:
----------------------
-"MEMA" indicates the address of memory page allocated by BIOS.
-
- +----------------------+      +-----------------------+
- |    1. OSPM           |      |    2. OSPM            |
- | save _DSM input data |      |  write "MEMA" to      | Exit to QEMU
- | to the page          +----->|  IO port 0x0a18       +------------+
- | indicated by "MEMA"  |      |                       |            |
- +----------------------+      +-----------------------+            |
-                                                                    |
-                                                                    v
- +-------------   ----+       +-----------+      +------------------+--------+
- |      5 QEMU        |       | 4 QEMU    |      |        3. QEMU            |
- | write _DSM result  |       |  emulate  |      | get _DSM input data from  |
- | to the page        +<------+ _DSM      +<-----+ the page indicated by the |
- |                    |       |           |      | value from the IO port    |
- +--------+-----------+       +-----------+      +---------------------------+
-          |
-          | Enter Guest
-          |
-          v
- +--------------------------+      +--------------+
- |     6 OSPM               |      |   7 OSPM     |
- | result size is returned  |      |  _DSM return |
- | by reading  DSM          +----->+              |
- | result from the page     |      |              |
- +--------------------------+      +--------------+
-
-NVDIMM hotplug
---------------
-ACPI BIOS GPE.4 handler is dedicated for notifying OS about nvdimm device
-hot-add event.
-
-QEMU internal use only _DSM function
-------------------------------------
-1) Read FIT
-   _FIT method uses _DSM method to fetch NFIT structures blob from QEMU
-   in 1 page sized increments which are then concatenated and returned
-   as _FIT method result.
-
-   Input parameters:
-   Arg0 – UUID {set to 648B9CF2-CDA1-4312-8AD9-49C4AF32BD62}
-   Arg1 – Revision ID (set to 1)
-   Arg2 - Function Index, 0x1
-   Arg3 - A package containing a buffer whose layout is as follows:
-
-   +----------+--------+--------+-------------------------------------------+
-   |  Field   | Length | Offset |                 Description               |
-   +----------+--------+--------+-------------------------------------------+
-   | offset   |   4    |   0    | offset in QEMU's NFIT structures blob to  |
-   |          |        |        | read from                                 |
-   +----------+--------+--------+-------------------------------------------+
-
-   Output layout in the dsm memory page:
-   +----------+--------+--------+-------------------------------------------+
-   |  Field   | Length | Offset |                 Description               |
-   +----------+--------+--------+-------------------------------------------+
-   | length   |   4    |   0    | length of entire returned data            |
-   |          |        |        | (including this header)                   |
-   +----------+-----------------+-------------------------------------------+
-   |          |        |        | return status codes                       |
-   |          |        |        | 0x0 - success                             |
-   |          |        |        | 0x100 - error caused by NFIT update while |
-   | status   |   4    |   4    | read by _FIT wasn't completed, other      |
-   |          |        |        | codes follow Chapter 3 in DSM Spec Rev1   |
-   +----------+-----------------+-------------------------------------------+
-   | fit data | Varies |   8    | contains FIT data, this field is present  |
-   |          |        |        | if status field is 0;                     |
-   +----------+--------+--------+-------------------------------------------+
-
-   The FIT offset is maintained by the OSPM itself, current offset plus
-   the size of the fit data returned by the function is the next offset
-   OSPM should read. When all FIT data has been read out, zero fit data
-   size is returned.
-
-   If it returns status code 0x100, OSPM should restart to read FIT (read
-   from offset 0 again).
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 8296fb19b72..65e9663916a 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -16,3 +16,4 @@ guest hardware that is specific to QEMU.
    acpi_cpu_hotplug
    acpi_mem_hotplug
    acpi_pci_hotplug
+   acpi_nvdimm
-- 
2.20.1


