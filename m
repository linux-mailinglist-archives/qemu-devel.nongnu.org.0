Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD863C3F36
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:34:15 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2g9V-0001Nn-HR
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3L-0003xc-RF; Sun, 11 Jul 2021 16:27:51 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3K-0002ua-Bz; Sun, 11 Jul 2021 16:27:51 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 968C03200201;
 Sun, 11 Jul 2021 16:27:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 11 Jul 2021 16:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=h8t2938WpU3UU
 zpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=YSeY9IF6EyhZH00IRO9anm/7qTcoq
 51Qw/Cl12xmH8RtRkQSuxvp38SIQ/CAkHVUfUFIqcD1Q2bcpIAuzlZ2N3DhMr/dR
 zmZWs98nEHUWpZ3h1QbCprK1A8MSTBR3IAgNw56rl90rNYi9GOxcV78sNkCeaiuI
 Cj6w9i3pcLLRlBVRPHMAf7ZmAWhESfwI5vJya1hd180cPrdrXmAk93ZFhxRH+xQH
 nsSGcIJbnhr9zqC9GTZEijD23m2s9cPwPvfictm6/sUMgX6Y6+1cfa5MwbI4vOY8
 KnW2/HvONmAz0bje9ze+1pgoZNKaIbnSGlcAO/5qiFtiVxYcCLFwrvz5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=h8t2938WpU3UUzpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=ARx/OKsq
 NOwZJ9ZsXS2JbWDzjtTumD8g4t8goIWTKY0ieuix/5AkpoFVMUFUJ3q1ZDYshntj
 4ILg6Z73K55Hw6QYDjm4GXOmh6NRwst29hkYXnoE5u0+/83cndKwc10lOQ3DqY51
 kI5QwN6HMZdjg+CT+/qpPUQC8iGQ4WmqSXAARCBBuqzPYxXXB9ZWWH01hVoSSang
 2vdiv5G4e9Ma03EQlbdM43VmDaLgUCKaoWxp+PGw//sNqLOGetvzJsqjTz4aX62n
 V583bF8S/T1XJ11GtdXbd65anpWZfvrlZ9YNDdc5w072Su0PKyWyQR2g3n3YQH/V
 cVemGbaVBzwHTA==
X-ME-Sender: <xms:RFTrYFXM7nINjjk5Np2l1TVjIW8xYAMn8OpHXD8RJ5wDfmFfKMWQxg>
 <xme:RFTrYFl6k9fqWyF5V8E3YFjDhHl6tx305vPWBUsyB8Oqyz1Lsrg7muXzz7qTJPtM_
 kY1LtYL_W3TmfSMDXg>
X-ME-Received: <xmr:RFTrYBZmIznwp7pjSYGTmC4mmlFDzPStRnA3Y6QM1vUk5MX41fui8fni9wUlz4HaM4UkV8fEWHwZbAfamAs4KNgA-pjutjzNwp2qF6YsVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RFTrYIWn9ZaQamHPJeYBlqt0vveW0zRfdVrqggT_67B9KFZsYhX4Bg>
 <xmx:RFTrYPmV-ftGUNpN_NdSP5O0A6bi3uhM8rAwl4qDfZzfPF0NibQG1A>
 <xmx:RFTrYFctdTaL3RDsPwBHhyqg4OaOXQgwMOeeeisN3eCxu4PizUa5-g>
 <xmx:RFTrYKuR0DMJ-PBpB_qD21TlWzv8Jkwji66U53r7UxdkDrV_WX_w-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:46 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] hw/nvme: mark nvme-subsys non-hotpluggable
Date: Sun, 11 Jul 2021 22:27:32 +0200
Message-Id: <20210711202736.591334-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

We currently lack the infrastructure to handle subsystem hotplugging, so
disable it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/subsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 192223d17ca1..dc7a96862f37 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -61,6 +61,7 @@ static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 
     dc->realize = nvme_subsys_realize;
     dc->desc = "Virtual NVMe subsystem";
+    dc->hotpluggable = false;
 
     device_class_set_props(dc, nvme_subsystem_props);
 }
-- 
2.32.0


