Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C41418EC2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:47:23 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjU2-0006wW-Rb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj38-0004hZ-5g; Mon, 27 Sep 2021 01:19:36 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:57839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj36-0000fX-C6; Mon, 27 Sep 2021 01:19:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D13402B0121F;
 Mon, 27 Sep 2021 01:19:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Xz3ePiKpJuH2U
 fpD1osQTpvITJuBpO640F6xyvxELF4=; b=YTUJ4pUu7Ky8H25J2VNHtaUdkZb2T
 AwM6tPdwG5m2vGUOwPT3hSn55a3cN7dqG/EREkM/981Lud2c7lvuPoQHVdryk3xm
 RDKf4QmIJqJsVGEcyVbAVY+E/3bxb1OLZDqLKtGIwjJim/VDpHPLwc3Hc1rx+Lnn
 L4BT417tIWu6Vu/JXLDTR8Mn9d0RgqPAggZhOvhHDRx+MjoH3q0XEz+qZUSptNR6
 D6td9dIpKXnnW/sklmpAAg0ULH2+r2tQqvcfJn/TPcQHy59dIm3ifJHNVQiwOPqu
 yfTpXJ0q7bIqjhY3Ub14k0WsHHX3RRY6iDq3lOO25GXxfymyy9xLq2k2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Xz3ePiKpJuH2UfpD1osQTpvITJuBpO640F6xyvxELF4=; b=ltOMuFaz
 amP9lgJgl3niLwTPWiysLcKAR7tLMZ/HsWQ5RjEjM36LHloMh9vYVxagVLb8fpLL
 Wq2PNnLk5cAtpmMJRIHgVK6OP5w7u26DGMExZTSdjOPKHrkFPFRMQCukCmieJOEu
 AOhUfMrjA22Yba4Ro1b11rgoNOZ7vrNFOK58cNilf0PLMsNiKPrkXAqNfOtAg5yT
 TcAMF6SE9BCpSBmZkbBjRmo7rqgCbVG5VCS45Sw0AYrqN+msdUtvsLnuompeGkre
 Zz2XJzwMrN6aQlUu8RoFr2xFHY7U3IE8WGjh+UdtvrbmbxdRRbMN/q3IThiOlKuW
 DwGfFde2sjyEqA==
X-ME-Sender: <xms:TVRRYeVT2QuBw3dC2JlIvZB2k_UkjnD5alkwFWH0eEtydO8DkniDsg>
 <xme:TVRRYamS-oHsbgk5VRxOT023rgaQEoxMzwo_S6DiRS6AlyEjR0hKp-floCIjcHg_8
 fWqTfz7k5ekX-Oancw>
X-ME-Received: <xmr:TVRRYSagoDBS47abDVVcuQ5o7DtR0-lXCbuTv3jIa2h6Zx8FgzDKbgCCM6Rw5WYMeQ6oPzYmSRAWMn4v3BhIA2kGU0ExHWsou-rHnSmRsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:TVRRYVXAMeBmI2J2dtN7CWQYmvFBM1Py08-zcVVQmJ7vu8lwu5tBcw>
 <xmx:TVRRYYkGm2gpOlhOUVg5-wLwFPZIvLrfIUwMcVlEeOwzIw0ePxOu7g>
 <xmx:TVRRYad6EycBEsytbjCFrLFCPsEKb2CZ4KfhbbueTfh4iY8uj9C_8g>
 <xmx:TVRRYclE2of2d_MTfQW94Kn_DoH6T40jgEO3k6fa2DChANf7f0-fSfgvDU0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:19:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 16/16] docs: add documentation for experimental nvme
 emulation
Date: Mon, 27 Sep 2021 07:17:59 +0200
Message-Id: <20210927051759.447305-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/device-emulation.rst          |   1 +
 docs/system/devices/nvme-experimental.rst | 107 ++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 docs/system/devices/nvme-experimental.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 7afcfd8064ae..9a4e08e4ea44 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -85,6 +85,7 @@ Emulated Devices
    devices/ivshmem.rst
    devices/net.rst
    devices/nvme.rst
