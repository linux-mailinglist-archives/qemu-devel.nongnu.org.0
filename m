Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE534396E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 07:27:00 +0100 (CET)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOE1j-0005hy-7I
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 02:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODv3-00044l-Tc; Mon, 22 Mar 2021 02:20:05 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODuz-0007Fh-Nn; Mon, 22 Mar 2021 02:20:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BFB3A11F4;
 Mon, 22 Mar 2021 02:19:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 02:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zvmOUxX3kek4y
 VoWEZEgSTTkeyiNBoyFAWFOrokm8r8=; b=D/piJdB3oxlQcZXKQtMy2rqS9knC8
 eU0btpNyxxYKwR6uDzgnRbDh8gnyzfXvoC5QU32aRu1M9JykWWwHCDE4FNHjnQBg
 BmK3jloXaX1ptGEz1PusF9/uk//EdF2N9VHti4+yOjKqehBWL+NDf/F9zNDQzp+4
 cUaNAJXGRAMIW8+RjJmxs1APSmw+v08yQoNf9dl8+VITPCqzZf3RGws0JAmeeZY0
 8HlpTXvdmopsfmVrMlePrbwZUOV6GoRLZyHoJpd6MOQr053CxyQjRxp0tloiPIsi
 MQd5zu9NwFgqPd98yDYEnENNeqr33TFjqNt57Dyj+oZoaDygosKaFvgVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zvmOUxX3kek4yVoWEZEgSTTkeyiNBoyFAWFOrokm8r8=; b=e3IHEmgh
 fyR1wsovT3oc5yG+Gjzcjkn9BchBhPt5fixV2ZlK/XMYDEBD9mHTg0aWESWEqeLe
 bMTmOAarcNWdFyOi4vU90Uca7JkNXW8Glh9wPTx+5WfKXR/mvmzFIDfJG32XIKTO
 vbWJmoZLc33dBm22I0awq1NXZ+uiLSa+0eq7o+j6mT5ALUhDGTcSUxzuU40oy8cd
 a8Ny5qSJCF9b668uhH0KzZxErNr3l2K0WplX7Z2EXkm/gevmAF4gbIXbnLpeg5WD
 D11XdFKbTZz6s09Gh4r4Igmvo1LD6xW83Ifd69xOo7XHRWDSUAQoyy6tAnJA5VqS
 HKSseyNNGN/GdA==
X-ME-Sender: <xms:DDdYYOkBWBmpRlQmgtTjQ8AgS7BNyhvu9JssaRe_eiwColv2BQs2tQ>
 <xme:DDdYYF1C8vRXP2Zyp4jojagCGNZVBk-yFR2eTCjNDeteHKEXNcNIimXUnJcU8zxDq
 jPWeeGW9J3gIt5JHXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DDdYYMon4r11GuRw1QivxuK1JR_dcYOKQbL0IB4BLYbokboLXCRHEQ>
 <xmx:DDdYYCnZJSgu7Kprh5oMLN17lT5R50wTIgEBGKrT0SjJAiDtCAhvAw>
 <xmx:DDdYYM0QSBUatqp9LP5xLA72G3R2Z75Mb0-gQuJo8gQOVPOD-ZpTlg>
 <xmx:DDdYYPQs0NQRBNCeNF09XJT3NrV2VnP14o-MUq2tuFbzzhgebvoCOg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AEA724041D;
 Mon, 22 Mar 2021 02:19:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: fix resource leak in nvme_dif_rw
Date: Mon, 22 Mar 2021 07:19:50 +0100
Message-Id: <20210322061951.186748-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322061951.186748-1-its@irrelevant.dk>
References: <20210322061951.186748-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If nvme_map_dptr() fails, nvme_dif_rw() will leak the bounce context.
Fix this by using the same error handling as everywhere else in the
function.

Reported-by: Coverity (CID 1451080)
Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-dif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 2038d724bda5..e6f04faafb5f 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -432,7 +432,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_map_dptr(n, &req->sg, mapped_len, &req->cmd);
     if (status) {
-        return status;
+        goto err;
     }
 
     ctx->data.bounce = g_malloc(len);
-- 
2.31.0


