Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7233236D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:57:07 +0100 (CET)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa30-0006E8-Lx
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZt6-0005bS-UC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZt3-0006tE-QO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9PTQpiQJGGchsS+yT2pn7+/6tWqLdBJOD2VVpJV67c=;
 b=gvyxT5NrqBtk4a4Ba4Tf/Qlq4cmoHRd+rwfmTrSq4SmWR9GPTEQKVDoYDn7vk2XZoIsXKk
 ClIF10y0TI7z2ykZspnXH2W7Rjk6o4dISeD0ECDeA1loDeaeBh6Rqss/Y+sQXIoQN5ku0O
 xLRZSAnM14b9e60HUS1mDp46HacaKhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-g_ic2yOMPxCTjrl4c-rAJQ-1; Tue, 09 Mar 2021 05:46:46 -0500
X-MC-Unique: g_ic2yOMPxCTjrl4c-rAJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9DBF107466C
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 10:46:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD1560C04;
 Tue,  9 Mar 2021 10:46:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] docs/devel/qgraph: improve qgraph documentation
Date: Tue,  9 Mar 2021 11:46:13 +0100
Message-Id: <20210309104617.714908-11-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Improve current qgraph documentation with a more concrete example
and clearer motivation.

This patch depends on the previous serie
"libqos/qgraph: format qgraph comments for sphinx documentation"

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210301092432.20342-1-eesposit@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/qgraph.rst | 509 +++++++++++++++++++++++++++++++++---------
 1 file changed, 408 insertions(+), 101 deletions(-)

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index 62a45cbcbf..a9aff167ad 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -4,14 +4,37 @@
 Qtest Driver Framework
 ========================================
 
-This Qgraph API provides all basic functions to create a graph
-and instantiate nodes representing machines, drivers and tests
-representing their relations with ``CONSUMES``, ``PRODUCES``, and
-``CONTAINS`` edges.
+In order to test a specific driver, plain libqos tests need to
+take care of booting QEMU with the right machine and devices.
+This makes each test "hardcoded" for a specific configuration, reducing
+the possible coverage that it can reach.
+
+For example, the sdhci device is supported on both x86_64 and ARM boards,
+therefore a generic sdhci test should test all machines and drivers that
+support that device.
+Using only libqos APIs, the test has to manually take care of
+covering all the setups, and build the correct command line.
+
+This also introduces backward compability issues: if a device/driver command
+line name is changed, all tests that use that will not work
+properly anymore and need to be adjusted.
+
+The aim of qgraph is to create a graph of drivers, machines and tests such that
+a test aimed to a certain driver does not have to care of
+booting the right QEMU machine, pick the right device, build the command line
+and so on. Instead, it only defines what type of device it is testing
+(interface in qgraph terms) and the framework takes care of
+covering all supported types of devices and machine architectures.
+
+Following the above example, an interface would be ``sdhci``,
+so the sdhci-test should only care of linking its qgraph node with
+that interface. In this way, if the command line of a sdhci driver
+is changed, only the respective qgraph driver node has to be adjusted.
+
+The graph is composed by nodes that represent machines, drivers, tests
+and edges that define the relationships between them (``CONSUMES``, ``PRODUCES``, and
+``CONTAINS``).
 
-The idea is to have a framework where each test asks for a specific
-driver, and the framework takes care of allocating the proper devices
-required and passing the correct command line arguments to QEMU.
 
 Nodes
 ^^^^^^
@@ -24,8 +47,11 @@ A node can be of four types:
   drivers).
   An interface is not explicitly created, it will be automatically
   instantiated when a node consumes or produces it.
-- **QNODE_TEST**:      for example ``sdhci-test``, consumes an interface and
-  tests the functions provided.
+  An interface is simply a struct that abstracts the various drivers
+  for the same type of device, and offers an API to the nodes that
+  use it ("consume" relation in qgraph terms) that is implemented/backed up by the drivers that implement it ("produce" relation in qgraph terms).
+- **QNODE_TEST**:      for example ``sdhci-test``. A test consumes an interface
+  and tests the functions provided by it.
 
 Notes for the nodes:
 
