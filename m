Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B633563AC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 08:01:22 +0200 (CEST)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1Fh-0001Vm-7y
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 02:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11i-0002Da-N2; Wed, 07 Apr 2021 01:46:54 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11g-00056C-2O; Wed, 07 Apr 2021 01:46:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8BD015C00E1;
 Wed,  7 Apr 2021 01:46:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vTFPlL7TkOoOy
 4lt5fLjax8HOg2qO6MjMNotMBL4pf4=; b=DWf5trVzC/IOYsY/u84h03ICxLAyL
 4LZMK2HEpIKNu0QMZnuakLSRXP9D83/CQCTAmKIfdRpGY/Xsd4SeXZmqdPiqIJNi
 /YLSDwbH2NPtbxDNsIhaofxTMuqy4hJXCWY47ZgIjq6xpjOiEaOBPVjd3zNmKJ06
 HckYIKdS+azjV/cHl+G2PxqaBvDcy3YnzAoKDkaJbE6h6GOysJ6qg0LZ2EkOFgCZ
 Qot1gp0K8/VJO1dENQtMuYKGJnMiKrE48GK+VyRoMAaPMEFr1R+pLWdxRKMfcTKB
 1ejcO0ZWypstgu2oAcMgYixB0iGzSZb9EJYGqP1TfOmvdZQcfXUQolMUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vTFPlL7TkOoOy4lt5fLjax8HOg2qO6MjMNotMBL4pf4=; b=sZg8Turq
 nHfBXyetKlMonOVhpIM6Oqh0UcmXs8zonfKbQ+Y2G4K3baIqAl040u9J7ULLW4MN
 jb7OL/3Ts84QQ4HYFV2d8ZZfuYSDyk5/ZWlH+bSojmqgXPKkaxSOp/tOSFGVZHtS
 RELayixukd+icaMZFAspy8N1J4hu9JPvf+NHzJHoe55q4iyTKFOY+VWCVB14hgeK
 CXs9lrlSBx4YJhy4a/oXf6elrAYY1fFtIVUKrSQN2gHH1LXLVF3kNCtDp4s/hs8Z
 t7LYW5bYcKti7LejDLBY3lBycrY4Vapza3mCyXB9N9h73ctANS29HEpcifHQdUjN
 SUOmNq+Z8O9m4Q==
X-ME-Sender: <xms:SUdtYFbvtr_6z2CEBA29ebIhIXkbK9k4tzJkXOYcdm5dnb94f4TuQg>
 <xme:SUdtYOaWVa9RNvpZ0e9mvglEfCPinEddRp2SVppd3oF4DM9cw04RszwE7RA2I7bOf
 QTGEIJAoi40sC0fVsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SUdtYBVlgYW83CXDyQjjXRFGG9RJv1VmgSUMg3wsqwMhdSXYQtKS7Q>
 <xmx:SUdtYF3daR-M45rN8AgCI6YDLXy6gVUOYRkk0CXDRBb5f90mZ-8VpA>
 <xmx:SUdtYIa7W_YtajdSmuD4sVWiqkHP_8gRN_sfXQtKN2779as7AiNADA>
 <xmx:SUdtYGkaMsW_Qs7o2CEfaaUjWTIcXGlpM5PoDE5oAIzI9xyT5j6hig>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FFCD1080068;
 Wed,  7 Apr 2021 01:46:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 07/10] hw/block/nvme: add missing copyright headers
Date: Wed,  7 Apr 2021 07:46:32 +0200
Message-Id: <20210407054635.189440-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add missing license/copyright headers to the nvme-dif.{c,h} files.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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


