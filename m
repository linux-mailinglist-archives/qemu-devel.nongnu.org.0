Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07F330EAA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:51:33 +0100 (CET)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFMB-0001Do-UC
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvG-0003DR-To; Mon, 08 Mar 2021 07:23:42 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvF-0006z0-7X; Mon, 08 Mar 2021 07:23:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B6F1EFDB;
 Mon,  8 Mar 2021 07:23:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TRGXLOPxxQQY3
 4P3n6pzBZTGxN6GdYsKeZcEPuXEdlg=; b=ZSQgVJzTY4+NXPIsizQJAyUGRQQxc
 O0xBi7TkmANLfUDXpj+X7wHoOodnZC9YN6cN2ofNNmmLly+Z9vfnMiyR7Tx5O4cQ
 50NPowCH8LXM8NuKVMWoxvk/i1G+TcFSYVre91KE5H36NP9PNgSYFsye4DaaKqMk
 PYo45DhGWmENK+ouYbF2WiPNlj49MmnmXOl1PUCPEbP3/bT8SwnG6OFLImEb0qbC
 rVncw6LlY7nbeLct9QpkWQcZ4AEy075mGZ9gRT5XsksbDRsswsX+oUybF0LNtcmO
 BTmAmMDkSLlsbM5L59tZzaLs3Yt80cyjTEYT+IxLZuYzu2voMPap2OrNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TRGXLOPxxQQY34P3n6pzBZTGxN6GdYsKeZcEPuXEdlg=; b=BzkRNox7
 lxgV4Di6/B2vqEsSGWgD5daoCqgwpZ5/ivGuY0EmjG2H1Aujx6+RG0ez9bXkLGYA
 9SfKXovlmlSYb9d1V1C8QbVhgtqXAxinC4lBqRdz9FWWfatND+AdV2psYPDm/71p
 oLqOJNQwTmVF/vOgi19/pPGWnH/GE+SlKQlLEptIqHVoqBmG7wOLxQF3uxM6u4jZ
 /1i5MxplCM234mMQ09egc3BAvchNtY/3gYceJquAxjO/pVBhvIX0/E7hKM/S4/hK
 j/bGRv2oDfZFDmF3syJXrLLlxmgeAYgTtHKxyBz8HT+BqzgIeAz0S/lQbnm2wNac
 dqlthpy4gSdXyQ==
X-ME-Sender: <xms:ShdGYOSqiNTiA-6AFQp2ntPRh85dtLJoHQ-6poBskC_1-Zhtul1aFw>
 <xme:ShdGYDy339EyW9O6erK4XfDCakFJX7rCi-n0LOxgOHZ4W15kj6ZCVZgymw11uVkOJ
 LqCLWWyQDzwL13yRhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ShdGYL1EkUWK8BAcked_dEZMaeJYfhnEdd53GqU8R7SItaP0BLXgGw>
 <xmx:ShdGYKB-u6u8-zR7RU4LCWGAkGi0xwknq_jaDcdKZsu2pcjcfWV6JA>
 <xmx:ShdGYHhuXEqJ_S2OUcvXPGe0wy3J2BxlpLI0z9ADXRh7ZLMDqqXQCA>
 <xmx:ShdGYGOHLY-lQcXxjydBU5wAzXglmBFv7chdmK8doLc3jQZnWqwF65zfrfs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 919111080066;
 Mon,  8 Mar 2021 07:23:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 14/38] hw/block/nvme: improve invalid zasl value reporting
Date: Mon,  8 Mar 2021 13:22:49 +0100
Message-Id: <20210308122313.286938-15-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Corne <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
improve the user experience by adding an early parameter check in
nvme_check_constraints.

When ZASL is still too small due to the host configuring the device for
an even larger page size, convert the trace point in nvme_start_ctrl to
an NVME_GUEST_ERR such that this is logged by QEMU instead of only
traced.

Reported-by: Corne <info@dantalion.nl>
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5cdf17db512c..ae7ccf643673 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3988,8 +3988,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         n->zasl = n->params.mdts;
     } else {
         if (n->params.zasl_bs < n->page_size) {
-            trace_pci_nvme_err_startfail_zasl_too_small(n->params.zasl_bs,
-                                                        n->page_size);
+            NVME_GUEST_ERR(pci_nvme_err_startfail_zasl_too_small,
+                           "Zone Append Size Limit (ZASL) of %d bytes is too "
+                           "small; must be at least %d bytes",
+                           n->params.zasl_bs, n->page_size);
             return -1;
         }
         n->zasl = 31 - clz32(n->params.zasl_bs / n->page_size);
@@ -4508,6 +4510,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "zone append size limit has to be a power of 2");
             return;
         }
+
+        if (n->params.zasl_bs < 4096) {
+            error_setg(errp, "zone append size limit must be at least "
+                       "4096 bytes");
+            return;
+        }
     }
 }
 
-- 
2.30.1