@@ -69,136 +95,415 @@ available and only test that are reached by them will be executed.
 Creating a new driver and its interface
 """""""""""""""""""""""""""""""""""""""""
 
-.. code::
+Here we continue the ``sdhci`` use case, with the following scenario:
+
+- ``sdhci-test`` aims to test the ``read[q,w], writeq`` functions
+  offered by the ``sdhci`` drivers.
+- The current ``sdhci`` device is supported by both ``x86_64/pc`` and ``ARM``
+  (in this example we focus on the ``arm-raspi2``) machines.
+- QEMU offers 2 types of drivers: ``QSDHCI_MemoryMapped`` for ``ARM`` and
+  ``QSDHCI_PCI`` for ``x86_64/pc``. Both implement the
+  ``read[q,w], writeq`` functions.
+
+In order to implement such scenario in qgraph, the test developer needs to:
+
+- Create the ``x86_64/pc`` machine node. This machine uses the
+  ``pci-bus`` architecture so it ``contains`` a PCI driver,
+  ``pci-bus-pc``. The actual path is
+
+  ``x86_64/pc --contains--> 1440FX-pcihost --contains-->
+  pci-bus-pc --produces--> pci-bus``.
+
+  For the sake of this example,
+  we do not focus on the PCI interface implementation.
+- Create the ``sdhci-pci`` driver node, representing ``QSDHCI_PCI``.
+  The driver uses the PCI bus (and its API),
+  so it must ``consume`` the ``pci-bus`` generic interface (which abstracts
+  all the pci drivers available)
+
+  ``sdhci-pci --consumes--> pci-bus``
+- Create an ``arm/raspi2`` machine node. This machine ``contains``
+  a ``generic-sdhci`` memory mapped ``sdhci`` driver node, representing
+  ``QSDHCI_MemoryMapped``.
+
+  ``arm/raspi2 --contains--> generic-sdhci``
+- Create the ``sdhci`` interface node. This interface offers the
+  functions that are shared by all ``sdhci`` devices.
+  The interface is produced by ``sdhci-pci`` and ``generic-sdhci``,
+  the available architecture-specific drivers.
+
+  ``sdhci-pci --produces--> sdhci``
+
+  ``generic-sdhci --produces--> sdhci``
+- Create the ``sdhci-test`` test node. The test ``consumes`` the
+  ``sdhci`` interface, using its API. It doesn't need to look at
+  the supported machines or drivers.
+
+  ``sdhci-test --consumes--> sdhci``
+
+``arm-raspi2`` machine, simplified from
+``tests/qtest/libqos/arm-raspi2-machine.c``::
 
     #include "qgraph.h"
 
-    struct My_driver {
+    struct QRaspi2Machine {
         QOSGraphObject obj;
-        Node_produced prod;
-        Node_contained cont;
+        QGuestAllocator alloc;
+        QSDHCI_MemoryMapped sdhci;
+    };
+
+    static void *raspi2_get_driver(void *object, const char *interface)
+    {
+        QRaspi2Machine *machine = object;
+        if (!g_strcmp0(interface, "memory")) {
+            return &machine->alloc;
+        }
+
+        fprintf(stderr, "%s not present in arm/raspi2\n", interface);
+        g_assert_not_reached();
+    }
+
+    static QOSGraphObject *raspi2_get_device(void *obj,
+                                                const char *device)
+    {
+        QRaspi2Machine *machine = obj;
+        if (!g_strcmp0(device, "generic-sdhci")) {
+            return &machine->sdhci.obj;
+        }
+
+        fprintf(stderr, "%s not present in arm/raspi2\n", device);
+        g_assert_not_reached();
     }
 
-    static void my_destructor(QOSGraphObject *obj)
+    static void *qos_create_machine_arm_raspi2(QTestState *qts)
     {
-        g_free(obj);
+        QRaspi2Machine *machine = g_new0(QRaspi2Machine, 1);
+
+        alloc_init(&machine->alloc, ...);
+
+        /* Get node(s) contained inside (CONTAINS) */
+        machine->obj.get_device = raspi2_get_device;
+
+        /* Get node(s) produced (PRODUCES) */
+        machine->obj.get_driver = raspi2_get_driver;
+
+        /* free the object */
+        machine->obj.destructor = raspi2_destructor;
+        qos_init_sdhci_mm(&machine->sdhci, ...);
+        return &machine->obj;
     }
 
-    static void *my_get_driver(void *object, const char *interface) {
-        My_driver *dev = object;
-        if (!g_strcmp0(interface, "my_interface")) {
-            return &dev->prod;
+    static void raspi2_register_nodes(void)
+    {
+        /* arm/raspi2 --contains--> generic-sdhci */
+        qos_node_create_machine("arm/raspi2",
+                                 qos_create_machine_arm_raspi2);
+        qos_node_contains("arm/raspi2", "generic-sdhci", NULL);
+    }
+
+    libqos_init(raspi2_register_nodes);
+
+``x86_64/pc`` machine, simplified from
+``tests/qtest/libqos/x86_64_pc-machine.c``::
+
+    #include "qgraph.h"
+
+    struct i440FX_pcihost {
+        QOSGraphObject obj;
+        QPCIBusPC pci;
+    };
+
+    struct QX86PCMachine {
+        QOSGraphObject obj;
+        QGuestAllocator alloc;
+        i440FX_pcihost bridge;
+    };
+
+    /* i440FX_pcihost */
+
+    static QOSGraphObject *i440FX_host_get_device(void *obj,
+                                                const char *device)
+    {
+        i440FX_pcihost *host = obj;
+        if (!g_strcmp0(device, "pci-bus-pc")) {
+            return &host->pci.obj;
+        }
+        fprintf(stderr, "%s not present in i440FX-pcihost\n", device);
+        g_assert_not_reached();
+    }
+
+    /* x86_64/pc machine */
+
+    static void *pc_get_driver(void *object, const char *interface)
+    {
+        QX86PCMachine *machine = object;
+        if (!g_strcmp0(interface, "memory")) {
+            return &machine->alloc;
         }
-        abort();
+
+        fprintf(stderr, "%s not present in x86_64/pc\n", interface);
+        g_assert_not_reached();
     }
 
-    static void *my_get_device(void *object, const char *device) {
-        My_driver *dev = object;
-        if (!g_strcmp0(device, "my_driver_contained")) {
-            return &dev->cont;
+    static QOSGraphObject *pc_get_device(void *obj, const char *device)
+    {
+        QX86PCMachine *machine = obj;
+        if (!g_strcmp0(device, "i440FX-pcihost")) {
+            return &machine->bridge.obj;
         }
-        abort();
+
+        fprintf(stderr, "%s not present in x86_64/pc\n", device);
+        g_assert_not_reached();
     }
 
-    static void *my_driver_constructor(void *node_consumed,
-                                        QOSGraphObject *alloc)
+    static void *qos_create_machine_pc(QTestState *qts)
     {
-        My_driver dev = g_new(My_driver, 1);
+        QX86PCMachine *machine = g_new0(QX86PCMachine, 1);
 
-        // get the node pointed by the produce edge
-        dev->obj.get_driver = my_get_driver;
+        /* Get node(s) contained inside (CONTAINS) */
+        machine->obj.get_device = pc_get_device;
 
-        // get the node pointed by the contains
-        dev->obj.get_device = my_get_device;
+        /* Get node(s) produced (PRODUCES) */
+        machine->obj.get_driver = pc_get_driver;
 
-        // free the object
-        dev->obj.destructor = my_destructor;
+        /* free the object */
+        machine->obj.destructor = pc_destructor;
+        pc_alloc_init(&machine->alloc, qts, ALLOC_NO_FLAGS);
 
-        do_something_with_node_consumed(node_consumed);
+        /* Get node(s) contained inside (CONTAINS) */
+        machine->bridge.obj.get_device = i440FX_host_get_device;
 
-        // set all fields of contained device
-        init_contained_device(&dev->cont);
-        return &dev->obj;
+        return &machine->obj;
     }
 
-    static void register_my_driver(void)
+    static void pc_machine_register_nodes(void)
     {
-        qos_node_create_driver("my_driver", my_driver_constructor);
-
-        // contained drivers don't need a constructor,
-        // they will be init by the parent.
-        qos_node_create_driver("my_driver_contained", NULL);
-
-        // For the sake of this example, assume machine x86_64/pc
-        // contains "other_node".
-        // This relation, along with the machine and "other_node"
-        // creation, should be defined in the x86_64_pc-machine.c file.
-        // "my_driver" will then consume "other_node"
-        qos_node_contains("my_driver", "my_driver_contained");
-        qos_node_produces("my_driver", "my_interface");
-        qos_node_consumes("my_driver", "other_node");
+        /* x86_64/pc --contains--> 1440FX-pcihost --contains-->
+         * pci-bus-pc [--produces--> pci-bus (in pci.h)] */
+        qos_node_create_machine("x86_64/pc", qos_create_machine_pc);
+        qos_node_contains("x86_64/pc", "i440FX-pcihost", NULL);
+
+        /* contained drivers don't need a constructor,
+         * they will be init by the parent */
+        qos_node_create_driver("i440FX-pcihost", NULL);
+        qos_node_contains("i440FX-pcihost", "pci-bus-pc", NULL);
     }
 
-In the above example, all possible types of relations are created:
-node "my_driver" consumes, contains and produces other nodes.
-More specifically::
+    libqos_init(pc_machine_register_nodes);
 
-  x86_64/pc -->contains--> other_node <--consumes-- my_driver
-                                                        |
-                       my_driver_contained <--contains--+
-                                                        |
-                              my_interface <--produces--+
+``sdhci`` taken from ``tests/qtest/libqos/sdhci.c``::
 
-or inverting the consumes edge in consumed_by::
+    /* Interface node, offers the sdhci API */
+    struct QSDHCI {
+        uint16_t (*readw)(QSDHCI *s, uint32_t reg);
+        uint64_t (*readq)(QSDHCI *s, uint32_t reg);
+        void (*writeq)(QSDHCI *s, uint32_t reg, uint64_t val);
+        /* other fields */
+    };
 
-  x86_64/pc -->contains--> other_node --consumed_by--> my_driver
-                                                            |
-                           my_driver_contained <--contains--+
+    /* Memory Mapped implementation of QSDHCI */
+    struct QSDHCI_MemoryMapped {
+        QOSGraphObject obj;
+        QSDHCI sdhci;
+        /* other driver-specific fields */
+    };
+
+    /* PCI implementation of QSDHCI */
+    struct QSDHCI_PCI {
+        QOSGraphObject obj;
+        QSDHCI sdhci;
+        /* other driver-specific fields */
+    };
+
+    /* Memory mapped implementation of QSDHCI */
+
+    static void *sdhci_mm_get_driver(void *obj, const char *interface)
+    {
+        QSDHCI_MemoryMapped *smm = obj;
+        if (!g_strcmp0(interface, "sdhci")) {
+            return &smm->sdhci;
+        }
+        fprintf(stderr, "%s not present in generic-sdhci\n", interface);
+        g_assert_not_reached();
+    }
+
+    void qos_init_sdhci_mm(QSDHCI_MemoryMapped *sdhci, QTestState *qts,
+                        uint32_t addr, QSDHCIProperties *common)
+    {
+        /* Get node contained inside (CONTAINS) */
+        sdhci->obj.get_driver = sdhci_mm_get_driver;
+
+        /* SDHCI interface API */
+        sdhci->sdhci.readw = sdhci_mm_readw;
+        sdhci->sdhci.readq = sdhci_mm_readq;
+        sdhci->sdhci.writeq = sdhci_mm_writeq;
+        sdhci->qts = qts;
+    }
+
+    /* PCI implementation of QSDHCI */
+
+    static void *sdhci_pci_get_driver(void *object,
+                                      const char *interface)
+    {
+        QSDHCI_PCI *spci = object;
+        if (!g_strcmp0(interface, "sdhci")) {
+            return &spci->sdhci;
+        }
+
+        fprintf(stderr, "%s not present in sdhci-pci\n", interface);
+        g_assert_not_reached();
+    }
+
+    static void *sdhci_pci_create(void *pci_bus,
+                                  QGuestAllocator *alloc,
+                                  void *addr)
+    {
+        QSDHCI_PCI *spci = g_new0(QSDHCI_PCI, 1);
+        QPCIBus *bus = pci_bus;
+        uint64_t barsize;
+
+        qpci_device_init(&spci->dev, bus, addr);
+
+        /* SDHCI interface API */
+        spci->sdhci.readw = sdhci_pci_readw;
+        spci->sdhci.readq = sdhci_pci_readq;
+        spci->sdhci.writeq = sdhci_pci_writeq;
+
+        /* Get node(s) produced (PRODUCES) */
+        spci->obj.get_driver = sdhci_pci_get_driver;
+
+        spci->obj.start_hw = sdhci_pci_start_hw;
+        spci->obj.destructor = sdhci_destructor;
+        return &spci->obj;
+    }
+
+    static void qsdhci_register_nodes(void)
+    {
+        QOSGraphEdgeOptions opts = {
+            .extra_device_opts = "addr=04.0",
+        };
+
+        /* generic-sdhci */
+        /* generic-sdhci --produces--> sdhci */
+        qos_node_create_driver("generic-sdhci", NULL);
+        qos_node_produces("generic-sdhci", "sdhci");
+
+        /* sdhci-pci */
+        /* sdhci-pci --produces--> sdhci
+         * sdhci-pci --consumes--> pci-bus */
+        qos_node_create_driver("sdhci-pci", sdhci_pci_create);
+        qos_node_produces("sdhci-pci", "sdhci");
+        qos_node_consumes("sdhci-pci", "pci-bus", &opts);
+    }
+
+    libqos_init(qsdhci_register_nodes);
+
+In the above example, all possible types of relations are created::
+
+  x86_64/pc --contains--> 1440FX-pcihost --contains--> pci-bus-pc
                                                             |
-                                  my_interface <--produces--+
+               sdhci-pci --consumes--> pci-bus <--produces--+
+                  |
+                  +--produces--+
+                               |
+                               v
+                             sdhci
+                               ^
+                               |
+                               +--produces-- +
+                                             |
+               arm/raspi2 --contains--> generic-sdhci
+
+or inverting the consumes edge in consumed_by::
 
-Creating new test
+  x86_64/pc --contains--> 1440FX-pcihost --contains--> pci-bus-pc
+                                                            |
+            sdhci-pci <--consumed by-- pci-bus <--produces--+
+                |
+                +--produces--+
+                             |
+                             v
+                            sdhci
+                             ^
+                             |
+                             +--produces-- +
+                                           |
+            arm/raspi2 --contains--> generic-sdhci
+
+Adding a new test
 """""""""""""""""
 
