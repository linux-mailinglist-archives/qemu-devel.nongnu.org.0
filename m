Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D33F9437
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:13:59 +0200 (CEST)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV7h-0001WJ-59
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2R-0002nZ-IO; Fri, 27 Aug 2021 02:08:27 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2P-0004yJ-7x; Fri, 27 Aug 2021 02:08:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso8371975wmg.4; 
 Thu, 26 Aug 2021 23:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziFWO8bxyp588DxjruH3IANz3bOHT3oDXgNEycciQEo=;
 b=S9Mf4l7RiqVH+Pp1z6Y9KaQgWuQFRjbrFsKwLvHcVDabhlmDR/OtjsUOaOh5yZwRIx
 OjqetqH/rEpELoI3tadb74p4iT4BnY5lYXdvUvR07uVmn7yv2n8eUgBZxxqsHLwjmQ2H
 A9/Tu7zwr9wrlHIlJI3yoNN1PmtkgdFl5hEdNVC+w3DRgvubtitrr5qCNna4BgwzdEJ6
 4QYZdqvFJYogI62vzQt3FAPMIVOb+ZuzLrh7LWTdGcyA08zhHNspGV2/t/I8BmjRnP9w
 TmgyuHQZ2GBxW/yWJwkOHxFTdiRs3MBBVQWPm6Mbvc2kI9Aq7TFNfKAOg28DqP5+PLH1
 yBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ziFWO8bxyp588DxjruH3IANz3bOHT3oDXgNEycciQEo=;
 b=c46m989+FC/qIYCwlM454WYlXhpb/x/0IQER9qWg+2ARxTpSdUOYV/xvq7rVm4hHK7
 Jxac3HL9SlT/UENsVPRpkxDWXFqhkaviCNIda8n2wSdQXOpuGDtTTsMCg3N+XwtyGoKM
 Bh9jlxvXWBdMxJQL9dyfhntGAKa+cS2ZtWriipF96rP0a8e70ZObDnE4yr0TFS+ivj/m
 wMJBka4WZvqn5FapDF/3Fvmi7aLXWRXVP7inswxcsYQ8pp0YB4wYxCGBThfB03ykSahz
 3L6yoJbt9P9lnG4sq6pry+9vCPhqae7iWMkV+8iGvY+shCmOsfyKUFt6zXi4ihbSfKv6
 5aLw==
X-Gm-Message-State: AOAM530t82k3TqFTGT9d/yVECw9B8OBGQ/1J8BdNM79lEd76ouU1ejwT
 TOd7JBAtBlIeg0lNkr5qGSATPPjHmyM=
X-Google-Smtp-Source: ABdhPJzVQ8Ba2mwb+NmXNb6TtaMbrJ9kvmCibmytXl9gY5jNDQ596Zhr+zgoJ0ZXxenuIIS/KOC6hw==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr15426533wme.119.1630044502882; 
 Thu, 26 Aug 2021 23:08:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e9sm1900417wrd.69.2021.08.26.23.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 23:08:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] tests: Remove uses of deprecated raspi2/raspi3 machine
 names
Date: Fri, 27 Aug 2021 08:08:14 +0200
Message-Id: <20210827060815.2384760-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827060815.2384760-1-f4bug@amsat.org>
References: <20210827060815.2384760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 155e1c82ed0 deprecated the raspi2/raspi3 machine names.
Use the recommended new names: raspi2b and raspi3b.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/qgraph.rst                   | 38 ++++++++++++-------------
 tests/qtest/libqos/qgraph.h             |  6 ++--
 tests/qtest/libqos/qgraph_internal.h    |  2 +-
 tests/qtest/boot-serial-test.c          |  2 +-
 tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---
 tests/unit/test-qgraph.c                |  2 +-
 tests/acceptance/boot_linux_console.py  |  6 ++--
 7 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index 39e293687e6..c2882c3a334 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -41,7 +41,7 @@ Nodes
 
 A node can be of four types:
 
-- **QNODE_MACHINE**:   for example ``arm/raspi2``
+- **QNODE_MACHINE**:   for example ``arm/raspi2b``
 - **QNODE_DRIVER**:    for example ``generic-sdhci``
 - **QNODE_INTERFACE**: for example ``sdhci`` (interface for all ``-sdhci``
   drivers).
