Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0641DB8D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:54:30 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwW5-0004BB-2h
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBT-00086z-OY
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBN-0005GO-Rp
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q2so227344wrc.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/L6oYH7LKQQ6EnSN+snPuNSEleo9MpfTkX3cojlfU4=;
 b=cQ1kXmCtAckj1CorKSXve3pQL1S/3kOLYpv/ta0Atq/cEohU0jM1/9u0glAIPQXbhr
 vkrxD/YyMu4qqON3wNnv/WHI1Gu3lGab2g58hV47zhjCLNyrtsnqL9lhFQ2AZhJWnRg3
 NK8PqBlVn1XxR+qay8azct8CFvBCFXtS0a+JDnfeIuMuOJMf/jhsrXnp6S7fJJNGxsEc
 qzwihL+gTCE1XNv9+xSUIgrbcHo8/DuOJkszxukaKxWtVrlO6KwHxLTJRkm5qCBLhwOH
 Tkd6IJJ6mmAKG4SJi+1isSRDVnbW3sq49o0DL9+zWW5/vGe4m2V8ZVSv+7yZHORdDz8b
 xTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U/L6oYH7LKQQ6EnSN+snPuNSEleo9MpfTkX3cojlfU4=;
 b=7IZdt6bAMX3oueGdr8/pI4pz54nuUm8ZOHJKohSTJO1SlfNgT8awsNvDcSmMho2Hgv
 tEu3Jke46yv2TakicnkIxY6Zl8vrpcLk2ghB9VVaTxUjXGcjBjqhNidqi5JaVYffEt7Q
 UydoRMcL277A9HmH+uvnwm1SNwmy8bJyg58zfFqwytXSYmP77hHcxzqb2mAMv6Wskvuv
 Q+GuOqbcoKH/qjLLepj8WO/FLiLWKKAYK+DqTFYu46EiLeEA1SSySsoMS5nkuUjHHDbh
 BO64kkw41Ve97A6W2K0xZ0C8a62X/GNWlRtqyqjODxRDhfe77fqYPNhs0cLXSMloRpjH
 vP5A==
X-Gm-Message-State: AOAM533bSOikmWQOi4dmxoUgIeUzSTadBxrWDoh84PILGUA/Ft/sWtqF
 ccqqAeVMvnH+pIlgk/aLOXsXXlK2YP8=
X-Google-Smtp-Source: ABdhPJxnyuDvPiAtLUWKmbjKD7XIj6Yg0GjJYQQV57P9pYz7MyGdpRo3gVxzI96X8PjHX+eSZilFwA==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr6026148wrv.154.1633008781762; 
 Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] docs: reorganize qgraph.rst
Date: Thu, 30 Sep 2021 15:32:47 +0200
Message-Id: <20210930133250.181156-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the heading levels to use === --- ~~~, and move the command line
building near to the other execution steps.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/qgraph.rst | 132 +++++++++++++++++++++---------------------
 1 file changed, 67 insertions(+), 65 deletions(-)

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index c2882c3a33..db44d71002 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -1,8 +1,7 @@
 .. _qgraph:
 
-========================================
 Qtest Driver Framework
-========================================
+======================
 
 In order to test a specific driver, plain libqos tests need to
 take care of booting QEMU with the right machine and devices.
@@ -31,13 +30,15 @@ so the sdhci-test should only care of linking its qgraph node with
 that interface. In this way, if the command line of a sdhci driver
 is changed, only the respective qgraph driver node has to be adjusted.
 
+QGraph concepts
+---------------
+
 The graph is composed by nodes that represent machines, drivers, tests
 and edges that define the relationships between them (``CONSUMES``, ``PRODUCES``, and
 ``CONTAINS``).
 
-
 Nodes
-^^^^^^
+~~~~~
 
 A node can be of four types:
 
@@ -64,7 +65,7 @@ Notes for the nodes:
   drivers name, otherwise they won't be discovered
 
 Edges
-^^^^^^
+~~~~~
 
 An edge relation between two nodes (drivers or machines) ``X`` and ``Y`` can be:
 
@@ -73,7 +74,7 @@ An edge relation between two nodes (drivers or machines) ``X`` and ``Y`` can be:
 - ``X CONTAINS Y``: ``Y`` is part of ``X`` component
 
 Execution steps
-^^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~~
 
 The basic framework steps are the following:
 
@@ -92,8 +93,64 @@ The basic framework steps are the following:
 Depending on the QEMU binary used, only some drivers/machines will be
 available and only test that are reached by them will be executed.
 
