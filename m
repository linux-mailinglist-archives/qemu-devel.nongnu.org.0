Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B03F8CD2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:18:25 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ13-0002go-SO
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImk-0005La-LA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImg-0008MM-IK
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d26so6252070wrc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bpKy06aWQHGk5o8oeE1BHvM+Caiu8yoY/ltq+d1ag6s=;
 b=Y72MQp6KWceCt6kkPIj4YFBefTrAvdeCyU2RB2u5DJYIQ+sVV+0UjSU6OC0E5jYUW2
 PrK89Y+Y39pFV0B73SU0uJBF/Yes4E71kh5zETuq8Ru1umWiO/PYmh2UFcjK7aoiNC3S
 3zw/qqCQ3WqDZT1qW2mpJsWo6K60wjGOGVUDga2BrarVN1jnhsrtDeLkOcRzHRCZWN7r
 X/hcteOPWJYfcgfJrUbfYpvNTiiRykDru61iSVfsAmHhCH9d8hrq8iFtWlrhYzhP8oJQ
 h+dYyWvvd7pJppWqKfBmMqU1zlrMDf8XiRgCpC61MPk/acOMZUL6/qHu2UtNV8bn12ar
 h+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpKy06aWQHGk5o8oeE1BHvM+Caiu8yoY/ltq+d1ag6s=;
 b=LBp8dQr7jWk9QNdS/F/rQVRYKmmBiFliuI9RTCGgItxupL7lBmMjAwoZG1M9lb79eb
 pb0jlLzAFvrKUDOFsPAb1ZZnKLIfvqyHhihMHDDpKGrtYcSjxU4CKEHgimkDmtKhyhZt
 uv+h/sCm819v5wDrvivu7A2l8GMW5ueGYYqnFjKeVRv7cwjW1TmnRLS5hCKj+L+mhbB1
 ptdsMbHpXTsQjuuzpnRr7dcsIa+3xtW5KQ0UNqI4ZrNl/sbA2dOJwvDx4qIRbPtKjJ3L
 VSheoqWHA+1V7X/n0q5CDEg8QL4pnQOLH8PKR29+kRSPxT+ANkBjzZfXNOwgOYrjBPsm
 OLSQ==
X-Gm-Message-State: AOAM532ut7GnHd+4LxsRy2wvckQHRE+gLMDW7CvzzZsP995uslIDwZUK
 tHwAmlXRHfl4xqeR8Ut5ZbLjEWEwfGFSag==
X-Google-Smtp-Source: ABdhPJwPDNhgjee5ciyYC712Qbo8Xd1aGyERTNGkBT2ELiQQT3wdtoRgP3YVapSmLnddeKdn+hvo5g==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr5101210wrs.179.1629997400789; 
 Thu, 26 Aug 2021 10:03:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/37] docs/specs/acpu_cpu_hotplug: Convert to rST
Date: Thu, 26 Aug 2021 18:02:40 +0100
Message-Id: <20210826170307.27733-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Do a basic conversion of the acpi_cpu_hotplug spec document to rST.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210727170414.3368-2-peter.maydell@linaro.org
---
 docs/specs/acpi_cpu_hotplug.rst | 235 ++++++++++++++++++++++++++++++++
 docs/specs/acpi_cpu_hotplug.txt | 160 ----------------------
 docs/specs/index.rst            |   1 +
 3 files changed, 236 insertions(+), 160 deletions(-)
 create mode 100644 docs/specs/acpi_cpu_hotplug.rst
 delete mode 100644 docs/specs/acpi_cpu_hotplug.txt