-.. code::
+Given the above setup, adding a new test is very simple.
+``sdhci-test``, taken from ``tests/qtest/sdhci-test.c``::
 
-    #include "qgraph.h"
+    static void check_capab_sdma(QSDHCI *s, bool supported)
+    {
+        uint64_t capab, capab_sdma;
 
-    static void my_test_function(void *obj, void *data)
+        capab = s->readq(s, SDHC_CAPAB);
+        capab_sdma = FIELD_EX64(capab, SDHC_CAPAB, SDMA);
+        g_assert_cmpuint(capab_sdma, ==, supported);
+    }
+
+    static void test_registers(void *obj, void *data,
+                                QGuestAllocator *alloc)
     {
-        Node_produced *interface_to_test = obj;
-        // test interface_to_test
+        QSDHCI *s = obj;
+
+        /* example test */
+        check_capab_sdma(s, s->props.capab.sdma);
     }
 
-    static void register_my_test(void)
+    static void register_sdhci_test(void)
     {
-        qos_add_test("my_interface", "my_test", my_test_function);
+        /* sdhci-test --consumes--> sdhci */
+        qos_add_test("registers", "sdhci", test_registers, NULL);
     }
 
-    libqos_init(register_my_test);
+    libqos_init(register_sdhci_test);
 