+Command line
+~~~~~~~~~~~~
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
+  by setting the parameter ``after_cmd_line`` and
+  ``extra_edge_opts`` in ``QOSGraphEdgeOptions``.
+  The framework automatically adds
+  a comma before ``extra_edge_opts``,
+  because it is going to add attributes
+  after the destination node pointed by
+  the edge containing these options, and automatically
+  adds a space before ``after_cmd_line``, because it
+  adds an additional device, not an attribute.
+- ``before node``  : added as additional argument to the node name.
+  This argument is added optionally when creating edges,
+  by setting the parameter ``before_cmd_line`` in
+  ``QOSGraphEdgeOptions``. This attribute
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
+        .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
+                           "file.read-zeroes=on,format=raw",
+        .after_cmd_line = "-device scsi-hd,bus=vs0.0,drive=drv0",
+
+        opts.extra_device_opts = "id=vs0";
+    };
+
+    qos_node_create_driver("virtio-scsi-device",
+                            virtio_scsi_device_create);
+    qos_node_consumes("virtio-scsi-device", "virtio-bus", &opts);
+
+Will produce the following command line:
+``-drive id=drv0,if=none,file=null-co://, -device virtio-scsi-device,id=vs0 -device scsi-hd,bus=vs0.0,drive=drv0``
+
 Troubleshooting unavailable tests
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 If there is no path from an available machine to a test then that test will be
 unavailable and won't execute. This can happen if a test or driver did not set
 up its qgraph node correctly. It can also happen if the necessary machine type
@@ -151,7 +208,7 @@ Typically this is because the QEMU binary lacks support for the necessary
 machine type or device.
 
 Creating a new driver and its interface
-"""""""""""""""""""""""""""""""""""""""""
+---------------------------------------
 
 Here we continue the ``sdhci`` use case, with the following scenario:
 
@@ -489,7 +546,7 @@ or inverting the consumes edge in consumed_by::
             arm/raspi2b --contains--> generic-sdhci
 
 Adding a new test
-"""""""""""""""""
+-----------------
 
 Given the above setup, adding a new test is very simple.
 ``sdhci-test``, taken from ``tests/qtest/sdhci-test.c``::
@@ -565,62 +622,7 @@ and for the binary ``QTEST_QEMU_BINARY=./qemu-system-arm``:
 
 Additional examples are also in ``test-qgraph.c``
 
-Command line:
-""""""""""""""
-
-Command line is built by using node names and optional arguments
-passed by the user when building the edges.
-
-There are three types of command line arguments:
-
-- ``in node``      : created from the node name. For example, machines will
-  have ``-M <machine>`` to its command line, while devices
-  ``-device <device>``. It is automatically done by the framework.
-- ``after node``   : added as additional argument to the node name.
-  This argument is added optionally when creating edges,
-  by setting the parameter ``after_cmd_line`` and
-  ``extra_edge_opts`` in ``QOSGraphEdgeOptions``.
-  The framework automatically adds
-  a comma before ``extra_edge_opts``,
-  because it is going to add attributes
-  after the destination node pointed by
-  the edge containing these options, and automatically
-  adds a space before ``after_cmd_line``, because it
-  adds an additional device, not an attribute.
-- ``before node``  : added as additional argument to the node name.
-  This argument is added optionally when creating edges,
-  by setting the parameter ``before_cmd_line`` in
-  ``QOSGraphEdgeOptions``. This attribute
-  is going to add attributes before the destination node
-  pointed by the edge containing these options. It is
-  helpful to commands that are not node-representable,
-  such as ``-fdsev`` or ``-netdev``.
-
-While adding command line in edges is always used, not all nodes names are
-used in every path walk: this is because the contained or produced ones
-are already added by QEMU, so only nodes that "consumes" will be used to
-build the command line. Also, nodes that will have ``{ "abstract" : true }``
-as QMP attribute will loose their command line, since they are not proper
-devices to be added in QEMU.
-
-Example::
-
-    QOSGraphEdgeOptions opts = {
-        .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
-                           "file.read-zeroes=on,format=raw",
-        .after_cmd_line = "-device scsi-hd,bus=vs0.0,drive=drv0",
-
-        opts.extra_device_opts = "id=vs0";
-    };
-
-    qos_node_create_driver("virtio-scsi-device",
-                            virtio_scsi_device_create);
-    qos_node_consumes("virtio-scsi-device", "virtio-bus", &opts);
-
-Will produce the following command line:
-``-drive id=drv0,if=none,file=null-co://, -device virtio-scsi-device,id=vs0 -device scsi-hd,bus=vs0.0,drive=drv0``
-
 Qgraph API reference
-^^^^^^^^^^^^^^^^^^^^
+--------------------
 
 .. kernel-doc:: tests/qtest/libqos/qgraph.h
-- 
2.31.1



