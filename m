Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87BD3308E0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:38:22 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJAT7-0005Ei-Sc
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lJAOA-0002vo-S3
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lJAO4-0002Kc-KP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615188787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R31Y+u8m9sNkxuZuBE3q87vr+FzntX4HIAQXu19LZk8=;
 b=OTLt7Esu3mvySMLMytfmTNmKv/kQ1JBPW3G8cofYyWMqZPq8L/oFWoR9F+ca0JRSiklzeq
 VQGzuAkPtshi+YvkvO/urwSKpNofh/PkxTNvLl7l7hTfQYYI4ZpWxA1ovjvJ+N44NW9USk
 dmhTnleMfu/Ux9/LJmku3PcvFmDArVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-s1aVw1KxOOaQfr_VOxiTmw-1; Mon, 08 Mar 2021 02:33:05 -0500
X-MC-Unique: s1aVw1KxOOaQfr_VOxiTmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49BC8108BD06
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 07:33:04 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-28.ams2.redhat.com
 [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 547D159449;
 Mon,  8 Mar 2021 07:32:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] libqos/qgraph: format qgraph comments for sphinx
 documentation
Date: Mon,  8 Mar 2021 08:32:40 +0100
Message-Id: <20210308073240.6363-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change documentation style and fix minor typos in tests/qtest/libqos/qgraph.h
to automatically generate sphinx documentation in docs/devel/qgraph.rst

The mechanism explanation that once was in qgraph.h is now moved to qgraph.rst

There is no functional change intended.

v2 -> v3:
- add proper documentation also to the qgraph struct, to remove warnings

v1 -> v2:
- qgraph link visible in docs/devel/index but not in docs/index, since it is
a subsection of qtest.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 MAINTAINERS                 |   1 +
 docs/devel/index.rst        |   1 +
 docs/devel/qgraph.rst       | 261 +++++++++++++++++++++
 docs/devel/qtest.rst        |   8 +
 tests/qtest/libqos/qgraph.h | 450 +++++++++---------------------------
 5 files changed, 386 insertions(+), 335 deletions(-)
 create mode 100644 docs/devel/qgraph.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..f22c3aaba0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2592,6 +2592,7 @@ S: Maintained
 F: softmmu/qtest.c
 F: accel/qtest/
 F: tests/qtest/
+F: docs/devel/qgraph.rst
 X: tests/qtest/bios-tables-test*
 
 Device Fuzzing
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 22854e334d..f0038f8722 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -12,6 +12,7 @@ Contents:
 
 .. toctree::
    :maxdepth: 2
+   :includehidden:
 
    build-system
    kconfig
diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
new file mode 100644
index 0000000000..62a45cbcbf
--- /dev/null
+++ b/docs/devel/qgraph.rst
@@ -0,0 +1,261 @@
+.. _qgraph:
+
+========================================
+Qtest Driver Framework
+========================================
+
+This Qgraph API provides all basic functions to create a graph
+and instantiate nodes representing machines, drivers and tests
+representing their relations with ``CONSUMES``, ``PRODUCES``, and
+``CONTAINS`` edges.
+
+The idea is to have a framework where each test asks for a specific
+driver, and the framework takes care of allocating the proper devices
+required and passing the correct command line arguments to QEMU.
+
+Nodes
+^^^^^^
+
+A node can be of four types:
+
+- **QNODE_MACHINE**:   for example ``arm/raspi2``
+- **QNODE_DRIVER**:    for example ``generic-sdhci``
+- **QNODE_INTERFACE**: for example ``sdhci`` (interface for all ``-sdhci``
+  drivers).
+  An interface is not explicitly created, it will be automatically
+  instantiated when a node consumes or produces it.
+- **QNODE_TEST**:      for example ``sdhci-test``, consumes an interface and
+  tests the functions provided.
+
+Notes for the nodes:
+
+- QNODE_MACHINE: each machine struct must have a ``QGuestAllocator`` and
+  implement ``get_driver()`` to return the allocator mapped to the interface
+  "memory". The function can also return ``NULL`` if the allocator
+  is not set.
+- QNODE_DRIVER:  driver names must be unique, and machines and nodes
+  planned to be "consumed" by other nodes must match QEMU
+  drivers name, otherwise they won't be discovered
+
+Edges
+^^^^^^
+
+An edge relation between two nodes (drivers or machines) `X` and `Y` can be:
+
+- ``X CONSUMES Y``: `Y` can be plugged into `X`
+- ``X PRODUCES Y``: `X` provides the interface `Y`
+- ``X CONTAINS Y``: `Y` is part of `X` component
+
+Execution steps
+^^^^^^^^^^^^^^^
+
+The basic framework steps are the following:
+
+- All nodes and edges are created in their respective
+  machine/driver/test files
+- The framework starts QEMU and asks for a list of available devices
+  and machines (note that only machines and "consumed" nodes are mapped
+  1:1 with QEMU devices)
+- The framework walks the graph starting from the available machines and
+  performs a Depth First Search for tests
+- Once a test is found, the path is walked again and all drivers are
+  allocated accordingly and the final interface is passed to the test
+- The test is executed
+- Unused objects are cleaned and the path discovery is continued
+
+Depending on the QEMU binary used, only some drivers/machines will be
+available and only test that are reached by them will be executed.
+
+Creating a new driver and its interface
+"""""""""""""""""""""""""""""""""""""""""
+
+.. code::
+
+    #include "qgraph.h"
+
+    struct My_driver {
+        QOSGraphObject obj;
+        Node_produced prod;
+        Node_contained cont;
+    }
+
+    static void my_destructor(QOSGraphObject *obj)
+    {
+        g_free(obj);
+    }
+
+    static void *my_get_driver(void *object, const char *interface) {
+        My_driver *dev = object;
+        if (!g_strcmp0(interface, "my_interface")) {
+            return &dev->prod;
+        }
+        abort();
+    }
+
+    static void *my_get_device(void *object, const char *device) {
+        My_driver *dev = object;
+        if (!g_strcmp0(device, "my_driver_contained")) {
+            return &dev->cont;
+        }
+        abort();
+    }
+
+    static void *my_driver_constructor(void *node_consumed,
+                                        QOSGraphObject *alloc)
+    {
+        My_driver dev = g_new(My_driver, 1);
+
+        // get the node pointed by the produce edge
+        dev->obj.get_driver = my_get_driver;
+
+        // get the node pointed by the contains
+        dev->obj.get_device = my_get_device;
+
+        // free the object
+        dev->obj.destructor = my_destructor;
+
+        do_something_with_node_consumed(node_consumed);
+
+        // set all fields of contained device
+        init_contained_device(&dev->cont);
+        return &dev->obj;
+    }
+
+    static void register_my_driver(void)
+    {
+        qos_node_create_driver("my_driver", my_driver_constructor);
+
+        // contained drivers don't need a constructor,
+        // they will be init by the parent.
+        qos_node_create_driver("my_driver_contained", NULL);
+
+        // For the sake of this example, assume machine x86_64/pc
+        // contains "other_node".
+        // This relation, along with the machine and "other_node"
+        // creation, should be defined in the x86_64_pc-machine.c file.
+        // "my_driver" will then consume "other_node"
+        qos_node_contains("my_driver", "my_driver_contained");
+        qos_node_produces("my_driver", "my_interface");
+        qos_node_consumes("my_driver", "other_node");
+    }
+
+In the above example, all possible types of relations are created:
+node "my_driver" consumes, contains and produces other nodes.
+More specifically::
+
+  x86_64/pc -->contains--> other_node <--consumes-- my_driver
+                                                        |
+                       my_driver_contained <--contains--+
+                                                        |
+                              my_interface <--produces--+
+
+or inverting the consumes edge in consumed_by::
+
+  x86_64/pc -->contains--> other_node --consumed_by--> my_driver
+                                                            |
+                           my_driver_contained <--contains--+
+                                                            |
+                                  my_interface <--produces--+
+
+Creating new test
+"""""""""""""""""
+
+.. code::
+
+    #include "qgraph.h"
+
+    static void my_test_function(void *obj, void *data)
+    {
+        Node_produced *interface_to_test = obj;
+        // test interface_to_test
+    }
+
+    static void register_my_test(void)
+    {
+        qos_add_test("my_interface", "my_test", my_test_function);
+    }
+
+    libqos_init(register_my_test);
+
+Here a new test is created, consuming "my_interface" node
+and creating a valid path from a machine to a test.
+Final graph will be like this::
+
+  x86_64/pc --contains--> other_node <--consumes-- my_driver
+                                                         |
+                        my_driver_contained <--contains--+
+                                                         |
+         my_test --consumes--> my_interface <--produces--+
+
+or inverting the consumes edge in consumed_by::
+
+  x86_64/pc --contains--> other_node --consumed_by--> my_driver
+                                                            |
+                           my_driver_contained <--contains--+
+                                                            |
+         my_test <--consumed_by-- my_interface <--produces--+
+
+Assuming there the binary is
+``QTEST_QEMU_BINARY=./qemu-system-x86_64``
+a valid test path will be:
+``/x86_64/pc/other_node/my_driver/my_interface/my_test``.
+
+Additional examples are also in ``test-qgraph.c``
+
+Command line:
+""""""""""""""
+
+Command line is built by using node names and optional arguments
+passed by the user when building the edges.
+
+There are three types of command line arguments:
+
+- ``in node``      : created from the node name. For example, machines will
+  have ``-M <machine>`` to its command line, while devices
+  ``-device <device>``. It is automatically done by the framework.
+- ``after node``   : added as additional argument to the node name.
+  This argument is added optionally when creating edges,
+  by setting the parameter @after_cmd_line and
+  @extra_edge_opts in #QOSGraphEdgeOptions.
+  The framework automatically adds
+  a comma before @extra_edge_opts,
+  because it is going to add attributes
+  after the destination node pointed by
+  the edge containing these options, and automatically
+  adds a space before @after_cmd_line, because it
+  adds an additional device, not an attribute.
+- ``before node``  : added as additional argument to the node name.
+  This argument is added optionally when creating edges,
+  by setting the parameter @before_cmd_line in
+  #QOSGraphEdgeOptions. This attribute
+  is going to add attributes before the destination node
+  pointed by the edge containing these options. It is
+  helpful to commands that are not node-representable,
+  such as ``-fdsev`` or ``-netdev``.
+
+While adding command line in edges is always used, not all nodes names are
+used in every path walk: this is because the contained or produced ones
+are already added by QEMU, so only nodes that "consumes" will be used to
+build the command line. Also, nodes that will have ``{ "abstract" : true }``
+as QMP attribute will loose their command line, since they are not proper
+devices to be added in QEMU.
+
+Example::
+
+    QOSGraphEdgeOptions opts = {
+        .arg = NULL,
+        .size_arg = 0,
+        .after_cmd_line = "-device other",
+        .before_cmd_line = "-netdev something",
+        .extra_edge_opts = "addr=04.0",
+    };
+    QOSGraphNodeS *node = qos_node_create_driver("my_node", constructor);
+    qos_node_consumes_args("my_node", "interface", &opts);
+
+Will produce the following command line:
+``-netdev something -device my_node,addr=04.0 -device other``
+
+Qgraph API reference
+^^^^^^^^^^^^^^^^^^^^
+
+.. kernel-doc:: tests/qtest/libqos/qgraph.h
diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index 97c5a75626..c3dceb6c8a 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -2,6 +2,11 @@
 QTest Device Emulation Testing Framework
 ========================================
 