-Here a new test is created, consuming "my_interface" node
-and creating a valid path from a machine to a test.
+Here a new test is created, consuming ``sdhci`` interface node
+and creating a valid path from both machines to a test.
 Final graph will be like this::
 
-  x86_64/pc --contains--> other_node <--consumes-- my_driver
-                                                         |
-                        my_driver_contained <--contains--+
-                                                         |
-         my_test --consumes--> my_interface <--produces--+
+  x86_64/pc --contains--> 1440FX-pcihost --contains--> pci-bus-pc
+                                                            |
+               sdhci-pci --consumes--> pci-bus <--produces--+
+                  |
+                  +--produces--+
+                               |
+                               v
+                             sdhci <--consumes-- sdhci-test
+                               ^
+                               |
+                               +--produces-- +
+                                             |
+               arm/raspi2 --contains--> generic-sdhci
 
 or inverting the consumes edge in consumed_by::
 
-  x86_64/pc --contains--> other_node --consumed_by--> my_driver
-                                                            |
-                           my_driver_contained <--contains--+
+  x86_64/pc --contains--> 1440FX-pcihost --contains--> pci-bus-pc
                                                             |
-         my_test <--consumed_by-- my_interface <--produces--+
+            sdhci-pci <--consumed by-- pci-bus <--produces--+
+                |
+                +--produces--+
+                             |
+                             v
+                            sdhci --consumed by--> sdhci-test
+                             ^
+                             |
+                             +--produces-- +
+                                           |
+            arm/raspi2 --contains--> generic-sdhci
 
 Assuming there the binary is
 ``QTEST_QEMU_BINARY=./qemu-system-x86_64``
 a valid test path will be:
-``/x86_64/pc/other_node/my_driver/my_interface/my_test``.
+``/x86_64/pc/1440FX-pcihost/pci-bus-pc/pci-bus/sdhci-pc/sdhci/sdhci-test``
+
+and for the binary ``QTEST_QEMU_BINARY=./qemu-system-arm``:
+
+``/arm/raspi2/generic-sdhci/sdhci/sdhci-test``
 
 Additional examples are also in ``test-qgraph.c``
 
@@ -215,19 +520,19 @@ There are three types of command line arguments:
   ``-device <device>``. It is automatically done by the framework.
 - ``after node``   : added as additional argument to the node name.
   This argument is added optionally when creating edges,
-  by setting the parameter @after_cmd_line and
-  @extra_edge_opts in #QOSGraphEdgeOptions.
+  by setting the parameter ``after_cmd_line`` and
+  ``extra_edge_opts`` in ``QOSGraphEdgeOptions``.
   The framework automatically adds
-  a comma before @extra_edge_opts,
+  a comma before ``extra_edge_opts``,
   because it is going to add attributes
   after the destination node pointed by
   the edge containing these options, and automatically
-  adds a space before @after_cmd_line, because it
+  adds a space before ``after_cmd_line``, because it
   adds an additional device, not an attribute.
 - ``before node``  : added as additional argument to the node name.
   This argument is added optionally when creating edges,