@@ -119,12 +119,12 @@ It is possible to troubleshoot unavailable tests by running::
   #      |-> dest='i440FX-pcihost' type=0 (node=0x5591421117f0)
   #   src=''
   #      |-> dest='x86_64/pc' type=0 (node=0x559142111600)
-  #      |-> dest='arm/raspi2' type=0 (node=0x559142110740)
+  #      |-> dest='arm/raspi2b' type=0 (node=0x559142110740)
   ...
   # }
   # ALL QGRAPH NODES: {
   #   name='virtio-net-tests/announce-self' type=3 cmd_line='(null)' [available]
-  #   name='arm/raspi2' type=0 cmd_line='-M raspi2 ' [UNAVAILABLE]
+  #   name='arm/raspi2b' type=0 cmd_line='-M raspi2b ' [UNAVAILABLE]
   ...
   # }
 
@@ -135,8 +135,8 @@ qgraph path in the "ALL QGRAPH EDGES" output as follows: '' -> 'x86_64/pc' ->
 'virtio-net'. The root of the qgraph is '' and the depth first search begins
 there.
 
-The ``arm/raspi`` machine node is listed as "UNAVAILABLE". Although it is
-reachable from the root via '' -> 'arm/raspi2' the node is unavailable because
+The ``arm/raspi2b`` machine node is listed as "UNAVAILABLE". Although it is
+reachable from the root via '' -> 'arm/raspi2b' the node is unavailable because
 the QEMU binary did not list it when queried by the framework. This is expected
 because we used the ``qemu-system-x86_64`` binary which does not support ARM
 machine types.
@@ -158,7 +158,7 @@ Here we continue the ``sdhci`` use case, with the following scenario:
 - ``sdhci-test`` aims to test the ``read[q,w], writeq`` functions
   offered by the ``sdhci`` drivers.
 - The current ``sdhci`` device is supported by both ``x86_64/pc`` and ``ARM``
-  (in this example we focus on the ``arm-raspi2``) machines.
+  (in this example we focus on the ``arm-raspi2b``) machines.
 - QEMU offers 2 types of drivers: ``QSDHCI_MemoryMapped`` for ``ARM`` and
   ``QSDHCI_PCI`` for ``x86_64/pc``. Both implement the
   ``read[q,w], writeq`` functions.
@@ -180,11 +180,11 @@ In order to implement such scenario in qgraph, the test developer needs to:
   all the pci drivers available)
 
   ``sdhci-pci --consumes--> pci-bus``
-- Create an ``arm/raspi2`` machine node. This machine ``contains``
+- Create an ``arm/raspi2b`` machine node. This machine ``contains``
   a ``generic-sdhci`` memory mapped ``sdhci`` driver node, representing
   ``QSDHCI_MemoryMapped``.
 
-  ``arm/raspi2 --contains--> generic-sdhci``
+  ``arm/raspi2b --contains--> generic-sdhci``
 - Create the ``sdhci`` interface node. This interface offers the
   functions that are shared by all ``sdhci`` devices.
   The interface is produced by ``sdhci-pci`` and ``generic-sdhci``,
@@ -199,7 +199,7 @@ In order to implement such scenario in qgraph, the test developer needs to:
 
   ``sdhci-test --consumes--> sdhci``
 
-``arm-raspi2`` machine, simplified from
+``arm-raspi2b`` machine, simplified from
 ``tests/qtest/libqos/arm-raspi2-machine.c``::
 
     #include "qgraph.h"
@@ -217,7 +217,7 @@ In order to implement such scenario in qgraph, the test developer needs to:
             return &machine->alloc;
         }
 
-        fprintf(stderr, "%s not present in arm/raspi2\n", interface);
+        fprintf(stderr, "%s not present in arm/raspi2b\n", interface);
         g_assert_not_reached();
     }
 
@@ -229,7 +229,7 @@ In order to implement such scenario in qgraph, the test developer needs to:
             return &machine->sdhci.obj;
         }
 
