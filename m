Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B1332542
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:17:46 +0100 (CET)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbJ3-0002WB-DN
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoB-0000ET-5u; Tue, 09 Mar 2021 06:45:55 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao6-0000UQ-Dp; Tue, 09 Mar 2021 06:45:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 38DBC2711;
 Tue,  9 Mar 2021 06:45:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 09 Mar 2021 06:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aOmn5re5Met7K
 i7b/tNZHVQqzNhkqaxr3jRGvFquYug=; b=YvmJFFf3enb+M4FJvVB9aHyvuxzYQ
 D+iTF2CwOPujRMgpko8y3GIYhcCA+/WAM0MtD1GefstqYiJU5kztaBXD15vxJIam
 TrUvxcsYe13sqQTTBWyp0zuRvTxWUaslAdOocMRzTRhir+3aEpy/s7ShP1lgd2jr
 KLcOBzATTirzVhM3lCVEuj7dzLvtLa3pQEqY5aAvCMwlqcgD8dd1NeIJqqK29vAT
 oIsZFfYUdwBOHfQ1JHqOCmWyb7+MFdR84Cf68cIORhd27L+sLrSFWErMMquIvinr
 MRVer+u9SDTM7z/xAFp1fLdyvx9eEzXUuvywQbdBicsfLEs2oMvMLowEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aOmn5re5Met7Ki7b/tNZHVQqzNhkqaxr3jRGvFquYug=; b=gC4PqG4K
 G5IU3FsEoNFCeTC5vALIVzjhsDst8qroiXgbWlVVQOpViyQ+7O768915GFuICnDx
 aXwnG8z5s6ZRHbMouygpVOFlXfHtuXRFjKwjCMu+4AOyzzAQSKXE1IKmTx0QuWqF
 WXfls2NFTJ9+2HpnT5n4KgNcgiImrOsd5HlXj1Qgc4dcuMrmokuIkjX8qdlRB2MP
 YUkBYr20rx8uFZRLmijPNomruTT8zqYNHlkAWr9PeVO/AcUibTWmWR+vSylJ7mdL
 wKy8h1T6naDP2JC+QULUuYRmiqf8cyhVJ9/HIceei+0KiRlM9kggR6nQMUrzJaY4
 iCyYSUEEA8E68A==
X-ME-Sender: <xms:5l9HYLoCt9YLecFjzKYsciVX1jfy6OpzBe5ZFNlX13wMW-_fN_rwDg>
 <xme:5l9HYDdT94CZenQ6v3vuobPWgspERiTrORmPKNEGoBDeJd2OSdOQxdi_tyQOwO5P9
 TtWaX2qw7GH-URBH3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5l9HYCoOBzQc-TD6BERApM5jKTchPJ7u3-nAdEOMg77anaH-oyZM3w>
 <xmx:5l9HYMERCUdMwB7n2QhakwvOoFvY1GyXWtThmr8FeEEEcCbQztDDVg>
 <xmx:5l9HYKsIp6giERhiYIXkjrqVSQum2HIyEJURjsPalbF2SysVP5zQ-A>
 <xmx:519HYHEIco-IMprKtAP83BSaM95zJTPtj0-BJFX3ff8TwQUQyqibIg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68724240057;
 Tue,  9 Mar 2021 06:45:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 17/38] hw/block/nvme: document 'mdts' nvme device parameter
Date: Tue,  9 Mar 2021 12:44:51 +0100
Message-Id: <20210309114512.536489-18-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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

Document the 'mdts' nvme device parameter.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index db1a3aabd8e8..6921b1957d28 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -72,6 +72,12 @@
  *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `mdts`
+ *   Indicates the maximum data transfer size for a command that transfers data
+ *   between host-accessible memory and the controller. The value is specified
+ *   as a power of two (2^n) and is in units of the minimum memory page size
+ *   (CAP.MPSMIN). The default value is 7 (i.e. 512 KiB).
+ *
  * - `zoned.append_size_limit`
  *   The maximum I/O size in bytes that is allowed in Zone Append command.
  *   The default is 128KiB. Since internally this this value is maintained as
-- 
2.30.1