-  by setting the parameter @before_cmd_line in
-  #QOSGraphEdgeOptions. This attribute
+  by setting the parameter ``before_cmd_line`` in
+  ``QOSGraphEdgeOptions``. This attribute
   is going to add attributes before the destination node
   pointed by the edge containing these options. It is
   helpful to commands that are not node-representable,
@@ -243,17 +548,19 @@ devices to be added in QEMU.
 Example::
 
     QOSGraphEdgeOptions opts = {
-        .arg = NULL,
-        .size_arg = 0,
-        .after_cmd_line = "-device other",
-        .before_cmd_line = "-netdev something",
-        .extra_edge_opts = "addr=04.0",
+        .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
+                           "file.read-zeroes=on,format=raw",
+        .after_cmd_line = "-device scsi-hd,bus=vs0.0,drive=drv0",
+
+        opts.extra_device_opts = "id=vs0";
     };
-    QOSGraphNodeS *node = qos_node_create_driver("my_node", constructor);
-    qos_node_consumes_args("my_node", "interface", &opts);
+
+    qos_node_create_driver("virtio-scsi-device",
+                            virtio_scsi_device_create);
+    qos_node_consumes("virtio-scsi-device", "virtio-bus", &opts);
 
 Will produce the following command line:
-``-netdev something -device my_node,addr=04.0 -device other``
+``-drive id=drv0,if=none,file=null-co://, -device virtio-scsi-device,id=vs0 -device scsi-hd,bus=vs0.0,drive=drv0``
 
 Qgraph API reference
 ^^^^^^^^^^^^^^^^^^^^
-- 
2.27.0