diff --git a/docs/specs/acpi_cpu_hotplug.rst b/docs/specs/acpi_cpu_hotplug.rst
new file mode 100644
index 00000000000..351057c9676
--- /dev/null
+++ b/docs/specs/acpi_cpu_hotplug.rst
@@ -0,0 +1,235 @@
+QEMU<->ACPI BIOS CPU hotplug interface
+======================================
+
+QEMU supports CPU hotplug via ACPI. This document
+describes the interface between QEMU and the ACPI BIOS.
+
+ACPI BIOS GPE.2 handler is dedicated for notifying OS about CPU hot-add
+and hot-remove events.
+
+
+Legacy ACPI CPU hotplug interface registers
+-------------------------------------------
+
+CPU present bitmap for:
+
+- ICH9-LPC (IO port 0x0cd8-0xcf7, 1-byte access)
+- PIIX-PM  (IO port 0xaf00-0xaf1f, 1-byte access)
+- One bit per CPU. Bit position reflects corresponding CPU APIC ID. Read-only.
+- The first DWORD in bitmap is used in write mode to switch from legacy
+  to modern CPU hotplug interface, write 0 into it to do switch.
+
+QEMU sets corresponding CPU bit on hot-add event and issues SCI
+with GPE.2 event set. CPU present map is read by ACPI BIOS GPE.2 handler
+to notify OS about CPU hot-add events. CPU hot-remove isn't supported.
+
+
+Modern ACPI CPU hotplug interface registers
+-------------------------------------------
+
+Register block base address:
+
+- ICH9-LPC IO port 0x0cd8
+- PIIX-PM  IO port 0xaf00
+
+Register block size:
+
+- ACPI_CPU_HOTPLUG_REG_LEN = 12
+
+All accesses to registers described below, imply little-endian byte order.
+
+Reserved registers behavior:
+
+- write accesses are ignored
+- read accesses return all bits set to 0.
+
+The last stored value in 'CPU selector' must refer to a possible CPU, otherwise
+
+- reads from any register return 0
+- writes to any other register are ignored until valid value is stored into it
+
+On QEMU start, 'CPU selector' is initialized to a valid value, on reset it
+keeps the current value.
+
+Read access behavior
+^^^^^^^^^^^^^^^^^^^^
+
+offset [0x0-0x3]
+  Command data 2: (DWORD access)
+
+  If value last stored in 'Command field' is:
+
+  0:
+    reads as 0x0
+  3:
+    upper 32 bits of architecture specific CPU ID value
+  other values:
+    reserved
+
+offset [0x4]
+  CPU device status fields: (1 byte access)
+
+  bits:
+
+  0:
+    Device is enabled and may be used by guest
+  1:
+    Device insert event, used to distinguish device for which
+    no device check event to OSPM was issued.
+    It's valid only when bit 0 is set.
+  2:
+    Device remove event, used to distinguish device for which
+    no device eject request to OSPM was issued. Firmware must
+    ignore this bit.
+  3:
+    reserved and should be ignored by OSPM
+  4:
+    if set to 1, OSPM requests firmware to perform device eject.
+  5-7:
+    reserved and should be ignored by OSPM
+
+offset [0x5-0x7]
+  reserved
+
+offset [0x8]
+  Command data: (DWORD access)
+
+  If value last stored in 'Command field' is one of:
+
+  0:
+    contains 'CPU selector' value of a CPU with pending event[s]
+  3:
+    lower 32 bits of architecture specific CPU ID value
+    (in x86 case: APIC ID)
+  otherwise:
+    contains 0
+
+Write access behavior
+^^^^^^^^^^^^^^^^^^^^^
+
+offset [0x0-0x3]
+  CPU selector: (DWORD access)
+
+  Selects active CPU device. All following accesses to other
+  registers will read/store data from/to selected CPU.
+  Valid values: [0 .. max_cpus)
+
+offset [0x4]
+  CPU device control fields: (1 byte access)
+
+  bits:
+
+  0:
+    reserved, OSPM must clear it before writing to register.
+  1:
+    if set to 1 clears device insert event, set by OSPM
+    after it has emitted device check event for the
+    selected CPU device
+  2:
+    if set to 1 clears device remove event, set by OSPM
+    after it has emitted device eject request for the
+    selected CPU device.
+  3:
+    if set to 1 initiates device eject, set by OSPM when it
+    triggers CPU device removal and calls _EJ0 method or by firmware
+    when bit #4 is set. In case bit #4 were set, it's cleared as
+    part of device eject.
+  4:
+    if set to 1, OSPM hands over device eject to firmware.
+    Firmware shall issue device eject request as described above
+    (bit #3) and OSPM should not touch device eject bit (#3) in case
+    it's asked firmware to perform CPU device eject.
+  5-7:
+    reserved, OSPM must clear them before writing to register
+
+offset[0x5]
+  Command field: (1 byte access)
+
+  value:
+
+  0:
+    selects a CPU device with inserting/removing events and
+    following reads from 'Command data' register return
+    selected CPU ('CPU selector' value).
+    If no CPU with events found, the current 'CPU selector' doesn't
+    change and corresponding insert/remove event flags are not modified.
+
+  1:
+    following writes to 'Command data' register set OST event
+    register in QEMU
+  2:
+    following writes to 'Command data' register set OST status
+    register in QEMU
+  3:
+    following reads from 'Command data' and 'Command data 2' return
+    architecture specific CPU ID value for currently selected CPU.
+  other values:
+    reserved
+
+offset [0x6-0x7]
+  reserved
+
+offset [0x8]
+  Command data: (DWORD access)
+
+  If last stored 'Command field' value is:
+
+  1:
+    stores value into OST event register
+  2:
+    stores value into OST status register, triggers
+    ACPI_DEVICE_OST QMP event from QEMU to external applications
+    with current values of OST event and status registers.
+  other values:
+    reserved
+
+Typical usecases
+----------------
+
+(x86) Detecting and enabling modern CPU hotplug interface
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+QEMU starts with legacy CPU hotplug interface enabled. Detecting and
+switching to modern interface is based on the 2 legacy CPU hotplug features:
+
+#. Writes into CPU bitmap are ignored.
+#. CPU bitmap always has bit #0 set, corresponding to boot CPU.
+
+Use following steps to detect and enable modern CPU hotplug interface:
+
+#. Store 0x0 to the 'CPU selector' register, attempting to switch to modern mode
+#. Store 0x0 to the 'CPU selector' register, to ensure valid selector value
+#. Store 0x0 to the 'Command field' register
+#. Read the 'Command data 2' register.
+   If read value is 0x0, the modern interface is enabled.
+   Otherwise legacy or no CPU hotplug interface available
+
+Get a cpu with pending event
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+#. Store 0x0 to the 'CPU selector' register.
+#. Store 0x0 to the 'Command field' register.
+#. Read the 'CPU device status fields' register.
+#. If both bit #1 and bit #2 are clear in the value read, there is no CPU
+   with a pending event and selected CPU remains unchanged.
+#. Otherwise, read the 'Command data' register. The value read is the
+   selector of the CPU with the pending event (which is already selected).
+
+Enumerate CPUs present/non present CPUs
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+#. Set the present CPU count to 0.
+#. Set the iterator to 0.
+#. Store 0x0 to the 'CPU selector' register, to ensure that it's in
+   a valid state and that access to other registers won't be ignored.
+#. Store 0x0 to the 'Command field' register to make 'Command data'
+   register return 'CPU selector' value of selected CPU
+#. Read the 'CPU device status fields' register.
+#. If bit #0 is set, increment the present CPU count.
+#. Increment the iterator.
+#. Store the iterator to the 'CPU selector' register.
+#. Read the 'Command data' register.
+#. If the value read is not zero, goto 05.
+#. Otherwise store 0x0 to the 'CPU selector' register, to put it
+   into a valid state and exit.
+   The iterator at this point equals "max_cpus".
diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
deleted file mode 100644
index 9bd59ae0dae..00000000000
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ /dev/null
@@ -1,160 +0,0 @@
-QEMU<->ACPI BIOS CPU hotplug interface
---------------------------------------
-
-QEMU supports CPU hotplug via ACPI. This document
-describes the interface between QEMU and the ACPI BIOS.
-
-ACPI BIOS GPE.2 handler is dedicated for notifying OS about CPU hot-add
-and hot-remove events.
-
-============================================
-Legacy ACPI CPU hotplug interface registers:
---------------------------------------------
-CPU present bitmap for:
-  ICH9-LPC (IO port 0x0cd8-0xcf7, 1-byte access)
-  PIIX-PM  (IO port 0xaf00-0xaf1f, 1-byte access)
-  One bit per CPU. Bit position reflects corresponding CPU APIC ID. Read-only.
-  The first DWORD in bitmap is used in write mode to switch from legacy
-  to modern CPU hotplug interface, write 0 into it to do switch.
----------------------------------------------------------------
-QEMU sets corresponding CPU bit on hot-add event and issues SCI
-with GPE.2 event set. CPU present map is read by ACPI BIOS GPE.2 handler
-to notify OS about CPU hot-add events. CPU hot-remove isn't supported.
-
-=====================================
-Modern ACPI CPU hotplug interface registers:
--------------------------------------
-Register block base address:
-    ICH9-LPC IO port 0x0cd8
-    PIIX-PM  IO port 0xaf00
-Register block size:
-    ACPI_CPU_HOTPLUG_REG_LEN = 12
-
-All accesses to registers described below, imply little-endian byte order.
-
-Reserved resisters behavior:
-   - write accesses are ignored
-   - read accesses return all bits set to 0.
-
-The last stored value in 'CPU selector' must refer to a possible CPU, otherwise
-  - reads from any register return 0
-  - writes to any other register are ignored until valid value is stored into it
-On QEMU start, 'CPU selector' is initialized to a valid value, on reset it
-keeps the current value.
-
-read access:
-    offset:
-    [0x0-0x3] Command data 2: (DWORD access)
-              if value last stored in 'Command field':
-                0: reads as 0x0
-                3: upper 32 bits of architecture specific CPU ID value
-                other values: reserved
-    [0x4] CPU device status fields: (1 byte access)
-        bits:
-           0: Device is enabled and may be used by guest
-           1: Device insert event, used to distinguish device for which
-              no device check event to OSPM was issued.
-              It's valid only when bit 0 is set.
-           2: Device remove event, used to distinguish device for which
-              no device eject request to OSPM was issued. Firmware must
-              ignore this bit.
-           3: reserved and should be ignored by OSPM
-           4: if set to 1, OSPM requests firmware to perform device eject.
-           5-7: reserved and should be ignored by OSPM
-    [0x5-0x7] reserved
-    [0x8] Command data: (DWORD access)
-          contains 0 unless value last stored in 'Command field' is one of:
-              0: contains 'CPU selector' value of a CPU with pending event[s]
-              3: lower 32 bits of architecture specific CPU ID value
-                 (in x86 case: APIC ID)
-
-write access:
-    offset:
-    [0x0-0x3] CPU selector: (DWORD access)
-              selects active CPU device. All following accesses to other
-              registers will read/store data from/to selected CPU.
-              Valid values: [0 .. max_cpus)
-    [0x4] CPU device control fields: (1 byte access)
-        bits:
-            0: reserved, OSPM must clear it before writing to register.
-            1: if set to 1 clears device insert event, set by OSPM
-               after it has emitted device check event for the
-               selected CPU device
-            2: if set to 1 clears device remove event, set by OSPM
-               after it has emitted device eject request for the
-               selected CPU device.
-            3: if set to 1 initiates device eject, set by OSPM when it
-               triggers CPU device removal and calls _EJ0 method or by firmware
-               when bit #4 is set. In case bit #4 were set, it's cleared as
-               part of device eject.
-            4: if set to 1, OSPM hands over device eject to firmware.
-               Firmware shall issue device eject request as described above
-               (bit #3) and OSPM should not touch device eject bit (#3) in case
-               it's asked firmware to perform CPU device eject.
-            5-7: reserved, OSPM must clear them before writing to register
-    [0x5] Command field: (1 byte access)
-          value:
-            0: selects a CPU device with inserting/removing events and
-               following reads from 'Command data' register return
-               selected CPU ('CPU selector' value).
-               If no CPU with events found, the current 'CPU selector' doesn't
-               change and corresponding insert/remove event flags are not modified.
-            1: following writes to 'Command data' register set OST event
-               register in QEMU
-            2: following writes to 'Command data' register set OST status
-               register in QEMU
-            3: following reads from 'Command data' and 'Command data 2' return
-               architecture specific CPU ID value for currently selected CPU.
-            other values: reserved
-    [0x6-0x7] reserved
-    [0x8] Command data: (DWORD access)
-          if last stored 'Command field' value:
-              1: stores value into OST event register
-              2: stores value into OST status register, triggers
-                 ACPI_DEVICE_OST QMP event from QEMU to external applications
-                 with current values of OST event and status registers.
-              other values: reserved
-
-Typical usecases:
-    - (x86) Detecting and enabling modern CPU hotplug interface.
-      QEMU starts with legacy CPU hotplug interface enabled. Detecting and
-      switching to modern interface is based on the 2 legacy CPU hotplug features:
-        1. Writes into CPU bitmap are ignored.
-        2. CPU bitmap always has bit#0 set, corresponding to boot CPU.
-
-      Use following steps to detect and enable modern CPU hotplug interface:
-        1. Store 0x0 to the 'CPU selector' register,
-           attempting to switch to modern mode
-        2. Store 0x0 to the 'CPU selector' register,
-           to ensure valid selector value
-        3. Store 0x0 to the 'Command field' register,
-        4. Read the 'Command data 2' register.
-           If read value is 0x0, the modern interface is enabled.
-           Otherwise legacy or no CPU hotplug interface available
-
-    - Get a cpu with pending event
-      1. Store 0x0 to the 'CPU selector' register.
-      2. Store 0x0 to the 'Command field' register.
-      3. Read the 'CPU device status fields' register.
-      4. If both bit#1 and bit#2 are clear in the value read, there is no CPU
-         with a pending event and selected CPU remains unchanged.
-      5. Otherwise, read the 'Command data' register. The value read is the
-         selector of the CPU with the pending event (which is already
-         selected).
-
-    - Enumerate CPUs present/non present CPUs
-      01. Set the present CPU count to 0.
-      02. Set the iterator to 0.
-      03. Store 0x0 to the 'CPU selector' register, to ensure that it's in
-          a valid state and that access to other registers won't be ignored.
-      04. Store 0x0 to the 'Command field' register to make 'Command data'
-          register return 'CPU selector' value of selected CPU
-      05. Read the 'CPU device status fields' register.
-      06. If bit#0 is set, increment the present CPU count.
-      07. Increment the iterator.
-      08. Store the iterator to the 'CPU selector' register.
-      09. Read the 'Command data' register.
-      10. If the value read is not zero, goto 05.
-      11. Otherwise store 0x0 to the 'CPU selector' register, to put it
-          into a valid state and exit.
-          The iterator at this point equals "max_cpus".
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b7b08ea30d7..24b765e1a45 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -13,3 +13,4 @@ guest hardware that is specific to QEMU.
    acpi_hw_reduced_hotplug
    tpm
    acpi_hest_ghes
+   acpi_cpu_hotplug
-- 
2.20.1


