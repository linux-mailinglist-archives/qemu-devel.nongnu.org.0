Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E2506C49
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:24:20 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmu3-0006r5-Rr
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmhB-0006gj-FT; Tue, 19 Apr 2022 08:11:01 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh8-0003li-QR; Tue, 19 Apr 2022 08:11:01 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1643232003C0;
 Tue, 19 Apr 2022 08:10:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650370255; x=
 1650456655; bh=FOaMJuv3F8/hy+3iREwbz/wapBJ6ORziEewjsiYJ3fc=; b=P
 r+awG38Thy8zRmHsGHmEgh3/GpdkOH1yxD96G1yHA4E2LGoyVHOud3mRQCoHcvJd
 GMlhcNp4Q4h6Ap1o6kWtkt/Tode/UusQrR3h/9XgMWjT6WA+Fe3xK9XJbQKkCtvt
 MH2tGNh0Xxd0QM4AhQQm8uVE+htTwwKsRSGYd0JYF0FDUFDqddO2azCRxi33mryy
 OMe40A9ouwtsy2qmYadQwlPmkjPszR3i7T7UzFcBd3cs9V5oshKH6uCBds5yixJl
 NeQL/Z2jHcRusr9+SS3sCahr0RWCfDOOZMbxWVGn2RbNy++FbUk6koIZehf2B9W6
 vK3sA1KbApkgZujnVGpxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370255; x=1650456655; bh=FOaMJuv3F8/hy+3iREwbz/wapBJ6ORziEew
 jsiYJ3fc=; b=JQGHAHcR8/IVKk+hUKExja3Cfkh9WyXVELkJfwXccD2QMDt264D
 VPdjcyu7uERQVLMRo/VdCmzZei2dgjX/nkxD6D746vgW0qwR0zveMeC7bzbTx1EZ
 wDJ2NxWb/85/kZfXu+9Ns7Y0Yw9xuFDTjvkldeYjTgzfS9Qr8BbWu3Xa14uVu9Mw
 5EHJq/veaLMfBXY3tlkDs5rPr0EtwihakafGQRGGZXi9hJwQGiMrtBqwlwaOwDSC
 6qy6z6LrQ7GVOUl/w5dIlHh5uYoQlIPitUr5tu9TsenUUjSNnoLFThSDRMz6Fo5z
 kQiWovWh0pyk4lVlGXWDP2pfSkMnydutfEg==
X-ME-Sender: <xms:z6ZeYtPN_DM2I37O6RpPFgwf--3azMi0_EZGBQrIMoOnS0xT2qPVrg>
 <xme:z6ZeYv9QCUSkYTPMFvKV-hEGcnBR-pgbc41v9UwiXkT8yAPcpiFgBQV2kA1FVLh6I
 RHPLZ6eWBr_ibaUhus>
X-ME-Received: <xmr:z6ZeYsTuMBsnd0LOB4D_qTTspR-cV-5cdZy92kHnS5tJwXf3ProUva1EPwxoZG5X986zwx_jvBzSKqlfhbtfmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:z6ZeYpst7ePMbFDcp6fn_qQN1Q-L6OsHfsH0qc2YPXvyZaFj7maa0g>
 <xmx:z6ZeYldxHdRlYbKM6XLQ_cwLsryVXM1ID4yAxaUgGtWB9mbXxIMWgQ>
 <xmx:z6ZeYl0IeDNcuRCOyj10pXMWaov0vcKh_KLCTnh0PxF6tC5AmczD0Q>
 <xmx:z6ZeYuEb8zBZr8nQxStx_XUNoqylknVVwQu3YgTNfmbvqY_ubKvXTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/nvme: do not auto-generate uuid
Date: Tue, 19 Apr 2022 14:10:38 +0200
Message-Id: <20220419121039.1259477-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419121039.1259477-1-its@irrelevant.dk>
References: <20220419121039.1259477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Do not default to generate an UUID for namespaces if it is not
explicitly specified.

This is a technically a breaking change in behavior. However, since the
UUID changes on every VM launch, it is not spec compliant and is of
little use since the UUID cannot be used reliably anyway and the
behavior prior to this patch must be considered buggy.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 5685221f47c6..960c5124b811 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -617,7 +617,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, true),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
-    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UUID_NODEFAULT("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
-- 
2.35.1