+.. toctree::
+   :hidden:
+
+   qgraph
+
 QTest is a device emulation testing framework.  It can be very useful to test
 device models; it could also control certain aspects of QEMU (such as virtual
 clock stepping), with a special purpose "qtest" protocol.  Refer to
@@ -24,6 +29,9 @@ On top of libqtest, a higher level library, ``libqos``, was created to
 encapsulate common tasks of device drivers, such as memory management and
 communicating with system buses or devices. Many virtual device tests use
 libqos instead of directly calling into libqtest.
+Libqos also offers the Qgraph API to increase each test coverage and
+automate QEMU command line arguments and devices setup.
+Refer to :ref:`qgraph` for Qgraph explanation and API.
 
 Steps to add a new QTest case are:
 
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 07a32535f1..54672350c8 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -29,7 +29,6 @@
 typedef struct QOSGraphObject QOSGraphObject;
 typedef struct QOSGraphNode QOSGraphNode;
 typedef struct QOSGraphEdge QOSGraphEdge;
-typedef struct QOSGraphNodeOptions QOSGraphNodeOptions;
 typedef struct QOSGraphEdgeOptions QOSGraphEdgeOptions;
 typedef struct QOSGraphTestOptions QOSGraphTestOptions;
 
@@ -49,340 +48,94 @@ typedef void (*QOSStartFunct) (QOSGraphObject *object);
 typedef void *(*QOSBeforeTest) (GString *cmd_line, void *arg);
 
 /**
- * SECTION: qgraph.h
- * @title: Qtest Driver Framework
- * @short_description: interfaces to organize drivers and tests
- *                     as nodes in a graph
- *
- * This Qgraph API provides all basic functions to create a graph
- * and instantiate nodes representing machines, drivers and tests
- * representing their relations with CONSUMES, PRODUCES, and CONTAINS
- * edges.
- *
- * The idea is to have a framework where each test asks for a specific
- * driver, and the framework takes care of allocating the proper devices
- * required and passing the correct command line arguments to QEMU.
- *
- * A node can be of four types:
- * - QNODE_MACHINE:   for example "arm/raspi2"
- * - QNODE_DRIVER:    for example "generic-sdhci"
- * - QNODE_INTERFACE: for example "sdhci" (interface for all "-sdhci" drivers)
- *                     an interface is not explicitly created, it will be auto-
- *                     matically instantiated when a node consumes or produces
- *                     it.
- * - QNODE_TEST:      for example "sdhci-test", consumes an interface and tests
- *                    the functions provided
- *
- * Notes for the nodes:
- * - QNODE_MACHINE: each machine struct must have a QGuestAllocator and
- *                  implement get_driver to return the allocator passing
- *                  "memory". The function can also return NULL if the
- *                  allocator is not set.
- * - QNODE_DRIVER:  driver names must be unique, and machines and nodes
- *                  planned to be "consumed" by other nodes must match QEMU
- *                  drivers name, otherwise they won't be discovered
- *
- * An edge relation between two nodes (drivers or machines) X and Y can be:
- * - X CONSUMES Y: Y can be plugged into X
- * - X PRODUCES Y: X provides the interface Y
- * - X CONTAINS Y: Y is part of X component
- *
- * Basic framework steps are the following:
- * - All nodes and edges are created in their respective
- *   machine/driver/test files
- * - The framework starts QEMU and asks for a list of available devices
- *   and machines (note that only machines and "consumed" nodes are mapped
- *   1:1 with QEMU devices)
- * - The framework walks the graph starting from the available machines and
- *   performs a Depth First Search for tests
- * - Once a test is found, the path is walked again and all drivers are
- *   allocated accordingly and the final interface is passed to the test
- * - The test is executed
- * - Unused objects are cleaned and the path discovery is continued
- *
- * Depending on the QEMU binary used, only some drivers/machines will be
- * available and only test that are reached by them will be executed.
- *
- * <example>
- *   <title>Creating new driver an its interface</title>
- *   <programlisting>
- #include "qgraph.h"
-
- struct My_driver {
-     QOSGraphObject obj;
-     Node_produced prod;
-     Node_contained cont;
- }
-
- static void my_destructor(QOSGraphObject *obj)
- {
-    g_free(obj);
- }
-
- static void my_get_driver(void *object, const char *interface) {
-    My_driver *dev = object;
-    if (!g_strcmp0(interface, "my_interface")) {
-        return &dev->prod;
-    }
-    abort();
- }
-
- static void my_get_device(void *object, const char *device) {
-    My_driver *dev = object;
-    if (!g_strcmp0(device, "my_driver_contained")) {
-        return &dev->cont;
-    }
-    abort();
- }
-
- static void *my_driver_constructor(void *node_consumed,
-                                    QOSGraphObject *alloc)
- {
-    My_driver dev = g_new(My_driver, 1);
-    // get the node pointed by the produce edge
-    dev->obj.get_driver = my_get_driver;
-    // get the node pointed by the contains
-    dev->obj.get_device = my_get_device;
-    // free the object
-    dev->obj.destructor = my_destructor;
-    do_something_with_node_consumed(node_consumed);
-    // set all fields of contained device
-    init_contained_device(&dev->cont);
-    return &dev->obj;
- }
-
- static void register_my_driver(void)
- {
-     qos_node_create_driver("my_driver", my_driver_constructor);
-     // contained drivers don't need a constructor,
-     // they will be init by the parent.
-     qos_node_create_driver("my_driver_contained", NULL);
-
-    // For the sake of this example, assume machine x86_64/pc contains
-    // "other_node".
-    // This relation, along with the machine and "other_node" creation,
-    // should be defined in the x86_64_pc-machine.c file.
-    // "my_driver" will then consume "other_node"
-    qos_node_contains("my_driver", "my_driver_contained");
-    qos_node_produces("my_driver", "my_interface");
-    qos_node_consumes("my_driver", "other_node");
- }
- *   </programlisting>
- * </example>
- *
- * In the above example, all possible types of relations are created:
- * node "my_driver" consumes, contains and produces other nodes.
- * more specifically:
- * x86_64/pc -->contains--> other_node <--consumes-- my_driver
- *                                                       |
- *                      my_driver_contained <--contains--+
- *                                                       |
- *                             my_interface <--produces--+
- *
- * or inverting the consumes edge in consumed_by:
- *
- * x86_64/pc -->contains--> other_node --consumed_by--> my_driver
- *                                                           |
- *                          my_driver_contained <--contains--+
- *                                                           |
- *                                 my_interface <--produces--+
- *
- * <example>
- *   <title>Creating new test</title>
- *   <programlisting>
- * #include "qgraph.h"
- *
- * static void my_test_function(void *obj, void *data)
- * {
- *    Node_produced *interface_to_test = obj;
- *    // test interface_to_test
- * }
- *
- * static void register_my_test(void)
- * {
- *    qos_add_test("my_interface", "my_test", my_test_function);
- * }
- *
- * libqos_init(register_my_test);
- *
- *   </programlisting>
- * </example>
- *
- * Here a new test is created, consuming "my_interface" node
- * and creating a valid path from a machine to a test.
- * Final graph will be like this:
- * x86_64/pc -->contains--> other_node <--consumes-- my_driver
- *                                                        |
- *                       my_driver_contained <--contains--+
- *                                                        |
- *        my_test --consumes--> my_interface <--produces--+
- *
- * or inverting the consumes edge in consumed_by:
- *
- * x86_64/pc -->contains--> other_node --consumed_by--> my_driver
- *                                                           |
- *                          my_driver_contained <--contains--+
- *                                                           |
- *        my_test <--consumed_by-- my_interface <--produces--+
- *
- * Assuming there the binary is
- * QTEST_QEMU_BINARY=./qemu-system-x86_64
- * a valid test path will be:
- * "/x86_64/pc/other_node/my_driver/my_interface/my_test".
- *
- * Additional examples are also in test-qgraph.c
- *
- * Command line:
- * Command line is built by using node names and optional arguments
- * passed by the user when building the edges.
- *
- * There are three types of command line arguments:
- * - in node      : created from the node name. For example, machines will
- *                  have "-M <machine>" to its command line, while devices
- *                  "-device <device>". It is automatically done by the
- *                   framework.
- * - after node   : added as additional argument to the node name.
- *                  This argument is added optionally when creating edges,
- *                  by setting the parameter @after_cmd_line and
- *                  @extra_edge_opts in #QOSGraphEdgeOptions.
- *                  The framework automatically adds
- *                  a comma before @extra_edge_opts,
- *                  because it is going to add attributes
- *                  after the destination node pointed by
- *                  the edge containing these options, and automatically
- *                  adds a space before @after_cmd_line, because it
- *                  adds an additional device, not an attribute.
- * - before node  : added as additional argument to the node name.
- *                  This argument is added optionally when creating edges,
- *                  by setting the parameter @before_cmd_line in
- *                  #QOSGraphEdgeOptions. This attribute
- *                  is going to add attributes before the destination node
- *                  pointed by the edge containing these options. It is
- *                  helpful to commands that are not node-representable,
- *                  such as "-fdsev" or "-netdev".
- *
- * While adding command line in edges is always used, not all nodes names are
- * used in every path walk: this is because the contained or produced ones
- * are already added by QEMU, so only nodes that "consumes" will be used to
- * build the command line. Also, nodes that will have { "abstract" : true }
- * as QMP attribute will loose their command line, since they are not proper
- * devices to be added in QEMU.
- *
- * Example:
- *
- QOSGraphEdgeOptions opts = {
-     .arg = NULL,
-     .size_arg = 0,
-     .after_cmd_line = "-device other",
-     .before_cmd_line = "-netdev something",
-     .extra_edge_opts = "addr=04.0",
- };
- QOSGraphNode * node = qos_node_create_driver("my_node", constructor);
- qos_node_consumes_args("my_node", "interface", &opts);
- *
- * Will produce the following command line:
- * "-netdev something -device my_node,addr=04.0 -device other"
- */
-
-/**
- * Edge options to be passed to the contains/consumes *_args function.
+ * struct QOSGraphEdgeOptions:
+ * Edge options to be passed to the contains/consumes \*_args function.
+ * @arg: optional arg that will be used by dest edge
+ * @size_arg: @arg size that will be used by dest edge
+ * @extra_device_opts: optional additional command line for dest
+ *                     edge, used to add additional attributes
+ *                     *after* the node command line, the
+ *                     framework automatically prepends ","
+ *                     to this argument.
+ * @before_cmd_line: optional additional command line for dest
+ *                   edge, used to add additional attributes
+ *                   *before* the node command line, usually
+ *                   other non-node represented commands,
+ *                   like "-fdsev synt"
+ * @after_cmd_line: optional extra command line to be added
+ *                  after the device command. This option
+ *                  is used to add other devices
+ *                  command line that depend on current node.
+ *                  Automatically prepends " " to this argument
+ * @edge_name: optional edge to differentiate multiple
+ *             devices with same node name
  */
 struct QOSGraphEdgeOptions {
-    void *arg;                    /*
-                                   * optional arg that will be used by
-                                   * dest edge
-                                   */
-    uint32_t size_arg;            /*
-                                   * optional arg size that will be used by
-                                   * dest edge
-                                   */
-    const char *extra_device_opts;/*
-                                   *optional additional command line for dest
-                                   * edge, used to add additional attributes
-                                   * *after* the node command line, the
-                                   * framework automatically prepends ","
-                                   * to this argument.
-                                   */
-    const char *before_cmd_line;  /*
-                                   * optional additional command line for dest
-                                   * edge, used to add additional attributes
-                                   * *before* the node command line, usually
-                                   * other non-node represented commands,
-                                   * like "-fdsev synt"
-                                   */
-    const char *after_cmd_line;   /*
-                                   * optional extra command line to be added
-                                   * after the device command. This option
-                                   * is used to add other devices
-                                   * command line that depend on current node.
-                                   * Automatically prepends " " to this
-                                   * argument
-                                   */
-    const char *edge_name;        /*
-                                   * optional edge to differentiate multiple
-                                   * devices with same node name
-                                   */
+    void *arg;
+    uint32_t size_arg;
+    const char *extra_device_opts;
+    const char *before_cmd_line;
+    const char *after_cmd_line;
+    const char *edge_name;
 };
 
 /**
+ * struct QOSGraphTestOptions:
  * Test options to be passed to the test functions.
+ * @edge: edge arguments that will be used by test.
+ *        Note that test *does not* use edge_name,
+ *        and uses instead arg and size_arg as
+ *        data arg for its test function.
+ * @arg:  if @before is non-NULL, pass @arg there.
+ *        Otherwise pass it to the test function.
+ * @before: executed before the test. Used to add
+ *          additional parameters to the command line
+ *          and modify the argument to the test function.
+ * @subprocess: run the test in a subprocess.
  */
 struct QOSGraphTestOptions {
-    QOSGraphEdgeOptions edge;   /* edge arguments that will be used by test.
-                                 * Note that test *does not* use edge_name,
-                                 * and uses instead arg and size_arg as
-                                 * data arg for its test function.
-                                 */
-    void *arg;                  /* passed to the .before function, or to the
-                                 * test function if there is no .before
-                                 * function
-                                 */
-    QOSBeforeTest before;       /* executed before the test. Can add
-                                 * additional parameters to the command line
-                                 * and modify the argument to the test function.
-                                 */
-    bool subprocess;            /* run the test in a subprocess */
+    QOSGraphEdgeOptions edge;
+    void *arg;
+    QOSBeforeTest before;
+    bool subprocess;
 };
 
 /**
+ * struct QOSGraphObject:
  * Each driver, test or machine of this framework will have a
  * QOSGraphObject as first field.
  *
  * This set of functions offered by QOSGraphObject are executed
  * in different stages of the framework:
- * - get_driver / get_device : Once a machine-to-test path has been
- * found, the framework traverses it again and allocates all the
- * nodes, using the provided constructor. To satisfy their relations,
- * i.e. for produces or contains, where a struct constructor needs
- * an external parameter represented by the previous node,
- * the framework will call get_device (for contains) or
- * get_driver (for produces), depending on the edge type, passing
- * them the name of the next node to be taken and getting from them
- * the corresponding pointer to the actual structure of the next node to
- * be used in the path.
- *
- * - start_hw: This function is executed after all the path objects
- * have been allocated, but before the test is run. It starts the hw, setting
- * the initial configurations (*_device_enable) and making it ready for the
- * test.
- *
- * - destructor: Opposite to the node constructor, destroys the object.
- * This function is called after the test has been executed, and performs
- * a complete cleanup of each node allocated field. In case no constructor
- * is provided, no destructor will be called.
- *
+ * @get_driver: see @get_device
+ * @get_device: Once a machine-to-test path has been
+ *              found, the framework traverses it again and allocates all the
+ *              nodes, using the provided constructor. To satisfy their
+ *              relations, i.e. for produces or contains, where a struct
+ *              constructor needs an external parameter represented by the
+ *              previous node, the framework will call
+ *              @get_device (for contains) or @get_driver (for produces),
+ *              depending on the edge type, passing them the name of the next
+ *              node to be taken and getting from them the corresponding
+ *              pointer to the actual structure of the next node to
+ *              be used in the path.
+ * @start_hw: This function is executed after all the path objects
+ *            have been allocated, but before the test is run. It starts the
+ *            hw, setting the initial configurations (\*_device_enable) and
+ *            making it ready for the test.
+ * @destructor: Opposite to the node constructor, destroys the object.
+ *              This function is called after the test has been executed, and
+ *              performs a complete cleanup of each node allocated field.
+ *              In case no constructor is provided, no destructor will be
+ *              called.
+ * @free: free the memory associated to the QOSGraphObject and its contained
+ *        children
  */
 struct QOSGraphObject {
-    /* for produces edges, returns void * */
     QOSGetDriver get_driver;
-    /* for contains edges, returns a QOSGraphObject * */
     QOSGetDevice get_device;
-    /* start the hw, get ready for the test */
     QOSStartFunct start_hw;
-    /* destroy this QOSGraphObject */
     QOSDestructorFunc destructor;
-    /* free the memory associated to the QOSGraphObject and its contained
-     * children */
     GDestroyNotify free;
 };
 
