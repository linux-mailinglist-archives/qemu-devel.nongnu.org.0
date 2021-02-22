Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422EA3220DC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:36:01 +0100 (CET)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHw0-0008Dg-6U
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHpj-00068b-CO; Mon, 22 Feb 2021 15:29:31 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHph-0007IF-DP; Mon, 22 Feb 2021 15:29:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C49485C0167;
 Mon, 22 Feb 2021 15:29:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 15:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=OwQKyqvrIAw6Q
 QNJz1/HxcS1f9tb+afhuYbkHeFh3AU=; b=h+NYjRWH9tGnH7DqRv5xnZkkvmQuw
 mJatuAWXU0vcBrIiIggJlfDPOsjc5txYkNu15p0m60rVt4JAT7xaVju5IpvumyWT
 kaT+iv4ZHisI9VNJEqY+3dwGsCxdvpJGG04D+OMmNMCX8rzRWkAp8cGjx6vBFWLt
 n9pD0p5P16ZNxrH1SrcWE5Xw683EHpzEakiwXZyng6CV/f2VDgC/lGnj0aehkF0w
 UrzRuXsOhFCPvte4cBpw4aG3gGW18FZ6Q/4MxdQmoZ8v6w77q74/35fs6ZPCmZkt
 n2TVsuQ8g18O/Bvu/fsgFLFRhuCHkHIr/hq3Jrf9wwk7Q6nzqWd/G7RRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OwQKyqvrIAw6QQNJz1/HxcS1f9tb+afhuYbkHeFh3AU=; b=I3X7hnpl
 gbY+/Q6xmPPEXhB749xOg9qC2vxOpVpBQnRCXn/m0mIg7T46Nf394s1aQPvaNzw5
 hPlIps1aFINavgGSiN/xyPNwoZUUKqbngUU7u8PSwn2YxTrGsWA/uDga5YkXUDq5
 QjERLfdrQV460SyGP5dwxwt8YivjLTprCLVCgDoa9is3+2lhGqnJDNJ/NnNs64NZ
 UrcVO+vU1Bf+3oJfQ1XZAulgo9v3qGhOgwCc3DNKSryKkQi89JZMHQ/ugxovHaBV
 bY4Tu69g6CZ9ZmFcddvugB1LC2SHqlru/6VHBWykuf6hleukAD53UZwE5NMnD9Bl
 5ikmJIKW4jV9hg==
X-ME-Sender: <xms:JxQ0YEtHwuvVw5ndIrc5tfuZJSeBk3PlhibSnlcZgBbs6wuKwldIhQ>
 <xme:JxQ0YBfZ3_gJUrkQU8o3sSIcqibjsby08Zi2Yd2aSORf3M12Ma5Cm_nMU9dAweZYi
 UoNFX64VAPxdD8j75g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JxQ0YPxw7h4sDA91B0LXSfsJ-qlABy4smJeSAIDlTGaPrgtLb-Sglw>
 <xmx:JxQ0YHPvO1r6oYbG4HyKCdNDiOIZCT6ZA610eu8P8i4oAkns9Ks9ww>
 <xmx:JxQ0YE8K7vjIGmchy2kTsLK0mbfB4CGMp6g86Gv_et_xG0YdrwsvTQ>
 <xmx:JxQ0YIbPklbcQj9GfbrKE-HrETSy_mqJ8oDl00vcR6xbGLeC6HMR2Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A332240066;
 Mon, 22 Feb 2021 15:29:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: document 'mdts' nvme device parameter
Date: Mon, 22 Feb 2021 21:29:19 +0100
Message-Id: <20210222202921.92774-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222202921.92774-1-its@irrelevant.dk>
References: <20210222202921.92774-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Document the 'mdts' nvme device parameter.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1cd82fa3c9fe..6a27b28f2c2d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -63,6 +63,12 @@
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


