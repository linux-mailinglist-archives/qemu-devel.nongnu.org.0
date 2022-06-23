Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA5558AF8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:55:01 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Umy-0006rh-Eo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUO-00055r-F6; Thu, 23 Jun 2022 17:35:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUM-0006hT-Lm; Thu, 23 Jun 2022 17:35:48 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C08BD320098C;
 Thu, 23 Jun 2022 17:35:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Jun 2022 17:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020143; x=
 1656106543; bh=h4o7AOFZwCbAGKNwqBDwSEl4y0eFfp1Y4AdI/3OaUNQ=; b=g
 NIZuiAmN1ihdaVcTuWF3TBjfPZXosiL2OCRTO5UhiBx1Mz60K1LccbK52Rl2+Zwj
 EMngF8hrY1qm4QxN4fuyfy80qI/HxmjoK/HRZpyv80XsCbxXjncB6ycTMmquD062
 r5sAHY2y9t/oLM5fkMyNlUM7VS/M/N/GiTvk5UZHB5I7U2pJmWMNBKDySBiC/3wi
 RmUG5f2A1pubFb4uVWxL67ykvX2bausfX1g3P8PrHtpZ+iFmIwZd4oASr2tmWwTZ
 A5inzZ0j8Hu3pid4zmpMfRcO1Q3cndRndiikS7VhylCwl5v2IYw9P9edIv8aaR6a
 spOUugigEJr+hArSj0NzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020143; x=
 1656106543; bh=h4o7AOFZwCbAGKNwqBDwSEl4y0eFfp1Y4AdI/3OaUNQ=; b=u
 ppeQCRcUkYLIWAFugaPlbKlOh9BGt/HD0G4VlA6Vk5ZacmJ/YLYY/v1JRaxvVsgV
 q1Fe/L0q6xB2kTh9vDss7ykYEM/SPv2l/jWGFKI3HqtQ/LFNiDI1mWHSq961HSMW
 euO+KimWUyUej96wYF1uf706osy+4bwCJLfhp6z0zHvlhMz38fqDAOUWdwmPOBrW
 SXmqEOzktnJxsX0V/wfkEfU2EpvzintqQ0gFSvvC9494Q6c6GtE/qO7H0Lp559M0
 ZJjqxgCtuQEVXmz7Yc5MNQI1zPfE3RzAd23tLfhZpRK8ykA3tElc4mzZDPyY49Zg
 yafhaUiCp97nZH2IegBcg==
X-ME-Sender: <xms:r9y0YjPlJwKaHQwIEGRA-nho_85aUBTCBTtaFB9uNGJyzk5k551YBA>
 <xme:r9y0Yt-E4o9kd5nSYy7DKP3nPRWWlek_NaQSaeeaux2WS7mKPOBXKMif9RemADB9u
 I87lkPUewCvi1mkx4U>
X-ME-Received: <xmr:r9y0YiRFx53j8X0LRrLXEKGFZntzZHqxTZJr9CW3RAAPHVBqa6ycN1Dnc5W_Ea8HfuVBPSm6P2HaEGfQBkbP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffetjeeihfdv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:r9y0Yns0CnC8eOEg7r8JoJL1mEEgHf5SArIjpnP6rQOXeS3lG5UuPQ>
 <xmx:r9y0YreeJid5NJY0_EwPWoSvGioUmQqdcagqXPsx0PrjNmBkblwtZA>
 <xmx:r9y0Yj2apOFlrt7yJnl8E_NwI7wfI1hs5PRlLgVX1x-vG-FFEn3m5A>
 <xmx:r9y0Ym3XzowEz76YVWVJIwUyG2HdpEZi3uY5NF95sOqrXVEwJmoCfQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:40 -0400 (EDT)
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
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 12/15] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Date: Thu, 23 Jun 2022 23:34:39 +0200
Message-Id: <20220623213442.67789-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

PCI device capable of SR-IOV support is a new, still-experimental
feature with only a single working example of the Nvme device.

This patch in an attempt to fix a double-free problem when a
SR-IOV-capable Nvme device is hot-unplugged in the following scenario:

Qemu CLI:
---------
-device pcie-root-port,slot=0,id=rp0
-device nvme-subsys,id=subsys0
-device nvme,id=nvme0,bus=rp0,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,sriov_vq_flexible=2,sriov_vi_flexible=1

Guest OS:
---------
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
sleep 1
echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
sleep 2
echo 01:00.1 > /sys/bus/pci/drivers/nvme/bind

Qemu monitor:
-------------
device_del nvme0

Explanation of the problem and the proposed solution:

1) The current SR-IOV implementation assumes it’s the PhysicalFunction
   that creates and deletes VirtualFunctions.
2) It’s a design decision (the Nvme device at least) for the VFs to be
   of the same class as PF. Effectively, they share the dc->hotpluggable
   value.
3) When a VF is created, it’s added as a child node to PF’s PCI bus
   slot.
4) Monitor/device_del triggers the ACPI mechanism. The implementation is
   not aware of SR/IOV and ejects PF’s PCI slot, directly unrealizing all
   hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
5) VFs are unrealized directly, and it doesn’t work well with (1).
   SR/IOV structures are not updated, so when it’s PF’s turn to be
   unrealized, it works on stale pointers to already-deleted VFs.

The proposed fix is to make the PCI ACPI code aware of SR/IOV.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/acpi/pcihp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index bf65bbea4940..84d75e6b846f 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -192,8 +192,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
      * ACPI doesn't allow hotplug of bridge devices.  Don't allow
      * hot-unplug of bridge devices unless they were added by hotplug
      * (and so, not described by acpi).
+     *
+     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
+     * will be removed implicitly, when Physical Function is unplugged.
      */
-    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable;
+    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
+           pci_is_vf(dev);
 }
 
 static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slots)
-- 
2.36.1


