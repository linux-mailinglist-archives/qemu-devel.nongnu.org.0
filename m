Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3B3D7B91
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:06:07 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QWs-0008Hh-5W
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVD-00069W-Cz
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVA-0006Zn-KZ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so1799531wmd.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2eh2kmMzC9fzs8x/MG0BdklDDp2GABorLnW+TSQVVU=;
 b=Y5Eh+Quf1VL6uefZXvWEeociwscJ0A6P5Q0X008KrhO/i9BwhoSTdTfVlz6nstJz9D
 jyjiWBd2kwobjRiLWwS2fvtGKLrdQ/YZl5QYkLK7OUekW0KT4t9WSndLy5GZ+50ipksu
 eGtdEQc/CboOxWN4PZVI8gpiWzzOOsGn6rs2FpRIzh+YqJxg9+v2QkgGZ1wPk4Jc3Tk4
 Y0OaHttFJYkFVsjJkbC4FMLfIFZpiwhACjzvqluFp6gpsNXbWpR5IBkw/eBdPAO8A2zn
 ihvlsJZlNqhd/73KCFfPz95rmWy9JrBQNj03Evpc//jwXzeRvvDlZLMOOONJdaEMfuV2
 9RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2eh2kmMzC9fzs8x/MG0BdklDDp2GABorLnW+TSQVVU=;
 b=Cr66NVOe8G2LTneoJa/d+D7IDwKuzq6pmJq058VTrSbm/mO5exFxo4lfq7Q6ENlOpD
 aLZEhsKtgZRwBy502fUpqj5U6RTA2mRgodxxIMBU/CVbBwMa9pDSSsx4s1+bwcxB+JWZ
 2swmc2e8l2JtplXnXcWWIa02mx8wkC2J8GjyBHeOM9ShPISLiOhsU+sza5wExmUorpE1
 +gOTOFx58SFPFSfbKnG+kBxfVtaG1ZToGJK4XTvbJ1GO4BhnDH8QXO2swN5brTJcEq2U
 TezytNofoANeOyAQDh5pxW2+in4gDiwhnCuIZxZXQ6K2+eTcwdrozQNLj/pkWs9JpZ+4
 W4Tw==
X-Gm-Message-State: AOAM531gDd+QlM7L3y94QA+x6d0gm1sRX+iAL9+ZsyOCG8Fa3cSJv6oo
 7qzYycoHad4F343nfAomES8lrthzpxz3HQ==
X-Google-Smtp-Source: ABdhPJzg4KbZsJ+XRrYmVRlQkG7XOTQo3z+7YUqQ4tBWedgAr1kqcUaLLdH2fuKTJSTo4GUDdpCy2Q==
X-Received: by 2002:a7b:cc8a:: with SMTP id p10mr15906029wma.30.1627405458901; 
 Tue, 27 Jul 2021 10:04:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 129sm3708518wmz.26.2021.07.27.10.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:04:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] docs/specs/acpi_mem_hotplug: Convert to rST
Date: Tue, 27 Jul 2021 18:04:11 +0100
Message-Id: <20210727170414.3368-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727170414.3368-1-peter.maydell@linaro.org>
References: <20210727170414.3368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the acpi memory hotplug spec to rST.

Note that this includes converting a lot of weird whitespace
characters to plain old spaces (the rST parser does not like
whatever the old ones were).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/acpi_mem_hotplug.rst | 128 ++++++++++++++++++++++++++++++++
 docs/specs/acpi_mem_hotplug.txt |  94 -----------------------
 docs/specs/index.rst            |   1 +
 3 files changed, 129 insertions(+), 94 deletions(-)
 create mode 100644 docs/specs/acpi_mem_hotplug.rst
 delete mode 100644 docs/specs/acpi_mem_hotplug.txt