+   devices/nvme-experimental.rst
    devices/usb.rst
    devices/vhost-user.rst
    devices/virtio-pmem.rst
diff --git a/docs/system/devices/nvme-experimental.rst b/docs/system/devices/nvme-experimental.rst
new file mode 100644
index 000000000000..d3b94dc3ef59
--- /dev/null
+++ b/docs/system/devices/nvme-experimental.rst
@@ -0,0 +1,107 @@
+===========================
+Experimental NVMe Emulation
+===========================
+
+QEMU offers experimental NVMe emulation through the ``x-nvme-ctrl`` device and
+the ``x-nvme-subsystem`` and ``x-nvme-ns-{nvm,zoned}`` objects.
+
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
+    -object x-nvme-subsystem,id=nvme-subsys-0
+    -device x-nvme-ctrl,subsys=nvme-subsys-0
+
+There are a number of optional general parameters for the ``x-nvme-ctrl``
+device. Some are mentioned here, but see ``-device x-nvme-ctrl,help`` to list
+all possible parameters.
+
+``max-ioqpairs=UINT32`` (default: ``64``)
+  Set the maximum number of allowed I/O queue pairs.
+
+``msix-vectors=UINT16`` (default: ``65``)
+  The number of MSI-X vectors that the device should support.
+
+``mdts=UINT8`` (default: ``7``)
+  Set the Maximum Data Transfer Size of the device.
+
+
+Additional Namespaces
+---------------------
+
+The invocation sketched above does not add any namespaces to the subsystem. To
+add these, add ``x-nvme-ns-NSTYPE`` (where ``NSTYPE`` is either ``nvm`` or
+``zoned``) objects with attached blockdevs and a reference to the subsystem:
+
+.. code-block:: console
+
+    -blockdev file,node-name=blk-file-nvm-1,filename=nvm-1.img
+    -blockdev raw,node-name=blk-nvm-1,file=blk-file-nvm-1
+    -object x-nvme-ns-nvm,id=nvm-1,blockdev=blk-nvm-1,subsys=nvme-subsys-0
+
+There are a number of optional parameters available (common to both the ``nvm``
+and ``zoned`` namespace types):
+
+``nsid`` (default: ``"auto"``)
+  Explicitly set the namespace identifier. If left at the default, the
+  subsystem will allocate the next available identifier.
+
+``uuid`` (default: ``"auto"``)
+  Set the UUID of the namespace. This will be reported as a "Namespace UUID"
+  descriptor in the Namespace Identification Descriptor List. If left at the
+  default, a UUID will be generated.
+
+``eui64`` (default: ``"auto"``)
+  Set the EUI-64 of the namespace. This will be reported as a "IEEE Extended
+  Unique Identifier" descriptor in the Namespace Identification Descriptor
+  List. If left at the default, an identifier prefixed with the QEMU IEEE OUI
+  (``52:54:00``) will be generated.
+
+``lba-size`` (default: ``4096``)
+  Set the logical block size.
+
+Namespaces support LBA metadata in the form separate metadata (``MPTR``-based)
+and extended LBAs.
+
+``metadata-size`` (default: ``0``)
+  Defines the number of metadata bytes per LBA.
+
+``extended-lba`` (default: ``off/false``)
+  Set to ``on/true`` to enable extended LBAs.
+
+With metadata configured, namespaces support DIF- and DIX-based protection
+information (depending on ``extended-lba``).
+
+``pi-type`` (default: ``"none"``)
+  Enable protection information of the specified type (type ``"type1"``,
+  ``"type2"`` or ``"type3"``).
+
+``pi-first`` (default: ``off/false``)
+  Controls the location of the protection information within the metadata. Set
+  to ``on/true`` to transfer protection information as the first eight bytes of
+  metadata. Otherwise, the protection information is transferred as the last
+  eight bytes.
+
+The ``zoned`` namespace type has additional parameters:
+
+``zone-size`` (default: ``4096``)
+  The number of LBAs in a zone.
+
+``zone-capacity`` (default: ``4096``)
+  The number of writable LBAs in a zone.
-- 
2.33.0


