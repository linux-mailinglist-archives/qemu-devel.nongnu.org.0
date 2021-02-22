Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39399321F83
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:01:21 +0100 (CET)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGSN-0004Rl-S2
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFr-0004wE-CI; Mon, 22 Feb 2021 13:48:23 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFh-0003k0-Ky; Mon, 22 Feb 2021 13:48:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A9295C0207;
 Mon, 22 Feb 2021 13:48:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Rf7n/5OW2Ypat
 jdSnPjiGbwX7Neana1YIDZg4xmL1kM=; b=dC1ro6BGl/7r+evi7kSpEUVfRiubJ
 szoqblCAqxSkp31C3uTwXKH1+xiHelOMfSHv981icDUtVomT0017GqKLrUBcjhJX
 eX4PmyEWaCWZIlkPX/D7qPptdw+jzHKOGIeXrV/y9fSC5oHovilkiXnH2ow8WRqr
 Rv9fxrb35bhkpg84tCkuYoMg6aKYbxHd2sf47CrudmaFKfUuWcMAZIY84yMgpv0u
 B96V4DFhTbJknyhlmWfAok5YTtLgNXlaQ9raCApc28iT5F2cKV4jCaXsar8DmhrJ
 jFhs8ztJOEU02/LkW7Ddr9zT7G+FFKjycM9wvz3UYPxnwLPH0ajEDyXNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Rf7n/5OW2YpatjdSnPjiGbwX7Neana1YIDZg4xmL1kM=; b=ebKFP+Vh
 oZnrUY1SwO0lwFar0S+39o+McCJCdYoLWcgjA6CHvTiRg9e2VB4Mv0UfFD3jpEn6
 8VNQHxsUYlbvs8H1Me9267C1G280fPEw9Q8YnKiQdQbaK3wSz2Lw3I4CsfeGSTaB
 b4LEqg1uPthYiWQol2kFDKgd8yFyGn7AenPU4ypa3Rym/hH3QTIXTHJhpproNQ+N
 eLUP70Q46rCcPCI6S0H8aVY2nbIsmr7wJZHKeiYP9Q3gRqWELSWdq+PxRnyQ+LMZ
 uVLhCyX3uAPSSknKu5lLyYlpXq87RQxXockF4VmY5wDymc8QKCVQbQer3fl1k2ty
 xvvCLSk8hecY7A==
X-ME-Sender: <xms:aPwzYNXsfaQfkCRjlEItlUhYwa8wJ4yPoQCMq0-IqME5gYeLR-HZxw>
 <xme:aPwzYNvFfHn_4intMs339bca1OJLQXXX8Lx2SXPYwf3zH2fAnFX6RbGPrjWBmQHCJ
 YIizFtA3bgO0KCJWqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:afwzYA0V_Kr6G9T3cPtJwGvSVJZyka2176H27PX-Rb7OJWtMOjPh2w>
 <xmx:afwzYG5EAaNFlHgb3ajhnt8Tem1Pfa_YyfyWUchF33W5qpfWT5Csvw>
 <xmx:afwzYPUa1B-y71QKML8cdDjL05XFiZ0El-YJ-7lYe7galo2luLzE3w>
 <xmx:afwzYIchqhEVCCUDGRFdCrvb_iQDHKlQs9xouXr1djQoqjQWeo72Aw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC220240068;
 Mon, 22 Feb 2021 13:48:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/block/nvme: add trace event for zone read check
Date: Mon, 22 Feb 2021 19:47:58 +0100
Message-Id: <20210222184759.65041-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
References: <20210222184759.65041-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add a trace event for the offline zone condition when checking zone
read.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: split commit]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index dcd51a52951c..b641c7a45a2f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1241,6 +1241,7 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_READ_ONLY:
         return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
+        trace_pci_nvme_err_zone_is_offline(zone->d.zslba);
         return NVME_ZONE_OFFLINE;
     default:
         assert(false);
-- 
2.30.1


