Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05935835E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:36:12 +0200 (CEST)
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUTtK-00050i-8a
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUTnw-0003LN-16; Thu, 08 Apr 2021 08:30:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUTns-0005x0-ID; Thu, 08 Apr 2021 08:30:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D0055C00B1;
 Thu,  8 Apr 2021 08:30:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 08:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=N2JTTBQ42sYV9TreRFXcZGkdkL
 ulzG1uVq1TbAkqx2w=; b=MAcn5ZbYGhHGaJKFYlkyGUqofbQNAkyX9B4q2DSQ3O
 XQUhdh0yv/V253UC7IklWTc8xwzbHAC3W/W5uSO+VCked1LloxOnsVTinPGvGPvZ
 CLlOlSvdqAnrdOIeCRbJkLhZ1O9IVUMvFxz8jsFgRQWwWf9rOggRStQBl3589Os/
 IRtO1+qAQzcSsFLoIzxBUOzgMinPyPfuRHGvMxhMvLGYt5fJXEFc2838Y/wEwIzH
 3mzVSlgbOgw3PhF1XrdRIcNBLE1tnjFVjIOvPew0x6ZdXj8ghNnxLoqto0Lb+EE/
 zVLzHYkEqRPnS/xs7CeT2kumR1YX1cbJlqfU54u6Imqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=N2JTTB
 Q42sYV9TreRFXcZGkdkLulzG1uVq1TbAkqx2w=; b=AiN35M93YlQxWrsja1lAj4
 JOTByG88MDgpv9jPEsKgmKbvD/EGtlXZFoCl0ZXwbhe9HOupY6TAaQwdFyR8nenh
 Z6sC7pWQxl7hMlkN+lTGSg+Lm8vtnXl1NLjawbQrAmNnEWE2yEZ7uN8SZ8qKAlRV
 fbpybjpIxNbEWJSeNh887rV7TminDp2wnmzYeRGk96uIMe5pq0IpHUlmCCpIvkOy
 U6Q6jWtU1GJ1Pkw8XOMcw2YByqeOXdnfDSy6WVJxY5wVO0kfqkfsVJdmhUSLLU3J
 +8LNuXEFFMauNtme0OffSEx0Q9n+cyNKLDf0cD1c9BjHzrQhfbtDSh1NbWKbBLMQ
 ==
X-ME-Sender: <xms:ZfduYPtrOVSCw5wuMI6tE4kwQjMv8F7G3WD3UL8B570D8ZDXltj0KQ>
 <xme:ZfduYAeY0PDpNy7V8y6K8zMNNmADPHXXJtX1KZkIdDjmvmyl6-lDwRrGNg1BGALcn
 CNljCy5ieXWVyF5pwo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeejuedukeelieejgfffjeekgfeftdeihefggeeivdeigeegjedtlefgvdeuieek
 necuffhomhgrihhnpehnvhhmvgigphhrvghsshdrohhrghdpihhnfhhrrgguvggrugdroh
 hrghenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZfduYCxdOyG9Kc5nU1Hokc_WA1BnA7iDlIl-RHplgENKdgTz2nIiyA>
 <xmx:ZfduYOOfb82doZX_hfX5KQci7QHe9_6dWFqU6hLWfIzaos1HiEltzg>
 <xmx:ZfduYP_JtD1Dh3Ss86rizsBroN4gYhKv52CWOAYdhpRiEQx2kFTFrw>
 <xmx:ZvduYCZVX1M2L-vi5hi1WStr3Y_FDlvLihEnINsFSt6byYoCmHo3iQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 96CB1108005C;
 Thu,  8 Apr 2021 08:30:28 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: add nvme emulation documentation
Date: Thu,  8 Apr 2021 14:30:26 +0200
Message-Id: <20210408123026.410303-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the docs/specs/nvme.txt and replace it with proper documentation
in docs/system/nvme.rst.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2:
 - add descriptions of the simple copy `mssrl`, `mcl` and `msrc`
   parameters. (philmd)

 docs/specs/nvme.txt   |  23 -----
 docs/system/index.rst |   1 +
 docs/system/nvme.rst  | 225 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS           |   2 +-
 4 files changed, 227 insertions(+), 24 deletions(-)
 delete mode 100644 docs/specs/nvme.txt
 create mode 100644 docs/system/nvme.rst

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
deleted file mode 100644
index 56d393884e7a..000000000000
--- a/docs/specs/nvme.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-NVM Express Controller
-======================
-
-The nvme device (-device nvme) emulates an NVM Express Controller.
-
-
-Reference Specifications
-------------------------
-
-The device currently implements most mandatory features of NVMe v1.3d, see
-
-  https://nvmexpress.org/resources/specifications/
-
-for the specification.
-
-
-Known issues
-------------
-
-* The accounting numbers in the SMART/Health are reset across power cycles
-
-* Interrupt Coalescing is not supported and is disabled by default in volation
-  of the specification.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 02d07071810f..b05af716a973 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -23,6 +23,7 @@ Contents:
    net
    virtio-net-failover
    usb