-        fprintf(stderr, "%s not present in arm/raspi2\n", device);
+        fprintf(stderr, "%s not present in arm/raspi2b\n", device);
         g_assert_not_reached();
     }
 
@@ -253,10 +253,10 @@ In order to implement such scenario in qgraph, the test developer needs to:
 
     static void raspi2_register_nodes(void)
     {
-        /* arm/raspi2 --contains--> generic-sdhci */
-        qos_node_create_machine("arm/raspi2",
+        /* arm/raspi2b --contains--> generic-sdhci */
+        qos_node_create_machine("arm/raspi2b",
                                  qos_create_machine_arm_raspi2);
-        qos_node_contains("arm/raspi2", "generic-sdhci", NULL);
+        qos_node_contains("arm/raspi2b", "generic-sdhci", NULL);
     }
 
     libqos_init(raspi2_register_nodes);
@@ -470,7 +470,7 @@ In the above example, all possible types of relations are created::
                                |
                                +--produces-- +
                                              |
-               arm/raspi2 --contains--> generic-sdhci
+               arm/raspi2b --contains--> generic-sdhci
 
 or inverting the consumes edge in consumed_by::
 
@@ -486,7 +486,7 @@ or inverting the consumes edge in consumed_by::
                              |
                              +--produces-- +
                                            |
-            arm/raspi2 --contains--> generic-sdhci
+            arm/raspi2b --contains--> generic-sdhci
 
 Adding a new test
 """""""""""""""""
@@ -536,7 +536,7 @@ Final graph will be like this::
                                |
                                +--produces-- +
                                              |
-               arm/raspi2 --contains--> generic-sdhci
+               arm/raspi2b --contains--> generic-sdhci
 
 or inverting the consumes edge in consumed_by::
 
@@ -552,7 +552,7 @@ or inverting the consumes edge in consumed_by::
                              |
                              +--produces-- +
                                            |
-            arm/raspi2 --contains--> generic-sdhci
+            arm/raspi2b --contains--> generic-sdhci
 
 Assuming there the binary is
 ``QTEST_QEMU_BINARY=./qemu-system-x86_64``
@@ -561,7 +561,7 @@ a valid test path will be:
 
 and for the binary ``QTEST_QEMU_BINARY=./qemu-system-arm``:
 
-``/arm/raspi2/generic-sdhci/sdhci/sdhci-test``
+``/arm/raspi2b/generic-sdhci/sdhci/sdhci-test``
 
 Additional examples are also in ``test-qgraph.c``
 
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 54672350c8f..871740c0dc8 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -252,17 +252,17 @@ void qos_node_create_driver_named(const char *name, const char *qemu_name,
  * This function can be useful when there are multiple devices
  * with the same node name contained in a machine/other node
  *
- * For example, if ``arm/raspi2`` contains 2 ``generic-sdhci``
+ * For example, if ``arm/raspi2b`` contains 2 ``generic-sdhci``
  * devices, the right commands will be:
  *
  * .. code::
  *
- *    qos_node_create_machine("arm/raspi2");
+ *    qos_node_create_machine("arm/raspi2b");
  *    qos_node_create_driver("generic-sdhci", constructor);
  *    // assume rest of the fields are set NULL
  *    QOSGraphEdgeOptions op1 = { .edge_name = "emmc" };
  *    QOSGraphEdgeOptions op2 = { .edge_name = "sdcard" };
- *    qos_node_contains("arm/raspi2", "generic-sdhci", &op1, &op2, NULL);
+ *    qos_node_contains("arm/raspi2b", "generic-sdhci", &op1, &op2, NULL);
  *
  * Of course this also requires that the @container's get_device function
  * should implement a case for "emmc" and "sdcard".
diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
index c0025f5ab9b..7d62fd17af7 100644
--- a/tests/qtest/libqos/qgraph_internal.h
+++ b/tests/qtest/libqos/qgraph_internal.h
@@ -230,7 +230,7 @@ void qos_graph_foreach_test_path(QOSTestCallback fn);
 /**
  * qos_get_machine_type(): return QEMU machine type for a machine node.
  * This function requires every machine @name to be in the form
- * <arch>/<machine_name>, like "arm/raspi2" or "x86_64/pc".
+ * <arch>/<machine_name>, like "arm/raspi2b" or "x86_64/pc".
  *
  * The function will validate the format and return a pointer to
  * @machine to <machine_name>.  For example, when passed "x86_64/pc"
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 96849cec915..83828ba2707 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -173,7 +173,7 @@ static testdef_t tests[] = {
       sizeof(kernel_pls3adsp1800), kernel_pls3adsp1800 },
     { "microblazeel", "petalogix-ml605", "", "TT",
       sizeof(kernel_plml605), kernel_plml605 },
-    { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
+    { "arm", "raspi2b", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
     /* For hppa, force bios to output to serial by disabling graphics. */
     { "hppa", "hppa", "-vga none", "SeaBIOS wants SYSTEM HALT" },
     { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/arm-raspi2-machine.c
index 35bb4709a45..09ca863c103 100644
--- a/tests/qtest/libqos/arm-raspi2-machine.c
+++ b/tests/qtest/libqos/arm-raspi2-machine.c
@@ -42,7 +42,7 @@ static void *raspi2_get_driver(void *object, const char *interface)
         return &machine->alloc;
     }
 
-    fprintf(stderr, "%s not present in arm/raspi2\n", interface);
+    fprintf(stderr, "%s not present in arm/raspi2b\n", interface);
     g_assert_not_reached();
 }
 
@@ -53,7 +53,7 @@ static QOSGraphObject *raspi2_get_device(void *obj, const char *device)
         return &machine->sdhci.obj;
     }
 
-    fprintf(stderr, "%s not present in arm/raspi2\n", device);
+    fprintf(stderr, "%s not present in arm/raspi2b\n", device);
     g_assert_not_reached();
 }
 
@@ -85,8 +85,8 @@ static void *qos_create_machine_arm_raspi2(QTestState *qts)
 
 static void raspi2_register_nodes(void)
 {
-    qos_node_create_machine("arm/raspi2", qos_create_machine_arm_raspi2);
-    qos_node_contains("arm/raspi2", "generic-sdhci", NULL);
+    qos_node_create_machine("arm/raspi2b", qos_create_machine_arm_raspi2);
+    qos_node_contains("arm/raspi2b", "generic-sdhci", NULL);
 }
 
 libqos_init(raspi2_register_nodes);
diff --git a/tests/unit/test-qgraph.c b/tests/unit/test-qgraph.c
index f819430e2cc..334c76c8e71 100644
--- a/tests/unit/test-qgraph.c
+++ b/tests/unit/test-qgraph.c
@@ -21,7 +21,7 @@
 #include "../qtest/libqos/qgraph_internal.h"
 
 #define MACHINE_PC "x86_64/pc"
-#define MACHINE_RASPI2 "arm/raspi2"
+#define MACHINE_RASPI2 "arm/raspi2b"
 #define I440FX "i440FX-pcihost"
 #define PCIBUS_PC "pcibus-pc"
 #define SDHCI "sdhci"
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 5248c8097df..0a49c0e2760 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -475,7 +475,7 @@ def do_test_arm_raspi2(self, uart_id):
     def test_arm_raspi2_uart0(self):
         """
         :avocado: tags=arch:arm
-        :avocado: tags=machine:raspi2
+        :avocado: tags=machine:raspi2b
         :avocado: tags=device:pl011
         :avocado: tags=accel:tcg
         """
@@ -484,7 +484,7 @@ def test_arm_raspi2_uart0(self):
     def test_arm_raspi2_initrd(self):
         """
         :avocado: tags=arch:arm
-        :avocado: tags=machine:raspi2
+        :avocado: tags=machine:raspi2b
         """
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
@@ -971,7 +971,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
     def test_aarch64_raspi3_atf(self):
         """
         :avocado: tags=arch:aarch64
-        :avocado: tags=machine:raspi3
+        :avocado: tags=machine:raspi3b
         :avocado: tags=cpu:cortex-a53
         :avocado: tags=device:pl011
         :avocado: tags=atf
-- 
2.31.1


