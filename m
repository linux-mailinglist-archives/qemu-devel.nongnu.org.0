Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A1558AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:51:43 +0200 (CEST)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Ujm-0001nO-Jn
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUF-000528-6k; Thu, 23 Jun 2022 17:35:40 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUD-0006gQ-Ei; Thu, 23 Jun 2022 17:35:38 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 84FA23200984;
 Thu, 23 Jun 2022 17:35:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020134; x=
 1656106534; bh=xB85BpHO8WPRA7kFCn2WZ19G2Wh0p1AexZXvQjcGgcQ=; b=b
 fGYg3PNJ/d9rQ3M6VU0ijxEFYaIqUd0fST3xTSeooxyDHRhMuRUkVIxab4dL2VRF
 mezVoJDKsEVPs+TjgieDfvqaR55w/2xNBNUsJg8pjkm5yYJoLV1PNoP2pRyvZo59
 oEVuy4cJhoJjT+WjRzTkNoxRgfhgh5kOgw5o15AQVmwGpeWGealbxC5l5Jjpbrbi
 YqAaEW8VQRNFQrDReVXWdc3f7Eb01dqMvPUbJUkNznyBYf+T0tH5nUP0wlASH7oz
 V3qiiLL46xbGf8FL2IImoTS9FUSepdu/7SHJ4xIkpe1/tTOIVJWV35ukFglrt1r0
 TEB8yHulQRWJHlapLWHgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020134; x=1656106534; bh=xB85BpHO8WPRA
 7kFCn2WZ19G2Wh0p1AexZXvQjcGgcQ=; b=D9B30MvHUwBqbj6SxdqgvlBx5R0HE
 w13iRmAvxrw+3DEKxPL5L857CU6Gz2nvP7Kymxd3ThRSvnUJSdXd4q5YYMArye6H
 aJBVk6KlhRjR6RqHQE+PhbzJMv7w7trCmQqNH83eA0HKMWj6BmCU8vW7sIgIhuvz
 VuuUWUf2eFtItqFNGsr3OwbSi97FI2PLENLVaBmXnvQzEvz9BwlpTTIHRxvHcQUL
 cVbjl+yfnoLlS67NVrV/kq+WTDf/lA5Oo7x/Os/gCOrjeJpUPAXXtVlW5jN8hQ1D
 1rHF6fKJhji9FFkXwk7YS4tulpBE7ierUvdvEfUbnWJfTM6LcJ395CE1g==
X-ME-Sender: <xms:pdy0YnxjRY6pFpl-7plVsZdEWljpxCpc1Q1i5hKyYrzyGRJUfTgLng>
 <xme:pdy0YvTfMnHrZLbytPMTUfMoeJvr5d142049Cw4QF6WxG97Bgw6wD1ya5B-Maytai
 3TLZAMZdc5qfrE3vhk>
X-ME-Received: <xmr:pdy0YhXrLuzsAS4EOAaNuR_5ngM9MK9MSq037oDXSns5gXuy_KlXgPAxBkmAJ1NkwfMD5pRbIlKyNn6Y1xBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pdy0YhhibumMuua4DU1tkNkFrL0LJzJxacJcnXGVGaDgrYg-_TNNZQ>
 <xmx:pdy0YpAYhQq29ckf_cij5Jflx1xpnbxCRh_3D9mwsABRB0b_zDEZFQ>
 <xmx:pdy0YqJxYxQYs-k0lvo9abTf38xM1JXDW175_LK_VkGZ1GpAHEQ4Sw>
 <xmx:pty0Yhbi0HI7Uzoun_2_6T_kZK2tHONBvdFlEdQ_EpZn6OlqyvUD7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 10/15] docs: Add documentation for SR-IOV and Virtualization
 Enhancements
Date: Thu, 23 Jun 2022 23:34:37 +0200
Message-Id: <20220623213442.67789-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Documentation describes 5 new parameters being added regarding SR-IOV:
sriov_max_vfs
sriov_vq_flexible
sriov_vi_flexible
sriov_max_vi_per_vf
sriov_max_vq_per_vf

The description also includes the simplest possible QEMU invocation
and the series of NVMe commands required to enable SR-IOV support.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/devices/nvme.rst | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index b5acb2a9c19d..aba253304e46 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -239,3 +239,85 @@ The virtual namespace device supports DIF- and DIX-based protection information
   to ``1`` to transfer protection information as the first eight bytes of
   metadata. Otherwise, the protection information is transferred as the last
   eight bytes.
+
+Virtualization Enhancements and SR-IOV (Experimental Support)
+-------------------------------------------------------------
+
+The ``nvme`` device supports Single Root I/O Virtualization and Sharing
+along with Virtualization Enhancements. The controller has to be linked to
+an NVM Subsystem device (``nvme-subsys``) for use with SR-IOV.
+
+A number of parameters are present (**please note, that they may be
+subject to change**):
+
+``sriov_max_vfs`` (default: ``0``)
+  Indicates the maximum number of PCIe virtual functions supported
+  by the controller. Specifying a non-zero value enables reporting of both
+  SR-IOV and ARI (Alternative Routing-ID Interpretation) capabilities
+  by the NVMe device. Virtual function controllers will not report SR-IOV.
+
+``sriov_vq_flexible``
+  Indicates the total number of flexible queue resources assignable to all
+  the secondary controllers. Implicitly sets the number of primary
+  controller's private resources to ``(max_ioqpairs - sriov_vq_flexible)``.
+
+``sriov_vi_flexible``
+  Indicates the total number of flexible interrupt resources assignable to
+  all the secondary controllers. Implicitly sets the number of primary
+  controller's private resources to ``(msix_qsize - sriov_vi_flexible)``.
+
+``sriov_max_vi_per_vf`` (default: ``0``)
+  Indicates the maximum number of virtual interrupt resources assignable
+  to a secondary controller. The default ``0`` resolves to
+  ``(sriov_vi_flexible / sriov_max_vfs)``
+
+``sriov_max_vq_per_vf`` (default: ``0``)
+  Indicates the maximum number of virtual queue resources assignable to
+  a secondary controller. The default ``0`` resolves to
+  ``(sriov_vq_flexible / sriov_max_vfs)``
+
+The simplest possible invocation enables the capability to set up one VF
+controller and assign an admin queue, an IO queue, and a MSI-X interrupt.
+
+.. code-block:: console
+
+   -device nvme-subsys,id=subsys0
+   -device nvme,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,
+    sriov_vq_flexible=2,sriov_vi_flexible=1
+
+The minimum steps required to configure a functional NVMe secondary
+controller are:
+
+  * unbind flexible resources from the primary controller
+
+.. code-block:: console
+
+   nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
+   nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
+
+  * perform a Function Level Reset on the primary controller to actually
+    release the resources
+
+.. code-block:: console
+
+   echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
+
+  * enable VF
+
+.. code-block:: console
+
+   echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+  * assign the flexible resources to the VF and set it ONLINE
+
+.. code-block:: console
+
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
+   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
+
+  * bind the NVMe driver to the VF
+
+.. code-block:: console
+
+   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
\ No newline at end of file
-- 
2.36.1