+   nvme
    ivshmem
    linuxboot
    generic-loader
diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
new file mode 100644
index 000000000000..f7f63d6bf615
--- /dev/null
+++ b/docs/system/nvme.rst
@@ -0,0 +1,225 @@
+==============
+NVMe Emulation
+==============
+
+QEMU provides NVMe emulation through the ``nvme``, ``nvme-ns`` and
+``nvme-subsys`` devices.
+
+See the following sections for specific information on
+
+  * `Adding NVMe Devices`_, `additional namespaces`_ and `NVM subsystems`_.
+  * Configuration of `Optional Features`_ such as `Controller Memory Buffer`_,
+    `Simple Copy`_, `Zoned Namespaces`_, `metadata`_ and `End-to-End Data
+    Protection`_,
+
+Adding NVMe Devices
+===================
+
+Controller Emulation
+--------------------
+
+The QEMU emulated NVMe controller implements version 1.4 of the NVM Express
+specification. All mandatory features are implement with a couple of exceptions
+and limitations:
+
+  * Accounting numbers in the SMART/Health log page are reset when the device
+    is power cycled.
+  * Interrupt Coalescing is not supported and is disabled by default.
+
+The simplest way to attach an NVMe controller on the QEMU PCI bus is to add the
+following parameters:
+
+.. code-block:: console
+
+    -drive file=nvm.img,if=none,id=nvm
+    -device nvme,serial=deadbeef,drive=nvm
+
+There are a number of optional general parameters for the ``nvme`` device. Some
+are mentioned here, but see ``-device nvme,help`` to list all possible
+parameters.
+
+``max_ioqpairs=UINT32`` (default: ``64``)
+  Set the maximum number of allowed I/O queue pairs. This replaces the
+  deprecated ``num_queues`` parameter.
+
+``msix_qsize=UINT16`` (default: ``65``)
+  The number of MSI-X vectors that the device should support.
+
+``mdts=UINT8`` (default: ``7``)
+  Set the Maximum Data Transfer Size of the device.
+
+``use-intel-id`` (default: ``off``)
+  Since QEMU 5.2, the device uses a QEMU allocated "Red Hat" PCI Device and
+  Vendor ID. Set this to ``on`` to revert to the unallocated Intel ID
+  previously used.
+
+Additional Namespaces
+---------------------
+
+In the simplest possible invocation sketched above, the device only support a
+single namespace with the namespace identifier ``1``. To support multiple
+namespaces and additional features, the ``nvme-ns`` device must be used.
+
+.. code-block:: console
+
+   -device nvme,id=nvme-ctrl-0,serial=deadbeef
+   -drive file=nvm-1.img,if=none,id=nvm-1
+   -device nvme-ns,drive=nvm-1
+   -drive file=nvm-2.img,if=none,id=nvm-2
+   -device nvme-ns,drive=nvm-2
+
+The namespaces defined by the ``nvme-ns`` device will attach to the most
+recently defined ``nvme-bus`` that is created by the ``nvme`` device. Namespace
+identifers are allocated automatically, starting from ``1``.
+
+There are a number of parameters available:
+
+``nsid`` (default: ``0``)
+  Explicitly set the namespace identifier.
+
+``uuid`` (default: *autogenerated*)
+  Set the UUID of the namespace. This will be reported as a "Namespace UUID"
+  descriptor in the Namespace Identification Descriptor List.
+
+``bus``
+  If there are more ``nvme`` devices defined, this parameter may be used to
+  attach the namespace to a specific ``nvme`` device (identified by an ``id``
+  parameter on the controller device).
+
+NVM Subsystems
+--------------
+
+Additional features becomes available if the controller device (``nvme``) is
+linked to an NVM Subsystem device (``nvme-subsys``).
+
+The NVM Subsystem emulation allows features such as shared namespaces and
+multipath I/O.
+
+.. code-block:: console
+
+   -device nvme-subsys,id=nvme-subsys-0,nqn=subsys0
+   -device nvme,serial=a,subsys=nvme-subsys-0
+   -device nvme,serial=b,subsys=nvme-subsys-0
+
+This will create an NVM subsystem with two controllers. Having controllers
+linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` parameters:
+
+``shared`` (default: ``off``)
+  Specifies that the namespace will be attached to all controllers in the
+  subsystem. If set to ``off`` (the default), the namespace will remain a
+  private namespace and may only be attached to a single controller at a time.
+
+``detached`` (default: ``off``)
+  If set to ``on``, the namespace will be be available in the subsystem, but
+  not attached to any controllers initially.
+
+Thus, adding
+
+.. code-block:: console
+
+   -drive file=nvm-1.img,if=none,id=nvm-1
+   -device nvme-ns,drive=nvm-1,nsid=1,shared=on
+   -drive file=nvm-2.img,if=none,id=nvm-2
+   -device nvme-ns,drive=nvm-2,nsid=3,detached=on
+
+will cause NSID 1 will be a shared namespace (due to ``shared=on``) that is
+initially attached to both controllers. NSID 3 will be a private namespace
+(i.e. only attachable to a single controller at a time) and will not be
+attached to any controller initially (due to ``detached=on``).
+
+Optional Features
+=================
+
+Controller Memory Buffer
+------------------------
+
+``nvme`` device parameters related to the Controller Memory Buffer support:
+
+``cmb_size_mb=UINT32`` (default: ``0``)
+  This adds a Controller Memory Buffer of the given size at offset zero in BAR
+  2.
+
+``legacy-cmb`` (default: ``off``)
+  By default, the device uses the "v1.4 scheme" for the Controller Memory
+  Buffer support (i.e, the CMB is initially disabled and must be explicitly
+  enabled by the host). Set this to ``on`` to behave as a v1.3 device wrt. the
+  CMB.
+
+Simple Copy
+-----------
+
+The device includes support for TP 4065 ("Simple Copy Command"). A number of
+additional ``nvme-ns`` device parameters may be used to control the Copy
+command limits:
+
+``mssrl=UINT16`` (default: ``128``)
+  Set the Maximum Single Source Range Length (``MSSRL``). This is the maximum
+  number of logical blocks that may be specified in each source range.
+
+``mcl=UINT32`` (default: ``128``)
+  Set the Maximum Copy Length (``MCL``). This is the maximum number of logical
+  blocks that may be specified in a Copy command (the total for all source
+  ranges).
+
+``msrc=UINT8`` (default: ``127``)
+  Set the Maximum Source Range Count (``MSRC``). This is the maximum number of
+  source ranges that may be used in a Copy command. This is a 0's based value.
+
+Zoned Namespaces
+----------------
+
+A namespaces may be "Zoned" as defined by TP 4053 ("Zoned Namespaces"). Set
+``zoned=on`` on an ``nvme-ns`` device to configure it as a zoned namespace.
+
+The namespace may be configured with additional parameters
+
+``zoned.zone_size=SIZE`` (default: ``128MiB``)
+  Define the zone size (``ZSZE``).
+
+``zoned.zone_capacity=SIZE`` (default: ``0``)
+  Define the zone capacity (``ZCAP``). If left at the default (``0``), the zone
+  capacity will equal the zone size.
+
+``zoned.descr_ext_size=UINT32`` (default: ``0``)
+  Set the Zone Descriptor Extension Size (``ZDES``). Must be a multiple of 64
+  bytes.
+
+``zoned.cross_read=BOOL`` (default: ``off``)
+  Set to ``on`` to allow reads to cross zone boundaries.
+
+``zoned.max_active=UINT32`` (default: ``0``)
+  Set the maximum number of active resources (``MAR``). The default (``0``)
+  allows all zones to be active.
+
+``zoned.max_open=UINT32`` (default: ``0``)
+  Set the maximum number of open resources (``MOR``). The default (``0``)
+  allows all zones to be open. If ``zoned.max_active`` is specified, this value
+  must be less than or equal to that.
+
+Metadata
+--------
+
+The virtual namespace device supports LBA metadata in the form separate
+metadata (``MPTR``-based) and extended LBAs.
+
+``ms=UINT16`` (default: ``0``)
+  Defines the number of metadata bytes per LBA.
+
+``mset=UINT8`` (default: ``0``)
+  Set to ``1`` to enable extended LBAs.
+
+End-to-End Data Protection
+--------------------------
+
+The virtual namespace device supports DIF- and DIX-based protection information
+(depending on ``mset``).
+
+``pi=UINT8`` (default: ``0``)
+  Enable protection information of the specified type (type ``1``, ``2`` or
+  ``3``).
+
+``pil=UINT8`` (default: ``0``)
+  Controls the location of the protection information within the metadata. Set
+  to ``1`` to transfer protection information as the first eight bytes of
+  metadata. Otherwise, the protection information is transferred as the last
+  eight bytes.
diff --git a/MAINTAINERS b/MAINTAINERS
index 58f342108e9e..04beb34e7ec4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1974,7 +1974,7 @@ S: Supported
 F: hw/block/nvme*
 F: include/block/nvme.h
 F: tests/qtest/nvme-test.c
-F: docs/specs/nvme.txt
+F: docs/system/nvme.rst
 T: git git://git.infradead.org/qemu-nvme.git nvme-next
 
 megasas
-- 
2.31.1