diff --git a/docs/specs/acpi_mem_hotplug.rst b/docs/specs/acpi_mem_hotplug.rst
new file mode 100644
index 00000000000..069819bc3e0
--- /dev/null
+++ b/docs/specs/acpi_mem_hotplug.rst
@@ -0,0 +1,128 @@
+QEMU<->ACPI BIOS memory hotplug interface
+=========================================
+
+ACPI BIOS GPE.3 handler is dedicated for notifying OS about memory hot-add
+and hot-remove events.
+
+Memory hot-plug interface (IO port 0xa00-0xa17, 1-4 byte access)
+----------------------------------------------------------------
+
+Read access behavior
+^^^^^^^^^^^^^^^^^^^^
+
+[0x0-0x3]
+  Lo part of memory device phys address
+[0x4-0x7]
+  Hi part of memory device phys address
+[0x8-0xb]
+  Lo part of memory device size in bytes
+[0xc-0xf]
+  Hi part of memory device size in bytes
+[0x10-0x13]
+  Memory device proximity domain
+[0x14]
+  Memory device status fields
+
+  bits:
+
+  0:
+    Device is enabled and may be used by guest
+  1:
+    Device insert event, used to distinguish device for which
+    no device check event to OSPM was issued.
+    It's valid only when bit 1 is set.
+  2:
+    Device remove event, used to distinguish device for which
+    no device eject request to OSPM was issued.
+  3-7:
+    reserved and should be ignored by OSPM
+
+[0x15-0x17]
+  reserved
+
+Write access behavior
+^^^^^^^^^^^^^^^^^^^^^
+
+
+[0x0-0x3]
+  Memory device slot selector, selects active memory device.
+  All following accesses to other registers in 0xa00-0xa17
+  region will read/store data from/to selected memory device.
+[0x4-0x7]
+  OST event code reported by OSPM
+[0x8-0xb]
+  OST status code reported by OSPM
+[0xc-0x13]
+  reserved, writes into it are ignored
+[0x14]
+  Memory device control fields
+
+  bits:
+
+  0:
+    reserved, OSPM must clear it before writing to register.
+    Due to BUG in versions prior 2.4 that field isn't cleared
+    when other fields are written. Keep it reserved and don't
+    try to reuse it.
+  1:
+    if set to 1 clears device insert event, set by OSPM
+    after it has emitted device check event for the
+    selected memory device
+  2:
+    if set to 1 clears device remove event, set by OSPM
+    after it has emitted device eject request for the
+    selected memory device
+  3:
+    if set to 1 initiates device eject, set by OSPM when it
+    triggers memory device removal and calls _EJ0 method
+  4-7:
+    reserved, OSPM must clear them before writing to register
+
+Selecting memory device slot beyond present range has no effect on platform:
+
+- write accesses to memory hot-plug registers not documented above are ignored
+- read accesses to memory hot-plug registers not documented above return
+  all bits set to 1.
+
+Memory hot remove process diagram
+---------------------------------
+
+::
+
+   +-------------+     +-----------------------+      +------------------+
+   |  1. QEMU    |     | 2. QEMU               |      |3. QEMU           |
+   |  device_del +---->+ device unplug request +----->+Send SCI to guest,|
+   |             |     |         cb            |      |return control to |
+   |             |     |                       |      |management        |
+   +-------------+     +-----------------------+      +------------------+
+
+   +---------------------------------------------------------------------+
+
+   +---------------------+              +-------------------------+
+   | OSPM:               | remove event | OSPM:                   |
+   | send Eject Request, |              | Scan memory devices     |
+   | clear remove event  +<-------------+ for event flags         |
+   |                     |              |                         |
+   +---------------------+              +-------------------------+
+             |
+             |
+   +---------v--------+            +-----------------------+
+   | Guest OS:        |  success   | OSPM:                 |
+   | process Ejection +----------->+ Execute _EJ0 method,  |
+   | request          |            | set eject bit in flags|
+   +------------------+            +-----------------------+
+             |failure                         |
+             v                                v
+   +------------------------+      +-----------------------+
+   | OSPM:                  |      | QEMU:                 |
+   | set OST event & status |      | call device unplug cb |
+   | fields                 |      |                       |
+   +------------------------+      +-----------------------+
+            |                                  |
+            v                                  v
+   +------------------+              +-------------------+
+   |QEMU:             |              |QEMU:              |
+   |Send OST QMP event|              |Send device deleted|
+   |                  |              |QMP event          |
+   +------------------+              |                   |
+                                     +-------------------+
diff --git a/docs/specs/acpi_mem_hotplug.txt b/docs/specs/acpi_mem_hotplug.txt
deleted file mode 100644
index 3df3620ce42..00000000000
--- a/docs/specs/acpi_mem_hotplug.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-QEMU<->ACPI BIOS memory hotplug interface
---------------------------------------
-
-ACPI BIOS GPE.3 handler is dedicated for notifying OS about memory hot-add
-and hot-remove events.
-
-Memory hot-plug interface (IO port 0xa00-0xa17, 1-4 byte access):
----------------------------------------------------------------
-0xa00:
-  read access:
-      [0x0-0x3] Lo part of memory device phys address
-      [0x4-0x7] Hi part of memory device phys address
-      [0x8-0xb] Lo part of memory device size in bytes
-      [0xc-0xf] Hi part of memory device size in bytes
-      [0x10-0x13] Memory device proximity domain
-      [0x14] Memory device status fields
-          bits:
-              0: Device is enabled and may be used by guest
-              1: Device insert event, used to distinguish device for which
-                 no device check event to OSPM was issued.
-                 It's valid only when bit 1 is set.
-              2: Device remove event, used to distinguish device for which
-                 no device eject request to OSPM was issued.
-              3-7: reserved and should be ignored by OSPM
-      [0x15-0x17] reserved
-
-  write access:
-      [0x0-0x3] Memory device slot selector, selects active memory device.
-                All following accesses to other registers in 0xa00-0xa17
-                region will read/store data from/to selected memory device.
-      [0x4-0x7] OST event code reported by OSPM
-      [0x8-0xb] OST status code reported by OSPM
-      [0xc-0x13] reserved, writes into it are ignored
-      [0x14] Memory device control fields
-          bits:
-              0: reserved, OSPM must clear it before writing to register.
-                 Due to BUG in versions prior 2.4 that field isn't cleared
-                 when other fields are written. Keep it reserved and don't
-                 try to reuse it.
-              1: if set to 1 clears device insert event, set by OSPM
-                 after it has emitted device check event for the
-                 selected memory device
-              2: if set to 1 clears device remove event, set by OSPM
-                 after it has emitted device eject request for the
-                 selected memory device
-              3: if set to 1 initiates device eject, set by OSPM when it
-                 triggers memory device removal and calls _EJ0 method
-              4-7: reserved, OSPM must clear them before writing to register
-
-Selecting memory device slot beyond present range has no effect on platform:
-   - write accesses to memory hot-plug registers not documented above are
-     ignored
-   - read accesses to memory hot-plug registers not documented above return
-     all bits set to 1.
-
-Memory hot remove process diagram:
-----------------------------------
- +-------------+     +-----------------------+      +------------------+     
- |  1. QEMU    |     | 2. QEMU               |      |3. QEMU           |     
- |  device_del +---->+ device unplug request +----->+Send SCI to guest,|     
- |             |     |         cb            |      |return control to |     
- +-------------+     +-----------------------+      |management        |     
-                                                    +------------------+     
-                                                                             
- +---------------------------------------------------------------------+     
-                                                                             
- +---------------------+              +-------------------------+            
- | OSPM:               | remove event | OSPM:                   |            
- | send Eject Request, |              | Scan memory devices     |            
- | clear remove event  +<-------------+ for event flags         |            
- |                     |              |                         |            
- +---------------------+              +-------------------------+            
-           |                                                                 
-           |                                                                 
- +---------v--------+            +-----------------------+                   
- | Guest OS:        |  success   | OSPM:                 |                   
- | process Ejection +----------->+ Execute _EJ0 method,  |                   
- | request          |            | set eject bit in flags|                   
- +------------------+            +-----------------------+                   
-           |failure                         |                                
-           v                                v                                
- +------------------------+      +-----------------------+                   
- | OSPM:                  |      | QEMU:                 |                   
- | set OST event & status |      | call device unplug cb |                   
- | fields                 |      |                       |                   
- +------------------------+      +-----------------------+                   
-          |                                  |                               
-          v                                  v                               
- +------------------+              +-------------------+                     
- |QEMU:             |              |QEMU:              |                     
- |Send OST QMP event|              |Send device deleted|                     
- |                  |              |QMP event          |                     
- +------------------+              |                   |                     
-                                   +-------------------+
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 24b765e1a45..17cc7868b91 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -14,3 +14,4 @@ guest hardware that is specific to QEMU.
    tpm
    acpi_hest_ghes
    acpi_cpu_hotplug
+   acpi_mem_hotplug
-- 
2.20.1


