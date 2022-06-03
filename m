Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3453D291
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:58:29 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDRE-0001Le-JT
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNS-0006K6-PK; Fri, 03 Jun 2022 15:54:35 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNQ-0008B6-2S; Fri, 03 Jun 2022 15:54:34 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 34528320095E;
 Fri,  3 Jun 2022 15:54:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 15:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286068; x=
 1654372468; bh=nG2SVVbNuLoH8KS/Dk9AeoHCWBYlTxx/9iwCVlaBHSg=; b=Y
 67ciQhELbAxq0Rf0WOigF8Uxqqh8jT4tXuNVsPxqH8myhZwreG0vma0P30o25WNT
 greXnhvru4hLwpoSXgmk75ExaLDLhDKv8p1oDN9Nd/Kwqk9qBv9jlBi4TLKdY4kO
 YKUx/hNsdx4HMkcCpVP0/mG5zI7qcme9wNG9z8tkEgBPV5jdaiC4AriW9uOPDCiw
 mccHOjQXDiovYFHTIAnj8EH9XaFA2Pl8FaRZ0WvtPNFgmneqPcqDaz6buy+1aP37
 /b5lbZY+KdyiCiST4alNyjfVZ4MRfb+N8Uo+BAa9SWtNEZ0twBUjDxgLUmLgkL4k
 fEw+VkTLGOye8xsLfJ5Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286068; x=1654372468; bh=nG2SVVbNuLoH8
 KS/Dk9AeoHCWBYlTxx/9iwCVlaBHSg=; b=MQnZzwF33j/Lu7mchNd9lftWhgogC
 c2jxdzctG59mP6K2mqKu9w1Wu2tetB3NG1FqvHu4rImtfNBpMvaORL4ghRC+1HWt
 ITuKPDOEOy5vtXA2vnXg3Mq6l2D5NhqSrAhGXE//npqSPfqB8VtLbYeTLzoTkjJd
 3vzPHiVlEXRucHcf65eC3fN4+qtkWBF1a+obZOH0dRj+EwHoIV2AZb8YhidkoB5X
 l7fgVVikbJ2Rmg0Xah4WuwzGL8iJDAMY11MUeLPxZSxPM5oUG9RuewSZ3qKgybTr
 eYcQAz0WHNmXp2GzIkNX3akw6gSUJNdLiAW4HULCdZxtRCbIePnslcpfQ==
X-ME-Sender: <xms:9GaaYkLExaCnNevbBTGcR7w93Rho5674qDl0hv_OZK6zxoG7J-szLA>
 <xme:9GaaYkL4VZMlqXvktM_j2r0bsTRP4V2QrvUBO1IDKj8K9o0zbYS3sCHIPPSThLDF4
 QoRe-6viKkihDsmD7Q>
X-ME-Received: <xmr:9GaaYktY3gh_JLOf3HXg1bAclGf9Ko1Fm9k3IuzdtcRKR3nnAF2dTdltFysMe9V3xVWv-zD8qxjMpWGXDMw6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9GaaYhZmBj7BdErDce4V16ASqzTiFvsPG0nXWgRfrxpUgUnMedaK_w>
 <xmx:9GaaYrb__JRza1_jl4n72rEwC9EPkG1fkB6ofocsYidfiODOp12syQ>
 <xmx:9GaaYtAAJc51TQ8ErAhHwNuGyNXw_cPOiVcFzQbGLfv665PN2S7xFA>
 <xmx:9GaaYhxDEv2pwUbo6ahqTwbG6O1Y3vDpM-Fhmzh5NZLx168pdpXopg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:26 -0400 (EDT)
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
 Klaus Jensen <k.jensen@samsung.com>, Christoph Hellwig <hch@lst.de>
Subject: [PULL 06/11] hw/nvme: do not auto-generate eui64
Date: Fri,  3 Jun 2022 21:53:49 +0200
Message-Id: <20220603195354.705516-7-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

We cannot provide auto-generated unique or persistent namespace
identifiers (EUI64, NGUID, UUID) easily. Since 6.1, namespaces have been
assigned a generated EUI64 of the form "52:54:00:<namespace counter>".
This is will be unique within a QEMU instance, but not globally.

Revert that this is assigned automatically and immediately deprecate the
compatibility parameter. Users can opt-in to this with the
`eui64-default=on` device parameter or set it explicitly with
`eui64=UINT64`.

Cc: libvir-list@redhat.com
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/about/deprecated.rst | 7 +++++++
 hw/core/machine.c         | 1 +
 hw/nvme/ns.c              | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e19bcba24240..47a8628b5601 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -296,6 +296,13 @@ contains native support for this feature and thus use of the option
 ROM approach is obsolete. The native SeaBIOS support can be activated
 by using ``-machine graphics=off``.
 
+``-device nvme-ns,eui64-default=on|off`` (since 7.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In QEMU versions 6.1, 6.2 and 7.0, the ``nvme-ns`` generates an EUI-64
+identifer that is not globally unique. If an EUI-64 identifer is required, the
+user must set it explicitly using the ``nvme-ns`` device parameter ``eui64``.
+
 
 Block device options
 ''''''''''''''''''''
diff --git a/hw/core/machine.c b/hw/core/machine.c
index bb0dc8f6a93d..c53548d0b138 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,7 @@
 
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
+    { "nvme-ns", "eui64-default", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index af6504fad2d8..06a04131f192 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -641,7 +641,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zrwas", NvmeNamespace, params.zrwas, 0),
     DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
-                     true),
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.36.1


