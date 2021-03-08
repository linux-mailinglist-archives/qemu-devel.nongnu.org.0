Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0E330ECE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:02:50 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFX7-00006H-VM
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvM-0003Jo-Dx; Mon, 08 Mar 2021 07:23:48 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvJ-00070W-2M; Mon, 08 Mar 2021 07:23:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E3D445C0103;
 Mon,  8 Mar 2021 07:23:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XWZR4rNGSbpWk
 TdETrQJffVntsGaMT3SFwA1Yctnp9E=; b=u/+7pncNeawN7Vy4GE7/29feOUCut
 XfcrdRpyzb3YJrgZgD+Sd8XL202f0yUguNZdK3Ld2YYCv/hqyEFLS91zIrXhH10e
 UiYFt3zGgkiqZptOnVf0v6bXoVjECVqUXgJtf410BFJyLtXSI2sUcZMnLifqWLbE
 4cJ0veZJnkI4qlXD4CVAbiDGS++dA9RsbSaSC3bwKfEEs4rI3yJfa5dCmh5DtpAt
 6FUEfwVASYr/LDAG58lNc2bDZKK8PkbC9N3fvRZNmFsPNPGCSeVxhoWXhuS2lOaK
 ZPFEp2gKjMYYoCNM2s/rWW/6VKzE4gCuOkovfjrs8Pwxnf0jtgWXAaE0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XWZR4rNGSbpWkTdETrQJffVntsGaMT3SFwA1Yctnp9E=; b=R3KZvGmJ
 2fQ1odRkxkniJ1uqgLK4r1MK2EQJfqJ77oLrnLx2wUq1V+rHrQaoT/dJ7pYqwItn
 T1hsH6+K/pUWc6+xdtvIzqoMAOiFknYg54euRjr22dgKkHs4IgV7Z399l/QymZk3
 Zsc2Bn/HAmpX8R2HjQZXULCOLTldr6m4uMTsQQg4AkPC2oNRN+Sevucc+8HEjIIc
 LZzdVByassNS17F1t6FBBEDFYfKHOkRlQeGXf2Qv5bOIB8focLV7Uwn437qE5sym
 DFJ83tzkjrLjZ/H3S+DpprMfbnNOH9bqlc9L+THjwOVtb/l+GqU1rkBADu+60fkv
 njaPfTNWEOAW/Q==
X-ME-Sender: <xms:ThdGYHMqf9AX1FszknurqapGgLXlxpdg2AhmDq_wnOsvz3eB91YJ6Q>
 <xme:ThdGYLkX4b0rrj_M-ZKzUQC5rhsjyCj3fu8QHHoRbOkxrGy9L4DBw47RGXa9yGIOZ
 MYT1n9HDOaX2cbBXag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ThdGYGRHhRLuOE5YESbEfmBcbq97rpD7SM__8AInNVSWtru4ieDwRw>
 <xmx:ThdGYPBFkV0fWgsPdEYCHp7_-JR3HncQZsWrUfugRcSAXLFH4YR0Vg>
 <xmx:ThdGYNTqut27WSOH6U25Qq4Hzk7JfqoLu06Uc8qyPlxNHPCXo5L2Tw>
 <xmx:ThdGYGQmj8HY42mTpTYjdfr805afpFjMNoimGOAvEh3BZg5HotCn5w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99D261080059;
 Mon,  8 Mar 2021 07:23:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 17/38] hw/block/nvme: document 'mdts' nvme device parameter
Date: Mon,  8 Mar 2021 13:22:52 +0100
Message-Id: <20210308122313.286938-18-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
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