@@ -399,24 +152,30 @@ void qos_graph_init(void);
 void qos_graph_destroy(void);
 
 /**
- * qos_node_destroy(): removes and frees a node from the,
+ * qos_node_destroy(): removes and frees a node from the
  * nodes hash table.
+ * @key: Name of the node
  */
 void qos_node_destroy(void *key);
 
 /**
- * qos_edge_destroy(): removes and frees an edge from the,
+ * qos_edge_destroy(): removes and frees an edge from the
  * edges hash table.
+ * @key: Name of the node
  */
 void qos_edge_destroy(void *key);
 
 /**
  * qos_add_test(): adds a test node @name to the nodes hash table.
+ * @name: Name of the test
+ * @interface: Name of the interface node it consumes
+ * @test_func: Actual test to perform
+ * @opts: Facultative options (see %QOSGraphTestOptions)
  *
  * The test will consume a @interface node, and once the
  * graph walking algorithm has found it, the @test_func will be
  * executed. It also has the possibility to
- * add an optional @opts (see %QOSGraphNodeOptions).
+ * add an optional @opts (see %QOSGraphTestOptions).
  *
  * For tests, opts->edge.arg and size_arg represent the arg to pass
  * to @test_func
@@ -428,6 +187,8 @@ void qos_add_test(const char *name, const char *interface,
 /**
  * qos_node_create_machine(): creates the machine @name and
  * adds it to the node hash table.
+ * @name: Name of the machine
+ * @function: Machine constructor
  *
  * This node will be of type QNODE_MACHINE and have @function
  * as constructor
@@ -438,6 +199,9 @@ void qos_node_create_machine(const char *name, QOSCreateMachineFunc function);
  * qos_node_create_machine_args(): same as qos_node_create_machine,
  * but with the possibility to add an optional ", @opts" after -M machine
  * command line.
+ * @name: Name of the machine
+ * @function: Machine constructor
+ * @opts: Optional additional command line
  */
 void qos_node_create_machine_args(const char *name,
                                   QOSCreateMachineFunc function,
@@ -446,6 +210,8 @@ void qos_node_create_machine_args(const char *name,
 /**
  * qos_node_create_driver(): creates the driver @name and
  * adds it to the node hash table.
+ * @name: Name of the driver
+ * @function: Driver constructor
  *
  * This node will be of type QNODE_DRIVER and have @function
  * as constructor
@@ -453,17 +219,17 @@ void qos_node_create_machine_args(const char *name,
 void qos_node_create_driver(const char *name, QOSCreateDriverFunc function);
 
 /**
- * Behaves as qos_node_create_driver() with the extension of allowing to
- * specify a different node name vs. associated QEMU device name.
+ * qos_node_create_driver_named(): behaves as qos_node_create_driver() with the
+ * extension of allowing to specify a different node name vs. associated QEMU
+ * device name.
+ * @name: Custom, unique name of the node to be created
+ * @qemu_name: Actual (official) QEMU driver name the node shall be
+ * associated with
+ * @function: Driver constructor
  *
  * Use this function instead of qos_node_create_driver() if you need to create
  * several instances of the same QEMU device. You are free to choose a custom
  * node name, however the chosen node name must always be unique.
- *
- * @param name: custom, unique name of the node to be created
- * @param qemu_name: actual (official) QEMU driver name the node shall be
- *                   associated with
- * @param function: driver constructor
  */
 void qos_node_create_driver_named(const char *name, const char *qemu_name,
                                   QOSCreateDriverFunc function);
@@ -472,6 +238,9 @@ void qos_node_create_driver_named(const char *name, const char *qemu_name,
  * qos_node_contains(): creates one or more edges of type QEDGE_CONTAINS
  * and adds them to the edge list mapped to @container in the
  * edge hash table.
+ * @container: Source node that "contains"
+ * @contained: Destination node that "is contained"
+ * @opts: Facultative options (see %QOSGraphEdgeOptions)
  *
  * The edges will have @container as source and @contained as destination.
  *
@@ -483,14 +252,17 @@ void qos_node_create_driver_named(const char *name, const char *qemu_name,
  * This function can be useful when there are multiple devices
  * with the same node name contained in a machine/other node
  *
- * For example, if "arm/raspi2" contains 2 "generic-sdhci"
+ * For example, if ``arm/raspi2`` contains 2 ``generic-sdhci``
  * devices, the right commands will be:
- * qos_node_create_machine("arm/raspi2");
- * qos_node_create_driver("generic-sdhci", constructor);
- * //assume rest of the fields are set NULL
- * QOSGraphEdgeOptions op1 = { .edge_name = "emmc" };
- * QOSGraphEdgeOptions op2 = { .edge_name = "sdcard" };
- * qos_node_contains("arm/raspi2", "generic-sdhci", &op1, &op2, NULL);
+ *
+ * .. code::
+ *
+ *    qos_node_create_machine("arm/raspi2");
+ *    qos_node_create_driver("generic-sdhci", constructor);
+ *    // assume rest of the fields are set NULL
+ *    QOSGraphEdgeOptions op1 = { .edge_name = "emmc" };
+ *    QOSGraphEdgeOptions op2 = { .edge_name = "sdcard" };
+ *    qos_node_contains("arm/raspi2", "generic-sdhci", &op1, &op2, NULL);
  *
  * Of course this also requires that the @container's get_device function
  * should implement a case for "emmc" and "sdcard".
@@ -505,6 +277,8 @@ void qos_node_contains(const char *container, const char *contained,
  * qos_node_produces(): creates an edge of type QEDGE_PRODUCES and
  * adds it to the edge list mapped to @producer in the
  * edge hash table.
+ * @producer: Source node that "produces"
+ * @interface: Interface node that "is produced"
  *
  * This edge will have @producer as source and @interface as destination.
  */
@@ -514,6 +288,9 @@ void qos_node_produces(const char *producer, const char *interface);
  * qos_node_consumes():  creates an edge of type QEDGE_CONSUMED_BY and
  * adds it to the edge list mapped to @interface in the
  * edge hash table.
+ * @consumer: Node that "consumes"
+ * @interface: Interface node that "is consumed by"
+ * @opts: Facultative options (see %QOSGraphEdgeOptions)
  *
  * This edge will have @interface as source and @consumer as destination.
  * It also has the possibility to add an optional @opts
@@ -539,7 +316,7 @@ const char *qos_get_current_command_line(void);
 /**
  * qos_allocate_objects():
  * @qts: The #QTestState that will be referred to by the machine object.
- * @alloc: Where to store the allocator for the machine object, or %NULL.
+ * @p_alloc: Where to store the allocator for the machine object, or %NULL.
  *
  * Allocate driver objects for the current test
  * path, but relative to the QTestState @qts.
@@ -551,24 +328,27 @@ void *qos_allocate_objects(QTestState *qts, QGuestAllocator **p_alloc);
 
 /**
  * qos_object_destroy(): calls the destructor for @obj
+ * @obj: A #QOSGraphObject to destroy
  */
 void qos_object_destroy(QOSGraphObject *obj);
 
 /**
  * qos_object_queue_destroy(): queue the destructor for @obj so that it is
  * called at the end of the test
+ * @obj: A #QOSGraphObject to destroy
  */
 void qos_object_queue_destroy(QOSGraphObject *obj);
 
 /**
  * qos_object_start_hw(): calls the start_hw function for @obj
+ * @obj: A #QOSGraphObject containing the start_hw function
  */
 void qos_object_start_hw(QOSGraphObject *obj);
 
 /**
  * qos_machine_new(): instantiate a new machine node
- * @node: A machine node to be instantiated
- * @qts: The #QTestState that will be referred to by the machine object.
+ * @node: Machine node to be instantiated
+ * @qts: A #QTestState that will be referred to by the machine object.
  *
  * Returns a machine object.
  */
@@ -587,8 +367,8 @@ QOSGraphObject *qos_driver_new(QOSGraphNode *node, QOSGraphObject *parent,
                                QGuestAllocator *alloc, void *arg);
 
 /**
- * Just for debugging purpose: prints all currently existing nodes and
- * edges to stdout.
+ * qos_dump_graph(): prints all currently existing nodes and
+ * edges to stdout. Just for debugging purposes.
  *
  * All qtests add themselves to the overall qos graph by calling qgraph
  * functions that add device nodes and edges between the individual graph
-- 
2.29.2


