Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E7318E60
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:27:45 +0100 (CET)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADse-0005mG-0n
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmt-0003bC-PA; Thu, 11 Feb 2021 10:21:47 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmr-0003jD-Ua; Thu, 11 Feb 2021 10:21:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1786E5C00DC;
 Thu, 11 Feb 2021 10:21:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 11 Feb 2021 10:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BfmdEzUgdDIvb
 g50pRo8Nb4WiAmDuGDTyLLtnjnm9sc=; b=hi/OeyKxUxnP7QtVxRM/U6j/e7uPa
 viV9lVngoTTQrz3mPo88t8Ut3r+LVE80Lg3USCyfgTRqBlIX6u+JFg3SnwbEAiYr
 k+Mfh4n1BvUwRSvxb3dxRCeWtIznKW43TIAFb+wGutffKCLyKXc/836dUJZJAbWv
 98E0k6HrgZwmTQscMD0D8MWaJGj3WAu/VwsNeinvUPULw2OJR4DCdMbLf+1thuLV
 IV7b+WyzQaX2dpowXPaja9MUdMvaYxY99H4pY1XIlYgFEKiGAsvjGoPGMHeHBBlw
 hZ8fzpfCsiGOKFC5VXzgBsXv82XIqgNkEMdd5U5iYEWv2jRndl4tqUoJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BfmdEzUgdDIvbg50pRo8Nb4WiAmDuGDTyLLtnjnm9sc=; b=Zep5RxOh
 VlqMy2SilF4RZiwoCE78chIJdjnf2I7KZ2HwhKBSub+0z4z5r+8vPK57XpONPAwW
 SDkTL3Z4Maq/KNJL5SC3oMaNA76dATtQGu+ghWZ0sOXCsxcbGEkjA0bYA5sIJjHn
 R5LrDrMFIH7LF5dolR3RBJmXZRMHK2f8AHOjw6JhZLwiOGRLJ86ROSDVo/S51HN3
 6adNIoz7SWGtm/CJaLm679r4PcCP3QtOXtypafXAnYu4SSANuP8d4FfCFg7fmOEX
 CQ1BP50h9VGuByhkIpsgqr87PDKgTO6UJUiYUVPbKT/E0qceXk+37jpdKMBGBO5Q
 +ikpuxQoWHu3ng==
X-ME-Sender: <xms:h0slYKHiHvnioKtXvJ4h1hTb3dOUB9axE8RmiqdCTeIsRnJd3uufEw>
 <xme:h0slYLSlpMThi4e7KOp_jzXSoT2iMHLBBSGch3lBCgF6jwEqKGbeXMDvv7H9BieLA
 inTmEkENIcLoR2G7Ao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:h0slYBA7DyLo-TKl9woZaJNJTo7RhQvr2grILFS5j5oJ-oWSTH0Fag>
 <xmx:h0slYL1y90NvM6KlzQ5n723MrqDDV2i3F9LhmE0RifDzOPlQhyuT1A>
 <xmx:h0slYPWxrPwmLqWtAeMQ2_KUNYyGsh26pk1338MhhStvk8O-aPlr6Q>
 <xmx:iUslYCbKnS4sriQIfAK4xQTkHa46sUZWlGlEM_Wbv3M47toigOKvLw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E06324005B;
 Thu, 11 Feb 2021 10:21:42 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 1/3] hw/block/nvme: fix legacy namespace registration
Date: Thu, 11 Feb 2021 16:21:37 +0100
Message-Id: <20210211152139.1004257-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211152139.1004257-1-its@irrelevant.dk>
References: <20210211152139.1004257-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Alexander Graf <agraf@csgraf.de>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Moving namespace registration to the nvme-ns realization function had
the unintended side-effect of breaking legacy namespace registration.
Fix this.

Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
Reported-by: Alexander Graf <agraf@csgraf.de>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7100b3..02390f1f5230 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4507,6 +4507,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         if (nvme_ns_setup(ns, errp)) {
             return;
         }
+
+        if (nvme_register_namespace(n, ns, errp)) {
+            return;
+        }
     }
 }
 
-- 
2.30.0


