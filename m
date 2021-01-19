Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235A2FB555
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:27:55 +0100 (CET)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oEs-000834-CH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2d-0001zD-6P; Tue, 19 Jan 2021 05:15:15 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2b-0004GL-2X; Tue, 19 Jan 2021 05:15:14 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2470AF4E;
 Tue, 19 Jan 2021 05:15:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 19 Jan 2021 05:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ahOpw4FmX/eXV
 G9+HP1hL9grmczPrRhOOSOKNtCCRMo=; b=YpYOZDlkTVGdagReMOsYwxQPn+uca
 ADrX1OKEgNbt5NRekMpHTKKgAfIZIHMAggosFG1CEV5liSA5r7lZwbWjzkfnUB5C
 JMDG1bleuoDOGYxkdjuG1kH2jcMyi2ndRvzv6pYdIxEaerDYJnXS3h9lShkGP7lH
 KCxMtxXSaHYVdjf9FKDwP6LW8dbH6BcVhRZ2gR0PNHdRrrSE1/IXPEPblQI6xjTp
 jiRImpYikG6jQoR3WeQhqhkvPJelJze7NGj8t58asDUg7SqkLKO48EoivXJBDm17
 n5HZhBnqjBR5Ozpw3SCnWcdD0v4q+V30ZxfpZV+8gUoOV5po1MbVmp3xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ahOpw4FmX/eXVG9+HP1hL9grmczPrRhOOSOKNtCCRMo=; b=X6Jjl7AT
 YzzN0pAY0SVD/QBtE1f5D3aI4rI4k9J2zJCeGe52G+0OpWVzeCqBiRp9nHCkS0k0
 AHyIVbr3jkL3Za295Sbzp1qa+aSOD1u80Eukj80MTpQ2eCKZuE/3lQf8YbejRmHA
 /kuznlHus8K1zDEGUgFdP8vdEZ/X3b2qtv9oV9OvNOTGHK7HGV6xNvKGlVsxxF4k
 ZI6mr5UBCfiblUUxdNsxEQaWSlWOJyrEoBqbTw8MF1PPjkhjNU/rPXRtGhLJWxFW
 Dzmq8uwutIduIBSFkjZMcJ2mhjjL/J+jqykaNxbfwR5DTYaX3Bgw5DjCqgBEFciT
 yEeg0n3jXn6Pbw==
X-ME-Sender: <xms:LrEGYP2ZTxpAFXXjCKXsD1Ii7bK_hvSOT7Ayj6EFBeFGwnbD7gc4XQ>
 <xme:LrEGYJ-xXgpQVneCOkCqZF4kdaPd845Lk7i-d5_K4c3xqT_1gbp2vxJVINaU53sf_
 J5ZEd3H633ULOWRaZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LrEGYM6VRe4QAAB8yRuyrxDBo_6N3NBQ20fklOzqRNPLtJZcJcgJKA>
 <xmx:LrEGYJtHUXNnKrtjpVx_BgEtKtCRKZFNgDho7HXoTxoNlHVNUf_jYw>
 <xmx:LrEGYG34JVU5H4zPH_0lKqaTnf8mVN0w6Tb4gALE8ce7iCttGlZZJA>
 <xmx:LrEGYJOWaQBvGaGE7NiwIxSkqrlACvyQrz5MEHHR45enBB9dNyxg6Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2733B24005A;
 Tue, 19 Jan 2021 05:15:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] hw/block/nvme: fix 64 bit register hi/lo split writes
Date: Tue, 19 Jan 2021 11:14:54 +0100
Message-Id: <20210119101504.231259-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

64 bit registers like ASQ and ACQ should be writable by both a hi/lo 32
bit write combination as well as a plain 64 bit write. The spec does not
define ordering on the hi/lo split, but the code currently assumes that
the low order bits are written first. Additionally, the code does not
consider that another address might already have been written into the
register, causing the OR'ing to result in a bad address.

Fix this by explicitly overwriting only the low or high order bits for
32 bit writes.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c1211b298603..9a508df8d200 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3790,19 +3790,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
         break;
     case 0x28:  /* ASQ */
-        n->bar.asq = data;
+        n->bar.asq = size == 8 ? data :
+            (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
         trace_pci_nvme_mmio_asqaddr(data);
         break;
     case 0x2c:  /* ASQ hi */
-        n->bar.asq |= data << 32;
+        n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
         break;
     case 0x30:  /* ACQ */
         trace_pci_nvme_mmio_acqaddr(data);
-        n->bar.acq = data;
+        n->bar.acq = size == 8 ? data :
+            (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
         break;
     case 0x34:  /* ACQ hi */
-        n->bar.acq |= data << 32;
+        n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
         break;
     case 0x38:  /* CMBLOC */
-- 
2.30.0


