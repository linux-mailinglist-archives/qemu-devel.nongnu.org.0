Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D72C314A57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:33:26 +0100 (CET)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OSb-0003qh-JS
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVd-0005Nm-2R; Tue, 09 Feb 2021 02:32:29 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVa-0005pD-4j; Tue, 09 Feb 2021 02:32:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 22978C89;
 Tue,  9 Feb 2021 02:32:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Pm0O7Jr9nMEyh
 KQdi5Meq9K6MMK75LOD07coR4ehkVw=; b=jyEey6f8yyqiguIH/5eoAX/gvfuwR
 e0b5PHJM+rc0dJiDCcw1z9RNExRKGP8T4e3q1KNTFzqnGoQM3QaQpGSCbcwwt2rE
 Et+9J77X/IfM9B/x/ZOHRHh9HaO9QEKRNzNLXBfL+mbzHYIct5u4mvfkCq8bNXPj
 nw/rX+aR28y+GxBXmZ+rXtl1EgPTLs1x41OrIb5Knr452K2fsGyukH1PLXP7GmCf
 ZGkg5QLX8ljRZ9xiD8hu/N2qYdFBXyj2QnnmAfqKOs/ZE+t5iCzGnuBY1z1j03Mt
 n5C+slKnq3H6Ce6JAO/E0Tuk2dDmiZ8V7bz4gJOmcp/m3BNJooO19W+Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Pm0O7Jr9nMEyhKQdi5Meq9K6MMK75LOD07coR4ehkVw=; b=luZfC18I
 sNU26hpt/L9qCGPEIOjXxGNfYYAU6jltDZsQfMOzocIGAxpjgfQ739mejQuE6MNm
 TB1ymQiycmttUnfzPeeg2GFSpZb6evJ9xD3ziMBE4ODNBrr+tJE+QMSLtScaAPcS
 UUvG4eXI2UuuGU13dYgpqF1NIDimsTgiwkrUc0XEPZqG/YlQwDwjxS1sQf6U1SIR
 Fd36Y9Lz0tGxqmFtGFtCF8HAyvxLRbAtW8mw340mcdNd+ymsG3GMBT7YFHuqbkr3
 cAAJW/V1LVtWlxYGKzOH3juIG6ZIK2YiueKSvfifdq0EQXZMpDyTS68OM8D3UrFl
 FXbeBHgw6QIDNw==
X-ME-Sender: <xms:hzoiYMds_lczz9gG1Vjm0nAghTA3HH3YpFOl4CIg_VjQFqYRojzmWw>
 <xme:hzoiYOM2eS4vEg-ihooJJ4YbkFEKSKKSqRa8RnEAADj5MKZfzMvApMaDxsYC-H2nA
 wEfPMSaOy5ed25VX4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedufe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hzoiYNiokBtFKYK1BQxTkOwjpO4_VO-3i2kZnwn-LySdrqLjoVn39Q>
 <xmx:hzoiYB9gTfCD1dBM2nKp2rRfu_0S732rFM_5qxbiGPHSxnEeO1NoYA>
 <xmx:hzoiYIuLJZAR-IrP34qbJmdWaKN35TZVk1DDsTpTMF7MC0kKxNzDjA>
 <xmx:hzoiYN8_erBFVN3gyV-ZeSp9FU-aPgRf3jWdOnmlEb2v5Ej61kJlYA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 092E2108005F;
 Tue,  9 Feb 2021 02:32:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 39/56] hw/block/nvme: fix 64 bit register hi/lo split writes
Date: Tue,  9 Feb 2021 08:30:44 +0100
Message-Id: <20210209073101.548811-40-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2407b6578abc..2785127037db 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3819,19 +3819,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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


