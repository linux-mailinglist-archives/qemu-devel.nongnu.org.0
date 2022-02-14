Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F24B43FF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:22:22 +0100 (CET)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWcj-0008H7-EB
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPD-00036y-7H; Mon, 14 Feb 2022 03:08:19 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPA-0007WS-Lq; Mon, 14 Feb 2022 03:08:18 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id AEB4F2B001D9;
 Mon, 14 Feb 2022 03:08:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Feb 2022 03:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=F/eErYpa2I1tv2
 iZA0vK2tT6B6vhC5CCDwx5Ep9eCmU=; b=bVO09q79/55G90T8LWCit3B3x6ljv7
 g8ovQo4r9ZT208NSQMA7fwzSlO97bWobR1a6585mcSj0/8aTOQgoyDclJxZuj95q
 pJn4tUvSSur9nM0I0xzIlVjwZUYGlTP6Of5tS/4X94mbG6JawCBKWMUcjyGkkhVn
 w8FuzGGVMCQvTeOu92fVJLpW7k5aWEptRxwkqWVrS/Thgxf2hObclqIns+IEW5CB
 Xj8wvGbDTFJWmaCWqZ11WPQSW+6qi91HNiM3eZVW/fTPU1BvwKSEH1NxKwqrC77s
 61BVj08yCCe5GbH9h8PgQzACxh6SjPIPxT5pE/Cp2QXTLx0cQNb6eKig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=F/eErYpa2I1tv2iZA0vK2tT6B6vhC5CCDwx5Ep9eC
 mU=; b=cZvoSyIbUBEWdjmiotiBjcoIQYOcgK0iIgy9RqvFjso7vSemoZ9rXVx1b
 uh2FoEb5KVJwJhr2z5Ennvj6oetOlsgMvQub6/o4Na4p+gB+8YaQGibWykAdF5kT
 C7BIExMnMeh9lhfwNkdpdxrH9IPTwg0l6rHBufZJLCJ73MRSvFg0QBcdQUw5pGic
 ypg1pLdYuPEKgbr9nX5hlZirIIr7xfIjhqLZMdFbGEZgJO9Yqu+c7gOMowwQZq4y
 Vuq01O4sDxZlhzp6hqX5gGyzYvoAqzj5H2hSQbXhQeSXcVHZatIq22y46pEm2xX0
 LpvOOlFxkpeRlZROCaByogghFV2jw==
X-ME-Sender: <xms:7A0KYnPsCr5ohSObfqziov_LAP9neZKE2kclPunRdpOQaUJsFfugrQ>
 <xme:7A0KYh8bELdtDd31GggWL7Kr3tGvcdbUW-N3f1oZ_OS2eiUn_ZVZSn2V-8gz9GN-B
 A4Y7QcwnIL33RwyLiU>
X-ME-Received: <xmr:7A0KYmS-LUStH_Eko64v5Nnu5Uyj3ie9FUqhd_rrwUzQmO_6xoWLND7B-RtvNadRPbm4s0Fev75EQvQXf3UCJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7A0KYrtUm6HOqxqrEmhy4FZxmsLLCGhBXszErmGUnIVqdPiok1o0mw>
 <xmx:7A0KYvfZ6t8NVgKZfxnsPYxxF-PYrSbpeCrFzfax-yqNI8l5j2yX6w>
 <xmx:7A0KYn1Ubfn20Teg75WVZEPxctYjjxbPWviVpVD23DeWcrdi0rrnkQ>
 <xmx:7A0KYgXYp6QMer8BO0Ul6bWE2juPdZ8tM14AH1XkDWmDU8Ft3acKnPPbbR0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/6] hw/nvme/ctrl: Have nvme_addr_write() take const buffer
Date: Mon, 14 Feb 2022 09:07:57 +0100
Message-Id: <20220214080801.13627-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
References: <20220214080801.13627-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The 'buf' argument is not modified, so better pass it as const type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 37681a975986..12e1fcda7c85 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -395,7 +395,7 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
-static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, const void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
     if (hi < addr) {
-- 
2.35.1


