Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80BA3B787E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:18:44 +0200 (CEST)
Received: from localhost ([::1]:35162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJFr-000569-NA
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInT-0002Ci-PN; Tue, 29 Jun 2021 14:49:23 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInS-0005mV-2c; Tue, 29 Jun 2021 14:49:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 4B3C42B00ACB;
 Tue, 29 Jun 2021 14:48:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 14:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2baY48VAt0HHh
 XU5nMQVFJfHq2LeuAXCGSA7ABXEUNo=; b=f98IpR6IN6I02BTOB/jH9NmJeTtlj
 Ky2FK2C9up1eUOfdYawV5RrfXA1kHGRZQOWfFVZ3BrNUK2oAdxhqSsvaeDorAn0i
 Mc4IPUDl3VgPH+ebBNLpOxwQ1uJfTW/2QAaM5zs30qyH+OJ0/ctsn1CkTuXgbCG9
 /Rbn8f4IisOapvDvE0AvtFFzclXrfH3giW3NwpS/Dzk4eR0Dh9+S/RrkL32rhvj6
 Fe8YOe+i+zYE1ycapqazkdJojCmjpRs5iICl6vJ2m1RAewJzAFX+crpuiqrMO3zL
 aWn0x8HOtXFEkxxnrElFy1ORL9cwidjVgPGQsl7NA+pkvEytwbYXtOFMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2baY48VAt0HHhXU5nMQVFJfHq2LeuAXCGSA7ABXEUNo=; b=ONfbn/+i
 eIW2w/WIDOtVGmMpP3w5+zwCsLGrFyRh7fChOwAV/VcTZXzolNvQwVRkGeJNAblM
 qtGyFMi3PZYzkrryA3YiH9FuDXon1AuSAlzbG1xWqByT4ZSMDyasGDYhU6XarZH4
 huhj75dUJDeN4CE+1GwG9FtRawc9+tsiYObxg4QVtyRX0jeOYl++v0TW5ogBEpIT
 Cjtz1X52wSiLLFwtEbxog4ALQ694Lb0BSBkJ/T9XYfBb0bZ6uKPrWEv7v7XRvc4C
 pSeHn4Mx8TcfrLSvU3iOzMUpMSnlAtXUKD50jWXyC/C2ouLBneKjYts/P/iiJoha
 uVZ+T3kEYX/HVA==
X-ME-Sender: <xms:GmvbYAp1k9e9RxtIbRadVBncy2RTzL2dCK01QCfX87A9pv1zZ4n9Qg>
 <xme:GmvbYGrtHR6M_i7PKhI6JnYu-y0oPWlwjAURVz5fCEH2juLTDyeJe4a36SWg6gwS2
 nden9pqhsL1duD2wLk>
X-ME-Received: <xmr:GmvbYFOqI3fayTU9Fz1kh4g-Fwcrs4ONd89FYNlQL3rugophearNKHQ6ISPPZAlhGg4o7n6FfV09cw80JUxsRi_HdDwf3ZKA69Zz_7uG_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GmvbYH6DnQiCck7XMZnpejkeZQf2hsDNHx1X0so_Ovyqqbvq2l8uIQ>
 <xmx:GmvbYP70n-cMc3ABkf65EJnM1fSSc-11ZLH4YcbdoHqcz_HYK5ArhQ>
 <xmx:GmvbYHggRvQ6cHG1IG56_f9198vNoachWcirfhYyi21mhUcxj4yvcA>
 <xmx:GmvbYDhBBYdrs9LoRyQJs4dyMaPyR8KpwxV0_r6v7QiUHsEGvzDRXCDLrnk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/23] hw/nvme: documentation fix
Date: Tue, 29 Jun 2021 20:47:40 +0200
Message-Id: <20210629184743.230173-21-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

In the documentation of the '-detached' param "be" and "not" has been
used side by side, fix that.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 541c0819d5b0..dd2b4fa127cc 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -120,7 +120,7 @@
  *   This parameter is only valid together with the `subsys` parameter. If left
  *   at the default value (`false/off`), the namespace will be attached to all
  *   controllers in the NVMe subsystem at boot-up. If set to `true/on`, the
- *   namespace will be be available in the subsystem not not attached to any
+ *   namespace will be available in the subsystem but not attached to any
  *   controllers.
  *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
-- 
2.32.0


