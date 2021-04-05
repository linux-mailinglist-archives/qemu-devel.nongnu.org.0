Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFA35468A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:08:40 +0200 (CEST)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTeR-0008Hk-Pr
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRb-0001A7-SR; Mon, 05 Apr 2021 13:55:23 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRX-0000Nz-IS; Mon, 05 Apr 2021 13:55:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B5975C00D7;
 Mon,  5 Apr 2021 13:55:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zRmLq8PSHV/9F
 ueHZtyhyK9YVawSKIVfONq1EgqGWTk=; b=Gj/hGB8p84Tj+cr/epUDU3k94b2If
 vuiGbDJlut9LooD0crOsA71L+wj52pPlbTVLhlv1LJU5DEgy0DxAoIGAmmVMuQ9r
 AcYPhbUu57t0eZD0AQgOJQrJBFb+51UvTgIWCbbCZ1c5rXllpWaGtwLZjG2NNfKW
 jn+OygWgC7wNzMmV6vocBiIJZc+Y0X9LRr6es06KzJxe4/i1JCUEX7cK/1TEVtx7
 1HUAxUsSIb5hZEkYa4cxA4W8GmhBXM0qbzDkfw5zslwXm39YCBBtEfg08z2kjATm
 3cZVjwumdbI5JzU7l5JiJ343CSoUtSrhEj2nnGorhUIQnJ95I0BdjkRMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zRmLq8PSHV/9FueHZtyhyK9YVawSKIVfONq1EgqGWTk=; b=j7J9N2ST
 uRk7SB5PRF/2l0ogTtJhjq5a7Lq63VkCTEA0r1TpxuyBhWEaoH5UrAR4cRMIRCP7
 n52dZUfm0MCI8vOJRNAyX90Ocq3m46Q32LUOo53Q09UxEWTbrHb9tpsM5delmUBC
 SB68qSR6OFILKRWfdZni99SamX7HP4w2mF4i3AruE4QAXXZU2aYaky0/5lrbW9Xn
 MCk0bgjo3fplb4yZZgvrokrkW84ydlpU/ILBTDnusU7chfCfYWO7DWKn6zvJFsCI
 IuCD3xeYrD6mw1vnj4k8LLPyWjMOzRws3diAoLHVnx4OW1/J2XaGvyPVE/utba51
 AlydBn5wh4bmkg==
X-ME-Sender: <xms:BE9rYMeHcwAxIau4dhcHwpChaqWtOFAZNiFiIMDO8VzN5R5R9MTr7w>
 <xme:BE9rYOO1lwKf6c3Ko_deyjmBdfezUfTqEMXvKK_07cYrcSYaxKKDdfH3vSx8akD1i
 SR2jX4Tf8bQn9ju3xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BE9rYNi7pua8UUpIpJBVH744xEopoj0x5B_Gmhh2UNuMGKAUvvmIiA>
 <xmx:BE9rYB93xcEQRBNUY82OfSTejJ7-FlnyM-kGgM27FjiCYHCKa-zYPA>
 <xmx:BE9rYItW8dinYx4jjCTrOqjOEFRpp5jKP4rAeN7P5HahHZFF7vkGjA>
 <xmx:BU9rYMhs_tVqF6O5DcolyZuNS6zXNCPHCD3WUevsNldllFwpYcU1CQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE74A240057;
 Mon,  5 Apr 2021 13:55:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 8/8] hw/block/nvme: add missing copyright headers
Date: Mon,  5 Apr 2021 19:54:52 +0200
Message-Id: <20210405175452.37578-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add missing license/copyright headers to the nvme-dif.{c,h} files.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-dif.h | 10 ++++++++++
 hw/block/nvme-dif.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/block/nvme-dif.h b/hw/block/nvme-dif.h
index 5a8e37c8525b..524faffbd7a0 100644
--- a/hw/block/nvme-dif.h
+++ b/hw/block/nvme-dif.h
@@ -1,3 +1,13 @@
+/*
+ * QEMU NVM Express End-to-End Data Protection support
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Klaus Jensen           <k.jensen@samsung.com>
+ *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
+ */
+
 #ifndef HW_NVME_DIF_H
 #define HW_NVME_DIF_H
 
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index e6f04faafb5f..81b0a4cb1382 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -1,3 +1,13 @@
+/*
+ * QEMU NVM Express End-to-End Data Protection support
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Klaus Jensen           <k.jensen@samsung.com>
+ *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
+ */
+
 #include "qemu/osdep.h"
 #include "hw/block/block.h"
 #include "sysemu/dma.h"
-- 
2.31.1


