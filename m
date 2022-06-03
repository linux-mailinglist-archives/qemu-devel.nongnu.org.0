Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611C53D2A2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:09:59 +0200 (CEST)
Received: from localhost ([::1]:60204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDcM-0008Ti-JS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNj-0006zG-Cf; Fri, 03 Jun 2022 15:54:51 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNe-0008CV-LO; Fri, 03 Jun 2022 15:54:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D4C803200972;
 Fri,  3 Jun 2022 15:54:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 15:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286083; x=
 1654372483; bh=bTDlsCpksBW533JoUBpw5+Erirf7Qt/s3d7AZz+W1ZE=; b=o
 xM/ha0dDfP6w3BzcD0p9Zv0eIVvO7tIkgd/MDf/A5MwHPx0U4oZ43m3j2uA99edV
 rL5JNs9ym+l31+LBLkJOpx92RQMbhkf2E5URfT+CB1hOuj3x9OdTVWU+8xF+s/pA
 BitSGOopr/7c0T/4zkDJyLlYDHy4nxnGX0muP6FSmcCgdmJhKGHJ1d/bkqaSrbtq
 Cy4mHVYoUc6E/rxad2eAzTLPChbJhaI++K7hkevnu7n1Z2fCOGdFsiraFZRwTK+D
 X1Tkpq5tthENU1SXYj+kwv4sf33P6Tmag4B6ynTu5GcW5S/msSkiMfeesOIhBMZO
 yhqei4k1cjixDjSlWTZZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286083; x=1654372483; bh=bTDlsCpksBW53
 3JoUBpw5+Erirf7Qt/s3d7AZz+W1ZE=; b=O1WPSKejreWhE+4m220CXgQoE2Pbc
 udOBQqLjA+UYTldZTO77IvTsx2Ki68o5kNn/AzAdzDW9ieWplxVVERyB2LUYnh1L
 C/hlpAyD0oh3OH2jVFr49Qjk4ffDfisge0UbQvaHvE+xn9cB/S3ImjzqvVt/zjaI
 nvQtV69kx06+3c+tX5Y6DVJnOLy14y5s4SRQ11XPCDEhwiiM3hQWOJpDSSHpr9qb
 LzT96q00eqbwtsHvSzJbs/75Cs3c0IaCvsmLs69qH/7QdssmFJbqcZ4SJZoCYZxC
 7KIVGAnE6xVlS+H3HcxOtOVheOHulz0bRULuMwbFXsKtVVv/LOpnmLScw==
X-ME-Sender: <xms:AmeaYjN86MZC5KYT_q4hr7XMAok5oYjDkRIcQo9ye9fRaCLu6p8g0Q>
 <xme:AmeaYt_PjJEUCMcUZfOyMIJigXkvz2KKDE5QCjDknbvG-QlRAFp3cMBmY7_U6xQfN
 OMayYDRxkIk9tQVrxI>
X-ME-Received: <xmr:AmeaYiQ0q3Y4SZef44Tpy4cGGof82mhelR7nOUJeIkVh1XpwlCghyvkminCYuLYTQLILpHFemXXz7_RY9RAL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AmeaYnv30OWjGmKpvrIkHe6Ra8V45a8ZCXbv8f2BIWw7utZjoNImWQ>
 <xmx:AmeaYrel-aMJuJXqXSoxQmN-HXCpzUiouzl3ZzWGdl0IEN3n32-MnQ>
 <xmx:AmeaYj2VyBMIstdMa1jGjt9OXPENY2cq53QiqesjfTG-rwhbJb4hSA>
 <xmx:A2eaYm-0LaAoWMK2b7VaQ7QttfxDNrH7GpE4G9VwxfbULw7mHfB14w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 09/11] hw/nvme: bump firmware revision
Date: Fri,  3 Jun 2022 21:53:52 +0200
Message-Id: <20220603195354.705516-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

The Linux kernel quirks the QEMU NVMe controller pretty heavily because
of the namespace identifier mess. Since this is now fixed, bump the
firmware revision number to allow the quirk to be disabled for this
revision.

As of now, bump the firmware revision number to be equal to the QEMU
release version number.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 909e357a7eb9..1e6e0fcad918 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6713,7 +6713,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
-    strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
+    strpadcpy((char *)id->fr, sizeof(id->fr), QEMU_VERSION, ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
 
     id->cntlid = cpu_to_le16(n->cntlid);
-- 
2.36.1


